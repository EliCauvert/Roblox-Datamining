local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local crossExperienceVoiceModule = require(parent.CrossExperienceVoice)
local UIBloxModule = require(parent.UIBlox)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local dependenciesModule = require(squads.dependencies)
local foundation = dependenciesModule.Foundation
local react = dependenciesModule.React
local gameSettings = UserSettings().GameSettings
local partyVoiceVolumeEngineFeature = game:GetEngineFeature("PartyVoiceVolume")
local cryoModule = require(parent.Cryo)
local flags = squads.Flags
local sharedFlagsModule = require(parent.SharedFlags)
local contextualSlider = UIBloxModule.App.Slider.ContextualSlider
local crossExperienceVoiceManager = crossExperienceVoiceModule.CrossExperienceVoiceManager
local presenceType = dependenciesModule.RoduxPresence.Enums.PresenceType
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local useEnableAudioFocusToggle = crossExperienceVoiceModule.Hooks.useEnableAudioFocusToggle
local useIsVoiceFocused = crossExperienceVoiceModule.Hooks.useIsVoiceFocused
local useSelector = dependenciesModule.Hooks.useSelector
local useTokens = foundation.Hooks.useTokens
local useLocalization = dependenciesModule.Hooks.useLocalization
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local useCurrentSquadParentChannelId = require(parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local fFlagSquadVoiceMenuFoundationRefactorModule = require(flags.FFlagSquadVoiceMenuFoundationRefactor)
local fFlagEnablePartyVoiceChangersInLua = sharedFlagsModule.FFlagEnablePartyVoiceChangersInLua
local fFlagSquadsPresenceStoreMigration = require(parent.SquadsCore.Flags).FFlagSquadsPresenceStoreMigration
local var8 = if fFlagSquadsPresenceStoreMigration then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local var9 = if fFlagSquadsPresenceStoreMigration then require(parent.DataHydration).Presence.PresenceEnums.PresenceType else nil
local circle24Stroke1 = images["component_assets/circle_24_stroke_1"]
local circle16 = images["component_assets/circle_16"]
local t = {
	forceEnableAudioFocusToggle = false,
	forceShowVoiceChangerSection = false,
	openSquadVoiceChangers = function() end
}

local var11 = function(p0)
	-- upvalues: useTokens (ref), react (ref), foundation (ref), fFlagSquadVoiceMenuFoundationRefactorModule (ref), contextualSlider (ref)
	local var13 = useTokens()
	
	return react.createElement(foundation.View, if fFlagSquadVoiceMenuFoundationRefactorModule then {
		tag = "size-full-0 auto-y padding-y-small col gap-small",
		LayoutOrder = p0.LayoutOrder
	} else {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		padding = {
			top = UDim.new(0, var13.Padding.Small),
			bottom = UDim.new(0, var13.Padding.Small)
		},
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var13.Gap.Small)
		},
		LayoutOrder = p0.LayoutOrder
	}, {
		Label = react.createElement(foundation.Text, if fFlagSquadVoiceMenuFoundationRefactorModule then {
			tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left text-label-medium content-emphasis",
			LayoutOrder = 1,
			Text = p0.labelText
		} else {
			TextWrapped = false,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			fontStyle = var13.Typography.LabelMedium,
			textStyle = var13.Color.Content.Emphasis,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = p0.labelText
		}),
		SliderWrapper = react.createElement(foundation.View, if fFlagSquadVoiceMenuFoundationRefactorModule then { tag = "size-full-0 auto-y", LayoutOrder = 2 } else {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Slider = react.createElement(contextualSlider, {
				stepInterval = 0.1,
				min = 0,
				max = 1,
				width = UDim.new(1, 0),
				value = p0.sliderValue,
				onValueChanged = p0.onValueChanged
			})
		})
	})
end

