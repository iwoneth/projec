<?php 
    $GLOBALS['basepath'] = $_SERVER['DOCUMENT_ROOT'].'/Projecto_AW/';
    if(isset($_GET['getPrice'])){
        require_once($GLOBALS['basepath'] . 'controller/contProduto.php');
        $control=new ControllerProduto();
        echo $control->getProdPrice();
    }else if(isset($_GET['getQuant'])){
        require_once($GLOBALS['basepath'] . 'controller/contProduto.php');
        $control=new ControllerProduto();
        $data=$_GET['getQuant'];
        echo $control->getProdQuant($data);
    }else if(isset($_GET['cat'])){
        require_once($GLOBALS['basepath'] . 'controller/contProduto.php');
        $control=new ControllerProduto();
        $data=$control->getAllProdutoByCat();
        //$teste=array();
        $i=0;
        $teste=array();
        foreach($data as $d){
            $teste[$i]= $d[1];
            $i=$i+1;
        }
        echo json_encode($teste,JSON_UNESCAPED_UNICODE) ;
    }else if(isset($_GET['totalVenda'])){
        require_once($GLOBALS['basepath'] . 'controller/contPedido.php');
        $control=new ControllerPedido();
        $data=$control->getTotalPedidoByCat();
        echo $data." KZ";
    }else if(isset($_GET['totalVendaProd'])){
        require_once($GLOBALS['basepath'] . 'controller/contPedido.php');
        $control=new ControllerPedido();
        $data=$control->getTotalPedidoByProd();
        echo $data." KZ";
    }else if(isset($_GET['getStock'])){
        require_once($GLOBALS['basepath'] . 'controller/contProduto.php');
        $control=new ControllerProduto();
        $data=$_GET['getStock'];
        echo $control->getProdQuant($data);
    }else{
        echo 2;
    }
?>