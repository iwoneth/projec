<?php

    //Instaciar uma sessão
    @session_start();

    //Definir variaveis globais para caminhos do ficheiro
    $GLOBALS['basepath'] = $_SERVER['DOCUMENT_ROOT'].'/Projecto_AW/';
    $GLOBALS['referer'] = '/Projecto_AW/indexAW.php';

    //chamar os controllerss
    require_once($GLOBALS['basepath'].'controller/contProduto.php');
    require_once($GLOBALS['basepath'].'controller/contLivro.php');
    require_once($GLOBALS['basepath'].'controller/contPedido.php');
    require_once($GLOBALS['basepath'].'controller/contRegulament.php');
    require_once($GLOBALS['basepath'].'controller/contLivre.php');
    //Preparar controlo de rotas a partir da URI
    $uri = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '';
    /*if($uri != ''){
        $uriPart = explode("/", $uri);
        $action = $uriPart[2] ;
        $destination = $uriPart[1] ;
    }*/

    //Estabelecendo modulos por default 
    require_once($GLOBALS['basepath'].'view/includes/header.phtml');
    if($uri == '' || $uri == '/indexAW.php'){
        if(!empty($_POST)){
            if(isset($_POST["addProd"])){
                $control=new ControllerProduto();
                $control->setProduct();
                unset($control);
            }else if(isset($_POST["addLivro"])){
                $control=new ControllerLivro();
                $control->setLivro();
                unset($control);
            }else if(isset($_POST["addPedido"])){
                $control=new ControllerPedido();
                $control->setPedido();
                unset($control);
            }else if(isset($_POST["upProd"])){
                $control=new ControllerProduto();
                $control->restoreStock();
                unset($control);
            }
        }
        require_once($GLOBALS['basepath']."view/indexAW.phtml");
        unset($control);
    }
    require_once($GLOBALS['basepath'].'view/includes/footer.phtml');
    
?>