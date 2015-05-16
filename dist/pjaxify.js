(function() {
  var PJAX;

  PJAX = (function() {
    PJAX.prototype.timeout = 1500;

    PJAX.prototype.mainContainer = '[data-pjax-container="main"]';

    PJAX.prototype.selectors = {
      base: 'a[data-pjax]',
      noPush: '[data-pjax-nopush]',
      container: '[data-pjax-container]',
      containerCustom: '[data-pjax-container="{}"]'
    };

    function PJAX() {
      var _this;
      _this = this;
      $(document).on('click', this.selectors.base, function(event) {
        var container, elem, pjax, push;
        elem = $(this);
        pjax = elem.data('pjax');
        push = !elem.is(_this.selectors.noPush);
        if (!pjax) {
          container = $(_this.mainContainer);
        } else if (pjax === 'closest') {
          container = elem.closest(_this.container);
        } else {
          container = $(_this.selectors.containerCustom.replace('{}', pjax));
        }
        return $.pjax.click(event, {
          container: container,
          timeout: _this.timeout,
          push: push
        });
      });
    }

    return PJAX;

  })();

  $(function() {
    if ($.support.pjax) {
      return window.pjaxify = new PJAX();
    }
  });

}).call(this);
