<?php
    require_once($GLOBALS['basepath'].'model/conexao.php');
    class ModelRegulamento{
        
        public function setProdReg($data){
            $dados = "values ('".$data["idproduto"]."','".$data["qtdade_max"]."','".$data["nive_subsidio"]."')";
            $table='tpRegulamentado';

            $db = new connection();
            return $db->insertor($dados, $table);;
        
        }

        public function getIdProdLivre($data){
            $chamada = "select F_getIdProduto('".$data."') as codigo";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }

        public function getAllProdutoLivre(){
            $chamada = "select * from view_getallproduct";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }

        public function getAllProdutoLivreByCat($data){
            $chamada = "select * from view_getallproduct where idCategoria='".$data."'";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }
        public function getProdLivrePrice($data){
            $chamada = "select F_getPriceByIdProd('".$data."') as price";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }
        
        public function getProdLivreQuant($data){
            $chamada = "select F_getStockActual('".$data."') as stock";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }
    } 
?>