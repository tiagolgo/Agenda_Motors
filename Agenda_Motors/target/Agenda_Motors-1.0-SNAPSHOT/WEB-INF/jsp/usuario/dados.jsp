<%-- 
    Document   : Altera_Email
    Created on : 23/11/2013, 00:37:29
    Author     : Tiago
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value="/bootstrap/js/validacao.js"/>" type="text/javascript"></script>
<form id="submitDados" action="<c:url value="/usuario/dados"/>" class="form-horizontal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title">Alterar Dados Pessoais</h3>
            </div>
            <div class="modal-body">
                <div class="col-lg-12">
                    <div style="color: blue;text-align: center" id="confirma">
                    </div>
                    <div style="color: red; text-align: center" id="erros">
                    </div>
                    <div style="font-size: 16px;font-weight: bold;color:red;text-align: center">
                    </div>
                    <div class="form-group">
                        <label for="nomeantigo" class="col-sm-4 control-label">Nome:</label>
                        <div class="col-sm-6">
                            <input class="form-control input-sm" id="nomeantigo" value="${sessao.usuario.nome}" placeholder="Nome" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="novonome" class="col-sm-4 control-label">*Novo nome:</label>
                        <div class="col-sm-6">
                            <input class="form-control input-sm" id="novonome" placeholder="Novo nome" name="nome"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div style="padding-top: 15px;">
                    <button type="submit" class="btn btn-xs col-lg-3 btn-primary">Salvar</button>
                    <button type="button" class="btn btn-xs col-lg-3 btn-warning" data-dismiss="modal">Sair</button>
                </div>
            </div>
        </div> 
    </div> 
</form>

