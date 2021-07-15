<?php
    
    class ControllerProdutoRegulamentado{

        function setProductReg(){
            require_once($GLOBALS['basepath'] . "model/modelRegulament.php");
            require_once($GLOBALS['basepath'] . "model/modelProduto.php");
            #$key = array_keys($_POST);
            #$dados[] = ($_POST[$key[0]]);
            $dados['qtdade_max']=$_POST['qtmaxpess'];
            $dados['nive_subsidio']=$_POST['nivel_sub'];

            $model=new ModelProduto();
            $id=$model->getLastIdProd();
            $dados['idproduto']=(int)$id[0][0];
           
            $model1=new ModelRegulamento();
            try {
                $model1->setProdReg($dados);
                unset($model1);
                require_once($GLOBALS['basepath'] . "view/Confirmacao.phtml");
            }
            catch(Exception $e){
                $errorOperation = $e;
                unset($model);
                require_once($GLOBALS['basepath'] . "view/SemAcesso.phtml");  
            }
        }
        
        function restoreStock(){
            require_once($GLOBALS['basepath'] . "model/modelRegulament.php");
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
            require_once($GLOBALS['basepath'] . "model/modelRegulament.php");
            $model=new ModelProduto();
            return $model->getIdProd("Motorizada");
        }

        function getAllProdutos(){
            require_once($GLOBALS['basepath'] . "model/modelRegulament.php");
            $model=new ModelProduto();
            return $model->getAllProduto();
        }

        function getAllProdutoByCat(){
            require_once($GLOBALS['basepath'] . "model/modelRegulament.php");
            $model=new ModelProduto();
            $data=$_GET['cat'];
            return $model->getAllProdutoByCat($data);
        }
        function getProdPrice(){
            require_once($GLOBALS['basepath'] . "model/modelRegulament.php");
            $model=new ModelProduto();
            $data=$_GET['getPrice'];
            $tmp=$model->getProdPrice($data);
            foreach($tmp as $price){
                return $price[0];
            }
        }
        
        function getProdQuant($data){
            require_once($GLOBALS['basepath'] . "model/modelRegulament.php");
            $model=new ModelProduto();
            $tmp=$model->getProdQuant($data);
            foreach($tmp as $quant){
                return $quant[0];
            }
        }
    }
?>