local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local CrossExperienceVoiceModule = require(Parent.CrossExperienceVoice)
local UIBloxModule = require(Parent.UIBlox)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local DependenciesModule = require(Squads.dependencies)
local Foundation = DependenciesModule.Foundation
local React = DependenciesModule.React
local GameSettings = UserSettings().GameSettings
local PartyVoiceVolumeEngineFeature = game:GetEngineFeature("PartyVoiceVolume")
local CryoModule = require(Parent.Cryo)
local ContextualSlider = UIBloxModule.App.Slider.ContextualSlider
local CrossExperienceVoiceManager = CrossExperienceVoiceModule.CrossExperienceVoiceManager
local PresenceType = DependenciesModule.RoduxPresence.Enums.PresenceType
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local UseEnableAudioFocusToggleFunction = CrossExperienceVoiceModule.Hooks.useEnableAudioFocusToggle
local UseIsVoiceFocusedFunction = CrossExperienceVoiceModule.Hooks.useIsVoiceFocused
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseTokensFunction = Foundation.Hooks.useTokens
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local UseCurrentSquadParentChannelIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local FFlagSquadVoiceMenuFoundationRefactorModule = require(Squads.Flags.FFlagSquadVoiceMenuFoundationRefactor)
local FFlagEnablePartyVoiceChangersInLua = require(Parent.SharedFlags).FFlagEnablePartyVoiceChangersInLua
local ComponentAssetsCircle24Stroke1 = Images["component_assets/circle_24_stroke_1"]
local ComponentAssetsCircle16 = Images["component_assets/circle_16"]
local config = {
	forceEnableAudioFocusToggle = false,
	forceShowVoiceChangerSection = false,
	openSquadVoiceChangers = function() end
}

local function v21(Frame: Frame)
	-- upvalues: UseTokensFunction (copy), React (copy), Foundation (copy), FFlagSquadVoiceMenuFoundationRefactorModule (copy), ContextualSlider (copy)
	local UseTokensResult = UseTokensFunction()
	
	return React.createElement(Foundation.View, if FFlagSquadVoiceMenuFoundationRefactorModule then {
		tag = "size-full-0 auto-y padding-y-small col gap-small",
		LayoutOrder = Frame.LayoutOrder
	} else {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		padding = {
			top = UDim.new(0, UseTokensResult.Padding.Small),
			bottom = UDim.new(0, UseTokensResult.Padding.Small)
		},
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, UseTokensResult.Gap.Small)
		},
		LayoutOrder = Frame.LayoutOrder
	}, {
		Label = React.createElement(Foundation.Text, if FFlagSquadVoiceMenuFoundationRefactorModule then {
			tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left text-label-medium content-emphasis",
			LayoutOrder = 1,
			Text = Frame.labelText
		} else {
			TextWrapped = false,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			fontStyle = UseTokensResult.Typography.LabelMedium,
			textStyle = UseTokensResult.Color.Content.Emphasis,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = Frame.labelText
		}),
		SliderWrapper = React.createElement(Foundation.View, if FFlagSquadVoiceMenuFoundationRefactorModule then { tag = "size-full-0 auto-y", LayoutOrder = 2 } else {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Slider = React.createElement(ContextualSlider, {
				stepInterval = 0.1,
				min = 0,
				max = 1,
				width = UDim.new(1, 0),
				value = Frame.sliderValue,
				onValueChanged = Frame.onValueChanged
			})
		})
	})
end

