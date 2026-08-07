local textSize = script:FindFirstAncestor("TextSize")

return require(textSize.Parent.Signals).createComputed(require(textSize.createTextSizeStore))