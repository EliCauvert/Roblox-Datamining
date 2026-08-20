local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local UIBloxModule = require(parent.UIBlox)
local view = foundationModule.View
local useLocalization = localizationModule.Hooks.useLocalization
local emptyState = UIBloxModule.App.Indicator.EmptyState
local textKeysModule = require(avatarExperienceProfilePictureEditor.Common.TextKeys)

return function(value) --[[ line: 24 | named "AssetPickerErrorBody" ]]
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), view (ref), emptyState (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-bottom-xxlarge",
		LayoutOrder = value.layoutOrder
	}, {
		EmptyState = reactModule.createElement(emptyState, {
			text = useLocalization({ failedMessage = textKeysModule.SomethingWentWrong }).failedMessage,
			onActivated = value.onRetry,
			size = UDim2.new(1, 0, 0, 187),
			position = UDim2.fromOffset(0, 0),
			anchorPoint = Vector2.new(0, 0)
		})
	})
end