local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local AvatarModule = require(Foundation.Components.Avatar)
local BadgeModule = require(Foundation.Components.Badge)
local IconModule = require(Foundation.Components.Icon)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local PresentationContextModule = require(Foundation.Providers.Style.PresentationContext)
local _ = require(Foundation.Providers.Style.Tokens)
local AccessoryTypeModule = require(Foundation.Enums.AccessoryType)
local _ = require(Foundation.Enums.InputSize)
local config = {
	isIconSize = true,
	colorNamespace = require(Foundation.Enums.ColorNamespace).Color
}

return function(Frame: Frame)
	-- upvalues: AccessoryTypeModule (copy), ReactModule (copy), ViewModule (copy), PresentationContextModule (copy), config (copy), AvatarModule (copy), TextModule (copy), BadgeModule (copy), IconModule (copy)
	local Accessory = Frame.accessory
	
	if Accessory == nil then
		return nil
	else
		local CenterName: string = `align-x-center align-y-center {Frame.iconVariant.tag}`
		
		return if Accessory.type == AccessoryTypeModule.Avatar then ReactModule.createElement(ViewModule, {
			LayoutOrder = Frame.LayoutOrder,
			tag = CenterName,
			testId = Frame.testId
		}, {
			Avatar = ReactModule.createElement(PresentationContextModule.Provider, { value = config }, {
				Avatar = ReactModule.createElement(AvatarModule, {
					userId = Accessory.userId,
					backplateStyle = Frame.tokens.Color.Shift.Shift_200,
					size = Frame.size
				})
			})
		}) elseif Accessory.type == "Hint" then ReactModule.createElement(ViewModule, {
			tag = "row align-y-center auto-xy padding-x-xsmall radius-small bg-shift-200",
			LayoutOrder = Frame.LayoutOrder,
			testId = Frame.testId
		}, {
			Text = ReactModule.createElement(TextModule, {
				tag = "auto-xy text-caption-medium content-muted",
				Text = Accessory.text
			})
		}) elseif Accessory.type == "Badge" then ReactModule.createElement(BadgeModule, {
			LayoutOrder = Frame.LayoutOrder,
			text = Accessory.text,
			icon = Accessory.icon,
			variant = Accessory.variant,
			testId = Frame.testId
		}) else ReactModule.createElement(ViewModule, {
			LayoutOrder = Frame.LayoutOrder,
			tag = CenterName,
			testId = Frame.testId
		}, {
			Icon = ReactModule.createElement(IconModule, {
				name = Accessory.iconName,
				variant = Accessory.iconVariant,
				style = Frame.iconVariant.style,
				size = Frame.iconVariant.size
			})
		})
	end
end