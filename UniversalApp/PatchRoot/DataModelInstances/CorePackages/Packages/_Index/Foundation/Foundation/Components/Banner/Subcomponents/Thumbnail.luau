local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local avatarModule = require(foundation.Components.Avatar)
local iconModule = require(foundation.Components.Icon)
local imageModule = require(foundation.Components.Image)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local avatarSizeModule = require(foundation.Enums.AvatarSize)
local cardDensityModule = require(foundation.Enums.CardDensity)
local iconSizeModule = require(foundation.Enums.IconSize)
local _ = require(foundation.Enums.UserPresence)

return function(p1)
	-- upvalues: useTokensModule (ref), cardDensityModule (ref), reactModule (ref), avatarModule (ref), avatarSizeModule (ref), imageModule (ref), iconModule (ref), iconSizeModule (ref), viewModule (ref)
	local var1 = useTokensModule()
	local var2 = if p1.density == cardDensityModule.Compact then var1.Size.Size_1200 else var1.Size.Size_1600
	local thumbnail = p1.thumbnail
	
	return reactModule.createElement(viewModule, {
		tag = "align-x-center align-y-center",
		Size = UDim2.fromOffset(var2, var2),
		LayoutOrder = p1.LayoutOrder,
		testId = `{p1.testId}--thumbnail`
	}, {
		Content = if thumbnail.type == "Avatar" then reactModule.createElement(avatarModule, {
			userId = thumbnail.userId,
			size = if p1.density == cardDensityModule.Compact then avatarSizeModule.Large else avatarSizeModule.XLarge,
			userPresence = thumbnail.userPresence,
			testId = `{p1.testId}--thumbnail-avatar`
		}) elseif thumbnail.type == "Image" then reactModule.createElement(imageModule, {
			tag = "size-full radius-medium",
			Image = thumbnail.image,
			ScaleType = Enum.ScaleType.Crop,
			testId = `{p1.testId}--thumbnail-image`
		}) elseif thumbnail.type == "Icon" then reactModule.createElement(iconModule, {
			name = if typeof(thumbnail.icon) == "table" then thumbnail.icon.name else thumbnail.icon,
			variant = if typeof(thumbnail.icon) == "table" then thumbnail.icon.variant else nil,
			size = iconSizeModule.Large,
			testId = `{p1.testId}--thumbnail-icon`
		}) else reactModule.createElement(viewModule, {
			tag = "align-x-center align-y-center size-full clip",
			testId = `{p1.testId}--thumbnail-slot`
		}, thumbnail.children)
	})
end