local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local foundationCloudAssetsModule = require(parent.FoundationCloudAssets)
local reactModule = require(parent.React)
local button = foundationModule.Button
local empty = foundationModule.Empty
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local t = {
	loading = "Loading comments\226\128\166",
	empty = "No comments yet",
	disabled = "Comments are disabled",
	unavailable = "Comments are unavailable"
}
foundationCloudAssetsModule.preloadAsset("pictograms/chat")

return function(p1)
	-- upvalues: reactModule (ref), empty (ref), iconSize (ref), t (ref), view (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref)
	return if p1.state == "empty" then reactModule.createElement(empty, {
		icon = { name = "pictograms/chat", size = iconSize.XXLarge },
		text = if p1.isReadOnly then t[p1.state] else "No comments yet. Be the first to comment!",
		testId = `moments-comments-state-{p1.state}`
	}) else reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		testId = `moments-comments-state-{p1.state}`
	}, {
		Message = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium content-emphasis",
			Text = t[p1.state]
		}),
		Retry = if p1.onRetry ~= nil then nil else reactModule.createElement(button, {
			text = "Retry",
			onActivated = p1.onRetry,
			size = inputSize.Small,
			variant = buttonVariant.Standard
		})
	})
end