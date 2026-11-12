local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local AccessoryTypeModule = require(Foundation.Enums.AccessoryType)
local AvatarIconModule = require(Foundation.Components.AvatarIcon)
local IconModule = require(Foundation.Components.Icon)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local _ = require(script.Parent.useMetadataVariants)

return function(Frame: Frame)
	-- upvalues: AccessoryTypeModule (copy), ReactModule (copy), ViewModule (copy), AvatarIconModule (copy), IconModule (copy)
	local Variant = Frame.variant
	local Config = if type(Frame.config) == "string" then { iconName = Frame.config } else Frame.config
	
	return if Config.type == AccessoryTypeModule.Avatar then ReactModule.createElement(ViewModule, { tag = Variant.avatarTag, LayoutOrder = Frame.LayoutOrder }, {
		Avatar = ReactModule.createElement(AvatarIconModule, {
			userId = Config.userId,
			size = Variant.avatarSize,
			testId = Frame.testId
		})
	}) else ReactModule.createElement(IconModule, {
		name = Config.iconName,
		variant = Config.iconVariant,
		size = Variant.iconSize,
		style = Variant.style,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	})
end