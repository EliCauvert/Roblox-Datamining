local parent = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent
local reactModule = require(parent.React)
local dataHydrationModule = require(parent.DataHydration)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens

return function(p0)
	-- upvalues: useTokens (ref), dataHydrationModule (ref), reactModule (ref), skeleton (ref), radius (ref), button (ref), iconName (ref), buttonVariant (ref)
	return if not (not p0.rootPlaceId or not p0.playability and p0.playabilityRetrievalStatus ~= dataHydrationModule.DataStatus.Failed) then if p0.playability then reactModule.createElement(button, {
		LayoutOrder = 1,
		width = UDim.new(1, 0),
		text = if p0.playability.isPlayable then nil else p0.playButtonUnavailableText,
		icon = if p0.playability.isPlayable then iconName.PlayLarge else iconName.CircleSlash,
		variant = if p0.playability.isPlayable then buttonVariant.Emphasis else buttonVariant.Standard,
		onActivated = p0.onJoin,
		isDisabled = not p0.playability.isPlayable
	}) else reactModule.createElement(button, {
		LayoutOrder = 1,
		width = UDim.new(1, 0),
		icon = iconName.PlayLarge,
		variant = buttonVariant.Emphasis,
		onActivated = p0.onJoin
	}) else reactModule.createElement(skeleton, {
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, useTokens().Size.Size_1000),
		radius = radius.Medium
	})
end