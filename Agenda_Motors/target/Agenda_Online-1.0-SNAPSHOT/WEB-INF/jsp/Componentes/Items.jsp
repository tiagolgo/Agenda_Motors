<%-- 
    Document   : Items
    Created on : 06/12/2013, 03:13:55
    Author     : Tiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            <div class="col-lg-12">
                <div class="panel panel-success" style="border-color: green">
                    <div class="panel-heading" id="slide">
                        <h3 class="panel-title"> <span class="glyphicon glyphicon-plus"></span> <a href="#">Adicionar Ítem de Manutencão</a></h3>
                    </div>
                    <div class="panel-body" id="painel" style="display: none">
                        <div class="col-lg-5">
                            <input type="text" class="form-control input-sm" id="item" name="item" placeholder="Novo Ítem de Manutenção" title="Informe o novo ítem de manutenção"/>
                        </div>
                        <div class="col-lg-2">
                            <select class="form-control input-sm" id="acao" name="acao" title="Ação">
                                <option>Inspecionar</option>
                                <option>Substituir</option>
                            </select>
                        </div>
                        <div class="col-lg-1">
                            <input type="text" class="form-control input-sm" id="periodo" name="periodo" placeholder="Período" title="Informe o período de manutenção do ítem"/>
                        </div>
                        <div class="col-lg-1">
                            <select class="form-control input-sm" id="periodicidade" name="periodicidade" title="Selecione a periodicidade">
                                <option>Km</option>
                                <option>Ano</option>
                            </select>
                        </div>
                        <div class="col-lg-2">
                            <button type="button" id="addItem" class="btn btn-success btn-sm col-lg-8" title="Cadastrar novo ítem">
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
                                            <button type="button" style="height: 25px" class="btn btn-default btn-sm" title="Editar ítem de manutenção"><span class="glyphicon glyphicon-edit"></span></button>
                                            <button type="button" style="height: 25px" class="btn btn-default btn-sm" title="Remover item de manutenção do veículo"><span class="glyphicon glyphicon-remove"></span></button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div style="text-align:center">
                    <input type="submit" id="salvar" class="btn btn-success" value="Salvar"/>
                    <a href="#" class="btn btn-warning">Cancelar</a>
                </div>
            </div>
        </form>
    </body>
</html>