local var12 = function(p1)
	-- upvalues: useTokens (ref), react (ref), foundation (ref), fFlagSquadVoiceMenuFoundationRefactorModule (ref), imageSetLabel (ref), circle24Stroke1 (ref), circle16 (ref)
	local var14 = useTokens()
	local color3 = var14.Color.Content.Emphasis.Color3
	local transparency = var14.Color.Content.Emphasis.Transparency
	
	return react.createElement(foundation.View, if fFlagSquadVoiceMenuFoundationRefactorModule then {
		tag = "size-full-0 auto-y padding-x-large padding-y-xsmall row align-x-left align-y-center gap-large",
		LayoutOrder = p1.LayoutOrder,
		onActivated = p1.onActivated
	} else {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		padding = Vector2.new(var14.Padding.Large, var14.Padding.XSmall),
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var14.Gap.Large)
		},
		LayoutOrder = p1.LayoutOrder,
		onActivated = p1.onActivated
	}, {
		Icon = react.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(24, 24),
			Image = p1.icon,
			ImageColor3 = color3,
			ImageTransparency = transparency
		}),
		Label = react.createElement(foundation.Text, if fFlagSquadVoiceMenuFoundationRefactorModule then {
			tag = "auto-xy fill text-truncate-end text-no-wrap text-align-x-left text-label-medium content-emphasis",
			LayoutOrder = 2,
			Text = p1.labelText
		} else {
			TextWrapped = false,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.XY,
			flexItem = { FlexMode = Enum.UIFlexMode.Fill },
			fontStyle = var14.Typography.LabelMedium,
			textStyle = var14.Color.Content.Emphasis,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = p1.labelText
		}),
		RadioButtonContainer = react.createElement(foundation.View, if fFlagSquadVoiceMenuFoundationRefactorModule then {
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
			DefaultIcon = react.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = circle24Stroke1,
				Size = UDim2.new(0, 24, 0, 24),
				ImageColor3 = color3,
				ImageTransparency = transparency,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0)
			}, {
				SelectedIcon = p1.isSelected and react.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Image = circle16,
					Size = UDim2.new(0, 16, 0, 16),
					ImageColor3 = color3,
					ImageTransparency = transparency,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0)
				})
			})
		})
	})
end

