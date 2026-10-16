local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local CommentsListSkeletonViewModule = require(Moments.Components.Comments.List.CommentsListSkeletonView)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Button = FoundationModule.Button
local Empty = FoundationModule.Empty
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local config = {
	empty = "Feature.Moments.Label.NoCommentsYet",
	emptyInvite = "Feature.Moments.Label.FirstCommentInvite",
	disabled = "Feature.Moments.Label.CommentsDisabled",
	unavailable = "Feature.Moments.Label.CommentsUnavailable",
	retry = "Feature.Moments.Action.Retry"
}
require(Parent.FoundationCloudAssets).preloadAsset("pictograms/chat")

return function(p1) --[[ Line: 41 | Named "CommentsPanelStateView" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), CommentsListSkeletonViewModule (copy), Empty (copy), IconSize (copy), View (copy), Text (copy), Button (copy), InputSize (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	return if p1.state == "loading" then ReactModule.createElement(CommentsListSkeletonViewModule, { testId = `moments-comments-state-{p1.state}` }) elseif p1.state == "empty" then ReactModule.createElement(Empty, {
		icon = { name = "pictograms/chat", size = IconSize.XXLarge },
		text = if p1.isReadOnly then UseLocalizationResult.empty else UseLocalizationResult.emptyInvite,
		testId = `moments-comments-state-{p1.state}`
	}) else ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y",
		testId = `moments-comments-state-{p1.state}`
	}, {
		Message = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-medium content-emphasis",
			Text = UseLocalizationResult[p1.state]
		}),
		Retry = if p1.onRetry == nil then nil else ReactModule.createElement(Button, {
			text = UseLocalizationResult.retry,
			onActivated = p1.onRetry,
			size = InputSize.Small,
			variant = ButtonVariant.Standard
		})
	})
end