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

function authStatefulRoundCornerBorder.render(p0) --[[ line: 27 ]]
	-- upvalues: withStyle (ref), roactModule (ref), t (ref), imageSetLabel (ref), getImageData (ref)
	return withStyle(function(p1) --[[ line: 28 ]]
		-- upvalues: p0 (ref), roactModule (copy), t (copy), imageSetLabel (copy), getImageData (copy)
		local size = p0.props.size
		local borderState = p0.props.borderState
		local layoutOrder = p0.props.layoutOrder
		local children = p0.props[roactModule.Children] or {}
		local color = p1.Theme.UIDefault.Color
		local transparency = p1.Theme.UIDefault.Transparency
		
		if borderState == t.Focused then
			color = p1.Theme.IconEmphasis.Color
			transparency = p1.Theme.IconEmphasis.Transparency
		elseif borderState == t.Hover then
			color = p1.Theme.IconDefault.Color
			transparency = p1.Theme.IconDefault.Transparency
		elseif borderState == t.Error then
			color = p1.Theme.Alert.Color
			transparency = p1.Theme.Alert.Transparency
		end
		if p0.props.borderColorOverride ~= nil then
			color = p0.props.borderColorOverride
		end
		if p0.props.borderTransparencyOverride ~= nil then
			transparency = p0.props.borderTransparencyOverride
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