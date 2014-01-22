<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <title>Agenda Motors</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="../../assets/ico/favicon.png">

        <script src="bootstrap/js/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
        <link href="bootstrap/css/jumbotron.css" rel="stylesheet">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="../../assets/js/html5shiv.js"></script>
          <script src="../../assets/js/respond.min.js"></script>
        <![endif]-->
       
    </head>

    <body style="text-align: justify">
        <!-- JANELA MODAL DE CADASTRO -->
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <h1><a href="#" style="font-weight: bold;text-decoration: none">Agenda Motors</a></h1>
                </div>
                <div class="navbar-collapse collapse">

                    <form id="login" action="<c:url value="/login/login"/>" class="navbar-form navbar-right" style="color:white">
                        <table>
                            <tbody>
                                <tr>
                                    <td><small>Email</small></td>
                                    <td><small>Senha</small></td>
                                    <td  rowspan="3" style="margin-top: 50%"><input type="submit"  id="acessar" class="btn btn-xs btn-success" value="Acessar"/></td>
                                </tr>
                                <tr>
                                    <td><input class="form-control" type="email" id="email" name="email" style="height: 20px;padding: 2px;font-size: 12px"/></td>
                                    <td><input class="form-control" type="password" id="senha" name="senha" style="height: 20px;padding: 2px;font-size: 12px"/></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td colspan="2"><a href=""><small>Esqueci Minha senha</small></a></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                <!--/.navbar-collapse -->
            </div>
        </div>

        <!-- Main jumbotron for a primary marketing message or call to action -->
        <div class="container" >
            <div style="padding-top: 45px">
                <div class="col-lg-6">
                    <img src="imagens/carro-manutencao.jpg" width="100%"/>
                    <!--<h3>Agenda de Manutenção de Veículos</h3>
                    <p>This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
                    <p><a href="#" class="btn btn-primary btn-sm">Leia mais&raquo;</a></p>-->

                </div>
                <div class="col-lg-6">
                    <div class="col-lg-9" style="float: right">
                        <div class="panel panel-primary" style="border-radius: 5px">
                            <div class="panel-heading">
                                <h2 class="panel-title" style="font-size: 30px;">Quero me cadastrar</h2>
                            </div>
                            <div class="panel-body">

                                <form method="post" class="form" action="<c:url value="/usuario"/>">
                                    <div class="form-group">
                                        <input type="text" class="form-control input-sm" name="usuario.nome" placeholder="Nome"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control input-sm" name="usuario.email" placeholder="Email"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control input-sm" name="confEmail" placeholder="Repita o Email"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control input-sm" name="usuario.senha" placeholder="Senha"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control input-sm" name="confSenha" placeholder="Repita a Senha"/>
                                    </div>

                                    <div style="margin-top: 5px;text-align: right">
                                        <button type="submit" class="btn btn-lg col-lg-12 btn-info">
                                            <span>Criar conta &raquo;</span>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- PLUGIN SOCIAL DO FACEBOOK -->
                        <div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-width="100%" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div>                        <div id="fb-root"></div>
                        <div id="fb-root"></div>
                        <script>
                            (function(d, s, id) {
                                var js, fjs = d.getElementsByTagName(s)[0];
                                if (d.getElementById(id))
                                    return;
                                js = d.createElement(s);
                                js.id = id;
                                js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1&appId=273300429357640";
                                fjs.parentNode.insertBefore(js, fjs);
                            }(document, 'script', 'facebook-jssdk'));
                        </script>
                        <!-- FIM PLUGI SOCIAL -->
                    </div>
                </div>

            </div>
        </div>
        <div class="container">
            <hr/>
            <footer>
                <p>&copy; Company 2013</p>
            </footer>
        </div> <!-- /container -->
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster --
        <button type="button" id="modal" data-target="#myModal">Launch modal</button>-->
        <!--c:set var="erros" value="{errors}"/>-->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Alerta de erro.</h4>
                    </div>
                    <div class="modal-body">
                        <div style="font-size: 15px;color: red; font-weight: bold">
                            <c:forEach var="error" items="${errors}">
                                ${error.message}<br />
                            </c:forEach>
                        </div>                    
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <c:if test='${not empty errors}'>
            <script>
                $('#myModal').modal('toggle');
            </script>
        </c:if>
    </body>
</html>
