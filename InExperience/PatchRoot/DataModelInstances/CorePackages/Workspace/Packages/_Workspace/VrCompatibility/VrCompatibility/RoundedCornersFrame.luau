local Parent = script.Parent.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)

return function(p1) --[[ Line: 13 ]]
	-- upvalues: ReactModule (copy), CryoModule (copy)
	return ReactModule.createElement("Frame", {
		BackgroundColor3 = p1.backgroundColor,
		BackgroundTransparency = p1.backgroundTransparency,
		Size = UDim2.new(1, 0, 1, 0)
	}, CryoModule.Dictionary.join({
		Padding = ReactModule.createElement("UIPadding", {
			PaddingRight = UDim.new(0, p1.cornerRadius),
			PaddingLeft = UDim.new(0, p1.cornerRadius),
			PaddingTop = UDim.new(0, p1.cornerRadius),
			PaddingBottom = UDim.new(0, p1.cornerRadius)
		}),
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) })
	}, p1.children))
end