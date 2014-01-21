/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function keyUp() {
    var re = $(this).val().replace(/[^0-9]/g, '');
    var tam = re.length;
    if (tam < 3) {
        $(this).val($(this).val());
    } else if (tam === 4) {
        $(this).val(re.slice(0, 1) + '.' + re.slice(1));
    } else if (tam === 5) {
        $(this).val(re.slice(0, 2) + '.' + re.slice(2));
    } else if (tam >= 6) {
        $(this).val(re.slice(0, 3) + '.' + re.slice(3, 6));
    } else {
        $(this).val(re);
    }
}

$(document).ready(function() {
    //inserir data de cadastro do veiculo
    /*var data = $('#dataCadastro').val();
     if (data === "") {
     var d = new Date();
     var m = d.getMonth();
     if (m < 8) {
     m = "0" + 1;
     }
     $('#dataCadastro').val(d.getDate() + "/" + m + "/" + d.getFullYear());
     }*/
    //máscaras dos campos
    $('#ano').mask('9999', {'translation': {9: {pattern: /[0-9]/}}});
    $('#placa').mask('aaa xxxx', {'translation': {a: {pattern: /[a-zA-Z]/}, x: {pattern: /[0-9]/}}});
    $('#km').keyup(keyUp);
    $('#kmdia').keyup(keyUp);
    $('#periodo').keyup(keyUp);
    $('#manut').keyup(keyUp);

    //EFEITO NO FORMULÁRIO DE INSERÇÃO DE ÍTEM
    $("#slide").click(function() {
        $("#painel").toggle("slow");
    });
    //AUTOCOMPLETE MARCA
    $("#marca").autocomplete({
        source: function(request, response) {
            $.ajax({
                url: "<c:url value='/veiculo/marca.json'/>",
                dataType: "json",
                data: {
                    featureClass: "P",
                    style: "full",
                    maxRows: 12,
                    trecho: request.term
                },
                success: function(data) {
                    response($.map(data.list, function(item) {
                        return {
                            label: item.marca,
                            value: item.marca
                        };
                    }));
                }
            });
        },
        minLength: 2
    });
    //AUTOCOMPLETE MODELO
    $("#modelo").autocomplete({
        source: function(request, response) {
            $.ajax({
                url: "<c:url value='/veiculo/modelo.json'/>",
                dataType: "json",
                data: {
                    featureClass: "P",
                    style: "full",
                    maxRows: 12,
                    trecho: request.term
                },
                success: function(data) {
                    response($.map(data.list, function(item) {
                        return {
                            label: item.modelo,
                            value: item.modelo
                        };
                    }));
                }
            });
        },
        minLength: 2
    });
    //AUTOCOMPLETE ITEM
    $("#item").autocomplete({
        source: function(request, response) {
            $.ajax({
                url: "<c:url value='/item.json'/>",
                dataType: "json",
                data: {
                    featureClass: "P",
                    style: "full",
                    maxRows: 12,
                    trecho: request.term
                },
                success: function(data) {
                    response($.map(data.list, function(item) {
                        return {
                            label: item.nome,
                            value: item.nome
                        };
                    }));
                }
            });
        },
        minLength: 2
    });

    //Deletar Item
    $(document).delegate('.deletar', 'click', function(event) {
        event.preventDefault();
        var linha = $(this).closest("tr");
        var id = linha.find(".idItem").val();
        if (id >= 0) {
            $.ajax({
                url: "<c:url value='/item/'/>" + id,
                type: 'POST',
                data: {_method: "DELETE", veiculo: $("#veiculoId").val()},
                success: function() {
                    $(linha).remove();
                },
                error: function() {
                    alert("Erro ao tentar remover Item.");
                }
            });
        } else {
            $(linha).remove();
        }
    });

    //Editar Item
    $(document).delegate('.editar', 'click', function(event) {
        event.preventDefault();
        var linha = $(this).closest("tr");
        var inputs = $(linha).find("input[class!='idItem']").toArray();
        $("#item").val($(inputs[0]).val());
        $("#acao").val($(inputs[1]).val());
        $("#periodo").val($(inputs[2]).val());
        $("#medida").val($(inputs[3]).val());
        $("#manut").val($(inputs[4]).val());

        var index = $(linha).index();

        $("#addItem").attr("onclick", "insereLinha(" + index + ");");
    });
});
//carregar documento - FIM

function calculoManut(periodo, ultmanut, kmatual) {
    var km = parseInt(kmatual);
    var per = parseInt(periodo);
    var um = parseInt(ultmanut);
    var proxmanut = per + um;
    while (!(proxmanut > km)) {
        proxmanut += per;
    }
    return proxmanut;
}

function insereLinha(param) {
    var periodo = $('#periodo').val().replace(/[^0-9]/g, '');
    var ultmanut = $('#manut').val().replace(/[^0-9]/g, '');
    var kmatual = $('#km').val().replace(/[^0-9]/g, '');
    var medida = $("#medida").val();
    var data, ver;
    if (medida === "Km") {
        if (!(parseInt(ultmanut) > parseInt(kmatual))) {
            ver = true;
            data = calculoManut(periodo, ultmanut, kmatual);
        } else {
            alert("Última manutenção não pode ser superior à kilometragem do veículo!");
            ver = false;
        }
    } else {
        var ano = $('#ano').val();
        var um = parseInt(ultmanut);
        var d = new Date();

        if ((um > parseInt(ano)) && (um > d.getFullYear())) {
            ver = true;
            data = calculoManut(periodo, ultmanut, ano);
        } else {
            alert("Ano de manutenção não pode ser menor que ano de fabricação do veículo!");
            ver = false;
        }
    }

    if (ver) {
        if (param === null) {//se o parâmetro for null inserir nova linha
            var linha = $("#tabela tbody tr").size();
            $("#tabela tbody").append($("<tr><td><input type='text' class='form-control input-sm' name='veiculo.itens[" + linha + "].nome' value='" + $('#item').val() + "'/></td><td><input type='text' class='form-control input-sm' name='veiculo.itens[" + linha + "].acao' value='" + $('#acao').val() + "'/></td><td><input type='text' class='form-control input-sm' name='veiculo.itens[" + linha + "].periodo' value='" + periodo + "'/></td><td><input type='text' class='form-control input-sm' name='veiculo.itens[" + linha + "].undmedida' value='" + medida + "'/></td><td><input type='text' class='form-control input-sm' name='veiculo.itens[" + linha + "].ultmanut' value='" + ultmanut + "'/></td><td><input type='text' class='form-control input-sm' name='veiculo.itens[" + linha + "].proxmanut' value='" + data + "'/></td><td><a href class='editar' title='Editar ítem de manutenção'><span class='glyphicon glyphicon-edit btn-lg'></span></a><a href class='deletar' title='Remover item de manutenção do veículo'><span class='glyphicon glyphicon-remove btn-lg'></span></a></td></tr>"));
        }
        else {//se o parâmetro não for null editar linha
            var inputs = $("#tabela tbody tr:eq(" + param + ")").find("input[class!='idItem']").toArray();
            $(inputs[0]).val($("#item").val());
            $(inputs[1]).val($("#acao").val());
            $(inputs[2]).val(periodo);
            $(inputs[3]).val(medida);
            $(inputs[4]).val(ultmanut);
            $(inputs[5]).val(data);
            $("#addItem").attr("onclick", "insereLinha(null);");
        }
        $("#item").val(' ');
        $("#periodo").val('0');
        $("#manut").val('0');
    }
}