return function(p2)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), useLocalUserId (ref), useIsVoiceFocused (ref), useEnableAudioFocusToggle (ref), react (ref), squadExternalContractContext (ref), fFlagSquadsPresenceStoreMigration (ref), var8 (ref), useSelector (ref), var9 (ref), presenceType (ref), useCurrentSquadParentChannelId (ref), crossExperienceVoiceManager (ref), partyVoiceVolumeEngineFeature (ref), gameSettings (ref), useLocalization (ref), foundation (ref), fFlagSquadVoiceMenuFoundationRefactorModule (ref), var11 (ref), var12 (ref), images (ref), fFlagEnablePartyVoiceChangersInLua (ref)
	local var15 = cryoModule.Dictionary.join(t, p2)
	local var16 = useTokens()
	local var17 = useLocalUserId()
	local var18 = useIsVoiceFocused()
	local var19 = useEnableAudioFocusToggle()
	local var20 = react.useContext(squadExternalContractContext)
	local var21 = if fFlagSquadsPresenceStoreMigration then var8(tostring(var17)) else useSelector(react.useCallback(function(p3)
		-- upvalues: var17 (ref)
		return p3.Squad.Presence.byUserId[tostring(var17)]
	end, { var17 }))
	local var22 = react.useMemo(function()
		-- upvalues: var21 (ref), fFlagSquadsPresenceStoreMigration (copy), var9 (copy), presenceType (copy)
		return var21 and var21.userPresenceType == (if fFlagSquadsPresenceStoreMigration then var9.InGame else presenceType.InGame)
	end, { var21 })
	local var23 = react.useMemo(function()
		-- upvalues: var21 (ref), var22 (ref)
		return if var21 and var22 then var21.lastLocation else nil
	end, { var21, var22 })
	local var24 = var20.useParentChannelTitleSelector(useCurrentSquadParentChannelId() or "")
	local var25 = react.useCallback(function()
		-- upvalues: crossExperienceVoiceManager (copy)
		crossExperienceVoiceManager.default:toggleAudioFocus()
	end, {})
	local var22_1 = var22 or not partyVoiceVolumeEngineFeature
	local var22_1_1 = partyVoiceVolumeEngineFeature and var22_1
	local var19_1 = var22 and (var19 or var15.forceEnableAudioFocusToggle)
	local var29, var30 = react.useState(if partyVoiceVolumeEngineFeature then gameSettings.PartyVoiceVolume else 0)
	local var31, var32 = react.useState(gameSettings.MasterVolume)
	local var33 = useLocalization({
		volumeLabelText = "Feature.Squads.Label.Volume",
		partyVolumeLabelText = "Feature.Squads.Label.PartyVolume",
		experienceLabelText = "Feature.Squads.Label.Experience",
		voiceChatsLabelText = "Feature.Squads.Label.VoiceChats",
		partyLabelText = "Feature.Squads.Label.Party"
	})
	local _ = nil
	
	return react.createElement(foundation.View, if fFlagSquadVoiceMenuFoundationRefactorModule then {
		tag = "size-full-0 auto-y padding-y-small radius-medium bg-surface-300 col"
	} else {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		padding = Vector2.new(0, var16.Padding.Small),
		cornerRadius = UDim.new(0, var16.Radius.Medium),
		backgroundStyle = var16.Color.Surface.Surface_300,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}
	}, {
		VolumeSection = react.createElement(foundation.View, if fFlagSquadVoiceMenuFoundationRefactorModule then {
			tag = "size-full-0 auto-y padding-x-large col",
			LayoutOrder = 1
		} else {
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			padding = Vector2.new(var16.Padding.Large, 0),
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}
		}, {
			VolumeLabel = var22_1_1 and react.createElement(foundation.Text, if fFlagSquadVoiceMenuFoundationRefactorModule then {
				tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left padding-y-xsmall text-title-small content-muted",
				LayoutOrder = 1,
				Text = var33.volumeLabelText
			} else {
				TextWrapped = false,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				fontStyle = var16.Typography.TitleSmall,
				textStyle = var16.Color.Content.Muted,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				padding = Vector2.new(0, var16.Padding.XSmall),
				Text = var33.volumeLabelText
			}),
			PartySliderGroup = partyVoiceVolumeEngineFeature and react.createElement(var11, {
				LayoutOrder = 2,
				labelText = if var22_1_1 then var33.partyLabelText else var33.partyVolumeLabelText,
				sliderValue = var29,
				onValueChanged = function(p4)
					-- upvalues: gameSettings (copy), var30 (ref)
					gameSettings.PartyVoiceVolume = p4
					var30(p4)
				end
			}),
			ExperienceSliderGroup = var22_1 and react.createElement(var11, {
				LayoutOrder = 3,
				labelText = if partyVoiceVolumeEngineFeature then var33.experienceLabelText else var33.volumeLabelText,
				sliderValue = var31,
				onValueChanged = function(p5)
					-- upvalues: gameSettings (copy), var32 (ref)
					gameSettings.MasterVolume = p5
					var32(p5)
				end
			})
		}),
		Divider = var19_1 and react.createElement(foundation.View, if fFlagSquadVoiceMenuFoundationRefactorModule then {
			tag = "size-full-0 auto-y padding-y-small",
			LayoutOrder = 2
		} else {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			padding = Vector2.new(0, var16.Padding.Small)
		}, {
			Divider = react.createElement(foundation.View, {
				Size = UDim2.new(1, 0, 0, 1),
				backgroundStyle = var16.Color.Stroke.Default
			})
		}),
		VoiceChatSection = var19_1 and react.createElement(foundation.View, if fFlagSquadVoiceMenuFoundationRefactorModule then { tag = "size-full-0 auto-y col", LayoutOrder = 3 } else {
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}
		}, {
			VoiceChatLabel = react.createElement(foundation.Text, if fFlagSquadVoiceMenuFoundationRefactorModule then {
				tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left padding-x-large padding-y-xsmall text-title-small content-muted",
				LayoutOrder = 1,
				Text = var33.voiceChatsLabelText
			} else {
				TextWrapped = false,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				fontStyle = var16.Typography.TitleSmall,
				textStyle = var16.Color.Content.Muted,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				padding = Vector2.new(var16.Padding.Large, var16.Padding.XSmall),
				Text = var33.voiceChatsLabelText
			}),
			PartySelector = react.createElement(var12, {
				LayoutOrder = 2,
				icon = images["icons/menu/platformChatOff"],
				labelText = var24 or "",
				isSelected = var18,
				onActivated = react.useCallback(function()
					-- upvalues: var18 (ref), var25 (ref)
					if not var18 then
						var25()
					end
				end, { var18, var25 })
			}),
			ExperienceSelector = react.createElement(var12, {
				LayoutOrder = 3,
				icon = images["icons/menu/publicChatOff"],
				labelText = var23 or "",
				isSelected = not var18,
				onActivated = react.useCallback(function()
					-- upvalues: var18 (ref), var25 (ref)
					if var18 then
						var25()
					end
				end, { var18, var25 })
			})
		}),
		VoiceChangerSection = if fFlagEnablePartyVoiceChangersInLua or var15.forceShowVoiceChangerSection then react.createElement(foundation.View, { tag = "size-full-0 auto-y col", LayoutOrder = 4 }, {
			VoiceChangerSectionLabel = react.createElement(foundation.Text, {
				tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left padding-x-large padding-y-xsmall text-title-small content-muted",
				LayoutOrder = 1,
				Text = "Voice changers"
			}),
			OpenVoiceChangerModal = react.createElement(foundation.View, {
				tag = "size-full-0 auto-y row align-x-left align-y-center gap-large padding-x-large padding-y-xsmall",
				LayoutOrder = 2,
				onActivated = react.useCallback(function()
					-- upvalues: var15 (ref)
					if var15.openSquadVoiceChangers then
						var15.openSquadVoiceChangers()
					end
				end, { var15.openSquadVoiceChangers })
			}, {
				ChooseVoicePackLabel = react.createElement(foundation.Text, {
					tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left fill text-label-medium content-emphasis",
					LayoutOrder = 1,
					Text = "Choose voice pack",
					Size = UDim2.new(1, 0, 0, 40)
				}),
				OpenIcon = react.createElement(foundation.Icon, { LayoutOrder = 2, name = "chevron-large-right" })
			})
		}) else nil
	})
end