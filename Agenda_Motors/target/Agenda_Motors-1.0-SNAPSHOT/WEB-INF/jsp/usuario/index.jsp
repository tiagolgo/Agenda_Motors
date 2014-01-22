<%-- 
    Document   : Agenda_Inicio
    Created on : 16/11/2013, 11:10:16
    Author     : Tiago
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Minha Agenda do Carro</title>
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="../../assets/js/html5shiv.js"></script>
          <script src="../../assets/js/respond.min.js"></script>
        <![endif]-->
        <style type="text/css">
            span{
                font-size: 16px;
                font-weight: bold;
            }
            .link {
                text-decoration: none;
                border: none;
                background: none;
                color: blue;
                cursor: pointer;
            }
            .danger{
                background-color: #f2dedf;
            }
        </style>
        <script src="../bootstrap/js/jquery.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                //remover conta
                $('.delConta').on('click', function(event) {
                    event.preventDefault();
                    if (confirm("Confirma a exclusão da sua Conta?") === true) {
                        $('#removeConta').submit();
                    }
                });

            });

            function remover(id) {
                var c = confirm("Confirma exclusão do veículo?");
                if (c === true) {
                    $.ajax({
                        url: "<c:url value='/veiculo/remove/'/>" + id,
                        type: 'POST',
                        data: {_method: "DELETE"},
                        success: function() {
                            $('#veiculo' + id).remove();
                        },
                        error: function() {
                            alert("Erro ao tentar remover Veiculo.");
                        }
                    });
                }
            }
        </script>
    </head>
    <body style="text-align: justify">
        <c:import url="../Componentes/Cabecalho.jsp"/>
        <div>
            Seja bem vindo<span style="font-size: 15px;color: #285e8e"> ${sessao.usuario.nome}</span>
        </div>
        <div class="jumbotron">
            <ol class="breadcrumb">
                Você está em: 
                <li class="active">Home</li>
            </ol>
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h2 class="panel-title" style="font-weight: bold;color: #285e8e">Minha Agenda - Veículos</h2>
                            </div>
                            <div class="panel-body">
                                <c:forEach var="veiculo" items="${veiculos}">
                                    <div class="container col-lg-12 ${veiculo.alerta}" id="veiculo${veiculo.id}" style="border-bottom:  1px solid gray; margin-top: -10px">
                                        <div class="row " ><span class="text-primary" style="font-size:22px;font-weight: bold"><c:out value="${veiculo.modelo}"/></span></div>
                                        <div class="row linha" ><span class="text-muted">Placa:</span> <c:out value="${veiculo.getPlaca()}"/> </div>
                                        <div class="row linha" >
                                            <div class="col-lg-6" style="padding-left:0px;"><span class="text-muted">Data de Cadastro:</span> <c:out value="${veiculo.dataCadastro}"/> </div>
                                            <div class="col-lg-6" style="text-align:right;">
                                                <button class="link">
                                                    <span class="glyphicon glyphicon-edit"></span> <a href="<c:url value='/veiculo/edita/${veiculo.id}'/>"> Alterar</a>
                                                </button>
                                                <button class="link" onclick="remover(${veiculo.id});">
                                                    <span class="glyphicon glyphicon-trash"></span> Excluir
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h2 class="panel-title">Opções da Agenda</h2>
                            </div>
                            <div class="panel-body" style="text-align:justify;font-size: 16px">
                                <div class="container col-lg-12">
                                    <div class="row">
                                        <span class="glyphicon glyphicon-plus"></span> <a href="<c:url value="/veiculo/novo"/>">Adicionar Veículo</a>
                                    </div>
                                    <div class="row">
                                        <span class="glyphicon glyphicon-envelope"></span> <a class="contModal" href="<c:url value="/usuario/email"/>">Alterar Email</a>
                                    </div>
                                    <div class="row">
                                        <span class="glyphicon glyphicon-user"></span> <a class="contModal" href="<c:url value="/usuario/dados"/>">Alterar Dados Pessoais</a>
                                    </div>
                                    <div class="row">
                                        <span class="glyphicon glyphicon-lock"></span> <a class="contModal" href="<c:url value="/usuario/senha"/>">Alterar Senha</a>
                                    </div>
                                    <div class="row">
                                        <form id="removeConta" action="<c:url value="/usuario/remove/${sessao.usuario.id}"/>">
                                            <span class="glyphicon glyphicon-remove"></span> <a class="delConta" href>Remover Conta</a>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- /container -->
        </div>
        <footer>
        </footer>
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

        </div> 
    </body>
</html>


