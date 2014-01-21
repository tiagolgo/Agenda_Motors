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
       
        </script>


    </head>

    <body>
    <c:import url="../Componentes/Cabecalho.jsp"/>
    <div id="te">
        Seja bem Vindo, <span style="font-size: 17px;color: #285e8e">${sessao.usuario.nome}</span>
    </div>
    <div>
        <form method="POST" id="formVeiculo" action="<c:url value="/agenda/salvar"/>" class="form-horizontal">
              <div class="container">
                <h3 class="">Veículo</h3>
                <div class="col-lg-12"> 
                    <div class="panel panel-warning" style="border-color: orange">
                        <div class="panel-heading" >
                            <h3 class="panel-title">Dados do Carro</h3>
                        </div>
                        <div class="panel-body" >
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="marca" class="col-sm-3 control-label">Marca:</label>
                                    <div class="col-sm-8">
                                        <input class="form-control input-sm" value="${veiculo.marca}" readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="modelo" class="col-sm-3 control-label">*Modelo:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control input-sm" value="${veiculo.modelo}" readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="placa" class="col-sm-3 control-label">*Placa:</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control input-sm" value="${veiculo.placa}" readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="ano" class="col-sm-3 control-label">*Ano:</label>
                                    <div class="col-sm-4">
                                        <input class="form-control input-sm" value="${veiculo.ano}" readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="kmAtual" class="col-sm-3 control-label">*Km Atual:</label>
                                    <div class="col-sm-4">
                                        <input class="form-control input-sm" value="${veiculo.kmAtual}" placeholder="" title="Informe a Kilometragem atual do veículo." readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="kmDia" class="col-sm-3 control-label">*Km Diária:</label>
                                    <div class="col-sm-4">
                                        <input class="form-control input-sm" value="${veiculo.kmDia}" placeholder="" title="Kilometragem média diária rodada pelo veículo." readonly/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<!--
                    <div class="panel panel-success" style="border-color: green">
                        <div class="panel-heading">
                            <h3 class="panel-title">Adicionar Ítem de Manutenção</h3>
                        </div>
                        <div class="panel-body">
                            <div class="col-lg-5">
                                <input type="text" class="form-control input-sm" id="tags" name="novoitem" placeholder="Novo Ítem de Manutenção" title="Informe o novo ítem de manutenção"/>
                            </div>
                            <div class="col-lg-2">
                                <select class="form-control input-sm" title="Ação">
                                    <option>Inspecionar</option>
                                    <option>Substituir</option>
                                </select>
                            </div>
                            <div class="col-lg-1">
                                <input type="text" class="form-control input-sm" id="period" name="periodicidade" placeholder="Período" title="Informe o período de manutenção do ítem"/>
                            </div>
                            <div class="col-lg-1">
                                <select class="form-control input-sm" title="Selecione a periodicidade">
                                    <option>Km</option>
                                    <option>Ano</option>
                                </select>
                            </div>
                            <div class="col-lg-2">
                                <button class="btn btn-success btn-sm col-lg-8" title="Cadastrar novo ítem">
                                    <span class="glyphicon glyphicon-plus"></span> Inserir
                                </button>                                          
                            </div>
                        </div>
                    </div>

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
                                        <th>Última Manut.</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    c:forEach var="item" items="{veiculo.item_Manutencao}">
                                    <tr>
                                        <td>{item.nome}</td>
                                        <td>$item.acao}</td>
                                        <td>$item.periodo}</td>
                                        <td>$item.periodicidade}</td>
                                        <td>$item.realizada}</td>
                                        <td>$item.ultManut}</td>
                                    </tr>
                                /c:forEach>
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
        </form>
-->
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



