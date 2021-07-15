<?php
    require_once($GLOBALS['basepath'].'model/conexao.php');
    class ModelPedido{
        public function setPedido($data){
            $chamada = "call P_setVenda('".$data["fk_idproduto"]."','".$data["fk_codnu"]."','".$data["qtdade"]."')";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados;
        }

        public function getTotalPedidoByProd($data){
            $chamada = "select sum(qtdade) from view_getdadosprodproduto where produto=F_getIdProduto('".$data."')";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }
    } 
?>