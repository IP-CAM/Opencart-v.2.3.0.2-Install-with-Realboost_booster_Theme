<!-- Footer -->
<footer>
  <div class="container d-flex justify-content-between">
    <p class="copyright">© RealBoost2019</p>

    <div class="social">
      <a href="#">
        <p>Присоединяйтесь</p>
        <img src="<?php echo $img_path; ?>icons/vk.png" alt="VK">
      </a>
    </div>

  </div>
</footer>


<!-- Вход -->
<form id="login" action = "<?php echo $login;?>" method="post" class="mfp-hide white-popup-block">
  <h1>Войти</h1>
  <fieldset style="border:0;">
    <input id="text" name="email" type="text" placeholder="Логин" required="">
    <input id="password" name="password" type="password" placeholder="Пароль" required="">
    <button type="submit">Войти</button>
  </fieldset>
  <a class="register popup-with-form" href="#register">Зарегистрироваться</a>
</form>

<!-- Регистрация -->
<form id="register" class="mfp-hide white-popup-block">
  <h1>Регистрация</h1>
  <fieldset style="border:0;">
    <input id="text" name="text" type="text" placeholder="Логин" required="">
    <input id="password" name="password" type="password" placeholder="Пароль" required="">
    <input id="password" name="password" type="password" placeholder="Подтвердите пароль" required="">
    <input id="email" name="email" type="email" placeholder="E-mail" required="">
    <button type="submit">Зарегистрироваться</button>
  </fieldset>
</form>


<!-- Меню -->
<div class="menu" id="menu">
  <div class="container container-menu">

    <div class="menu_header">
      <div class="left-menu"><img src="<?php echo $img_path; ?>icons/menu.png" alt="menu">Меню</div>
    </div>

    <div class="menu_nav">

      <a href="#"><h4>Услуги</h4></a>
        <a href="boost-rating.html">Заказать буст рейтинга</a>
        <a href="order-calibration.html">Заказать калибровку</a>
        <a href="boost-rating.html">Слить лоу приорити</a>
        <a href="battle-cup.html">Победить battle cup</a>
        <a href="training.html">Обучение от бустеров</a>

      <br>
      
      <a href="guarantees.html"><h4>Гарантии</h4></a>
      <a href="job.html"><h4>Работа</h4></a>

    </div>

  </div>
</div>
<div class="milk-shadow"></div>


<script src="<?php echo $js_path; ?>script.js"></script>

</body></html>