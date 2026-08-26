local parent = script:FindFirstAncestor("AuthCommon").Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local withStyle = UIBloxModule.Style.withStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local getImageData = require(parent.RobloxAppAssets).GetImageData
local t = {
	Hover = "Hover",
	Focused = "Focused",
	Error = "Error",
	Default = "Default"
}
local authStatefulRoundCornerBorder = roactModule.PureComponent:extend("AuthStatefulRoundCornerBorder")
authStatefulRoundCornerBorder.defaultProps = { borderState = t.Default }

function authStatefulRoundCornerBorder.render(p1)
	-- upvalues: withStyle (ref), roactModule (ref), t (ref), imageSetLabel (ref), getImageData (ref)
	return withStyle(function(p2)
		-- upvalues: p1 (ref), roactModule (copy), t (copy), imageSetLabel (copy), getImageData (copy)
		local size = p1.props.size
		local borderState = p1.props.borderState
		local layoutOrder = p1.props.layoutOrder
		local children = p1.props[roactModule.Children] or {}
		local color = p2.Theme.UIDefault.Color
		local transparency = p2.Theme.UIDefault.Transparency
		
		if borderState == t.Focused then
			color = p2.Theme.IconEmphasis.Color
			transparency = p2.Theme.IconEmphasis.Transparency
		elseif borderState == t.Hover then
			color = p2.Theme.IconDefault.Color
			transparency = p2.Theme.IconDefault.Transparency
		elseif borderState == t.Error then
			color = p2.Theme.Alert.Color
			transparency = p2.Theme.Alert.Transparency
		end
		if p1.props.borderColorOverride ~= nil then
			color = p1.props.borderColorOverride
		end
		if p1.props.borderTransparencyOverride ~= nil then
			transparency = p1.props.borderTransparencyOverride
		end
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = size,
			LayoutOrder = layoutOrder
		}, {
			Boundary = roactModule.createElement(imageSetLabel, {
				ZIndex = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(9, 9, 9, 9),
				Image = getImageData("LuaApp/buttons/buttonStroke") or "LuaApp/buttons/buttonStroke",
				ImageColor3 = color,
				ImageTransparency = transparency
			}),
			ContentWrapper = roactModule.createElement("Frame", {
				ZIndex = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0)
			}, children)
		})
	end)
end

authStatefulRoundCornerBorder.BorderState = t

return authStatefulRoundCornerBorder