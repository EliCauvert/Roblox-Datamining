local Parent = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent
local ReactModule = require(Parent.React)
local DataHydrationModule = require(Parent.DataHydration)
local LaunchErrorLocalizationKeys = require(Parent.GameLaunch).LaunchErrorLocalizationKeys
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local InExperienceDetailsPromptPlayButtonModule = require(script.Parent.InExperienceDetailsPromptPlayButton)
local FoundationModule = require(Parent.Foundation)
local Sheet = FoundationModule.Sheet
local View = FoundationModule.View
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagLuaAppIedpFixPlayButton = require(Parent.SharedFlags).FFlagLuaAppIedpFixPlayButton

return function(p1)
	-- upvalues: UseTokensFunction (copy), LaunchErrorLocalizationKeys (copy), UseLocalizationFunction (copy), ReactModule (copy), Sheet (copy), View (copy), FFlagLuaAppIedpFixPlayButton (copy), InExperienceDetailsPromptPlayButtonModule (copy), Text (copy), DataHydrationModule (copy), Button (copy), IconName (copy), ButtonVariant (copy), Skeleton (copy), Radius (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		playButtonUnavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		playabilityError = if p1.playability and not p1.playability.isPlayable and p1.playability.playabilityStatus then LaunchErrorLocalizationKeys[p1.playability.playabilityStatus] else nil
	})
	
	return ReactModule.createElement(Sheet.Actions, nil, {
		View = ReactModule.createElement(View, { tag = "col gap-small size-full-0 auto-y" }, if FFlagLuaAppIedpFixPlayButton then {
			PlayButton = ReactModule.createElement(InExperienceDetailsPromptPlayButtonModule, {
				playability = p1.playability,
				onJoin = p1.onJoin,
				rootPlaceId = p1.rootPlaceId,
				playabilityRetrievalStatus = p1.playabilityRetrievalStatus,
				playButtonUnavailableText = UseLocalizationResult.playButtonUnavailable
			}),
			Text = if p1.playability and not p1.playability.isPlayable and UseLocalizationResult.playabilityError then ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "text-body-small content-default text-truncate-split auto-xy",
				Text = UseLocalizationResult.playabilityError
			}) else nil
		} elseif p1.playability then {
			PlayButton = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				width = UDim.new(1, 0),
				text = if p1.playability.isPlayable then nil else UseLocalizationResult.playButtonUnavailable,
				icon = if p1.playability.isPlayable then IconName.PlayLarge else IconName.CircleSlash,
				variant = if p1.playability.isPlayable then ButtonVariant.Emphasis else ButtonVariant.Standard,
				onActivated = p1.onJoin,
				isDisabled = not p1.playability.isPlayable
			}),
			Text = if p1.playability.isPlayable or not UseLocalizationResult.playabilityError then nil else ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "text-body-small content-default text-truncate-split auto-xy",
				Text = UseLocalizationResult.playabilityError
			})
		} else {
			PlayButton = if p1.playabilityRetrievalStatus == DataHydrationModule.DataStatus.Failed then ReactModule.createElement(Button, {
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
		})
	})
end