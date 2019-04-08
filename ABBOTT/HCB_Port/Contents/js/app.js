$(document).ready(function () {
    add_inconexpan();
    toggleItem();
});
function menu_click() {
    var $btn = $('[data-action="collapse-expand-sidebar"]');
    if (isCollapsed()) {
        $btn.find('>*')
                        .removeClass('fa fa-chevron-circle-right')
                        .addClass('fa fa-chevron-circle-left');
        $('body').removeClass('menu-collapsed');
    } else {
        $btn.find('>*')
                    .removeClass('fa fa-chevron-circle-left')
                    .addClass('fa fa-chevron-circle-right');
        $('body').addClass('menu-collapsed');
    }
    
}
function showHideBtn() {
    var $btn = $('[data-action="show-hide-sidebar"]');
    if (ismenu()) {
        $btn.removeClass('border-radius-0 btn font-size-lg active')
                        .addClass('border-radius-0 btn font-size-lg');
        $('body').removeClass('menu-hidden');
    } else {
        $btn.removeClass('border-radius-0 btn font-size-lg')
                    .addClass('border-radius-0 btn font-size-lg active');
        $('body').addClass('menu-hidden');
    }
}
function ismenu() {
    if ($('body').hasClass('menu-hidden')) {
        return true;
    } else {
        return false;
    }
};
function isCollapsed() {
    if ($('body').hasClass('menu-collapsed')) {
        return true;
    } else {
        return false;
    }
};
function isParentLink(href) {
    var a = href;
    //if (typeof href === 'string') {
    //    a = this.$('.menu').find('>ul>li>a[href="' + href + '"]');
    //}
    //if (a.length !== 1) {
    //    return false;
    //}
    if (a.closest('ul').parent().closest('ul').length > 0) {
        return false;
    }
    return true;
};
function add_inconexpan()
{
    var $links = $('.menu').find('nav').find('ul>li>a');
    $links.each(function (ind, a) {
        var $a = $(a);
        //                If this menu item has nested menu and it does not have toggle icon yet we add toggle icon
        if ($a.next('ul').length > 0 && $a.find('.menu-item-toggle-icon').length === 0) {
            //                    If this menu item is parent menu item
            if ($a.closest('ul').parent().closest('ul').length === 0) {
                $a.append($('<i class=" fa fa-chevron-circle-right  menu-item-toggle-icon"></i>'));
            } else {
                $a.append($('<i class=" fa fa-plus-square-o menu-item-toggle-icon"></i>'));
            }
        }
    });
}

function expandItem(a) {

    if (a.next('ul').length > 0) {
        //Find opened item and close it
        collapseItem(a.closest('ul').find('>li.opened>a'));

        ////if menu is collapsed .slideDown method does not work
        if (isCollapsed() && isParentLink(a)) {
            a.next('ul').css('display', 'block');
        } else {
            a.next('ul').slideDown(200);
        }
        ////Open new item
        a.parent().addClass('opened');
        var icon = a.find('.menu-item-toggle-icon');
        //if the item is parent item change parent item icon
        //if not change submenu item icon
        if (isParentLink(a)) {
            icon.removeClass('fa fa-chevron-circle-right').addClass('fa fa-chevron-circle-down');
        } else {
            icon.removeClass('fa fa-plus-square-o').addClass('fa fa-minus-square-o');
        }
      
    }
    return this;
};

function collapseItem(a) {
    if (a.next('ul').length > 0) {
        a.parent().removeClass('opened');

        //if menu is collapsed .slideUp method does not work
        if (isCollapsed() && isParentLink(a)) {
            a.next('ul').css('display', 'none');
        } else {
            a.next('ul').slideUp(200);
        }
        var icon = a.find('.menu-item-toggle-icon');
        //if the item is parent item change parent item icon
        //if not change submenu item icon
        if (isParentLink(a)) {
            icon.removeClass('fa fa-chevron-circle-down').addClass('fa fa-chevron-circle-right');
        } else {
            icon.removeClass('fa fa-minus-square-o').addClass('fa fa-plus-square-o');
        }
      
    }
    return this;
};

function toggleItem() {
    //var a = $('.menu nav>ul>li>a');
    //var li = $(this).parent();
    //if (li.hasClass('opened')) {
    //    this.collapseItem(a);
    //} else {
    //    li.addClass('opened');
    //    var icon =this.find('.menu-item-toggle-icon');
    //    //if the item is parent item change parent item icon
    //    //if not change submenu item icon
    //    if (this.isParentLink(a)) {
    //        icon.removeClass('fa fa-chevron-circle-down').addClass('fa fa-chevron-circle-right');
    //    } else {
    //        icon.removeClass('fa fa-minus-square-o').addClass('fa fa-plus-square-o');
    //    }
    //}
    $('.menu>nav>ul>li>a').click(function () {
        var a = $(this);
        var li = a.parent();
        if (li.hasClass('opened')) {
            collapseItem(a);
        } else {
            expandItem(a);
        }
        
        return false;
    });
};