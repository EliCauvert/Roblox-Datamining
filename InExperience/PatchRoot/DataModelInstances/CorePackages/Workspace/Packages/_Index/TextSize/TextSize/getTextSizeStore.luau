local TextSize = script:FindFirstAncestor("TextSize")

return require(TextSize.Parent.Signals).createComputed((require(TextSize.createTextSizeStore)))