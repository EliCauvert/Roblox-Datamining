local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local AvatarModule = require(Foundation.Components.Avatar)
local BadgeModule = require(Foundation.Components.Badge)
local IconModule = require(Foundation.Components.Icon)
local ImageModule = require(Foundation.Components.Image)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local FlagsModule = require(Foundation.Utility.Flags)
local IconMigrationUtilsModule = require(Foundation.Utility.iconMigrationUtils)
local IsBuilderOrMigratedIconFunction = IconMigrationUtilsModule.isBuilderOrMigratedIcon
local NormalizeIconNameFunction = IconMigrationUtilsModule.normalizeIconName
local PresentationContextModule = require(Foundation.Providers.Style.PresentationContext)
local _ = require(Foundation.Providers.Style.Tokens)
local AccessoryTypeModule = require(Foundation.Enums.AccessoryType)
local _ = require(Foundation.Enums.InputSize)
local config = {
	isIconSize = true,
	colorNamespace = require(Foundation.Enums.ColorNamespace).Color
}

return function(Frame: Frame)
	-- upvalues: AccessoryTypeModule (copy), ReactModule (copy), ViewModule (copy), PresentationContextModule (copy), config (copy), AvatarModule (copy), TextModule (copy), BadgeModule (copy), FlagsModule (copy), IsBuilderOrMigratedIconFunction (copy), ImageModule (copy), NormalizeIconNameFunction (copy), IconModule (copy)
	local Accessory = Frame.accessory
	
	if Accessory == nil then
		return nil
	end
	local CenterName: string = `align-x-center align-y-center {Frame.iconVariant.tag}`
	
	if Accessory.type == AccessoryTypeModule.Avatar then
		return ReactModule.createElement(ViewModule, {
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
		})
	elseif Accessory.type == "Hint" then
		return ReactModule.createElement(ViewModule, {
			tag = "row align-y-center auto-xy padding-x-xsmall radius-small bg-shift-200",
			LayoutOrder = Frame.LayoutOrder,
			testId = Frame.testId
		}, {
			Text = ReactModule.createElement(TextModule, {
				tag = "auto-xy text-caption-medium content-muted",
				Text = Accessory.text
			})
		})
	elseif Accessory.type == "Badge" then
		return ReactModule.createElement(BadgeModule, {
			LayoutOrder = Frame.LayoutOrder,
			text = Accessory.text,
			icon = Accessory.icon,
			variant = Accessory.variant,
			testId = Frame.testId
		})
	elseif FlagsModule.FoundationBaseMenuAccessorySizing and not IsBuilderOrMigratedIconFunction(Accessory.iconName) then
		return ReactModule.createElement(ViewModule, {
			LayoutOrder = Frame.LayoutOrder,
			tag = CenterName,
			testId = Frame.testId
		}, {
			Media = ReactModule.createElement(ImageModule, {
				tag = "size-full-full radius-xsmall",
				Image = Accessory.iconName,
				ScaleType = Enum.ScaleType.Crop,
				testId = `{Frame.testId}--media`
			})
		})
	else
		local NormalizeIconNameResult = if FlagsModule.FoundationBaseMenuAccessorySizing then NormalizeIconNameFunction(Accessory.iconName) else nil
		
		return ReactModule.createElement(ViewModule, {
			LayoutOrder = Frame.LayoutOrder,
			tag = CenterName,
			testId = Frame.testId
		}, {
			Icon = ReactModule.createElement(IconModule, {
				name = if FlagsModule.FoundationBaseMenuAccessorySizing then NormalizeIconNameResult.name else Accessory.iconName,
				variant = FlagsModule.FoundationBaseMenuAccessorySizing and NormalizeIconNameResult.variant or Accessory.iconVariant,
				style = Frame.iconVariant.style,
				size = Frame.iconVariant.size
			})
		})
	end
end