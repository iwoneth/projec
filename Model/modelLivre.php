<?php
    require_once($GLOBALS['basepath'].'model/conexao.php');
    class ModelProdutoLivre{
        
        public function setProdLivr($data){
            $dados = "values ('".$data["padicional"]."','".$data["idproduto"]."')";
            $table='tplivre';

            $db = new connection();
            return $db->insertor($dados, $table);;
        
        }

        public function getIdProdReg($data){
            $chamada = "select F_getIdProduto('".$data."') as codigo";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }

        public function getAllProdutoReg(){
            $chamada = "select * from view_getallproduct";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }

        public function getAllProdutoByCatReg($data){
            $chamada = "select * from view_getallproduct where idCategoria='".$data."'";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }
        public function getProdPriceReg($data){
            $chamada = "select F_getPriceByIdProd('".$data."') as price";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }
        
        public function getProdQuantReg($data){
            $chamada = "select F_getStockActual('".$data."') as stock";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }
    } 
?>