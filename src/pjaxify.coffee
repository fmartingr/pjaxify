class PJAX
    timeout: 1500
    mainContainer: '[data-pjax-container="main"]'
    selectors:
        # Elements that will fire pjax navigation
        base: 'a[data-pjax]'
        # Not fire pushState for this particular element
        noPush: '[data-pjax-nopush]'
        # To search for a container element
        container: '[data-pjax-container]'
        # A custom container element
        containerCustom: '[data-pjax-container="{}"]'

    constructor: ->
        _this = @
        $(document).on 'click', @selectors.base, (event) ->
            elem = $(@)
            pjax = elem.data('pjax')

            # Do I need to push the URL to the browser?
            push = !elem.is(_this.selectors.noPush)

            # What container should I use?
            if not pjax
                # The mail container if none is set
                container = $(_this.mainContainer)
            else if pjax == 'closest'
                # The closest?
                container = elem.closest(_this.container)
            else
                # Or a custom one?
                # TODO use the main if this does not exist
                container = $(_this.selectors.containerCustom.replace('{}', pjax))

            # Fire pjax event
            $.pjax.click event,
                container: container
                timeout: _this.timeout
                push: push

$ ->
    if $.support.pjax
        window._pjax_navigation = new PJAX()
