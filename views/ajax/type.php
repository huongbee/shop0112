<?php
// echo "Da nhan";
// print_r($result);
// die;

?>
<?php foreach($result as $f):?>
<div class="col-md-4 col-sm-6 col-xs-12">
    <div class="blog-item item swin-transition">
        <div class="block-img">
            <img src="public/source/assets/images/hinh_mon_an/<?=$f->image?>" alt="" class="img img-responsive" style="height:250px">
            <div class="block-circle price-wrapper">
                <span class="price woocommerce-Price-amount amount">
                    <?=number_format($f->price)?>
                        <span class="price-symbol"> vnd</span>
                </span>
            </div>
            <div class="group-btn">
                <a href="<?=$f->url?>-<?=$f->id?>.html" class="swin-btn btn-link">
                    <i class="icons fa fa-link"></i>
                </a>
                <a href="javascript:void(0)" class="swin-btn btn-add-to-card">
                    <i class="fa fa-shopping-basket"></i>
                </a>
            </div>
        </div>
        <div class="block-content">
            <h5 class="title">
                <a href="<?=$f->url?>-<?=$f->id?>.html">
                    <?=$f->name?>
                </a>
            </h5>
            <div class="product-info">
                <?=$f->summary?>
            </div>
        </div>
    </div>
</div>
<? endforeach?>