local Parent = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent
local ReactModule = require(Parent.React)
local DataHydrationModule = require(Parent.DataHydration)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), DataHydrationModule (copy), ReactModule (copy), Skeleton (copy), Radius (copy), Button (copy), IconName (copy), ButtonVariant (copy)
	local UseTokensResult = UseTokensFunction()
	
	return if p1.rootPlaceId and (p1.playability or p1.playabilityRetrievalStatus == DataHydrationModule.DataStatus.Failed) then if p1.playability then ReactModule.createElement(Button, {
		LayoutOrder = 1,
		width = UDim.new(1, 0),
		text = if p1.playability.isPlayable then nil else p1.playButtonUnavailableText,
		icon = if p1.playability.isPlayable then IconName.PlayLarge else IconName.CircleSlash,
		variant = if p1.playability.isPlayable then ButtonVariant.Emphasis else ButtonVariant.Standard,
		onActivated = p1.onJoin,
		isDisabled = not p1.playability.isPlayable
	}) else ReactModule.createElement(Button, {
		LayoutOrder = 1,
		width = UDim.new(1, 0),
		icon = IconName.PlayLarge,
		variant = ButtonVariant.Emphasis,
		onActivated = p1.onJoin
	}) else ReactModule.createElement(Skeleton, {
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1000),
		radius = Radius.Medium
	})
end