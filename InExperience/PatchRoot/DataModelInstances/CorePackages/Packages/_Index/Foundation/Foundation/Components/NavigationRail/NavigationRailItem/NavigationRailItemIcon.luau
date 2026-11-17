local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local ReactModule = require(Parent.React)
local AccessoryTypeModule = require(Foundation.Enums.AccessoryType)
local AvatarModule = require(Foundation.Components.Avatar)
local AvatarSizeModule = require(Foundation.Enums.AvatarSize)
local ColorNamespaceModule = require(Foundation.Enums.ColorNamespace)
local IconModule = require(Foundation.Components.Icon)
local _ = require(Foundation.Enums.IconSize)
local ImageModule = require(Foundation.Components.Image)
local PresentationContextModule = require(Foundation.Providers.Style.PresentationContext)
local _ = require(Foundation.Components.Types)
local IconMigrationUtilsModule = require(Foundation.Utility.iconMigrationUtils)
local IconVariant = BuilderIconsModule.IconVariant
local config = {
	isIconSize = true,
	colorNamespace = ColorNamespaceModule.Color
}

return function(p1)
	-- upvalues: ReactModule (copy), ImageModule (copy), AccessoryTypeModule (copy), PresentationContextModule (copy), config (copy), AvatarModule (copy), AvatarSizeModule (copy), IconModule (copy), IconMigrationUtilsModule (copy), IconVariant (copy)
	local Icon = p1.icon
	local Name = nil
	local Variant = nil
	
	if typeof(Icon) == "table" then
		if Icon.type == "Image" then
			return ReactModule.createElement(ImageModule, {
				tag = "size-600-600 radius-small",
				Image = Icon.image,
				ScaleType = Enum.ScaleType.Crop,
				testId = p1.testId
			})
		end
		if Icon.type == AccessoryTypeModule.Avatar then
			return ReactModule.createElement(PresentationContextModule.Provider, { value = config }, {
				Avatar = ReactModule.createElement(AvatarModule, {
					userId = Icon.userId,
					size = AvatarSizeModule.Large,
					testId = p1.testId
				})
			})
		end
		Name = Icon.name
		Variant = Icon.variant
	elseif typeof(Icon) == "string" then
		Name = Icon
	end
	return if Name == nil then nil else ReactModule.createElement(IconModule, {
		name = Name,
		variant = Variant or (if p1.isActive and IconMigrationUtilsModule.isBuilderOrMigratedIcon(Name) then IconVariant.Filled else nil),
		size = p1.size,
		style = p1.style,
		testId = p1.testId
	})
end