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
local var1 = if fFlagSquadsPresenceStoreMigration then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local var2 = if fFlagSquadsPresenceStoreMigration then require(parent.DataHydration).Presence.PresenceEnums.PresenceType else nil
local circle24Stroke1 = images["component_assets/circle_24_stroke_1"]
local circle16 = images["component_assets/circle_16"]
local t = {
	forceEnableAudioFocusToggle = false,
	forceShowVoiceChangerSection = false,
	openSquadVoiceChangers = function() end
}

local var3 = function(p1)
	-- upvalues: useTokens (ref), react (ref), foundation (ref), fFlagSquadVoiceMenuFoundationRefactorModule (ref), contextualSlider (ref)
	local var4 = useTokens()
	
	return react.createElement(foundation.View, if fFlagSquadVoiceMenuFoundationRefactorModule then {
		tag = "size-full-0 auto-y padding-y-small col gap-small",
		LayoutOrder = p1.LayoutOrder
	} else {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		padding = {
			top = UDim.new(0, var4.Padding.Small),
			bottom = UDim.new(0, var4.Padding.Small)
		},
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var4.Gap.Small)
		},
		LayoutOrder = p1.LayoutOrder
	}, {
		Label = react.createElement(foundation.Text, if fFlagSquadVoiceMenuFoundationRefactorModule then {
			tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left text-label-medium content-emphasis",
			LayoutOrder = 1,
			Text = p1.labelText
		} else {
			TextWrapped = false,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			fontStyle = var4.Typography.LabelMedium,
			textStyle = var4.Color.Content.Emphasis,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = p1.labelText
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
				value = p1.sliderValue,
				onValueChanged = p1.onValueChanged
			})
		})
	})
end

