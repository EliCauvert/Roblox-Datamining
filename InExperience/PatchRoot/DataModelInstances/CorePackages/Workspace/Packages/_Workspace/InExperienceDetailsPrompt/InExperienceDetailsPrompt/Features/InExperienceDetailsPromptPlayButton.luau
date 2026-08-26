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

return function(p1)
	-- upvalues: useTokens (ref), dataHydrationModule (ref), reactModule (ref), skeleton (ref), radius (ref), button (ref), iconName (ref), buttonVariant (ref)
	return if not (not p1.rootPlaceId or not p1.playability and p1.playabilityRetrievalStatus ~= dataHydrationModule.DataStatus.Failed) then if p1.playability then reactModule.createElement(button, {
		LayoutOrder = 1,
		width = UDim.new(1, 0),
		text = if p1.playability.isPlayable then nil else p1.playButtonUnavailableText,
		icon = if p1.playability.isPlayable then iconName.PlayLarge else iconName.CircleSlash,
		variant = if p1.playability.isPlayable then buttonVariant.Emphasis else buttonVariant.Standard,
		onActivated = p1.onJoin,
		isDisabled = not p1.playability.isPlayable
	}) else reactModule.createElement(button, {
		LayoutOrder = 1,
		width = UDim.new(1, 0),
		icon = iconName.PlayLarge,
		variant = buttonVariant.Emphasis,
		onActivated = p1.onJoin
	}) else reactModule.createElement(skeleton, {
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, useTokens().Size.Size_1000),
		radius = radius.Medium
	})
end