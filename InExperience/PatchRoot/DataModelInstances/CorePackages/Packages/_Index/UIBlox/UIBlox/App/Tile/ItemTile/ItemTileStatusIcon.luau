local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent
local reactModule = require(parent_1.Parent.React)
local useStyleModule = require(parent_1.Core.Style.useStyle)
local iconSizeModule = require(parent_1.App.ImageSet.Enum.IconSize)
local imagesModule = require(parent_1.App.ImageSet.Images)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local itemTileEnumsModule = require(parent.Enum.ItemTileEnums)
local getIconSizeModule = require(parent_1.App.ImageSet.getIconSize)

local function _(p1)
	-- upvalues: itemTileEnumsModule (ref)
	return if p1 == itemTileEnumsModule.StatusStyle.PendingIcon then "icons/status/pending_small" elseif p1 == itemTileEnumsModule.StatusStyle.AlertIcon then "icons/actions/info_small" else nil
end

return function(p1)
	-- upvalues: useStyleModule (ref), itemTileEnumsModule (ref), getIconSizeModule (ref), iconSizeModule (ref), reactModule (ref), imageSetComponentModule (ref), imagesModule (ref)
	local tokens = useStyleModule().Tokens
	local statusStyle = p1.statusStyle
	local var1 = if statusStyle == itemTileEnumsModule.StatusStyle.PendingIcon then "icons/status/pending_small" elseif statusStyle == itemTileEnumsModule.StatusStyle.AlertIcon then "icons/actions/info_small" else nil
	
	if var1 then
		local var2 = getIconSizeModule(iconSizeModule.Small)
		local emphasis = tokens.Color.Content.Emphasis
		
		return reactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(tokens.Size.Size_200, tokens.Size.Size_200),
			Size = UDim2.fromOffset(var2, var2),
			Image = imagesModule[var1],
			ImageColor3 = emphasis.Color3,
			ImageTransparency = emphasis.Transparency
		})
	end
	return nil
end