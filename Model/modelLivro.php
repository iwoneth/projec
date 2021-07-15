<?php
    require_once($GLOBALS['basepath'].'model/conexao.php');
    class ModelLivro{
        public function setLivro($data){
            $dados = "values ('".$data["codnu"]."','".$data["nomeresp"]."','".$data["endereco"]."','".$data["plano_jaba"]."','".$data["n_membro"]."')";
            $table = 'tlivro';
            $db = new connection();
            var_dump($db);
            return $db->insertor($dados, $table);
        }

        public function getIdLivro($data){
            $chamada = "select F_getIdLivro('".$data."') as codigo";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }

        public function getAllLivro(){
            $chamada = "select * from view_getalllivro";
            $db = new connection();
            $dados = $db->executer($chamada);
            return $dados->fetchAll();
        }
    } 
?>