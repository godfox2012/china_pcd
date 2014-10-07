(($) ->
  $.fn.china_pcd = ->
    @each ->
      selects = $(@).find('.city-select')
      selects.change ->
        $this = $(@)
        next_selects = selects.slice(selects.index(@) + 1) # empty all children city
        $("option:gt(0)", next_selects).remove()
        if next_selects.first()[0] and $this.val() # init next child
          $.get "/china_pcd/#{$(@).val()}", (data) ->
            next_selects.first()[0].options.add(new Option(option[0], option[1])) for option in data

  $ ->
    $('.china-pcd-group').china_pcd()
)(jQuery)