local function v22(Frame: Frame)
	-- upvalues: UseTokensFunction (copy), React (copy), Foundation (copy), FFlagSquadVoiceMenuFoundationRefactorModule (copy), ImageSetLabel (copy), ComponentAssetsCircle24Stroke1 (copy), ComponentAssetsCircle16 (copy)
	local UseTokensResult = UseTokensFunction()
	local EmphasisColor3 = UseTokensResult.Color.Content.Emphasis.Color3
	local Transparency = UseTokensResult.Color.Content.Emphasis.Transparency
	
	return React.createElement(Foundation.View, if FFlagSquadVoiceMenuFoundationRefactorModule then {
		tag = "size-full-0 auto-y padding-x-large padding-y-xsmall row align-x-left align-y-center gap-large",
		LayoutOrder = Frame.LayoutOrder,
		onActivated = Frame.onActivated
	} else {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		padding = Vector2.new(UseTokensResult.Padding.Large, UseTokensResult.Padding.XSmall),
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, UseTokensResult.Gap.Large)
		},
		LayoutOrder = Frame.LayoutOrder,
		onActivated = Frame.onActivated
	}, {
		Icon = React.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(24, 24),
			Image = Frame.icon,
			ImageColor3 = EmphasisColor3,
			ImageTransparency = Transparency
		}),
		Label = React.createElement(Foundation.Text, if FFlagSquadVoiceMenuFoundationRefactorModule then {
			tag = "auto-xy fill text-truncate-end text-no-wrap text-align-x-left text-label-medium content-emphasis",
			LayoutOrder = 2,
			Text = Frame.labelText
		} else {
			TextWrapped = false,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.XY,
			flexItem = { FlexMode = Enum.UIFlexMode.Fill },
			fontStyle = UseTokensResult.Typography.LabelMedium,
			textStyle = UseTokensResult.Color.Content.Emphasis,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = Frame.labelText
		}),
		RadioButtonContainer = React.createElement(Foundation.View, if FFlagSquadVoiceMenuFoundationRefactorModule then {
			tag = "auto-x row align-x-right align-y-center",
			LayoutOrder = 3,
			Size = UDim2.new(0, 0, 0, 40)
		} else {
			LayoutOrder = 3,
			Size = UDim2.new(0, 0, 0, 40),
			AutomaticSize = Enum.AutomaticSize.X,
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}
		}, {
			DefaultIcon = React.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Image = ComponentAssetsCircle24Stroke1,
				Size = UDim2.new(0, 24, 0, 24),
				ImageColor3 = EmphasisColor3,
				ImageTransparency = Transparency,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0)
			}, {
				SelectedIcon = Frame.isSelected and React.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = ComponentAssetsCircle16,
					Size = UDim2.new(0, 16, 0, 16),
					ImageColor3 = EmphasisColor3,
					ImageTransparency = Transparency,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0)
				})
			})
		})
	})
