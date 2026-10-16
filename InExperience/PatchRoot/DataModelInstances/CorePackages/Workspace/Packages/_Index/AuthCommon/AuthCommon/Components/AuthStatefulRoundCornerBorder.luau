local Parent = script:FindFirstAncestor("AuthCommon").Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(Parent.RobloxAppAssets).GetImageData
local BorderState = {
	Hover = "Hover",
	Focused = "Focused",
	Error = "Error",
	Default = "Default"
}
local AuthStatefulRoundCornerBorder = RoactModule.PureComponent:extend("AuthStatefulRoundCornerBorder")
AuthStatefulRoundCornerBorder.defaultProps = { borderState = BorderState.Default }

function AuthStatefulRoundCornerBorder.render(p1) --[[ Line: 27 ]]
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), BorderState (copy), ImageSetLabel (copy), GetImageDataFunction (copy)
	return WithStyleFunction(function(p2) --[[ Line: 28 ]]
		-- upvalues: p1 (copy), RoactModule (upval), BorderState (upval), ImageSetLabel (upval), GetImageDataFunction (upval)
		local Size = p1.props.size
		local BorderState1 = p1.props.borderState
		local LayoutOrder = p1.props.layoutOrder
		local Prop = p1.props[RoactModule.Children] or {}
		local Color = p2.Theme.UIDefault.Color
		local Transparency = p2.Theme.UIDefault.Transparency
		
		if BorderState1 == BorderState.Focused then
			Color = p2.Theme.IconEmphasis.Color
			Transparency = p2.Theme.IconEmphasis.Transparency
		elseif BorderState1 == BorderState.Hover then
			Color = p2.Theme.IconDefault.Color
			Transparency = p2.Theme.IconDefault.Transparency
		elseif BorderState1 == BorderState.Error then
			Color = p2.Theme.Alert.Color
			Transparency = p2.Theme.Alert.Transparency
		end
		if p1.props.borderColorOverride ~= nil then
			Color = p1.props.borderColorOverride
		end
		if p1.props.borderTransparencyOverride ~= nil then
			Transparency = p1.props.borderTransparencyOverride
		end
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = Size,
			LayoutOrder = LayoutOrder
		}, {
			Boundary = RoactModule.createElement(ImageSetLabel, {
				ZIndex = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(9, 9, 9, 9),
				Image = GetImageDataFunction("LuaApp/buttons/buttonStroke") or "LuaApp/buttons/buttonStroke",
				ImageColor3 = Color,
				ImageTransparency = Transparency
			}),
			ContentWrapper = RoactModule.createElement("Frame", {
				ZIndex = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0)
			}, Prop)
		})
	end)
end

AuthStatefulRoundCornerBorder.BorderState = BorderState

return AuthStatefulRoundCornerBorder