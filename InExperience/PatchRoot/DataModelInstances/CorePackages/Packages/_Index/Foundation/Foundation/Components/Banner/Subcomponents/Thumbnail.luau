local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.BuilderIcons)
local ReactModule = require(Parent.React)
local AvatarModule = require(Foundation.Components.Avatar)
local IconModule = require(Foundation.Components.Icon)
local ImageModule = require(Foundation.Components.Image)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local AvatarSizeModule = require(Foundation.Enums.AvatarSize)
local CardDensityModule = require(Foundation.Enums.CardDensity)
local IconSizeModule = require(Foundation.Enums.IconSize)
local _ = require(Foundation.Enums.UserPresence)

return function(Frame)
	-- upvalues: UseTokensModule (copy), CardDensityModule (copy), ReactModule (copy), AvatarModule (copy), AvatarSizeModule (copy), ImageModule (copy), IconModule (copy), IconSizeModule (copy), ViewModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local Size1200 = if Frame.density == CardDensityModule.Compact then UseTokensModuleResult.Size.Size_1200 else UseTokensModuleResult.Size.Size_1600
	local Thumbnail = Frame.thumbnail
	
	return ReactModule.createElement(ViewModule, {
		tag = "align-x-center align-y-center",
		Size = UDim2.fromOffset(Size1200, Size1200),
		LayoutOrder = Frame.LayoutOrder,
		testId = `{Frame.testId}--thumbnail`
	}, {
		Content = if Thumbnail.type == "Avatar" then ReactModule.createElement(AvatarModule, {
			userId = Thumbnail.userId,
			size = if Frame.density == CardDensityModule.Compact then AvatarSizeModule.Large else AvatarSizeModule.XLarge,
			userPresence = Thumbnail.userPresence,
			testId = `{Frame.testId}--thumbnail-avatar`
		}) elseif Thumbnail.type == "Image" then ReactModule.createElement(ImageModule, {
			tag = "size-full radius-medium",
			Image = Thumbnail.image,
			ScaleType = Enum.ScaleType.Crop,
			testId = `{Frame.testId}--thumbnail-image`
		}) elseif Thumbnail.type == "Icon" then ReactModule.createElement(IconModule, {
			name = if typeof(Thumbnail.icon) == "table" then Thumbnail.icon.name else Thumbnail.icon,
			variant = if typeof(Thumbnail.icon) == "table" then Thumbnail.icon.variant else nil,
			size = IconSizeModule.Large,
			testId = `{Frame.testId}--thumbnail-icon`
		}) else ReactModule.createElement(ViewModule, {
			tag = "align-x-center align-y-center size-full clip",
			testId = `{Frame.testId}--thumbnail-slot`
		}, Thumbnail.children)
	})
end