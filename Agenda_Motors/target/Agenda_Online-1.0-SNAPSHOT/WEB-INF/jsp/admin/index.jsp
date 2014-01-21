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
                color: blue;
            }
        </style>
        <script src="../bootstrap/js/jquery.js"></script>

    </head>

    <body style="text-align: justify">
        <c:import url="../Componentes/Cabecalho.jsp"/>
        <div>Seja bem vindo<span> ${sessao.usuario.nome}</span></div>
        <div class="jumbotron">
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">Minha Agenda - Veículos</h3>
                            </div>
                            <div class="panel-body">
                                <c:forEach begin="1" end="3" step="1">
                                    <form>
                                        <div class="row" style="border-top: 1px solid gray; margin-top: 10px">
                                            <div class="col-lg-10" style="padding-left:20px">
                                                <div class="row " style="font-size:18px"><c:out value="${veiculo.getModelo()}"/>CHEVROLET ÁGILE LTZ 1.4 FLEX</div>
                                                <div class="row linha" ><c:out value="${veiculo.getPlaca()}"/> Placa: ARR9477</div>
                                                <div class="row linha" ><c:out value="${veiculo.getDataCadastro()}"/>Data de Cadastro: ARR9477</div>
                                            </div>
                                            <div class="col-lg-2" style="padding-left:45px">
                                                <div><span class="glyphicon glyphicon-eye-open"></span><a href="#"> Visualizar</a></div>
                                                <div><span class="glyphicon glyphicon-edit"></span><a href="#"> Alterar</a></div>
                                                <div><span class="glyphicon glyphicon-trash"></span><a href="#"> Excluir</a></div>
                                            </div>
                                        </div>
                                    </form>
                                </c:forEach>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                <h2 class="panel-title">Opções da Agenda</h2>
                            </div>
                            <div class="panel-body">

                            </div>

                        </div>
                    </div>
                </div>
            </div> <!-- /container -->
        </div>
        <footer>
            <p>&copy; Company 2013</p>
        </footer>
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
    </body>
</html>


