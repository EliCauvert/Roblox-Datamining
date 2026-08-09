local squads = script:FindFirstAncestor("Squads")
local dependenciesModule = require(squads.dependencies)
local parent = squads.Parent
local crossExperienceVoiceModule = require(parent.CrossExperienceVoice)
local UIBloxModule = require(parent.UIBlox)
local userProfilesModule = require(parent.UserProfiles)
local getStandardSizeAvatarHeadShotRbxthumb = require(parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local builderIconsModule = require(parent.BuilderIcons)
local hooksModule = require(parent.SquadsCore.Hooks)
local presenceType = dependenciesModule.RoduxPresence.Enums.PresenceType
local foundation = dependenciesModule.Foundation
local react = dependenciesModule.React
local sharedFlags = dependenciesModule.SharedFlags
local useLocalization = dependenciesModule.Hooks.useLocalization
local useSelector = dependenciesModule.Hooks.useSelector
local useParticipant = crossExperienceVoiceModule.Hooks.useParticipant
local useIsVoiceConnected = crossExperienceVoiceModule.Hooks.useIsVoiceConnected
local useIsActiveParticipant = crossExperienceVoiceModule.Hooks.useIsActiveParticipant
local useAnimatedTransparency = crossExperienceVoiceModule.Hooks.useAnimatedTransparency
local useIsParticipantMuted = crossExperienceVoiceModule.Hooks.useIsParticipantMuted
local useIsVoiceConnecting = crossExperienceVoiceModule.Hooks.useIsVoiceConnecting
local useIsMicPermissionsError = crossExperienceVoiceModule.Hooks.useIsMicPermissionsError
local useIsParticipantInOtherAudioContext = crossExperienceVoiceModule.Hooks.useIsParticipantInOtherAudioContext
local useIsParticipantMutedLocally = crossExperienceVoiceModule.Hooks.useIsParticipantMutedLocally
local useTokens = foundation.Hooks.useTokens
local useSquadUserDropdownMenuButtonsModule = require(squads.Hooks.useSquadUserDropdownMenuButtons)
local useIsLocalPlayerPartyVoiceEligible = hooksModule.useIsLocalPlayerPartyVoiceEligible
local useIsUserPartyVoiceEligible = hooksModule.useIsUserPartyVoiceEligible
local useIsCurrentSquadPartyVoiceEligible = hooksModule.useIsCurrentSquadPartyVoiceEligible
local getFFlagEnableCrossExpVoice = sharedFlags.GetFFlagEnableCrossExpVoice
local fFlagEnableSquadUserCardHoverFix = sharedFlags.FFlagEnableSquadUserCardHoverFix
local iconSize = foundation.Enums.IconSize
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local _ = require(squads.Common.ModelTypes)
local squadUserPartyStatusModule = require(squads.Enums.SquadUserPartyStatus)
local partyVoiceActivityIndicatorDebounceMs = game:DefineFastInt("PartyVoiceActivityIndicatorDebounceMs", 100)
local partyVoiceActivityIndicatorAnimationMs = game:DefineFastInt("PartyVoiceActivityIndicatorAnimationMs", 100)
local fFlagEnablePartyVoiceChangersInLua = sharedFlags.FFlagEnablePartyVoiceChangersInLua
local fFlagEnableBlackbirdCheck = sharedFlags.FFlagEnableBlackbirdCheck
local useIsRobloxSubscriber = userProfilesModule.Hooks.useIsRobloxSubscriber

return function(p0) --[[ line: 76 ]]
	-- upvalues: useLocalization (ref), useTokens (ref), useAnimatedTransparency (ref), partyVoiceActivityIndicatorAnimationMs (ref), useIsRobloxSubscriber (ref), fFlagEnableBlackbirdCheck (ref), userProfilesModule (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), react (ref), useSelector (ref), presenceType (ref), useLocalUserId (ref), getFFlagEnableCrossExpVoice (ref), useIsVoiceConnected (ref), useIsMicPermissionsError (ref), useParticipant (ref), useIsVoiceConnecting (ref), useIsActiveParticipant (ref), useIsLocalPlayerPartyVoiceEligible (ref), useIsUserPartyVoiceEligible (ref), useIsCurrentSquadPartyVoiceEligible (ref), useIsParticipantMutedLocally (ref), useIsParticipantMuted (ref), useIsParticipantInOtherAudioContext (ref), fFlagEnablePartyVoiceChangersInLua (ref), crossExperienceVoiceModule (ref), partyVoiceActivityIndicatorDebounceMs (ref), squadUserPartyStatusModule (ref), foundation (ref), iconSize (ref), builderIconsModule (ref), fFlagEnableSquadUserCardHoverFix (ref), useSquadUserDropdownMenuButtonsModule (ref), imageSetLabel (ref)
	local var11 = useLocalization({
		connectingText = "Feature.Squads.Label.Connecting",
		inExperiencePresenceText = "Common.Presence.Label.InExperience",
		invitedText = "Feature.Squads.Description.Invited",
		noResponseText = "Feature.Squads.Description.NoResponse",
		onlinePresenceText = "Common.Presence.Label.Online"
	})
	local var12 = useTokens()
	local var13, var14 = useAnimatedTransparency(1, partyVoiceActivityIndicatorAnimationMs, Enum.EasingStyle.Cubic)
	local var15 = useIsRobloxSubscriber(if fFlagEnableBlackbirdCheck then tostring(p0.user.userId) else nil)
	local var16 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { tostring(p0.user.userId) },
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local var17 = if var16.data then userProfilesModule.Selectors.getCombinedNameFromId(var16.data, p0.user.userId) else ""
	local var18 = getStandardSizeAvatarHeadShotRbxthumb(tostring(p0.user.userId))
	local var19 = useSelector(react.useCallback(function(p1) --[[ line: 103 ]]
		-- upvalues: p0 (ref)
		return p1.Squad.Presence.byUserId[tostring(p0.user.userId)]
	end, { p0.user.userId }))
	local var20 = var19 and var19.userPresenceType == presenceType.InGame
	local _ = nil
	local var21 = if not var20 then if var19.lastLocation and var19.lastLocation ~= "" then var19.lastLocation else var11.inExperiencePresenceText else var11.onlinePresenceText
	local isConnecting = p0.isConnecting
	local var22 = tonumber(useLocalUserId()) or 0
	local var23 = var22 == p0.user.userId
	local _ = nil
	local var24 = false
	local _ = false
	local _ = false
	local _ = false
	local _ = false
	local var25 = false
	local var26 = false
	local _ = false
	local var27 = false
	local var23_1 = false
	local var29 = false
	local _ = false
	local var30 = false
	
	if getFFlagEnableCrossExpVoice() then
		local var31 = useIsVoiceConnected()
		local var32 = useIsMicPermissionsError()
		local var33 = useParticipant(p0.user.userId)
		var23_1 = useIsVoiceConnecting() and var23
		var24 = useIsActiveParticipant(p0.user.userId)
		local var34 = useIsLocalPlayerPartyVoiceEligible()
		local var35 = useIsUserPartyVoiceEligible(p0.user.userId)
		local var36 = useIsCurrentSquadPartyVoiceEligible() == true
		var29 = var35 and (var36 and (not var23 and useIsParticipantMutedLocally(p0.user.userId) == true))
		var27 = useIsParticipantMuted(p0.user.userId) and not var29
		var25 = var36 and (var34 and (var35 and (not var31 or (not var33 or (useIsParticipantInOtherAudioContext(var22, p0.user.userId) == true or var32)))))
		var26 = var36 and (var34 and not var35)
		var30 = if fFlagEnablePartyVoiceChangersInLua and var33 then var33.isVoiceChangerActive else false
	end
	local var37 = react.useMemo(function() --[[ line: 170 ]]
		-- upvalues: crossExperienceVoiceModule (copy), var14 (ref), partyVoiceActivityIndicatorDebounceMs (copy)
		return crossExperienceVoiceModule.Utils.debounce(function(p2) --[[ line: 171 ]]
			-- upvalues: var14 (copy)
			var14(p2)
		end, partyVoiceActivityIndicatorDebounceMs)
	end, {})
	react.useEffect(function() --[[ line: 176 ]]
		-- upvalues: getFFlagEnableCrossExpVoice (copy), var24 (write), var37 (ref), var14 (ref)
		if getFFlagEnableCrossExpVoice() then
			if var24 then
				var37.cancel()
				var14(0)
				
				return
			end
			var37.call(1)
		end
	end, { var24 })
	local var38 = react.useMemo(function() --[[ line: 188 ]]
		-- upvalues: p0 (ref), squadUserPartyStatusModule (copy), var11 (ref), isConnecting (ref), var23_1 (write), var21 (write)
		return if p0.user.partyStatus == squadUserPartyStatusModule.NoResponse then var11.noResponseText elseif p0.user.partyStatus == squadUserPartyStatusModule.Invited then var11.invitedText elseif isConnecting or var23_1 then var11.connectingText else var21
	end, {
		p0.user and p0.user.partyStatus, var21, isConnecting, var23_1,
		var11.noResponse, var11.invitedText, var11.connectingText
	})
	local var39 = react.useMemo(function() --[[ line: 210 ]]
		-- upvalues: p0 (ref), squadUserPartyStatusModule (copy), react (copy), foundation (copy), iconSize (copy), var12 (ref), isConnecting (ref), var23_1 (write), var20 (ref)
		return if p0.user.partyStatus == squadUserPartyStatusModule.Invited then react.createElement(foundation.View, { tag = "auto-xy" }, {
			LoadingIcon = react.createElement(foundation.Loading, {
				LayoutOrder = 1,
				size = iconSize.Small,
				Padding = var12.Padding.XSmall
			})
		}) elseif p0.user.partyStatus == squadUserPartyStatusModule.NoResponse then nil elseif isConnecting or var23_1 then react.createElement(foundation.View, { tag = "auto-xy" }, {
			LoadingIcon = react.createElement(foundation.Loading, {
				LayoutOrder = 1,
				size = iconSize.Small,
				Padding = var12.Padding.XSmall
			})
		}) elseif var20 then react.createElement(foundation.Icon, {
			LayoutOrder = 1,
			name = "icons/common/play",
			size = iconSize.Small,
			style = var12.Color.Content.Emphasis
		}) else nil
	end, {
		p0.user and p0.user.partyStatus,
		isConnecting,
		var23_1,
		var20
	})
	local _ = nil
	
	return react.createElement(foundation.View, {
		LayoutOrder = p0.layoutOrder,
		Size = p0.size,
		backgroundStyle = var12.Color.Surface.Surface_200,
		cornerRadius = UDim.new(0, var12.Radius.Medium),
		isDisabled = isConnecting or (var23_1 or (if p0.user.partyStatus ~= squadUserPartyStatusModule.Invited then p0.user.partyStatus == squadUserPartyStatusModule.NoResponse else true)),
		onActivated = if p0.onActivated and (if fFlagEnableSquadUserCardHoverFix then not var23 and not (#useSquadUserDropdownMenuButtonsModule(p0.user.userId, p0.isInExperience) < 1) else not var23) then react.useCallback(function() --[[ line: 431 ]]
			-- upvalues: p0 (ref)
			if p0.onActivated then
				p0.onActivated(tostring(p0.user.userId))
			end
		end, { p0.onActivated, p0.user.userId }) else nil
	}, {
		AvatarImage = react.createElement(imageSetLabel, {
			ZIndex = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(96, 96),
			BackgroundColor3 = var12.Color.Shift.Shift_300.Color3,
			BackgroundTransparency = var12.Color.Shift.Shift_300.Transparency,
			Image = var18
		}, {
			UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}),
		GradientFrame = react.createElement("Frame", {
			ZIndex = 1,
			Size = UDim2.fromScale(1, 0.5),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = var12.Color.Surface.Surface_100.Color3,
			BackgroundTransparency = var12.Color.Surface.Surface_100.Transparency
		}, {
			UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(0, var12.Radius.Medium) }),
			UIGradient = react.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			}, {})
		}),
		InactiveOverlay = if isConnecting or var25 or (var23_1 or p0.user.partyStatus == squadUserPartyStatusModule.Invited) or p0.user.partyStatus == squadUserPartyStatusModule.NoResponse then react.createElement(foundation.View, {
			tag = "size-full radius-medium",
			backgroundStyle = {
				Transparency = 0.25,
				Color3 = var12.Color.Surface.Surface_100.Color3
			}
		}, {}) else nil,
		TextContainer = react.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1),
			Size = UDim2.fromScale(1, 0)
		}, {
			UIListLayout = react.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Bottom
			}),
			UIPadding = react.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, var12.Padding.Medium),
				PaddingLeft = UDim.new(0, var12.Padding.Medium),
				PaddingRight = UDim.new(0, var12.Padding.Medium),
				PaddingTop = UDim.new(0, var12.Padding.Medium)
			}),
			Name = react.useMemo(function() --[[ line: 242 ]]
				-- upvalues: var17 (write), react (copy), var12 (ref), p0 (ref), foundation (copy), iconSize (copy), var29 (write), var27 (write), var25 (write), var26 (write), fFlagEnablePartyVoiceChangersInLua (copy), var30 (write), builderIconsModule (copy), fFlagEnableBlackbirdCheck (copy), var15 (ref)
				return if var17 == "" then nil else react.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.fromScale(1, 0)
				}, {
					UIListLayout = react.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = UDim.new(0, var12.Gap.XSmall + 2),
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					BlockedIcon = if p0.isBlocked then react.createElement(foundation.Icon, {
						LayoutOrder = 1,
						name = "icons/status/unavailable_small",
						size = iconSize.Small,
						style = var12.Color.Extended.Red.Red_800
					}) else nil,
					MutedLocallyIcon = if var29 then react.createElement(foundation.Icon, {
						LayoutOrder = 2,
						name = "icons/controls/voice/microphone_off_small_dark",
						size = iconSize.Small,
						style = var12.Color.Extended.Red.Red_800
					}) else nil,
					MutedIcon = if var27 then react.createElement(foundation.Icon, {
						LayoutOrder = 3,
						name = "icons/controls/microphoneMute_small",
						size = iconSize.Small,
						style = var12.Color.Content.Emphasis
					}) else nil,
					NotVoiceParticipantIcon = if var25 then react.createElement(foundation.Icon, {
						LayoutOrder = 4,
						name = "icons/controls/headphoneDeafen_small",
						size = iconSize.Small,
						style = var12.Color.Content.Emphasis
					}) else nil,
					NotEligibleVoiceParticipant = if var26 then react.createElement(foundation.Icon, {
						LayoutOrder = 5,
						name = "icons/controls/headphoneDeafen_small",
						size = iconSize.Small,
						style = var12.Color.System.Warning
					}) else nil,
					VoiceChangerActiveIcon = if fFlagEnablePartyVoiceChangersInLua and var30 then react.createElement(foundation.Icon, {
						LayoutOrder = 6,
						size = iconSize.Small,
						name = builderIconsModule.Icon.DiamondSimplified,
						style = var12.Color.Content.Emphasis
					}) else nil,
					NameTextLabel = if not fFlagEnableBlackbirdCheck then react.createElement(foundation.Text, {
						TextWrapped = false,
						AutomaticSize = Enum.AutomaticSize.Y,
						backgroundStyle = var12.Color.None,
						colorstyle = var12.Color.Content.Emphasis,
						fontStyle = var12.Typography.TitleMedium,
						LayoutOrder = if fFlagEnablePartyVoiceChangersInLua then 7 else 6,
						Text = var17,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						TextTruncate = Enum.TextTruncate.AtEnd
					}, {
						UIFlexItem = react.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
					}) else nil,
					NameAndBadge = if fFlagEnableBlackbirdCheck then react.createElement("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.fromScale(0, 0),
						LayoutOrder = if fFlagEnablePartyVoiceChangersInLua then 7 else 6
					}, {
						Layout = react.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							Padding = UDim.new(0, var12.Gap.XSmall),
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center
						}),
						FlexFill = react.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
						NameText = react.createElement(foundation.Text, {
							LayoutOrder = 1,
							TextWrapped = false,
							AutomaticSize = Enum.AutomaticSize.XY,
							backgroundStyle = var12.Color.None,
							colorstyle = var12.Color.Content.Emphasis,
							fontStyle = var12.Typography.TitleMedium,
							Text = var17,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Center,
							TextTruncate = Enum.TextTruncate.AtEnd
						}, {
							UIFlexItem = react.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink })
						}),
						SubscriptionBadge = if var15 then react.createElement(foundation.Icon, {
							LayoutOrder = 2,
							size = iconSize.Small,
							name = foundation.Enums.IconName.RobloxPlus,
							style = var12.Color.Content.Emphasis
						}) else nil
					}) else nil
				})
			end, {
				var17, var27, var29, p0.isBlocked, var12, var25, var26,
				if fFlagEnablePartyVoiceChangersInLua then var30 else nil,
				if fFlagEnableBlackbirdCheck then var15 else nil
			}),
			Presence = if not p0.isBlocked then react.useMemo(function() --[[ line: 378 ]]
				-- upvalues: react (copy), var12 (ref), var39 (ref), foundation (copy), var38 (ref)
				return react.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.fromScale(1, 0)
				}, {
					UIListLayout = react.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = UDim.new(0, var12.Gap.XSmall),
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					PresenceIcon = var39,
					PresenceTextLabel = react.createElement(foundation.Text, {
						LayoutOrder = 2,
						TextWrapped = false,
						AutomaticSize = Enum.AutomaticSize.Y,
						backgroundStyle = var12.Color.None,
						colorstyle = var12.Color.Content.Default,
						fontStyle = var12.Typography.BodyMedium,
						Text = var38,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						TextTruncate = Enum.TextTruncate.AtEnd
					}, {
						UIFlexItem = react.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
					})
				})
			end, {
				isConnecting, var23_1, var20, var11.connectingText, var21, var12, var39, var38
			}) else nil
		}),
		ActiveBorder = react.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 4,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, -8, 1, -8)
		}, {
			UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(0, var12.Radius.Medium - 4) }),
			UIStroke = react.createElement("UIStroke", {
				Thickness = 4,
				Color = var12.Color.Extended.Green.Green_800.Color3,
				Transparency = var13
			})
		}),
		DefaultBorder = react.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, -2, 1, -2)
		}, {
			UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(0, var12.Radius.Medium - 1) }),
			UIStroke = react.createElement("UIStroke", {
				Thickness = 1,
				Color = var12.Color.Stroke.Default.Color3,
				Transparency = var13:map(function(p3) --[[ line: 555 ]]
					-- upvalues: var12 (ref)
					return if p3 < 0.9 then 1 else var12.Color.Stroke.Default.Transparency
				end)
			})
		})
	})
end