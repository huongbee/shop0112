<?php
// print_r($data);
// die;

?>
    <div class="page-container">
        <div data-bottom-top="background-position: 50% 50px;" data-center="background-position: 50% 0px;" data-top-bottom="background-position: 50% -50px;"
            class="page-title page-reservation">
            <div class="container">
                <div class="title-wrapper">
                    <div data-top="transform: translateY(0px);opacity:1;" data--20-top="transform: translateY(-5px);" data--50-top="transform: translateY(-15px);opacity:0.8;"
                        data--120-top="transform: translateY(-30px);opacity:0;" data-anchor-target=".page-title" class="title">Giỏ hàng của bạn</div>
                    <div data-top="opacity:1;" data--120-top="opacity:0;" data-anchor-target=".page-title" class="divider">
                        <span class="line-before"></span>
                        <span class="dot"></span>
                        <span class="line-after"></span>
                    </div>
                    <div data-top="transform: translateY(0px);opacity:1;" data--20-top="transform: translateY(5px);" data--50-top="transform: translateY(15px);opacity:0.8;"
                        data--120-top="transform: translateY(30px);opacity:0;" data-anchor-target=".page-title" class="subtitle">Just a few click to make the reservation online for saving your time and money</div>
                </div>
            </div>
        </div>
        <div class="page-content-wrapper">
            <section class="section-reservation-form padding-top-100 padding-bottom-100">
                <div class="container">
                    <div class="section-content">
                        <div class="swin-sc swin-sc-title style-2">
                            <h3 class="title">
                                <span id="message">
                                    <?=$data->totalPrice!=0 ? 'Chi tiết giỏ hàng':'Giỏ hàng rỗng'?>
                                </span>
                            </h3>
                        </div>
                        <?php if($data->totalPrice!=0):?>
                        <div class="reservation-form">
                            <div class="swin-sc swin-sc-contact-form light mtl">
                                <table class="table table-striped" style="text-align: center;">
                                    <thead>
                                        <tr>
                                            <th width="30%" style="text-align: center;">Product</th>
                                            <th width="20%" style="text-align: center;">Price</th>
                                            <th width="20%" style="text-align: center;">Qty.</th>
                                            <th width="20%" style="text-align: center;">Total</th>
                                            <th width="10%" style="text-align: center;">Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach($data->items as $idSP => $sanpham):?>
                                        <tr class="productInfo-<?=$idSP?>">
                                            <td>
                                                <img src="public/source/assets/images/hinh_mon_an/<?=$sanpham['item']->image?>" width="150px">
                                                <p>
                                                    <br>
                                                    <b>
                                                        <?=$sanpham['item']->name?>
                                                    </b>
                                                </p>
                                            </td>
                                            <td>
                                                <?=number_format($sanpham['item']->price)?> vnd</td>
                                            <td>
                                                <select name="product-qty" id="product-qty" class="form-control txtQty" width="20" data-id="<?=$idSP?>">
                                                    <?php for($i=1; $i<=10; $i++):?>
                                                    <option value="<?=$i?>" <?=$i==$sanpham[ 'qty'] ? "selected": ''?>>
                                                        <?=$i?>
                                                    </option>
                                                    <?php endfor?>
                                                </select>
                                            </td>
                                            <td class="detailPrice-<?=$idSP?>">
                                                <?=number_format($sanpham['price'])?> vnd
                                            </td>
                                            <td>
                                                <a class="remove" data-id="<?=$idSP?>" title="Remove this item">
                                                    <i class="fa fa-trash-o fa-2x"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <?php endforeach?>
                                        <tr>
                                            <td colspan="3" style="font-size:20px; text-align:right">Tổng tiền:</td>
                                            <td style="font-size:20px; color:blue" class="totalPrice">
                                                <?=number_format($data->totalPrice)?> vnd</td>
                                            <td></td>
                                        </tr>

                                </tbody>
                            </table>

                        </div>
                        <div class="swin-sc swin-sc-contact-form light mtl style-full">
                            <div class="swin-sc swin-sc-title style-2">
                                <h3 class="title">
                                    <span>Đặt hàng</span>
                                </h3>
                            </div>
                            <form method="post">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <input type="text" placeholder="Fullname" class="form-control" require name="fullname">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-envelope"></i>
                                        </div>
                                        <input type="email" placeholder="Email" class="form-control" require name="email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <div class="fa fa-map-marker"></div>
                                        </div>
                                        <input type="text" placeholder="Address" class="form-control" require name="address">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <div class="fa fa-phone"></div>
                                        </div>
                                        <input type="text" placeholder="Phone" class="form-control" require name="phone">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <textarea placeholder="Message" class="form-control" name="note"></textarea>
                                </div>
                                <div class="form-group">
                                    <div class="swin-btn-wrap center">
                                        <button type="submit" class="swin-btn center form-submit" name="btnCheckout">
                                            <span>Checkout</span>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <?php endif?>
                        </div>
                    </div>
                </div>
            </section>
            <section data-bottom-top="background-position: 50% 100px;" data-center="background-position: 50% 0px;" data-top-bottom="background-position: 50% -100px;"
                class="section-reservation-service padding-top-100 padding-bottom-100">
                <div class="container">
                    <div class="section-content">
                        <div class="swin-sc swin-sc-title style-2 light">
                            <h3 class="title">
                                <span>Fooday Best Service</span>
                            </h3>
                        </div>
                        <div class="swin-sc swin-sc-iconbox light">
                            <div class="row">
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="item icon-box-02 wow fadeInUpShort">
                                        <div class="wrapper-icon">
                                            <i class="icons swin-icon-dish"></i>
                                            <span class="number">1</span>
                                        </div>
                                        <h4 class="title">Reservation</h4>
                                        <div class="description">Lorem ipsum dolor sit amet, tong consecteturto sed eiusmod incididunt utote labore
                                            et
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div data-wow-delay="0.5s" class="item icon-box-02 wow fadeInUpShort">
                                        <div class="wrapper-icon">
                                            <i class="icons swin-icon-dinner-2"></i>
                                            <span class="number">2</span>
                                        </div>
                                        <h4 class="title">Private Event</h4>
                                        <div class="description">Lorem ipsum dolor sit amet, tong consecteturto sed eiusmod incididunt utote labore
                                            et
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div data-wow-delay="1s" class="item icon-box-02 wow fadeInUpShort">
                                        <div class="wrapper-icon">
                                            <i class="icons swin-icon-browser"></i>
                                            <span class="number">3</span>
                                        </div>
                                        <h4 class="title">Online Order</h4>
                                        <div class="description">Lorem ipsum dolor sit amet, tong consecteturto sed eiusmod incididunt utote labore
                                            et
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div data-wow-delay="1.5s" class="item icon-box-02 wow fadeInUpShort">
                                        <div class="wrapper-icon">
                                            <i class="icons swin-icon-delivery"></i>
                                            <span class="number">4</span>
                                        </div>
                                        <h4 class="title">Fast Delivery</h4>
                                        <div class="description">Lorem ipsum dolor sit amet, tong consecteturto sed eiusmod incididunt utote labore
                                            et
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.txtQty').change(function () {
                var qty = $(this).val()
                var idSP = $(this).attr('data-id')
                var action = "update";
                $.ajax({
                    url: "cart.php",
                    data: {
                        id: idSP, // $_POST['id']
                        quantity: qty, // $_POST['quantity]
                        action: action
                    },
                    type: "POST",
                    dataType: 'JSON',
                    success: function (result) {
                        //console.log(result)
                        var totalPrice = result.totalPrice
                        var detailPrice = result.detailPrice

                        $('.totalPrice').text(totalPrice)
                        $('.detailPrice-' + idSP).text(detailPrice)
                    }
                })
            })

            $('.remove').click(function () {
                var idSP = $(this).attr('data-id');
                $.ajax({
                    url: 'cart.php',
                    data: {
                        id: idSP,
                        action: "delete"
                    },
                    type: "POST",
                    success: function (result) {
                        //console.log(result)
                        if ($.trim(result) == '0') {
                            $('.reservation-form').hide(500)
                            $('#message').text('Giỏ hàng rỗng')
                        }
                        else {
                            $('.totalPrice').text(result + ' vnd')
                            $('.productInfo-' + idSP).hide(500)
                        }

                    },
                    error: function () {

                    }
                }).done(function (result) {
                    //console.log(result)
                })
            })
        })
    </script>