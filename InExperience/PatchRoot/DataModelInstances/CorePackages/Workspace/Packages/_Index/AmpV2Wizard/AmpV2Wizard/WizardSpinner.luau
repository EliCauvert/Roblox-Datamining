local Parent = script:FindFirstAncestor("AmpV2Wizard").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Loading = FoundationModule.Loading
local IconSize = FoundationModule.Enums.IconSize

return function()
	-- upvalues: ReactModule (copy), Loading (copy), IconSize (copy)
	return ReactModule.createElement(Loading, {
		size = IconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end