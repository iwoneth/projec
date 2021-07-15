<?php
    
    class ControllerProduto{

        function setProduct(){
            require_once($GLOBALS['basepath'] . "model/modelProduto.php");
            require_once($GLOBALS['basepath'].'controller/contRegulament.php');
            require_once($GLOBALS['basepath'].'controller/contLivre.php');


            require_once($GLOBALS['basepath'].'model/conexao.php');


            #$key = array_keys($_POST);
            #$dados[] = ($_POST[$key[0]]);
            $dados['nome']=$_POST['nomProd'];
            $dados['estado']=(int)$_POST['estado']; 
            $dados['custprod']=(int)$_POST['custp']; 

            //$dados['tipologia']=$_POST['tipologia']==1 ? 'InterNacional' : 'Nacional';
            $dados['qtdadeexst']=(int)$_POST['QtddePro'];
            

            $model=new ModelProduto();
            try {
                $model->setProd($dados);
                unset($model);
                if($_POST['tipologia']==1){
                    $control=new ControllerProdutoRegulamentado();
                    $control->setProductReg();
                    
                    unset($control);
                }
                else{
                    if($_POST['tipologia']==2){
                        $control=new ControllerProdutoLivre();
                        $control->setProductLiv();
                        unset($control);
                     }
                //require_once($GLOBALS['basepath'] . "view/Confirmacao.phtml");
                 }
            }
            catch(Exception $e){
                $errorOperation = $e;
                unset($model);
                require_once($GLOBALS['basepath'] . "view/SemAcesso.phtml");  
            }
        }
        
        function restoreStock(){
            require_once($GLOBALS['basepath'] . "model/modelProduto.php");
            $dados['idProd']=$_POST['upProduto'];
            $dados['quant']=$_POST['upStock'];
            $model=new ModelProduto();
            try {
                $model->restoreStock($dados);
                unset($model);
                require_once($GLOBALS['basepath'] . "view/successful.phtml");
            }
            catch(Exception $e){
                $errorOperation = $e;
                unset($model);
                require_once($GLOBALS['basepath'] . "view/SemAcesso.phtml");  
            }
        }

        function getIdProd(){
            require_once($GLOBALS['basepath'] . "model/modelProduto.php");
            $model=new ModelProduto();
            return $model->getIdProd("Motorizada");
        }

        function getAllProdutos(){
            require_once($GLOBALS['basepath'] . "model/modelProduto.php");
            $model=new ModelProduto();
            return $model->getAllProduto();
        }

        function getAllProdutoByCat(){
            require_once($GLOBALS['basepath'] . "model/modelProduto.php");
            $model=new ModelProduto();
            $data=$_GET['cat'];
            return $model->getAllProdutoByCat($data);
        }
        function getProdPrice(){
            require_once($GLOBALS['basepath'] . "model/modelProduto.php");
            $model=new ModelProduto();
            $data=$_GET['getPrice'];
            $tmp=$model->getProdPrice($data);
            foreach($tmp as $price){
                return $price[0];
            }
        }
        
        function getProdQuant($data){
            require_once($GLOBALS['basepath'] . "model/modelProduto.php");
            $model=new ModelProduto();
            $tmp=$model->getProdQuant($data);
            foreach($tmp as $quant){
                return $quant[0];
            }
        }
    }
?>