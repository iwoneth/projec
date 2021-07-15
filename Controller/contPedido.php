<?php
    
    class ControllerPedido{

        function setPedido(){
            require_once($GLOBALS['basepath'] . "model/modelPedido.php");
            #$key = array_keys($_POST);
            #$dados[] = ($_POST[$key[0]]);
            $dados['prodName']=$_POST['vendaProd'];
            $dados['pU']=$_POST['pU'];
            $dados['vendaQuant']=$_POST['vendaQuant1'];
            $dados['subTotal']=$_POST['subTotal'];
            $dados['vendaValorPago']=$_POST['vendaValorPago1'];
            $dados['troco']=$_POST['troco'];
            $dados['vendaAtendido']=$_POST['vendaAtendido'];
            $model=new ModelPedido();
            try {
                $model->setPedido($dados);
                unset($model);
                require_once($GLOBALS['basepath'] . "view/Confirmacao.phtml");
            }
            catch(Exception $e){
                $errorOperation = $e;
                unset($model);
                require_once($GLOBALS['basepath'] . "view/SemAcesso.phtml");  
            }
        }
        
        /*function getIdVenda(){
            require_once($GLOBALS['basepath'] . "model/modelVenda.php");
            $model=new ModelVenda();
            return $model->getIdVenda("Motorizada");
        }
*/
        function getTotalPedidoByCat(){
            require_once($GLOBALS['basepath'] . "model/modelPedido.php");
            $model=new ModelVenda();
            $tmp=$model->getTotalPedidoByCat($_GET['totalPedido']);
            foreach($tmp as $total){
                return $total[0];
            }
        }
        
        function getTotalVendaByProd(){
            require_once($GLOBALS['basepath'] . "model/modelVenda.php");
            $model=new ModelVenda();
            $tmp=$model->getTotalVendaByProd($_GET['totalVendaProd']);
            foreach($tmp as $total){
                return $total[0];
            }
        }
    }
?>