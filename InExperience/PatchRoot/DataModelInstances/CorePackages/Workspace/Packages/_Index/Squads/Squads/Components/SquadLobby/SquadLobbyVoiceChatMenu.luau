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
local circle24Stroke1 = images["component_assets/circle_24_stroke_1"]
local circle16 = images["component_assets/circle_16"]
local t = {
	forceEnableAudioFocusToggle = false,
	forceShowVoiceChangerSection = false,
	openSquadVoiceChangers = function() --[[ line: 56 ]] end
}

local var9 = function(p0) --[[ line: 66 ]]
	-- upvalues: useTokens (ref), react (ref), foundation (ref), fFlagSquadVoiceMenuFoundationRefactorModule (ref), contextualSlider (ref)
	local var11 = useTokens()
	
	return react.createElement(foundation.View, if fFlagSquadVoiceMenuFoundationRefactorModule then {
		tag = "size-full-0 auto-y padding-y-small col gap-small",
		LayoutOrder = p0.LayoutOrder
	} else {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		padding = {
			top = UDim.new(0, var11.Padding.Small),
			bottom = UDim.new(0, var11.Padding.Small)
		},
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var11.Gap.Small)
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
			fontStyle = var11.Typography.LabelMedium,
			textStyle = var11.Color.Content.Emphasis,
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

local var10 = function(p1) --[[ line: 145 ]]
	-- upvalues: useTokens (ref), react (ref), foundation (ref), fFlagSquadVoiceMenuFoundationRefactorModule (ref), imageSetLabel (ref), circle24Stroke1 (ref), circle16 (ref)
	local var12 = useTokens()
	local color3 = var12.Color.Content.Emphasis.Color3
	local transparency = var12.Color.Content.Emphasis.Transparency
	
	return react.createElement(foundation.View, if fFlagSquadVoiceMenuFoundationRefactorModule then {
		tag = "size-full-0 auto-y padding-x-large padding-y-xsmall row align-x-left align-y-center gap-large",
		LayoutOrder = p1.LayoutOrder,
		onActivated = p1.onActivated
	} else {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		padding = Vector2.new(var12.Padding.Large, var12.Padding.XSmall),
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var12.Gap.Large)
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
			fontStyle = var12.Typography.LabelMedium,
			textStyle = var12.Color.Content.Emphasis,
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

return function(p2) --[[ line: 248 ]]
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), useLocalUserId (ref), useIsVoiceFocused (ref), useEnableAudioFocusToggle (ref), react (ref), squadExternalContractContext (ref), useSelector (ref), presenceType (ref), useCurrentSquadParentChannelId (ref), crossExperienceVoiceManager (ref), partyVoiceVolumeEngineFeature (ref), gameSettings (ref), useLocalization (ref), foundation (ref), fFlagSquadVoiceMenuFoundationRefactorModule (ref), var9 (ref), var10 (ref), images (ref), fFlagEnablePartyVoiceChangersInLua (ref)
	local var13 = cryoModule.Dictionary.join(t, p2)
	local var14 = useTokens()
	local var15 = useLocalUserId()
	local var16 = useIsVoiceFocused()
	local var17 = useEnableAudioFocusToggle()
	local var18 = react.useContext(squadExternalContractContext)
	local var19 = useSelector(react.useCallback(function(p3) --[[ line: 256 ]]
		-- upvalues: var15 (ref)
		return p3.Squad.Presence.byUserId[tostring(var15)]
	end, { var15 }))
	local var20 = react.useMemo(function() --[[ line: 261 ]]
		-- upvalues: var19 (ref), presenceType (copy)
		return var19 and var19.userPresenceType == presenceType.InGame
	end, { var19 })
	local var21 = react.useMemo(function() --[[ line: 265 ]]
		-- upvalues: var19 (ref), var20 (ref)
		return if var19 and var20 then var19.lastLocation else nil
	end, { var19, var20 })
	local var22 = var18.useParentChannelTitleSelector(useCurrentSquadParentChannelId() or "")
	local var23 = react.useCallback(function() --[[ line: 273 ]]
		-- upvalues: crossExperienceVoiceManager (copy)
		crossExperienceVoiceManager.default:toggleAudioFocus()
	end, {})
	local var20_1 = var20 or not partyVoiceVolumeEngineFeature
	local var20_1_1 = partyVoiceVolumeEngineFeature and var20_1
	local var17_1 = var20 and (var17 or var13.forceEnableAudioFocusToggle)
	local var27, var28 = react.useState(if partyVoiceVolumeEngineFeature then gameSettings.PartyVoiceVolume else 0)
	local var29, var30 = react.useState(gameSettings.MasterVolume)
	local var31 = useLocalization({
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
		padding = Vector2.new(0, var14.Padding.Small),
		cornerRadius = UDim.new(0, var14.Radius.Medium),
		backgroundStyle = var14.Color.Surface.Surface_300,
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
			padding = Vector2.new(var14.Padding.Large, 0),
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}
		}, {
			VolumeLabel = var20_1_1 and react.createElement(foundation.Text, if fFlagSquadVoiceMenuFoundationRefactorModule then {
				tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left padding-y-xsmall text-title-small content-muted",
				LayoutOrder = 1,
				Text = var31.volumeLabelText
			} else {
				TextWrapped = false,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				fontStyle = var14.Typography.TitleSmall,
				textStyle = var14.Color.Content.Muted,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				padding = Vector2.new(0, var14.Padding.XSmall),
				Text = var31.volumeLabelText
			}),
			PartySliderGroup = partyVoiceVolumeEngineFeature and react.createElement(var9, {
				LayoutOrder = 2,
				labelText = if var20_1_1 then var31.partyLabelText else var31.partyVolumeLabelText,
				sliderValue = var27,
				onValueChanged = function(p4) --[[ line: 381 ]]
					-- upvalues: gameSettings (copy), var28 (ref)
					gameSettings.PartyVoiceVolume = p4
					var28(p4)
				end
			}),
			ExperienceSliderGroup = var20_1 and react.createElement(var9, {
				LayoutOrder = 3,
				labelText = if partyVoiceVolumeEngineFeature then var31.experienceLabelText else var31.volumeLabelText,
				sliderValue = var29,
				onValueChanged = function(p5) --[[ line: 390 ]]
					-- upvalues: gameSettings (copy), var30 (ref)
					gameSettings.MasterVolume = p5
					var30(p5)
				end
			})
		}),
		Divider = var17_1 and react.createElement(foundation.View, if fFlagSquadVoiceMenuFoundationRefactorModule then {
			tag = "size-full-0 auto-y padding-y-small",
			LayoutOrder = 2
		} else {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			padding = Vector2.new(0, var14.Padding.Small)
		}, {
			Divider = react.createElement(foundation.View, {
				Size = UDim2.new(1, 0, 0, 1),
				backgroundStyle = var14.Color.Stroke.Default
			})
		}),
		VoiceChatSection = var17_1 and react.createElement(foundation.View, if fFlagSquadVoiceMenuFoundationRefactorModule then { tag = "size-full-0 auto-y col", LayoutOrder = 3 } else {
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
				Text = var31.voiceChatsLabelText
			} else {
				TextWrapped = false,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				fontStyle = var14.Typography.TitleSmall,
				textStyle = var14.Color.Content.Muted,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				padding = Vector2.new(var14.Padding.Large, var14.Padding.XSmall),
				Text = var31.voiceChatsLabelText
			}),
			PartySelector = react.createElement(var10, {
				LayoutOrder = 2,
				icon = images["icons/menu/platformChatOff"],
				labelText = var22 or "",
				isSelected = var16,
				onActivated = react.useCallback(function() --[[ line: 301 ]]
					-- upvalues: var16 (ref), var23 (ref)
					if not var16 then
						var23()
					end
				end, { var16, var23 })
			}),
			ExperienceSelector = react.createElement(var10, {
				LayoutOrder = 3,
				icon = images["icons/menu/publicChatOff"],
				labelText = var21 or "",
				isSelected = not var16,
				onActivated = react.useCallback(function() --[[ line: 307 ]]
					-- upvalues: var16 (ref), var23 (ref)
					if var16 then
						var23()
					end
				end, { var16, var23 })
			})
		}),
		VoiceChangerSection = if fFlagEnablePartyVoiceChangersInLua or var13.forceShowVoiceChangerSection then react.createElement(foundation.View, { tag = "size-full-0 auto-y col", LayoutOrder = 4 }, {
			VoiceChangerSectionLabel = react.createElement(foundation.Text, {
				tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left padding-x-large padding-y-xsmall text-title-small content-muted",
				LayoutOrder = 1,
				Text = "Voice changers"
			}),
			OpenVoiceChangerModal = react.createElement(foundation.View, {
				tag = "size-full-0 auto-y row align-x-left align-y-center gap-large padding-x-large padding-y-xsmall",
				LayoutOrder = 2,
				onActivated = react.useCallback(function() --[[ line: 314 ]]
					-- upvalues: var13 (ref)
					if var13.openSquadVoiceChangers then
						var13.openSquadVoiceChangers()
					end
				end, { var13.openSquadVoiceChangers })
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