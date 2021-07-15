var tmp = 0.0;
var subTotalPagar = 0.0;
var quantProd = 0;
var ativo = -1;

function open_menu_hamb() {
    document.getElementById("hamb_conteiner").style.marginLeft = '-55px';
}

function close_menu_hamb() {
    document.getElementById("hamb_conteiner").style.marginLeft = '-2000px';
}

function showById(event, partid) {
    restid = event.target.value;
    console.log(restid);
    id = partid + restid;
    document.getElementById(id).style.display = 'block';
}

$(document).ready(function() {
    $('.regulamentado').hide();
    $('.livre').hide();
    $("#tipologia").change(function(){
        if($("#tipologia").val()==1){
            $('.regulamentado').show();
            $('.livre').hide();
        }else{
            $('.regulamentado').hide();
            $('.livre').show();
        }
    });

    $('.notificacao').click(function(e) {
        e.preventDefault(); // stops link from making page jump to the top
        e.stopPropagation(); // when you click the button, it stops the page from seeing it as clicking the body too
        $('.notificacoes_ul').slideToggle(100);
        $(this).toggleClass('notif_ativa');
    });

    $('.notificacoes_ul').click(function(e) {
        e.stopPropagation(); // when you click within the content area, it stops the page from seeing it as clicking the body too
    });

    $('.html').click(function() {
        $('.notificacoes_ul').slideUp(100);
        $('.notificacao.notif_ativa').removeClass('notif_ativa');
    });
});

//Verificar se pegou o código TODO: Comentar depois de comprovar
//window.onload = () => alert("JavaScript Loaded");

//Pegar o input do email

function validarEmail($target) {
    var value = $target.value;
    var regex = RegExp('\^[a-z]+([.]+[a-z]+)+@isptec.co.ao$');
    if (regex.test(value)) {
        //Condição Verdadeira
        //Para comprovar que a função entrou TODO: Comentar depois de comprovar
        $('.estado-log1').show(100);
        $('.estado-log2').hide(100);
    } else {
        //Condição Falsa
        //Para comprovar que a função entrou TODO: Comentar depois de comprovar
        $('.estado-log2').show(100);
        $('.estado-log1').hide(100);
    }
}

// TABS

function openSubTab(evt, curso) {
    var i, subtab, tablinks;
    subtab = document.getElementsByClassName("sub-tab");
    for (i = 0; i < subtab.length; i++) {
        subtab[i].style.display = "none";
    }
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(curso).style.display = "flex";
    evt.currentTarget.className += " active";
}

function openCurso(evt, curso) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(curso).style.display = "block";
    evt.currentTarget.className += " active";
}

function openLab(evt, curso) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("sub-tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(curso).style.display = "block";
    evt.currentTarget.className += " active";
}

/**************FORMS********* */
function displayForm(id) {
    var form = document.querySelector('.form');
    form.style.display = "flex";
    var fieldset = document.querySelector('.form-field');
    fieldset.style.marginTop = "0";
    specForm = document.querySelectorAll('.form-item');
    specForm.forEach(element => { element.style.display = "none"; });
    specForm = document.querySelectorAll('#' + id);
    specForm.forEach(element => { element.style.display = "block"; });

}

function displayOff() {
    var form = document.querySelector('.form');
    form.style.display = "none";
    var fieldset = document.querySelector('.form-field');
    fieldset.style.marginTop = "-300vh";
}

function trocoCalc() {
    if ($("#vendaValorPago").val() < tmp) {
        $("#vendaValorPago").css("border-bottom", "2px solid red");
        $("#vendaValorPago").css("border-left", "1px solid red");

    } else {
        var troco = ($("#vendaValorPago").val() - subTotalPagar);
        document.getElementById("troco").placeholder = "Troco a dar: " + troco + " KZ";
        if (troco < 0.0)
            $("#troco").css("border-bottom", "2px solid red");
        else
            $("#troco").css("border-bottom", "2px solid var(--primary-color)");

        document.getElementById("HpU").value = tmp;
        document.getElementById("HsubTotal").value = subTotalPagar;
        document.getElementById("Htroco").value = troco;
        $("#vendaValorPago").css("border-bottom", "2px solid var(--primary-color)");
        $("#vendaValorPago").css("border-left", "1px solid var(--primary-color)");
    }
}

function subTotalCalc() {
    if (((quantProd - $("#vendaQuant").val()) < 0) || ($("#vendaQuant").val() < 1)) {
        $("#vendaQuant").css("border-bottom", "2px solid red");
        $("#vendaQuant").css("border-left", "1px solid red");
    } else {
        $("#vendaQuant").css("border-bottom", "2px solid var(--primary-color)");
        $("#vendaQuant").css("border-left", "1px solid var(--primary-color)");
        subTotalPagar = ($("#vendaQuant").val() * tmp);
        document.getElementById("subTotal").placeholder = "Total a pagar: " + subTotalPagar + " KZ";
    }
}

