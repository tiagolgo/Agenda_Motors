<%-- 
    Document   : Agenda_Veiculo
    Created on : 16/11/2013, 11:11:29
    Author     : Tiago
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Agenda de Manutenção</title>
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="../../assets/js/html5shiv.js"></script>
          <script src="../../assets/js/respond.min.js"></script>
        <![endif]-->

        <script src="../bootstrap/js/jquery.js"></script>
        <!-- <script src="../bootstrap/js/jquery.autocomplete.min.js"></script>
         <script src="../bootstrap/css/jquery.autocomplete.css"></script>-->
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

        <script type="text/javascript">
            /*
             $(document).ready(function() {
             $('#addItem').click(function() {
             //event.preventDefault();
             var item = $('#item').val();
             var acao = $('#acao').val();
             var periodo = $('#periodo').val();
             var periodicidade = $('#periodicidade').val();
             var dados = $("#novo").serialize();
             $.ajax({
             type: 'POST',
             url: 'c:url value="/item/additem"/>',
             data: "item=" + item + "&acao=" + acao + "&periodo=" + periodo + "&periodicidade=" + periodicidade,
             dataType: 'json'
             }).done(function() {
             alert("Ítem adicionado com sucesso! ");
             // $('#dados').load('c:url value="../Componentes/Items.jsp"/>');
             }).fail(function(data) {
             alert("Ítem não adicionado! " + data);
             });
             
             return false;
             //}
             });
             //slide dow insert itens
             $("#slide").click(function() {
             /* var not = "";
             var marca = $('#marca').val();
             var modelo = $('#modelo').val();
             var placa = $('#placa').val();
             var ano = $('#ano').val();
             var kmatual = $('#kmAtual').val();
             var kmdia = $('#kmDia').val();
             if (marca === "") {
             not = not + "Informe a Marca do Veículo!\n";
             }
             if (modelo === "") {
             not = not + "Informe o Modelo do Veiculo!\n";
             }
             if (placa === "") {
             not = not + "Informe a Placa do Veículo!\n";
             }
             if (ano === "") {
             not = not + "Informe o Ano do Veículo!\n";
             }
             if (kmatual === "") {
             not = not + "Informe a Kilometragem Atual do Veículo!\n";
             }
             if (kmdia === "") {
             not = not + "Informe a Kilometragem diária!";
             }
             
             if (not.length === 0) {*/
            //salvar veículo na sessao

            // $("#painel").slideDown("slow");
            /*} else {
             alert(not);
             }*
             });
             });
             //AUTOCOMPLETE
             /*
             $("#tags").autocomplete('c:url value="/item/busca.json"/>', {
             dataType: "json", // pra falar que vamos tratar um json
             parse: function(itens) { // para tratar o json
             // a função map vai iterar por toda a lista,
             // e transformar os dados usando a função passada
             return $.map(itens, function(item) {
             return {
             // todos os dados do produto
             data: item,
             // o valor lógico do produto
             value: item.nome,
             // o que vai aparecer ao selecionar
             result: item.nome
             };
             });
             },
             // o que vai aparecer na lista de autocomplete
             formatItem: function(item) {
             return item.nome + "( + produto.preco + )";
             }
             });
             /*
             $(function() {
             
             var itens;
             // var itens= eval();
             /$.ajax({
             //  type: 'GET',
             url: 'c:url value="/item/busca.json"/>'
             //dataType: 'JSON'
             }).done(function(data) {
             alert("antes "+itens);
             itens=data;
             alert("depois "+itens);
             
             
             }).fail(function(){
             alert("erro"));
             
             
             $("#tags").autocomplete({
             source: itens
             });
             });*/

        </script>
    </head>

    <body>
        <c:import url="../Componentes/Cabecalho.jsp"/>
        <div id="te">
            Seja bem Vindo, <span style="font-size: 17px;color: #285e8e">${sessao.usuario.nome}</span>
        </div>
        <div>
            <!-- <form method="POST" id="formVeiculo" action="c:url value="/agenda/salvar"/>" class="form-horizontal">-->
            <div class="container">
                <h3 class="">Veículo</h3>
                <div class="col-lg-12">
                    <div class="row" style="text-align: center;color: green;font-size: 14px;font-weight: bold">
                        ${msgOk}
                    </div>
                    <div class="row" style="text-align: center;color: red;font-size: 14px;font-weight: bold">
                        ${msgErr}
                    </div>
                    <form method="post" action="<c:url value="/item/addItem"/>">
                        <div class="panel panel-warning" style="border-color: orange">
                            <div class="panel-heading" >
                                <h3 class="panel-title">Dados do Carro</h3>
                            </div>
                            <div class="panel-body" >
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="marca" class="col-sm-3 control-label">Marca:</label>
                                        <div class="col-sm-8">
                                            <input class="form-control input-sm" id="marca" value="${veiculo.getMarca()}" name="veiculo.marca" oncanplay/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="modelo" class="col-sm-3 control-label">*Modelo:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control input-sm" id="modelo" value="${veiculo.getModelo()}" name="veiculo.modelo" oncanplay/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="placa" class="col-sm-3 control-label">*Placa:</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control input-sm" id="placa" value="${veiculo.getPlaca()}" name="veiculo.placa" oncanplay/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="ano" class="col-sm-3 control-label">*Ano:</label>
                                        <div class="col-sm-4">
                                            <input class="form-control input-sm" id="ano" value="${veiculo.getAno()}" name="veiculo.ano" oncanplay/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="kmAtual" class="col-sm-3 control-label">*Km Atual:</label>
                                        <div class="col-sm-4">
                                            <input class="form-control input-sm" id="kmAtual" name="veiculo.kmAtual" placeholder="" title="Informe a Kilometragem atual do veículo." oncanplay/>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="kmDia" class="col-sm-3 control-label">*Km Diária:</label>
                                        <div class="col-sm-4">
                                            <input class="form-control input-sm" id="kmDia" name="veiculo.kmDia" placeholder="" title="Kilometragem média diária rodada pelo veículo." oncanplay/>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-success" style="border-color: green">
                            <div class="panel-heading" id="slide">
                                <h3 class="panel-title"> <span class="glyphicon glyphicon-plus"></span> <a href="#">Adicionar Ítem de Manutencão</a></h3>
                            </div>

                            <div class="panel-body" id="painel" style="display: none">
                                <div class="col-lg-5">
                                    <input type="text" class="form-control input-sm" id="item" name="item_manutencao.nome" placeholder="Novo Ítem de Manutenção" title="Informe o novo ítem de manutenção"/>
                                </div>
                                <div class="col-lg-2">
                                    <select class="form-control input-sm" id="acao" name="item_manutencao.acao" title="Ação">
                                        <option>Inspecionar</option>
                                        <option>Substituir</option>
                                    </select>
                                </div>
                                <div class="col-lg-1">
                                    <input type="text" class="form-control input-sm" id="periodo" name="item_manutencao.periodo" placeholder="Período" title="Informe o período de manutenção do ítem"/>
                                </div>
                                <div class="col-lg-1">
                                    <select class="form-control input-sm" id="periodicidade" name="item_manutencao.periodicidade" title="Selecione a periodicidade">
                                        <option>Km</option>
                                        <option>Ano</option>
                                    </select>
                                </div>
                                <div class="col-lg-2">
                                    <button type="submit" id="addItem" class="btn btn-success btn-sm col-lg-8" title="Cadastrar novo ítem">
                                        <span class="glyphicon glyphicon-plus"></span> Inserir
                                    </button>                                          
                                </div>
                            </div>
                        </div>
                    </form>

                    <div class="panel panel-default" style="border-color: gray">
                        <div class="panel-heading"  >
                            <h3 class="panel-title">Ítens de Manutenção do Veículo</h3>
                        </div>
                        <div class="panel-body">

                            <table class="table table-condensed">
                                <thead>
                                    <tr style="text-align:center">
                                        <th>Ítem</th>
                                        <th>Ação</th>
                                        <th>Periodo</th>
                                        <th></th>
                                        <th>Realizada</th>
                                        <th>Últ. Manut</th>
                                        <th style="text-align:center">Ações</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!--c:forEach begin="1" end="5" step="1" varStatus="id">
                                        Teste:c:out value="$id.count}"/><br/>
                                    /c:forEach>-->
                                    <c:forEach var="item" items="${sessao.itens}">

                                        <tr>
                                            <td>${item.nome}</td>
                                            <td>${item.acao}</td>
                                            <td>${item.periodo}</td>
                                            <td>${item.periodicidade}</td>
                                            <td>
                                                <select class="form-control input-sm"title="Alterar status do ítem de manutenção">
                                                    <option></option>
                                                    <option>Sim</option>
                                                    <option>Não</option>
                                                </select>
                                            </td>
                                            <td>${item.ultManut}</td>
                                            <td style="text-align:center">
                                                <a href="" style="height: 25px" class="btn btn-default btn-sm" title="Editar ítem de manutenção"><span class="glyphicon glyphicon-edit"></span></a>
                                                <a href="" style="height: 25px" class="btn btn-default btn-sm" title="Remover item de manutenção do veículo"><span class="glyphicon glyphicon-remove"></span></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div style="text-align:center">
                <input type="submit" id="salvar" class="btn btn-success" value="Salvar"/>
                <a href="#" class="btn btn-warning">Cancelar</a>
            </div>

            <div id="dad" style="width: auto;height: 100px">

            </div>
        </div>
        <footer>
            <p>&copy; Tiago Luiz Gomes de Oliveira 2013</p>
        </footer>
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <!--IMPORTAR MODAL DE INSERÇÃO DE ÍTENS-->
        <!--c:import url="../Componentes/ModalItens.jsp"/>-->
    </body>
</html>



