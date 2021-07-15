<div class="item_quadrado" onclick="displayForm('newCat')">
                        <div class="foto">
                            <span class="item_icon"><i class="fad fa-stream"></i></span>
                        </div>
                        <h1 class="titulo_item">Registrar Categoria</h1>
                    </div>

                    <div class="item_quadrado" onclick="displayForm('newFunc')">
                        <div class="foto">
                            <span class="item_icon"><i class="fad fa-user-tie"></i></span>
                        </div>
                        <div class="item_quadrado" onclick="displayForm('upgradeStock')">
                        <div class="foto">
                            <span class="item_icon"><i class="fad fa-layer-plus"></i></span>
                        </div>
                        <h1 class="titulo_item">Actualizar Stock</h1>
                    </div>

                    <div class="item_quadrado" onclick="displayForm('dashBoard')">
                        <div class="foto">
                            <span class="item_icon"><i class="fad fa-badge-dollar"></i></span>
                        </div>
                        <h1 class="titulo_item">Dashboard Pedido</h1>
                    </div>

  
            <legend class="form-legend form-item" id="upgradeStock"><i class="fas fa-layer-plus form-legend-icon"></i></legend>
  
            

 <div id="upgradeStock" class="form-item">
                <h2 class="form-title">ACTUALIZANDO STOCK</h2>
                <form method="post" class="form-content">
                    <select name="upProduto" id="upProduto"class="form-select" required="" onchange="getStock();">
                        <option value="" selected="" disabled="">Selecione o produto</option>
                        <?php
                            /*$model=new ControllerProduto();
                            $data=$model->getAllProdutos();
                            foreach($data as $d){
                        */?><option value="<?php #echo $d[0];?>"><?php #echo $d[1];?></option>
                        <?php #} ?>
                    </select>
                    <h3 class="titulo_item" style="color: var(--primary-color);" id="StockUp">STOCK ACTUAL ATINGIDO: __ UND </h3>
                    <input type="number" name="upStock" placeholder="Actualize o novo stock" class="form-input" required="">
                    <button type="reset" class="form-button button-secondary"><i style="font-size:20px"class="fad fa-eraser form-legend-icon"></i>Limpar</button>
                    <button type="submit" name="upProd" class="form-button button-primary"><i style="font-size:20px"class="fad fa-layer-plus form-legend-icon"></i>Atualizar o Stock</button>
                </form>
            </div>
            











             <label>Tipo</label>

                         <select name="estado" class="form-select" required="">

                             <option value="" selected="" disabled=""> Nacional</option>
                             <a href="produtoRegu.phtml"></a>
                             <?php #echo $d[0];?>"><?php #echo $d[1];?>

                             <option value="" selected="" disabled="">Exportado </option>
                             <a href="prodtoBal.phtml"></a>
                             <?php #echo $d[0];?>"><?php #echo $d[1];?>
                        
                         </select>








                         // <input type="number" name="nivel_sub"placeholder="Nível de subsidio" class="regulamentado form-input"  >