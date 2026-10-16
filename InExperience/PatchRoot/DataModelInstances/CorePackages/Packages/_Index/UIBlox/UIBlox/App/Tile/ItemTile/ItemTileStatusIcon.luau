local Parent = script.Parent.Parent
local Parent1 = Parent.Parent.Parent
local ReactModule = require(Parent1.Parent.React)
local UseStyleModule = require(Parent1.Core.Style.useStyle)
local IconSizeModule = require(Parent1.App.ImageSet.Enum.IconSize)
local ImagesModule = require(Parent1.App.ImageSet.Images)
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local ItemTileEnumsModule = require(Parent.Enum.ItemTileEnums)
local GetIconSizeModule = require(Parent1.App.ImageSet.getIconSize)

local function _(AlertIcon) --[[ Line: 21 | Named "getIconImage" ]]
	-- upvalues: ItemTileEnumsModule (copy)
	return if AlertIcon == ItemTileEnumsModule.StatusStyle.PendingIcon then "icons/status/pending_small" elseif AlertIcon == ItemTileEnumsModule.StatusStyle.AlertIcon then "icons/actions/info_small" else nil
end

return function(p1) --[[ Line: 31 | Named "ItemTileStatusIcon" ]]
	-- upvalues: UseStyleModule (copy), ItemTileEnumsModule (copy), GetIconSizeModule (copy), IconSizeModule (copy), ReactModule (copy), ImageSetComponentModule (copy), ImagesModule (copy)
	local Tokens = UseStyleModule().Tokens
	local StatusStyle = p1.statusStyle
	local PendingSmall = if StatusStyle == ItemTileEnumsModule.StatusStyle.PendingIcon then "icons/status/pending_small" elseif StatusStyle == ItemTileEnumsModule.StatusStyle.AlertIcon then "icons/actions/info_small" else nil
	
	if PendingSmall then
		local IconSizeModule1 = GetIconSizeModule(IconSizeModule.Small)
		local Emphasis = Tokens.Color.Content.Emphasis
		
		return ReactModule.createElement(ImageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(Tokens.Size.Size_200, Tokens.Size.Size_200),
			Size = UDim2.fromOffset(IconSizeModule1, IconSizeModule1),
			Image = ImagesModule[PendingSmall],
			ImageColor3 = Emphasis.Color3,
			ImageTransparency = Emphasis.Transparency
		})
	else
		return nil
	end
end