function getPrice() {
    //$('#boa').addClass('beal');

    getQuant();
    $.ajax({
        url: 'controller/contAuxiliar.php?getPrice=' + $('#vendaProd').val(),
        method: 'GET'
    }).done(function(data) {
        document.getElementById("pU").placeholder = "Preço do produto: " + data + " KZ";
        document.getElementById("subTotal").placeholder = "Total a pagar: ::: KZ";
        document.getElementById("troco").placeholder = "Troco a dar: ::: KZ";
        document.getElementById("vendaQuant").value = "";
        document.getElementById("vendaValorPago").value = "";
        subTotalPagar = 0.0;
        tmp = data;

        $("#vendaQuant").css("border-bottom", "2px solid var(--primary-color)");
        $("#vendaQuant").css("border-left", "1px solid var(--primary-color)");
        $("#troco").css("border-bottom", "2px solid var(--primary-color)");
    })
}

function getQuant() {
    $.ajax({
        url: 'controller/contAuxiliar.php?getQuant=' + $('#vendaProd').val(),
        method: 'GET'
    }).done(function(data) {
        quantProd = data;
        document.getElementById("vendaQuant").placeholder = "Quant. à levar.    Limite Máx. de: " + quantProd;
    })
}
/*option[value='option1']").remove()
function mudeProd() {
    $("#" + $("#dashCat").val()).removeClass('prodInativo');
    $("#" + $("#dashCat").val()).addClass('prodAtivo');
    alert($("#dashCat").val());
    if (ativo == -1)
        ativo = $("#dashCat").val();
    else {
        $("#" + ativo).removeClass('prodAtivo');
        $("#" + ativo).addClass('prodInativo');
        ativo = $("#dashCat").val();
    }
}*/


function CalcTotalByCat() {
    document.getElementById("dashValue").innerHTML = "0.0 KZ";
    $.ajax({
        url: 'controller/contAuxiliar.php?cat=' + $('#dashCat').val(),
        method: 'GET'
    }).done(function(data) {
        var ki = data.replace("[", "").replace("]", "").split(",");
        $("#dashProd").children('option:not(:first)').remove().attr("selected", "");
        for (var index = 0; index < ki.length; index++) {
            if (ki[index] != "") {
                var meuValor = ki[index].replace('"', "").replace('"', "");
                $('#dashProd').append($("<option></option>").attr("value", meuValor).text(meuValor));
            }
        }
    });

    $.ajax({
        url: 'controller/contAuxiliar.php?totalVenda=' + $('#dashCat').val(),
        method: 'GET'
    }).done(function(data) {
        if (data == " KZ") {
            data = "0.0 KZ";
            $("#dashValue").css("color", "red");
        } else {
            $("#dashValue").css("color", "green");
        }
        document.getElementById("dashValue").innerHTML = data;
    })
}

function CalcTotalByProd() {
    document.getElementById("dashValue").innerHTML = "0.0 KZ";
    $.ajax({
        url: 'controller/contAuxiliar.php?totalVendaProd=' + $('#dashProd').val(),
        method: 'GET'
    }).done(function(data) {
        if (data == " KZ") {
            data = "0.0 KZ";
            $("#dashValue").css("color", "red");
        } else {
            $("#dashValue").css("color", "green");
        }
        document.getElementById("dashValue").innerHTML = data;
    })
}

function getStock() {
    $.ajax({
        url: 'controller/contAuxiliar.php?getStock=' + $('#upProduto').val(),
        method: 'GET'
    }).done(function(data) {
        document.getElementById("StockUp").innerHTML = "STOCK ACTUAL ATINGIDO: " + data + " UND";
    })
}
/** READ MORE AND READ LESS */
function showMore() {
    var less = document.getElementById('less');
    var more = document.getElementById('more');
    less.style.display = 'none';
    more.style.display = 'block';
}

function showLess() {
    var less = document.getElementById('less');
    var more = document.getElementById('more');
    less.style.display = 'inline';
    more.style.display = 'none';
}

function primeiro_passo() {
    document.getElementById("passo1").style.display = "block";
    document.getElementById("passo2").style.display = "none";
    document.getElementById("passo3").style.display = "none";
}

function segundo_passo() {
    document.getElementById("passo1").style.display = "none";
    document.getElementById("passo2").style.display = "block";
    document.getElementById("passo3").style.display = "none";
}

function terceiro_passo() {
    document.getElementById("passo1").style.display = "none";
    document.getElementById("passo2").style.display = "none";
    document.getElementById("passo3").style.display = "block";
}