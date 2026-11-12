local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function()
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new() })
end