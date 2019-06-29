<div id="cm-<?php echo $module; ?>" class="<?php echo $box_class; ?>">
  <?php if ($title) { ?>
  <div class="<?php echo $title_class ? $title_class : ''; ?> <?php echo $minimized ? 'menu-collapsed' : 'menu-expanded'; ?> toggle-title"><?php echo $title; ?></div>
  <?php } ?>
  <div <?php echo $content_class ? 'class="'.$content_class.'"' : ''; ?> <?php echo $minimized ? 'style="display:none"' : ''; ?>>
    <div class="cm-<?php echo $menu_design; ?> fm-one"><ul><?php echo $menu; ?></ul></div>
  </div>
</div>

<script type="text/javascript"><!--
$('#cm-<?php echo $module; ?> .cm-fm.fm-one li > a.item-wrapper').hover(function() {
  var li = $(this).closest('li');
  li.siblings('.active').removeClass('active');
});

$('#cm-<?php echo $module; ?> .cm-fm ul, #cm-<?php echo $module; ?> .cm-fm.fm-one ul>div').menuAim({
  submenuDirection: $('#cm-<?php echo $module; ?>').parents().is('#column-right') ? 'left' : 'right',
  activate: function(item){
    $(item).find('>.item-toggle').next().show();
    $(item).siblings().find('>.item-toggle').next().hide();
  },
  deactivate: function(item){
    $(item).find('>.item-toggle').next().fadeOut(300);
  },
  exitMenu: function(item){
    $(item).find('.fm-container:visible').delay(700).fadeOut(300);
    return true;
  }
});

var url = window.location.href;

$('#cm-<?php echo $module; ?> li > a').each(function() {
  if(url == (this.href)) {
    $(this).removeAttr('href').removeAttr('target');
    $(this).addClass('item-current').parents('li').addClass('active');
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