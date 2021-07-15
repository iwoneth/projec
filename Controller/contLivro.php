<?php
    
    class ControllerLivro{

        function setLivro(){
            require_once($GLOBALS['basepath'] . "model/modelLivro.php");
            $key = array_keys($_POST);
            $dados[] = ($_POST[$key[0]]);
            $dados['codnu']=$_POST['Numbnucleo'];
            $dados['nomeresp']=$_POST['Nameresp'];
            $dados['endereco']=$_POST['endernucleo'];
            $dados['plano_jaba']=$_POST['prodCat'];
            $dados['n_membro']=$_POST['NumMembNucl'];
            $model=new ModelLivro();
            try {
                $model->setLivro($dados);
                unset($model);
                require_once($GLOBALS['basepath'] . "view/Confirmacao.phtml");
            }
            catch(Exception $e){
                $errorOperation = $e;
                unset($model);
                require_once($GLOBALS['basepath'] . "view/SemAcesso.phtml");  
            }
        }
        
        function getIdLivro(){
            require_once($GLOBALS['basepath'] . "model/modelLivro.php");
            $model=new ModelLivro();
            return $model->getIdFunc("Motorizada");
        }

        function getAllLivro(){
            require_once($GLOBALS['basepath'] . "model/modelLivro.php");
            $model=new ModelLivro();
            return $model->getAllLivro();
        }
    }
?>