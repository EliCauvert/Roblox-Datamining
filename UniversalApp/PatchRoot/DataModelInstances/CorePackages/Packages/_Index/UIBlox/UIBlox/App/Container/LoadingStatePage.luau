local Parent = script.Parent.Parent.Parent.Parent
local RoactModule = require(Parent.Roact)
local FoundationModule = require(Parent.Foundation)
local Loading = FoundationModule.Loading
local IconSize = FoundationModule.Enums.IconSize
local LoadingStatePage = RoactModule.PureComponent:extend("LoadingStatePage")

function LoadingStatePage:render()
	-- upvalues: RoactModule (copy), Loading (copy), IconSize (copy)
	return RoactModule.createElement(Loading, {
		size = IconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end

return LoadingStatePage