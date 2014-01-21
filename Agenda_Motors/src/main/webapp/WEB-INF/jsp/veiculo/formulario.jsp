<%-- 
    Document   : Agenda_Veiculo
    Created on : 16/11/2013, 11:11:29
    Author     : Tiago
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Agenda de Manutenção</title>
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="../../assets/js/html5shiv.js"></script>
          <script src="../../assets/js/respond.min.js"></script>
        <![endif]-->
        <script src="<c:url value="/bootstrap/js/jquery.js"/>"></script>
        <script src="<c:url value="/bootstrap/js/jquery.mask.min.js"/>"></script>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script>
            /* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function keyUp() {
    var re = $(this).val().replace(/[^0-9]/g, '');
    var tam = re.length;
    if (tam < 3) {
        $(this).val($(this).val());
    } else if (tam === 4) {
        $(this).val(re.slice(0, 1) + '.' + re.slice(1));
    } else if (tam === 5) {
        $(this).val(re.slice(0, 2) + '.' + re.slice(2));
    } else if (tam >= 6) {
        $(this).val(re.slice(0, 3) + '.' + re.slice(3, 6));
    } else {
        $(this).val(re);
    }
}

$(document).ready(function() {
    //inserir data de cadastro do veiculo
    /*var data = $('#dataCadastro').val();
     if (data === "") {
     var d = new Date();
     var m = d.getMonth();
     if (m < 8) {
     m = "0" + 1;
     }
     $('#dataCadastro').val(d.getDate() + "/" + m + "/" + d.getFullYear());
     }*/
    //máscaras dos campos
    $('#ano').mask('9999', {'translation': {9: {pattern: /[0-9]/}}});
    $('#placa').mask('aaa xxxx', {'translation': {a: {pattern: /[a-zA-Z]/}, x: {pattern: /[0-9]/}}});
    $('#km').keyup(keyUp);
    $('#kmdia').keyup(keyUp);
    $('#periodo').keyup(keyUp);
    $('#manut').keyup(keyUp);

    //EFEITO NO FORMULÁRIO DE INSERÇÃO DE ÍTEM
    $("#slide").click(function() {
        $("#painel").toggle("slow");
    });
    //AUTOCOMPLETE MARCA
    $("#marca").autocomplete({
        source: function(request, response) {
            $.ajax({
                url: "<c:url value='/veiculo/marca.json'/>",
                dataType: "json",
                data: {
                    featureClass: "P",
                    style: "full",
                    maxRows: 12,
                    trecho: request.term
                },
                success: function(data) {
                    response($.map(data.list, function(item) {
                        return {
                            label: item.marca,
                            value: item.marca
                        };
                    }));
                }
            });
        },
        minLength: 2
    });
    //AUTOCOMPLETE MODELO
    $("#modelo").autocomplete({
        source: function(request, response) {
            $.ajax({
                url: "<c:url value='/veiculo/modelo.json'/>",
                dataType: "json",
                data: {
                    featureClass: "P",
                    style: "full",
                    maxRows: 12,
                    trecho: request.term
                },
                success: function(data) {
                    response($.map(data.list, function(item) {
                        return {
                            label: item.modelo,
                            value: item.modelo
                        };
                    }));
                }
            });
        },
        minLength: 2
    });
    //AUTOCOMPLETE ITEM
    $("#item").autocomplete({
        source: function(request, response) {
            $.ajax({
                url: "<c:url value='/item.json'/>",
                dataType: "json",
                data: {
                    featureClass: "P",
                    style: "full",
                    maxRows: 12,
                    trecho: request.term
                },
                success: function(data) {
                    response($.map(data.list, function(item) {
                        return {
                            label: item.nome,
                            value: item.nome
                        };
                    }));
                }
            });
        },
        minLength: 2
    });

    //Deletar Item
    $(document).delegate('.deletar', 'click', function(event) {
        event.preventDefault();
        var linha = $(this).closest("tr");
        var id = linha.find(".idItem").val();
        if (id >= 0) {
            $.ajax({
                url: "<c:url value='/item/'/>" + id,
                type: 'POST',
                data: {_method: "DELETE", veiculo: $("#veiculoId").val()},
                success: function() {
                    $(linha).remove();
                },
                error: function() {
                    alert("Erro ao tentar remover Item.");
                }
            });
        } else {
            $(linha).remove();
        }
    });

    //Editar Item
    $(document).delegate('.editar', 'click', function(event) {
        event.preventDefault();
        var linha = $(this).closest("tr");
        var inputs = $(linha).find("input[class!='idItem']").toArray();
        $("#item").val($(inputs[0]).val());
        $("#acao").val($(inputs[1]).val());
        $("#periodo").val($(inputs[2]).val());
        $("#medida").val($(inputs[3]).val());
        $("#manut").val($(inputs[4]).val());

        var index = $(linha).index();

        $("#addItem").attr("onclick", "insereLinha(" + index + ");");
    });
});
//carregar documento - FIM