end

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), UseLocalUserIdFunction (copy), UseIsVoiceFocusedFunction (copy), UseEnableAudioFocusToggleFunction (copy), React (copy), SquadExternalContractContext (copy), UseSelectorFunction (copy), PresenceType (copy), UseCurrentSquadParentChannelIdFunction (copy), CrossExperienceVoiceManager (copy), PartyVoiceVolumeEngineFeature (copy), GameSettings (copy), UseLocalizationFunction (copy), Foundation (copy), FFlagSquadVoiceMenuFoundationRefactorModule (copy), v21 (copy), v22 (copy), Images (copy), FFlagEnablePartyVoiceChangersInLua (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseTokensResult = UseTokensFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseIsVoiceFocusedResult = UseIsVoiceFocusedFunction()
	local UseEnableAudioFocusToggleResult = UseEnableAudioFocusToggleFunction()
	local UseContextResult = React.useContext(SquadExternalContractContext)
	local UseSelectorResult = UseSelectorFunction((React.useCallback(function(p2)
		-- upvalues: UseLocalUserIdResult (copy)
		return p2.Squad.Presence.byUserId[tostring(UseLocalUserIdResult)]
	end, { UseLocalUserIdResult })))
	local UseMemoResult = React.useMemo(function(): boolean
		-- upvalues: UseSelectorResult (copy), PresenceType (upval)
		return UseSelectorResult and UseSelectorResult.userPresenceType == PresenceType.InGame
	end, { UseSelectorResult })
	local UseMemoResult1 = React.useMemo(function()
		-- upvalues: UseSelectorResult (copy), UseMemoResult (copy)
		return if UseSelectorResult and UseMemoResult then UseSelectorResult.lastLocation else nil
	end, { UseSelectorResult, UseMemoResult })
	local UseParentChannelTitleSelectorResult = UseContextResult.useParentChannelTitleSelector(UseCurrentSquadParentChannelIdFunction() or "")
	local UseResult = React.useCallback(function()
		-- upvalues: CrossExperienceVoiceManager (upval)
		CrossExperienceVoiceManager.default:toggleAudioFocus()
	end, {})
	local UseMemoResult2 = UseMemoResult or not PartyVoiceVolumeEngineFeature
	local UseMemoResult2_1 = PartyVoiceVolumeEngineFeature and UseMemoResult2
	local UseEnableAudioFocusToggleResult1 = UseMemoResult and (UseEnableAudioFocusToggleResult or JoinResult.forceEnableAudioFocusToggle)
	local UseStateResult, UseStateResult2 = React.useState(if PartyVoiceVolumeEngineFeature then GameSettings.PartyVoiceVolume else 0)
	local UseStateResult1, UseStateResult2_1 = React.useState(GameSettings.MasterVolume)
	local UseLocalizationResult = UseLocalizationFunction({
		volumeLabelText = "Feature.Squads.Label.Volume",
		partyVolumeLabelText = "Feature.Squads.Label.PartyVolume",
		experienceLabelText = "Feature.Squads.Label.Experience",
		voiceChatsLabelText = "Feature.Squads.Label.VoiceChats",
		partyLabelText = "Feature.Squads.Label.Party"
	})
	local PartyLabelText = if UseMemoResult2_1 then UseLocalizationResult.partyLabelText else UseLocalizationResult.partyVolumeLabelText
	local ExperienceLabelText = if PartyVoiceVolumeEngineFeature then UseLocalizationResult.experienceLabelText else UseLocalizationResult.volumeLabelText
	local UseResult1 = React.useCallback(function()
		-- upvalues: UseIsVoiceFocusedResult (copy), UseResult (copy)
		if not UseIsVoiceFocusedResult then
			UseResult()
		end
	end, { UseIsVoiceFocusedResult, UseResult })
	local UseResult2 = React.useCallback(function()
		-- upvalues: UseIsVoiceFocusedResult (copy), UseResult (copy)
		if UseIsVoiceFocusedResult then
			UseResult()
		end
	end, { UseIsVoiceFocusedResult, UseResult })
	local UseResult3 = React.useCallback(function()
		-- upvalues: JoinResult (copy)
		if JoinResult.openSquadVoiceChangers then
			JoinResult.openSquadVoiceChangers()
		end
	end, { JoinResult.openSquadVoiceChangers })
	
	return React.createElement(Foundation.View, if FFlagSquadVoiceMenuFoundationRefactorModule then {
		tag = "size-full-0 auto-y padding-y-small radius-medium bg-surface-300 col"
	} else {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		padding = Vector2.new(0, UseTokensResult.Padding.Small),
		cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium),
		backgroundStyle = UseTokensResult.Color.Surface.Surface_300,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}
	}, {
		VolumeSection = React.createElement(Foundation.View, if FFlagSquadVoiceMenuFoundationRefactorModule then {
			tag = "size-full-0 auto-y padding-x-large col",
			LayoutOrder = 1
		} else {
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			padding = Vector2.new(UseTokensResult.Padding.Large, 0),
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}
		}, {
			VolumeLabel = UseMemoResult2_1 and React.createElement(Foundation.Text, if FFlagSquadVoiceMenuFoundationRefactorModule then {
				tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left padding-y-xsmall text-title-small content-muted",
				LayoutOrder = 1,
				Text = UseLocalizationResult.volumeLabelText
			} else {
				TextWrapped = false,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				fontStyle = UseTokensResult.Typography.TitleSmall,
				textStyle = UseTokensResult.Color.Content.Muted,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				padding = Vector2.new(0, UseTokensResult.Padding.XSmall),
				Text = UseLocalizationResult.volumeLabelText
			}),
			PartySliderGroup = PartyVoiceVolumeEngineFeature and React.createElement(v21, {
				LayoutOrder = 2,
				labelText = PartyLabelText,
				sliderValue = UseStateResult,
				onValueChanged = function(PartyVoiceVolume)
					-- upvalues: GameSettings (upval), UseStateResult2 (copy)
					GameSettings.PartyVoiceVolume = PartyVoiceVolume
					UseStateResult2(PartyVoiceVolume)
				end
			}),
			ExperienceSliderGroup = UseMemoResult2 and React.createElement(v21, {
				LayoutOrder = 3,
				labelText = ExperienceLabelText,
				sliderValue = UseStateResult1,
				onValueChanged = function(MasterVolume)
					-- upvalues: GameSettings (upval), UseStateResult2_1 (copy)
					GameSettings.MasterVolume = MasterVolume
					UseStateResult2_1(MasterVolume)
				end
			})
		}),
		Divider = UseEnableAudioFocusToggleResult1 and React.createElement(Foundation.View, if FFlagSquadVoiceMenuFoundationRefactorModule then {
			tag = "size-full-0 auto-y padding-y-small",
			LayoutOrder = 2
		} else {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			padding = Vector2.new(0, UseTokensResult.Padding.Small)
		}, {
			Divider = React.createElement(Foundation.View, {
				Size = UDim2.new(1, 0, 0, 1),
				backgroundStyle = UseTokensResult.Color.Stroke.Default
			})
		}),
		VoiceChatSection = UseEnableAudioFocusToggleResult1 and React.createElement(Foundation.View, if FFlagSquadVoiceMenuFoundationRefactorModule then { tag = "size-full-0 auto-y col", LayoutOrder = 3 } else {
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}
		}, {
			VoiceChatLabel = React.createElement(Foundation.Text, if FFlagSquadVoiceMenuFoundationRefactorModule then {
				tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left padding-x-large padding-y-xsmall text-title-small content-muted",
				LayoutOrder = 1,
				Text = UseLocalizationResult.voiceChatsLabelText
			} else {
				TextWrapped = false,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				fontStyle = UseTokensResult.Typography.TitleSmall,
				textStyle = UseTokensResult.Color.Content.Muted,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				padding = Vector2.new(UseTokensResult.Padding.Large, UseTokensResult.Padding.XSmall),
				Text = UseLocalizationResult.voiceChatsLabelText
			}),
			PartySelector = React.createElement(v22, {
				LayoutOrder = 2,
				icon = Images["icons/menu/platformChatOff"],
				labelText = UseParentChannelTitleSelectorResult or "",
				isSelected = UseIsVoiceFocusedResult,
				onActivated = UseResult1
			}),
			ExperienceSelector = React.createElement(v22, {
				LayoutOrder = 3,
				icon = Images["icons/menu/publicChatOff"],
				labelText = UseMemoResult1 or "",
				isSelected = not UseIsVoiceFocusedResult,
				onActivated = UseResult2
			})
		}),
		VoiceChangerSection = if FFlagEnablePartyVoiceChangersInLua or JoinResult.forceShowVoiceChangerSection then React.createElement(Foundation.View, { tag = "size-full-0 auto-y col", LayoutOrder = 4 }, {
			VoiceChangerSectionLabel = React.createElement(Foundation.Text, {
				tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left padding-x-large padding-y-xsmall text-title-small content-muted",
				LayoutOrder = 1,
				Text = "Voice changers"
			}),
			OpenVoiceChangerModal = React.createElement(Foundation.View, {
				tag = "size-full-0 auto-y row align-x-left align-y-center gap-large padding-x-large padding-y-xsmall",
				LayoutOrder = 2,
				onActivated = UseResult3
			}, {
				ChooseVoicePackLabel = React.createElement(Foundation.Text, {
					tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left fill text-label-medium content-emphasis",
					LayoutOrder = 1,
					Text = "Choose voice pack",
					Size = UDim2.new(1, 0, 0, 40)
				}),
				OpenIcon = React.createElement(Foundation.Icon, { LayoutOrder = 2, name = "chevron-large-right" })
			})
		}) else nil
	})
end