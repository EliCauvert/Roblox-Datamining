local Parent = script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local IconButton = UIBloxModule.App.Button.IconButton
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local IconsMenuClothingClassicHeadOn = Images["icons/menu/clothing/classicHead_on"]
local IconsMenuClothingClassicHeadOff = Images["icons/menu/clothing/classicHead_off"]

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), IconButton (copy), IconsMenuClothingClassicHeadOn (copy), IconsMenuClothingClassicHeadOff (copy), UIBloxModule (copy)
	local Theme = UseStyleFunction().Theme
	
	return ReactModule.createElement(IconButton, {
		showBackground = true,
		icon = if p1.isSelected then IconsMenuClothingClassicHeadOn else IconsMenuClothingClassicHeadOff,
		iconSize = UIBloxModule.App.Constant.IconSize.Medium,
		iconColor3 = if p1.isSelected then Theme.IconEmphasis.Color else Theme.IconDefault.Color,
		iconTransparency = if p1.isSelected then Theme.IconEmphasis.Transparency else Theme.IconDefault.Transparency,
		onActivated = function()
			-- upvalues: p1 (copy)
			if p1.onActivated then
				p1.onActivated()
			end
		end,
		buttonRef = p1.buttonRef,
		NextSelectionUp = p1.nextSelectionUp,
		NextSelectionDown = p1.nextSelectionDown
	})
end