local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local EmptyState = require(Parent.UIBlox).App.Indicator.EmptyState
local TextKeysModule = require(AvatarExperienceProfilePictureEditor.Common.TextKeys)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), View (copy), EmptyState (copy)
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y padding-bottom-xxlarge",
		LayoutOrder = p1.layoutOrder
	}, {
		EmptyState = ReactModule.createElement(EmptyState, {
			text = UseLocalizationFunction({ failedMessage = TextKeysModule.SomethingWentWrong }).failedMessage,
			onActivated = p1.onRetry,
			size = UDim2.new(1, 0, 0, 187),
			position = UDim2.fromOffset(0, 0),
			anchorPoint = Vector2.new(0, 0)
		})
	})
end