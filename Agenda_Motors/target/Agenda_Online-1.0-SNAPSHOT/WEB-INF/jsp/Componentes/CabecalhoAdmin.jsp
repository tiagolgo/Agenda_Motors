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
            <script src="../bootstrap/js/bootstrap.min.js"></script>

            <title>Agenda de Manutenção</title>

            <!-- Bootstrap core CSS -->
            <link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
            <!-- Custom styles for this template -->
            <link href="../bootstrap/css/jumbotron.css" rel="stylesheet">
            <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"/>
            <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
            <!--[if lt IE 9]>
              <script src="../../assets/js/html5shiv.js"></script>
              <script src="../../assets/js/respond.min.js"></script>
            <![endif]-->           
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
                        <li class="active"><a href="<c:url value="/agenda/minhaAgenda"/>">Home</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Configurações <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-header">Usuário</li>
                                <li><a href="<c:url value="/usuario/alteraDadosPessoais"/>">Alterar Dados Pessoais</a></li>
                                <li><a href="<c:url value="/usuario/alteraEmail"/>">Alterar Email</a></li>
                                <li><a href="<c:url value="/usuario/alteraSenha"/>">Alterar Senha</a></li>
                                <li class="divider"></li>
                                <li class="dropdown-header">Ítens de Manutenção</li>
                                <li><a href="<c:url value="/agenda/veiculo"/>">Adicionar</a></li>
                                <li><a href="<c:url value="/agenda/alteraDadosPessoais"/>">Alterar</a></li>
                                <li><a href="<c:url value="/agenda/alteraDadosPessoais"/>">Ecluir</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-right">
                        <button type="submit" class="btn btn-success">Sair</button>
                    </form>
                </div>
            </div>
        </div>
    </html>
