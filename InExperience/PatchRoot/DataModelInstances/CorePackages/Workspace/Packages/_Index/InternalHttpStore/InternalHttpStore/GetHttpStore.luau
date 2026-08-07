local parent = script.Parent

return require(parent.Parent.Signals).createComputed(require(parent.createHttpStore))