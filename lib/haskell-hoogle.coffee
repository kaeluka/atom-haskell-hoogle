Shell = require 'shell'

module.exports = HaskellHoogle =
  activate: (state) ->
    atom.commands.add 'atom-workspace', 'haskell-hoogle:lookup', => @lookup()

  lookup: ->
    #This assumes the active pane item is an editor:
    editor = atom.workspace.getActivePaneItem()
    selection = editor.getLastSelection().getText()
    if selection
      url = 'https://www.haskell.org/hoogle/?hoogle='+selection
      Shell.openExternal url
    else
      Shell.openExternal 'https://www.haskell.org/hoogle'
