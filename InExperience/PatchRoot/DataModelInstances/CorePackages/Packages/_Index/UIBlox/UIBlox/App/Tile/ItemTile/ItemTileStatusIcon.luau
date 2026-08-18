local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent
local reactModule = require(parent_1.Parent.React)
local useStyleModule = require(parent_1.Core.Style.useStyle)
local iconSizeModule = require(parent_1.App.ImageSet.Enum.IconSize)
local imagesModule = require(parent_1.App.ImageSet.Images)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local itemTileEnumsModule = require(parent.Enum.ItemTileEnums)
local getIconSizeModule = require(parent_1.App.ImageSet.getIconSize)

local function _(p0) --[[ line: 21 | named "getIconImage" ]]
	-- upvalues: itemTileEnumsModule (ref)
	return if p0 == itemTileEnumsModule.StatusStyle.PendingIcon then "icons/status/pending_small" elseif p0 == itemTileEnumsModule.StatusStyle.AlertIcon then "icons/actions/info_small" else nil
end

return function(p1) --[[ line: 31 | named "ItemTileStatusIcon" ]]
	-- upvalues: useStyleModule (ref), itemTileEnumsModule (ref), getIconSizeModule (ref), iconSizeModule (ref), reactModule (ref), imageSetComponentModule (ref), imagesModule (ref)
	local tokens = useStyleModule().Tokens
	local statusStyle = p1.statusStyle
	local var7 = if statusStyle == itemTileEnumsModule.StatusStyle.PendingIcon then "icons/status/pending_small" elseif statusStyle == itemTileEnumsModule.StatusStyle.AlertIcon then "icons/actions/info_small" else nil
	
	if var7 then
		local var8 = getIconSizeModule(iconSizeModule.Small)
		local emphasis = tokens.Semantic.Color.Icon.Emphasis
		
		return reactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(tokens.Global.Size_100, tokens.Global.Size_100),
			Size = UDim2.fromOffset(var8, var8),
			Image = imagesModule[var7],
			ImageColor3 = emphasis.Color3,
			ImageTransparency = emphasis.Transparency
		})
	end
	return nil
end