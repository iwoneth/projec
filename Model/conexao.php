<?php
class connection{
    public $conn;
    public function connect(){
        $conn = new PDO('mysql:host=localhost;dbname=vendas_produtos','root','');
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    }
    public function selector($projection, $table){
      $query = "SELECT ". $projection." FROM ".$table;
      return $this->executer($query);
    }

    public function insertor($dados, $table){
      $query = "INSERT INTO ".$table." ".$dados;
      return $this->executer($query);
    }

    public function delector($table,$value){
      $query = "DELETE FROM ". $table ." WHERE ".$value;
      return $this->executer($query);
    }

    public function updator($table,$data,$idKey,$idValue){
      $query = "UPDATE ". $table ." SET ".$data."  WHERE ".$idKey." = '".$idValue."'";
      return $this->executer($query);
    }

    public function executer($sql){
      $conn = $this->connect();
      $data = $conn->prepare($sql);
      $data->execute();
      return $data;
    }
}
