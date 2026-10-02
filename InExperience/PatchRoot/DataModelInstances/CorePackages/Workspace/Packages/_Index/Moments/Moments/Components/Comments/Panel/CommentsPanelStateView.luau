local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local foundationCloudAssetsModule = require(parent.FoundationCloudAssets)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local commentsListSkeletonViewModule = require(moments.Components.Comments.List.CommentsListSkeletonView)
local useLocalization = localizationModule.Hooks.useLocalization
local button = foundationModule.Button
local empty = foundationModule.Empty
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local t = {
	empty = "Feature.Moments.Label.NoCommentsYet",
	emptyInvite = "Feature.Moments.Label.FirstCommentInvite",
	disabled = "Feature.Moments.Label.CommentsDisabled",
	unavailable = "Feature.Moments.Label.CommentsUnavailable",
	retry = "Feature.Moments.Action.Retry"
}
foundationCloudAssetsModule.preloadAsset("pictograms/chat")

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), commentsListSkeletonViewModule (ref), empty (ref), iconSize (ref), view (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref)
	local var1 = useLocalization(t)
	
	return if p1.state == "loading" then reactModule.createElement(commentsListSkeletonViewModule, { testId = `moments-comments-state-{p1.state}` }) elseif p1.state == "empty" then reactModule.createElement(empty, {
		icon = { name = "pictograms/chat", size = iconSize.XXLarge },
		text = if p1.isReadOnly then var1.empty else var1.emptyInvite,
		testId = `moments-comments-state-{p1.state}`
	}) else reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		testId = `moments-comments-state-{p1.state}`
	}, {
		Message = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium content-emphasis",
			Text = var1[p1.state]
		}),
		Retry = if p1.onRetry ~= nil then nil else reactModule.createElement(button, {
			text = var1.retry,
			onActivated = p1.onRetry,
			size = inputSize.Small,
			variant = buttonVariant.Standard
		})
	})
end