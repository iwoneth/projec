<?php
    
    class ControllerProdutoLivre{

        function setProductLiv(){
            require_once($GLOBALS['basepath'] . "model/modelLivre.php");
            require_once($GLOBALS['basepath'] . "model/modelProduto.php");

            #$key = array_keys($_POST);
            #$dados[] = ($_POST[$key[0]]);
            $dados['padicional']=(int)$_POST['precAdic'];
           var_dump($_POST['precAdic']);
           
            $model=new ModelProduto();
            $id=$model->getLastIdProd();
            $dados['idproduto']=(int)$id[0][0];
           

            $model=new ModelProdutoLivre();
            try {
                $model->setProdLivr($dados);
                unset($model);
                require_once($GLOBALS['basepath'] . "view/Confirmacao.phtml");
            }
            catch(Exception $e){
                $errorOperation = $e;
                unset($model);
                require_once($GLOBALS['basepath'] . "view/SemAcesso.phtml");  
            }
        }
        
        function restoreStock(){
            require_once($GLOBALS['basepath'] . "model/modelLivre.php");
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
            require_once($GLOBALS['basepath'] . "model/modelLivre.php");
            $model=new ModelProduto();
            return $model->getIdProd("Motorizada");
        }

        function getAllProdutos(){
            require_once($GLOBALS['basepath'] . "model/modelLivre.php");
            $model=new ModelProduto();
            return $model->getAllProduto();
        }

        function getAllProdutoByCat(){
            require_once($GLOBALS['basepath'] . "model/modelLivre.php");
            $model=new ModelProduto();
            $data=$_GET['cat'];
            return $model->getAllProdutoByCat($data);
        }
        function getProdPrice(){
            require_once($GLOBALS['basepath'] . "model/modelLivre.php");
            $model=new ModelProduto();
            $data=$_GET['getPrice'];
            $tmp=$model->getProdPrice($data);
            foreach($tmp as $price){
                return $price[0];
            }
        }
        
        function getProdQuant($data){
            require_once($GLOBALS['basepath'] . "model/modelLivre.php");
            $model=new ModelProduto();
            $tmp=$model->getProdQuant($data);
            foreach($tmp as $quant){
                return $quant[0];
            }
        }
    }
?>