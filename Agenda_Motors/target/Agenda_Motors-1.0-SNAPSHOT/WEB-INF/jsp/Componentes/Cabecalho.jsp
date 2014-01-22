<%-- 
    Document   : Cabecalho
    Created on : 19/11/2013, 16:42:11
    Author     : Tiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="description" content="">
            <meta name="author" content="">
            <link rel="shortcut icon" href="../../assets/ico/favicon.png">
            <script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>

            <title>Agenda de Manutenção</title>

            <!-- Bootstrap core CSS -->
            <link href="<c:url value="/bootstrap/css/bootstrap.css"/>" rel="stylesheet"/>
            <!-- Custom styles for this template -->
            <link href="<c:url value="/bootstrap/css/jumbotron.css"/>" rel="stylesheet"/>
            <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
            <!--[if lt IE 9]>
              <script src="../../assets/js/html5shiv.js"></script>
              <script src="../../assets/js/respond.min.js"></script>
            <![endif]-->  
            <script type="text/javascript">
                $(document).ready(function() {
                    //editar dados
                    $('.contModal').on('click', function(event) {
                        event.preventDefault();
                        $('#myModal').load($(this).attr('href'));
                        $('#myModal').modal('toggle');
                    });
                });
            </script>
        </head>
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Agenda de Manutenção</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="<c:url value="/usuario/index"/>"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span> Configurações <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-header">Usuário</li>
                                <li><a class="contModal" href="<c:url value="/usuario/dados"/>">Alterar Dados Pessoais</a></li>
                                <li><a class="contModal" href="<c:url value="/usuario/email"/>">Alterar Email</a></li>
                                <li><a class="contModal" href="<c:url value="/usuario/senha"/>">Alterar Senha</a></li>
                                <li><a class="delConta" href>Remover Conta</a></form></li>
                                <li class="divider"></li>
                                <li class="dropdown-header">Veículo</li>
                                <li><a href="<c:url value="/veiculo/novo"/>">Adicionar</a></li>
                                <li><a href="<c:url value="/usuario/index"/>">Alterar</a></li>
                                <li><a href="<c:url value="/usuario/index"/>">Excluir</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form method="post" action="<c:url value="/logout"/>" class="navbar-form navbar-right">
                        <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-log-out"></span> Sair</button>
                    </form>
                </div>
            </div>
        </div>
    </html>