local var4 = function(p1)
	-- upvalues: useTokens (ref), react (ref), foundation (ref), fFlagSquadVoiceMenuFoundationRefactorModule (ref), imageSetLabel (ref), circle24Stroke1 (ref), circle16 (ref)
	local var5 = useTokens()
	local color3 = var5.Color.Content.Emphasis.Color3
	local transparency = var5.Color.Content.Emphasis.Transparency
	
	return react.createElement(foundation.View, if fFlagSquadVoiceMenuFoundationRefactorModule then {
		tag = "size-full-0 auto-y padding-x-large padding-y-xsmall row align-x-left align-y-center gap-large",
		LayoutOrder = p1.LayoutOrder,
		onActivated = p1.onActivated
	} else {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		padding = Vector2.new(var5.Padding.Large, var5.Padding.XSmall),
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var5.Gap.Large)
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
			fontStyle = var5.Typography.LabelMedium,
			textStyle = var5.Color.Content.Emphasis,
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

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), useLocalUserId (ref), useIsVoiceFocused (ref), useEnableAudioFocusToggle (ref), react (ref), squadExternalContractContext (ref), fFlagSquadsPresenceStoreMigration (ref), var1 (ref), useSelector (ref), var2 (ref), presenceType (ref), useCurrentSquadParentChannelId (ref), crossExperienceVoiceManager (ref), partyVoiceVolumeEngineFeature (ref), gameSettings (ref), useLocalization (ref), foundation (ref), fFlagSquadVoiceMenuFoundationRefactorModule (ref), var3 (ref), var4 (ref), images (ref), fFlagEnablePartyVoiceChangersInLua (ref)
	local var5 = cryoModule.Dictionary.join(t, p1)
	local var6 = useTokens()
	local var7 = useLocalUserId()
	local var8 = useIsVoiceFocused()
	local var9 = useEnableAudioFocusToggle()
	local var10 = react.useContext(squadExternalContractContext)
	local var11 = if fFlagSquadsPresenceStoreMigration then var1(tostring(var7)) else useSelector(react.useCallback(function(p2)
		-- upvalues: var7 (ref)
		return p2.Squad.Presence.byUserId[tostring(var7)]
	end, { var7 }))
	local var12 = react.useMemo(function()
		-- upvalues: var11 (ref), fFlagSquadsPresenceStoreMigration (copy), var2 (copy), presenceType (copy)
		return var11 and var11.userPresenceType == (if fFlagSquadsPresenceStoreMigration then var2.InGame else presenceType.InGame)
	end, { var11 })
	local var13 = react.useMemo(function()
		-- upvalues: var11 (ref), var12 (ref)
		return if var11 and var12 then var11.lastLocation else nil
	end, { var11, var12 })
	local var14 = var10.useParentChannelTitleSelector(useCurrentSquadParentChannelId() or "")
	local var15 = react.useCallback(function()
		-- upvalues: crossExperienceVoiceManager (copy)
		crossExperienceVoiceManager.default:toggleAudioFocus()
	end, {})
	local var16 = var12 or not partyVoiceVolumeEngineFeature
	local var22_1_1 = partyVoiceVolumeEngineFeature and var16
	local var17 = var12 and (var9 or var5.forceEnableAudioFocusToggle)
	local var18, var19 = react.useState(if partyVoiceVolumeEngineFeature then gameSettings.PartyVoiceVolume else 0)
	local var20, var21 = react.useState(gameSettings.MasterVolume)
	local var22 = useLocalization({
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
		padding = Vector2.new(0, var6.Padding.Small),
		cornerRadius = UDim.new(0, var6.Radius.Medium),
		backgroundStyle = var6.Color.Surface.Surface_300,
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
			padding = Vector2.new(var6.Padding.Large, 0),
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}
		}, {
			VolumeLabel = var22_1_1 and react.createElement(foundation.Text, if fFlagSquadVoiceMenuFoundationRefactorModule then {
				tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left padding-y-xsmall text-title-small content-muted",
				LayoutOrder = 1,
				Text = var22.volumeLabelText
			} else {
				TextWrapped = false,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				fontStyle = var6.Typography.TitleSmall,
				textStyle = var6.Color.Content.Muted,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				padding = Vector2.new(0, var6.Padding.XSmall),
				Text = var22.volumeLabelText
			}),
			PartySliderGroup = partyVoiceVolumeEngineFeature and react.createElement(var3, {
				LayoutOrder = 2,
				labelText = if var22_1_1 then var22.partyLabelText else var22.partyVolumeLabelText,
				sliderValue = var18,
				onValueChanged = function(p2)
					-- upvalues: gameSettings (copy), var19 (ref)
					gameSettings.PartyVoiceVolume = p2
					var19(p2)
				end
			}),
			ExperienceSliderGroup = var16 and react.createElement(var3, {
				LayoutOrder = 3,
				labelText = if partyVoiceVolumeEngineFeature then var22.experienceLabelText else var22.volumeLabelText,
				sliderValue = var20,
				onValueChanged = function(p2)
					-- upvalues: gameSettings (copy), var21 (ref)
					gameSettings.MasterVolume = p2
					var21(p2)
				end
			})
		}),
		Divider = var17 and react.createElement(foundation.View, if fFlagSquadVoiceMenuFoundationRefactorModule then {
			tag = "size-full-0 auto-y padding-y-small",
			LayoutOrder = 2
		} else {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			padding = Vector2.new(0, var6.Padding.Small)
		}, {
			Divider = react.createElement(foundation.View, {
				Size = UDim2.new(1, 0, 0, 1),
				backgroundStyle = var6.Color.Stroke.Default
			})
		}),
		VoiceChatSection = var17 and react.createElement(foundation.View, if fFlagSquadVoiceMenuFoundationRefactorModule then { tag = "size-full-0 auto-y col", LayoutOrder = 3 } else {
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
				Text = var22.voiceChatsLabelText
			} else {
				TextWrapped = false,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				fontStyle = var6.Typography.TitleSmall,
				textStyle = var6.Color.Content.Muted,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				padding = Vector2.new(var6.Padding.Large, var6.Padding.XSmall),
				Text = var22.voiceChatsLabelText
			}),
			PartySelector = react.createElement(var4, {
				LayoutOrder = 2,
				icon = images["icons/menu/platformChatOff"],
				labelText = var14 or "",
				isSelected = var8,
				onActivated = react.useCallback(function()
					-- upvalues: var8 (ref), var15 (ref)
					if not var8 then
						var15()
					end
				end, { var8, var15 })
			}),
			ExperienceSelector = react.createElement(var4, {
				LayoutOrder = 3,
				icon = images["icons/menu/publicChatOff"],
				labelText = var13 or "",
				isSelected = not var8,
				onActivated = react.useCallback(function()
					-- upvalues: var8 (ref), var15 (ref)
					if var8 then
						var15()
					end
				end, { var8, var15 })
			})
		}),
		VoiceChangerSection = if fFlagEnablePartyVoiceChangersInLua or var5.forceShowVoiceChangerSection then react.createElement(foundation.View, { tag = "size-full-0 auto-y col", LayoutOrder = 4 }, {
			VoiceChangerSectionLabel = react.createElement(foundation.Text, {
				tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left padding-x-large padding-y-xsmall text-title-small content-muted",
				LayoutOrder = 1,
				Text = "Voice changers"
			}),
			OpenVoiceChangerModal = react.createElement(foundation.View, {
				tag = "size-full-0 auto-y row align-x-left align-y-center gap-large padding-x-large padding-y-xsmall",
				LayoutOrder = 2,
				onActivated = react.useCallback(function()
					-- upvalues: var5 (ref)
					if var5.openSquadVoiceChangers then
						var5.openSquadVoiceChangers()
					end
				end, { var5.openSquadVoiceChangers })
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