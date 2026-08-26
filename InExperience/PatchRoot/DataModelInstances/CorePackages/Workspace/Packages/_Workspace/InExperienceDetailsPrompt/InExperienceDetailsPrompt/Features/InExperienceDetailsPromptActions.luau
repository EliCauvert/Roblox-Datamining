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

return function(p1)
	-- upvalues: useTokens (ref), launchErrorLocalizationKeys (ref), useLocalization (ref), reactModule (ref), sheet (ref), view (ref), fFlagLuaAppIedpFixPlayButton (ref), inExperienceDetailsPromptPlayButtonModule (ref), text (ref), dataHydrationModule (ref), button (ref), iconName (ref), buttonVariant (ref), skeleton (ref), radius (ref)
	local var1 = useLocalization({
		playButtonUnavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		playabilityError = if p1.playability and not p1.playability.isPlayable and p1.playability.playabilityStatus then launchErrorLocalizationKeys[p1.playability.playabilityStatus] else nil
	})
	
	return reactModule.createElement(sheet.Actions, nil, {
		View = reactModule.createElement(view, { tag = "col gap-small size-full-0 auto-y" }, if fFlagLuaAppIedpFixPlayButton then {
			PlayButton = reactModule.createElement(inExperienceDetailsPromptPlayButtonModule, {
				playability = p1.playability,
				onJoin = p1.onJoin,
				rootPlaceId = p1.rootPlaceId,
				playabilityRetrievalStatus = p1.playabilityRetrievalStatus,
				playButtonUnavailableText = var1.playButtonUnavailable
			}),
			Text = if p1.playability and not p1.playability.isPlayable and var1.playabilityError then reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "text-body-small content-default text-truncate-split auto-xy",
				Text = var1.playabilityError
			}) else nil
		} elseif p1.playability then {
			PlayButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				width = UDim.new(1, 0),
				text = if p1.playability.isPlayable then nil else var1.playButtonUnavailable,
				icon = if p1.playability.isPlayable then iconName.PlayLarge else iconName.CircleSlash,
				variant = if p1.playability.isPlayable then buttonVariant.Emphasis else buttonVariant.Standard,
				onActivated = p1.onJoin,
				isDisabled = not p1.playability.isPlayable
			}),
			Text = if p1.playability.isPlayable or not var1.playabilityError then nil else reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "text-body-small content-default text-truncate-split auto-xy",
				Text = var1.playabilityError
			})
		} else {
			PlayButton = if p1.playabilityRetrievalStatus == dataHydrationModule.DataStatus.Failed then reactModule.createElement(button, {
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
		})
	})
end