function calculoManut(periodo, ultmanut, kmatual) {
    var km = parseInt(kmatual);
    var per = parseInt(periodo);
    var um = parseInt(ultmanut);
    var proxmanut = per + um;
    while (!(proxmanut > km)) {
        proxmanut += per;
    }
    return proxmanut;
}

function insereLinha(param) {
    var periodo = $('#periodo').val().replace(/[^0-9]/g, '');
    var ultmanut = $('#manut').val().replace(/[^0-9]/g, '');
    var kmatual = $('#km').val().replace(/[^0-9]/g, '');
    var medida = $("#medida").val();
    var data, ver;
    if (medida === "Km") {
        if (!(parseInt(ultmanut) > parseInt(kmatual))) {
            ver = true;
            data = calculoManut(periodo, ultmanut, kmatual);
        } else {
            alert("Última manutenção não pode ser superior à kilometragem do veículo!");
            ver = false;
        }
    } else {
        var ano = $('#ano').val();
        var um = parseInt(ultmanut);
        var d = new Date();

        if ((um > parseInt(ano)) && (um > d.getFullYear())) {
            ver = true;
            data = calculoManut(periodo, ultmanut, ano);
        } else {
            alert("Ano de manutenção não pode ser menor que ano de fabricação do veículo!");
            ver = false;
        }
    }

    if (ver) {
        if (param === null) {//se o parâmetro for null inserir nova linha
            var linha = $("#tabela tbody tr").size();
            $("#tabela tbody").append($("<tr><td><input type='text' class='form-control input-sm' name='veiculo.itens[" + linha + "].nome' value='" + $('#item').val() + "'/></td><td><input type='text' class='form-control input-sm' name='veiculo.itens[" + linha + "].acao' value='" + $('#acao').val() + "'/></td><td><input type='text' class='form-control input-sm' name='veiculo.itens[" + linha + "].periodo' value='" + periodo + "'/></td><td><input type='text' class='form-control input-sm' name='veiculo.itens[" + linha + "].undmedida' value='" + medida + "'/></td><td><input type='text' class='form-control input-sm' name='veiculo.itens[" + linha + "].ultmanut' value='" + ultmanut + "'/></td><td><input type='text' class='form-control input-sm' name='veiculo.itens[" + linha + "].proxmanut' value='" + data + "'/></td><td><a href class='editar' title='Editar ítem de manutenção'><span class='glyphicon glyphicon-edit btn-lg'></span></a><a href class='deletar' title='Remover item de manutenção do veículo'><span class='glyphicon glyphicon-remove btn-lg'></span></a></td></tr>"));
        }
        else {//se o parâmetro não for null editar linha
            var inputs = $("#tabela tbody tr:eq(" + param + ")").find("input[class!='idItem']").toArray();
            $(inputs[0]).val($("#item").val());
            $(inputs[1]).val($("#acao").val());
            $(inputs[2]).val(periodo);
            $(inputs[3]).val(medida);
            $(inputs[4]).val(ultmanut);
            $(inputs[5]).val(data);
            $("#addItem").attr("onclick", "insereLinha(null);");
        }
        $("#item").val(' ');
        $("#periodo").val('0');
        $("#manut").val('0');
    }
}



        </script>
    </head>
    <body>
        <c:import url="../Componentes/Cabecalho.jsp"/>
        <div>
            Seja bem Vindo, <span style="font-size: 15px;color: #285e8e">${sessao.usuario.nome}</span>
        </div>
        <div class="jumbotron">
            <ol class="breadcrumb">
                Você está em:
                <li><a href="<c:url value='/usuario/index'/>">Home</a></li>
                <li class="active">Formulário</li>
            </ol>
            <div class="container">
                <form method="POST" action='<c:url value="/veiculo"/>' id="formVeiculo" class="form-horizontal">
                    <div>
                        <input type="text" id="veiculoId" value="${veiculo.id}" name="veiculo.id" hidden="true"/>
                        <h3 class="">Veículo</h3>
                        <div class="col-lg-12"> 
                            <div class="panel panel-success" style="border-color: green">
                                <div class="panel-heading" >
                                    <h3 class="panel-title">Dados do Carro</h3>
                                </div>
                                <div class="panel-body" >
                                    <div class="row" style="text-align: center;font-size: 14px;font-weight: bold;color: green">${msgOk}</div>
                                    <div class="row" style="text-align: center;font-size: 14px;font-weight: bold;color: red">${msgErr}</div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="marca" class="col-sm-3 control-label">Marca:</label>
                                            <div class="col-sm-8">
                                                <input class="form-control input-sm" id="marca" name="veiculo.marca" value="${veiculo.getMarca()}" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="modelo" class="col-sm-3 control-label">*Modelo:</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control input-sm" id="modelo" name="veiculo.modelo" value="${veiculo.getModelo()}" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="placa" class="col-sm-3 control-label">*Placa:</label>
                                            <div class="col-sm-4">
                                                <input type="text" id="placa" class="form-control input-sm" name="veiculo.placa" value="${veiculo.getPlaca()}" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="ano" class="col-sm-3 control-label">*Ano:</label>
                                            <div class="col-sm-4">
                                                <input class="form-control input-sm" id="ano" name="veiculo.ano" value="${veiculo.getAno()}" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">  
                                        <div class="form-group">
                                            <label for="km" class="col-sm-3 control-label">*Km Atual:</label>
                                            <div class="col-sm-4">
                                                <input class="form-control input-sm" id="km"  value="${veiculo.km}"  placeholder="" name="veiculo.km"  title="Informe a Kilometragem atual do veículo." />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="kmdia" class="col-sm-3 control-label">*Km Diária:</label>
                                            <div class="col-sm-4">
                                                <input class="form-control input-sm" id="kmdia" placeholder="" value="${veiculo.kmdia}" name="veiculo.kmdia" title="Kilometragem média diária rodada pelo veículo."/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="dataCadastro" class="col-sm-3 control-label">Cadastro:</label>
                                            <div class="col-sm-4">
                                                <input class="form-control input-sm" id="dataCadastro" placeholder="" value="${veiculo.dataCadastro}" name="veiculo.dataCadastro" title="Data de Cadastro do Veículo." readonly/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- FORMULÁRIO DE INSERÇÃO DE ITENS -->
                            <div class="panel panel-success" style="border-color: green">
                                <div class="panel-heading" id="slide">
                                    <h3 class="panel-title"> <span class="glyphicon glyphicon-plus"></span> <a href="#" style="text-decoration: none">Ítens de Manutencão</a></h3>
                                </div>
                                <div class="panel-body" id="painel" style="display: none">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <input type="text" class="form-control input-sm" id="item" placeholder="Novo Ítem de Manutenção" title="Informe o novo ítem de manutenção"/>
                                        </div>
                                        <div class="col-lg-2">
                                            <select class="form-control input-sm" id="acao" title="Ação">
                                                <option>Inspecionar</option>
                                                <option>Substituir</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-1">
                                            <input type="text" class="form-control input-sm" id="periodo" value="0" placeholder="Período" title="Informe o período de manutenção do ítem"/>
                                        </div>
                                        <div class="col-lg-1">
                                            <select class="form-control input-sm" id="medida" title="Selecione a periodicidade">
                                                <option>Km</option>
                                                <option>Ano</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-1">
                                            <input type="text" class="form-control input-sm" id="manut" value="0"  placeholder="Última manut." title="Informe a última manutenção do ítem"/>
                                        </div>

                                        <div class="col-lg-2">
                                            <button type="button" id="addItem" onclick="insereLinha(null);" class="btn btn-success btn-sm col-lg-8" title="Cadastrar novo ítem">
                                                <span class="glyphicon glyphicon-plus"></span> Adicionar
                                            </button>                                          
                                        </div>
                                    </div>
                                    <!--TABELA DE ITENS -->
                                    <div class="row" >
                                        <div class="col-lg-12">
                                            <table class="table table-condensed" id="tabela" style="margin-top: 20px;border-top: 2px solid lightgray">
                                                <thead style="background-color:#31b0d5 ;color: white">
                                                    <tr style="text-align:center">
                                                        <th>Ítem</th>
                                                        <th>Ação</th>
                                                        <th>Periodo</th>
                                                        <th>Medida</th>
                                                        <th>Últ. Manut</th>
                                                        <th>Próx. Manut</th>
                                                        <th style="text-align:center">Ações</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="corpo">
                                                    <c:if test="${not empty veiculo.itens}">
                                                        <c:forEach var="item" items="${veiculo.itens}" varStatus="i">
                                                            <tr class='${item.alerta}'>
                                                                <td>
                                                                    <input class="idItem" name="veiculo.itens[${i.count-1}].id" value="${item.id}" hidden />
                                                                    <input class='form-control input-sm' value="${item.nome}" type="text" name="veiculo.itens[${i.count-1}].nome" readonly/>
                                                                </td>
                                                                <td><input class='form-control input-sm' value="${item.acao}" type="text" name="veiculo.itens[${i.count-1}].acao" readonly/></td>
                                                                <td><input class='form-control input-sm' value="${item.periodo}" type="text" name="veiculo.itens[${i.count-1}].periodo" readonly/></td>
                                                                <td><input class='form-control input-sm' value="${item.undmedida}" type="text" name="veiculo.itens[${i.count-1}].undmedida" readonly/></td>
                                                                <td><input class='form-control input-sm' value="${item.ultmanut}" type="text" name="veiculo.itens[${i.count-1}].ultmanut" readonly/></td>
                                                                <td><input class='form-control input-sm' value="${item.proxmanut}" type="text" name="veiculo.itens[${i.count-1}].proxmanut" readonly/></td>
                                                                <td>
                                                                    <a class="editar" href="" title="Editar ítem de manutenção"><span class="glyphicon glyphicon-edit btn-lg"></span></a>
                                                                    <a class="deletar" href="" title="Remover item de manutenção do veículo"><span class="glyphicon glyphicon-remove btn-lg"></span></a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- FIM DO FORMULÁRIO -->
                        </div>
                    </div>
                    <div style="text-align:center" id="divBotoes">
                        <button type="submit" class="btn btn-success">
                            <span class="glyphicon glyphicon-floppy-save"></span> Salvar
                        </button>
                        <button class="btn btn-warning">
                            <span class="glyphicon glyphicon-remove"></span>  <a href="<c:url value='/usuario/index'/>">Cancelar</a>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <footer>
            <p>&copy; Tiago Luiz Gomes de Oliveira 2013</p>
        </footer>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        </div> 
    </body>
</html>



