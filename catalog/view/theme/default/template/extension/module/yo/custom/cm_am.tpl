<div id="cm-<?php echo $module; ?>" class="<?php echo $box_class; ?>">
  <?php if ($title) { ?>
  <div class="<?php echo $title_class ? $title_class : ''; ?> <?php echo $minimized ? 'menu-collapsed' : 'menu-expanded'; ?> toggle-title"><?php echo $title; ?></div>
  <?php } ?>
  <div <?php echo $content_class ? 'class="'.$content_class.'"' : ''; ?> <?php echo $minimized ? 'style="display:none"' : ''; ?>>
    <div class="cm-<?php echo $menu_design; ?>"><ul><?php echo $menu; ?></ul></div>
  </div>
</div>

<script type="text/javascript"><!--
$('#cm-<?php echo $module; ?> .btn-toggle, #cm-<?php echo $module; ?> .item-toggle').on('click', function(e) {
  e.preventDefault();

  var li = $(this).closest('li');
  var ch = li.find('>ul').height();
  var ah = li.find('>ul').css('height','auto').height();

  if (ah>ch) {
    li.toggleClass('active').find('>ul').height(ch).animate({'height':ah}, 300);
  } else {
    li.toggleClass('active').find('>ul').animate({'height':0}, 300);
  }

  li.closest('ul').css('height','auto');
  li.siblings('.active').removeClass('active').find('>ul').css('height','auto').animate({'height':0}, 300);
});

var url = window.location.href;

$('#cm-<?php echo $module; ?> li > a').each(function() {
  if(url == (this.href)) { 
    $(this).addClass('item-current').removeAttr('href').parents('li').addClass('active');
  }
});

var toggle = $('#cm-<?php echo $module; ?> .toggle-title');

if (<?php echo $save_view; ?>) {
  if (!localStorage.getItem('custom-menu-<?php echo $module; ?>')) {
    if (<?php echo $minimized; ?>) {
      localStorage.setItem('custom-menu-<?php echo $module; ?>', 'collapsed');
    } else {
      localStorage.setItem('custom-menu-<?php echo $module; ?>', 'expanded');
    }
  }

  $(toggle).click(function() {
    $(this).toggleClass('menu-expanded menu-collapsed').next().slideToggle(300);
    if ($(this).hasClass('menu-expanded')) {
      localStorage.setItem('custom-menu-<?php echo $module; ?>', 'expanded');
    } else {
      localStorage.setItem('custom-menu-<?php echo $module; ?>', 'collapsed');
    }
  });

  if (localStorage.getItem('custom-menu-<?php echo $module; ?>') == 'expanded') { 
    toggle.addClass('menu-expanded').removeClass('menu-collapsed').next().show();
  } else {
    toggle.addClass('menu-collapsed').removeClass('menu-expanded').next().hide();
  }
} else {
  localStorage.removeItem('custom-menu-<?php echo $module; ?>');
  $(toggle).click(function() {
    $(this).toggleClass('menu-expanded menu-collapsed').next().slideToggle(300);
  });
}
//--></script>
