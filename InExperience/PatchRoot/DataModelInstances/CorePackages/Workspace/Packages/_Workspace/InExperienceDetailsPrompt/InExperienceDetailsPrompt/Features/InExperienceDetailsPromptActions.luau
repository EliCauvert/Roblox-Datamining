local parent = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent
local reactModule = require(parent.React)
local dataHydrationModule = require(parent.DataHydration)
local launchErrorLocalizationKeys = require(parent.GameLaunch).LaunchErrorLocalizationKeys
local useLocalization = require(parent.Localization).Hooks.useLocalization
local inExperienceDetailsPromptPlayButtonModule = require(script.Parent.InExperienceDetailsPromptPlayButton)
local foundationModule = require(parent.Foundation)
local sheet = foundationModule.Sheet
local view = foundationModule.View
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local fFlagLuaAppIedpFixPlayButton = require(parent.SharedFlags).FFlagLuaAppIedpFixPlayButton

return function(p0) --[[ line: 29 | named "InExperienceDetailsPromptActions" ]]
	-- upvalues: useTokens (ref), launchErrorLocalizationKeys (ref), useLocalization (ref), reactModule (ref), sheet (ref), view (ref), fFlagLuaAppIedpFixPlayButton (ref), inExperienceDetailsPromptPlayButtonModule (ref), text (ref), dataHydrationModule (ref), button (ref), iconName (ref), buttonVariant (ref), skeleton (ref), radius (ref)
	local var4 = useLocalization({
		playButtonUnavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		playabilityError = if p0.playability and not p0.playability.isPlayable and p0.playability.playabilityStatus then launchErrorLocalizationKeys[p0.playability.playabilityStatus] else nil
	})
	
	return reactModule.createElement(sheet.Actions, nil, {
		View = reactModule.createElement(view, { tag = "col gap-small size-full-0 auto-y" }, if fFlagLuaAppIedpFixPlayButton then {
			PlayButton = reactModule.createElement(inExperienceDetailsPromptPlayButtonModule, {
				playability = p0.playability,
				onJoin = p0.onJoin,
				rootPlaceId = p0.rootPlaceId,
				playabilityRetrievalStatus = p0.playabilityRetrievalStatus,
				playButtonUnavailableText = var4.playButtonUnavailable
			}),
			Text = if p0.playability and not p0.playability.isPlayable and var4.playabilityError then reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "text-body-small content-default text-truncate-split auto-xy",
				Text = var4.playabilityError
			}) else nil
		} elseif p0.playability then {
			PlayButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				width = UDim.new(1, 0),
				text = if p0.playability.isPlayable then nil else var4.playButtonUnavailable,
				icon = if p0.playability.isPlayable then iconName.PlayLarge else iconName.CircleSlash,
				variant = if p0.playability.isPlayable then buttonVariant.Emphasis else buttonVariant.Standard,
				onActivated = p0.onJoin,
				isDisabled = not p0.playability.isPlayable
			}),
			Text = if p0.playability.isPlayable or not var4.playabilityError then nil else reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "text-body-small content-default text-truncate-split auto-xy",
				Text = var4.playabilityError
			})
		} else {
			PlayButton = if p0.playabilityRetrievalStatus == dataHydrationModule.DataStatus.Failed then reactModule.createElement(button, {
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
		})
	})
end