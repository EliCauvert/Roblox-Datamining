local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: FoundationModule (copy), ReactModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Diameter = if Frame.iconDiameter then Frame.diameter else UseTokensResult.Size.Size_600
	local IsShowBackground = Frame.showBackground ~= false
	local Surface100 = if Frame.inverted then UseTokensResult.Color.Surface.Surface_100 else UseTokensResult.Color.Content.Muted
	local v1: number = if Frame.disabled then 0.5 else 1
	
	return ReactModule.createElement(FoundationModule.View, {
		Size = UDim2.fromOffset(Diameter, Diameter),
		scale = if Frame.diameter == Diameter then nil else Frame.diameter / Diameter,
		Position = Frame.Position,
		AnchorPoint = Frame.AnchorPoint,
		LayoutOrder = Frame.LayoutOrder,
		tag = {
			["align-x-center align-y-center radius-circle"] = IsShowBackground,
			["align-x-center align-y-center"] = not IsShowBackground
		},
		backgroundStyle = if IsShowBackground then {
			Color3 = Surface100.Color3,
			Transparency = 1 - (1 - Surface100.Transparency) * v1
		} else UseTokensResult.Color.None,
		testId = Frame.testId .. "Container"
	}, {
		Icon = ReactModule.createElement(FoundationModule.Icon, {
			name = Frame.name,
			variant = FoundationModule.Enums.IconVariant.Filled,
			size = Frame.iconDiameter or UseTokensResult.Size.Size_400,
			style = if IsShowBackground and not Frame.inverted then UseTokensResult.Color.Surface.Surface_100 else UseTokensResult.Color.Content.Emphasis,
			testId = Frame.testId
		})
	})
end)