<%-- 
    Document   : ModalItens
    Created on : 04/12/2013, 01:16:16
    Author     : Tiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3 class="modal-title" id="myModalLabel">Adicionar Ítem de Manutenção</h3>
                    </div>
                    <div class="modal-body">
                        <!-- FORMULÁRIO DE INSERÇÃO DE ITEM DE MANUTENÇÃO-->
                        <form id="insertItem">
                            <!--
                            <select class="form-control input-sm" title="Selecione o novo ítem de manutenção">
                                <option>- Selecione um item -</option>
                                <option>Pneu</option>
                                <option>Carroceria</option>
                            </select>
                            <input type="text" class="form-control input-sm" id="item" name="nome" placeholder="Ítem de Manutenção" title="Informe o ÍTem de manutenção"/>
                        </div>
                            -->
                            <div class="form-group">
                                <label>Ítens</label>
                                <div class="checkbox"><label><input type="checkbox" value=""/>Pneu</label></div>
                                <div class="checkbox"><label><input type="checkbox" value=""/>Pneu</label></div>
                            </div>
                            <!--
                            <div class="col-lg-2">
                                <input type="submit" id="setItem" class="btn btn-sm btn-danger" value="Inserir"/>
                            </div>
                            -->
                        </form>

                        <!-- FIM DO FORMULÁRIO DE INSERÇÃO DE ÍTEM-->
                    </div>
                    <div class="modal-footer">
                        <div class="row" style="border-bottom: 1px solid lightgray;padding-bottom: 10px">
                            <div class="col-lg-5">
                                <input type="text" class="form-control input-sm" id="novoitem" name="novoitem" placeholder="Novo Ítem de Manutenção" title="Informe o novo ítem de manutenção"/>
                            </div>
                            <div class="col-lg-3">
                                <input type="text" class="form-control input-sm" id="period" name="periodicidade" placeholder="Período" title="Informe o período de manutenção do ítem"/>
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control input-sm" style="height: 25px" title="Selecione a periodicidade">
                                    <option>Km</option>
                                    <option>Ano</option>
                                </select>
                            </div>
                            <div class="col-lg-1">
                                <button class="btn btn-success btn-xs" title="Cadastrar novo ítem">
                                    <span class="glyphicon glyphicon-plus"></span> 
                                </button>                                          
                            </div>
                        </div>
                        <div class="row" style="padding-top: 15px;">
                            <button type="button" class="btn btn-xs col-lg-3 btn-primary">Salvar</button>
                            <button type="button" class="btn btn-xs col-lg-3 btn-warning" data-dismiss="modal">Fechar</button>
                        </div>
                    </div>
                </div> 
            </div> 
        </div>     
    </body>
</html>
