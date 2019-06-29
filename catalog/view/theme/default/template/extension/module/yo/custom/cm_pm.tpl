<div id="cm-<?php echo $module; ?>" class="<?php echo $box_class; ?>">
  <?php if ($title) { ?>
  <div class="<?php echo $title_class ? $title_class : ''; ?> <?php echo $minimized ? 'menu-collapsed' : 'menu-expanded'; ?> toggle-title"><?php echo $title; ?></div>
  <?php } ?>
  <div <?php echo $content_class ? 'class="'.$content_class.'"' : ''; ?> <?php echo $minimized ? 'style="display:none"' : ''; ?>>
    <div class="cm-<?php echo $menu_design; ?>"><ul><?php echo $menu; ?></ul></div>
  </div>
</div>

<script type="text/javascript"><!--
$('#cm-<?php echo $module; ?> .cm-pm > ul').show().parent().css('overflow', 'hidden');
$('#cm-<?php echo $module; ?> .cm-pm .item-toggle').not('.pm-prev').on('click', function(e,act) {
  e.preventDefault();
  if (act=='active') {
    $(this).parents('ul').addClass('pm-invisible').show();
    $(this).next().show();
  } else {
    $(this).parents('ul').show().addClass('pm-invisible pm-trans');
    $(this).next().fadeIn(300);
  }
  $(this).parent().siblings().find('>ul').hide();
  var height = $(this).next().outerHeight(true);
  if (act=='active') {
    $('#cm-<?php echo $module; ?> .cm-pm > ul').parent().height(height);
  } else {
    $('#cm-<?php echo $module; ?> .cm-pm > ul').parent().animate({'height': height}, 300);
  }
});

$('#cm-<?php echo $module; ?> .pm-prev').on('click', function(e) {
  e.preventDefault();
  var height = $(this).closest('.pm-invisible').outerHeight(true);
  $(this).parents('ul.pm-invisible').addClass('pm-trans');
  $('#cm-<?php echo $module; ?> .cm-pm > ul').parent().animate({'height': height}, 300);
  
  $(this).closest('.pm-invisible').removeClass('pm-invisible');
  $(this).closest('ul').fadeOut(250);
});

var url = window.location.href;

$('#cm-<?php echo $module; ?> li > a').each(function() {
  if(url == (this.href)) {
    $(this).removeAttr('href').removeAttr('target');
    $(this).trigger('click', ['active']);

    if ($(this).hasClass('item-toggle')) {
      $(this).next().find('li.active>a').addClass('item-current');
    } else {
      $(this).addClass('item-current');
      $(this).closest('ul').not('.cm-pm > ul').prev('.item-toggle').trigger('click', ['active']);
    }
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