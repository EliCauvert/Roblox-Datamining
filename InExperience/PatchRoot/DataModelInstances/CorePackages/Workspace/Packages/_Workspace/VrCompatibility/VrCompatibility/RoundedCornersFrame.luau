local parent = script.Parent.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)

return function(p0)
	-- upvalues: reactModule (ref), cryoModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundColor3 = p0.backgroundColor,
		BackgroundTransparency = p0.backgroundTransparency,
		Size = UDim2.new(1, 0, 1, 0)
	}, cryoModule.Dictionary.join({
		Padding = reactModule.createElement("UIPadding", {
			PaddingRight = UDim.new(0, p0.cornerRadius),
			PaddingLeft = UDim.new(0, p0.cornerRadius),
			PaddingTop = UDim.new(0, p0.cornerRadius),
			PaddingBottom = UDim.new(0, p0.cornerRadius)
		}),
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p0.cornerRadius) })
	}, p0.children))
end