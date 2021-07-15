<?php
    require_once($GLOBALS['basepath'].'model/conexao.php');
    class ModelProduto{
        
        public function setProd($data){
            $dados = "values (null,'".$data["nome"]."','".$data["estado"]."','".$data["custprod"]."','".$data["qtdadeexst"]."')";
            $table='tproduto';
            //`idproduto` FROM tproduto ORDER BY idproduto DESC LIMIT 1
            $db = new connection();
            return $db->insertor($dados, $table);
            
        }
        
        public function getLastIdProd(){
            $table = "tproduto ORDER BY idproduto DESC LIMIT 1";
            $projection='idproduto';
            $db = new connection();
            $dados = $db->selector($projection,$table);
            return $dados->fetchAll();
        }

        public function getIdProd($data){
            $chamada = "select F_getIdProduto('".$data."') as codigo";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }


        public function getAllProduto(){
            $chamada = "select * from view_getallproduct";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }

        public function getAllProdutoByCat($data){
            $chamada = "select * from view_getallproduct where idCategoria='".$data."'";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }
        public function getProdPrice($data){
            $chamada = "select F_getPriceByIdProd('".$data."') as price";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }
        
        public function getProdQuant($data){
            $chamada = "select F_getStockActual('".$data."') as stock";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }
    } 
?>