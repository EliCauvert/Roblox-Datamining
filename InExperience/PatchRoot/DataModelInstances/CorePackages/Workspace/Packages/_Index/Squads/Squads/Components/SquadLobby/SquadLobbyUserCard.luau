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
local fFlagSquadsPresenceStoreMigration = require(parent.SquadsCore.Flags).FFlagSquadsPresenceStoreMigration
local var7 = if fFlagSquadsPresenceStoreMigration then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local var8 = if fFlagSquadsPresenceStoreMigration then require(parent.DataHydration).Presence.PresenceEnums.PresenceType else nil
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

return function(p0) --[[ line: 84 ]]
	-- upvalues: useLocalization (ref), useTokens (ref), useAnimatedTransparency (ref), partyVoiceActivityIndicatorAnimationMs (ref), useIsRobloxSubscriber (ref), fFlagEnableBlackbirdCheck (ref), userProfilesModule (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), react (ref), fFlagSquadsPresenceStoreMigration (ref), var7 (ref), useSelector (ref), var8 (ref), presenceType (ref), useLocalUserId (ref), getFFlagEnableCrossExpVoice (ref), useIsVoiceConnected (ref), useIsMicPermissionsError (ref), useParticipant (ref), useIsVoiceConnecting (ref), useIsActiveParticipant (ref), useIsLocalPlayerPartyVoiceEligible (ref), useIsUserPartyVoiceEligible (ref), useIsCurrentSquadPartyVoiceEligible (ref), useIsParticipantMutedLocally (ref), useIsParticipantMuted (ref), useIsParticipantInOtherAudioContext (ref), fFlagEnablePartyVoiceChangersInLua (ref), crossExperienceVoiceModule (ref), partyVoiceActivityIndicatorDebounceMs (ref), squadUserPartyStatusModule (ref), foundation (ref), iconSize (ref), builderIconsModule (ref), fFlagEnableSquadUserCardHoverFix (ref), useSquadUserDropdownMenuButtonsModule (ref), imageSetLabel (ref)
	local var23, onlinePresenceText
	local var13 = useLocalization({
		connectingText = "Feature.Squads.Label.Connecting",
		inExperiencePresenceText = "Common.Presence.Label.InExperience",
		invitedText = "Feature.Squads.Description.Invited",
		noResponseText = "Feature.Squads.Description.NoResponse",
		onlinePresenceText = "Common.Presence.Label.Online"
	})
	local var14 = useTokens()
	local var15, var16 = useAnimatedTransparency(1, partyVoiceActivityIndicatorAnimationMs, Enum.EasingStyle.Cubic)
	local var17 = useIsRobloxSubscriber(if fFlagEnableBlackbirdCheck then tostring(p0.user.userId) else nil)
	local var18 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { tostring(p0.user.userId) },
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local var19 = if var18.data then userProfilesModule.Selectors.getCombinedNameFromId(var18.data, p0.user.userId) else ""
	local var20 = getStandardSizeAvatarHeadShotRbxthumb(tostring(p0.user.userId))
	local var21 = if fFlagSquadsPresenceStoreMigration then var7(tostring(p0.user.userId)) else useSelector(react.useCallback(function(p1) --[[ line: 111 ]]
		-- upvalues: p0 (ref)
		return p1.Squad.Presence.byUserId[tostring(p0.user.userId)]
	end, { p0.user.userId }))
	local var22 = var21 and var21.userPresenceType == (if fFlagSquadsPresenceStoreMigration then var8.InGame else presenceType.InGame)
	local _ = nil
	
	if var22 then
		var23 = if fFlagSquadsPresenceStoreMigration then var21 and var21.lastLocation else var21.lastLocation
		onlinePresenceText = if var23 and var23 ~= "" then var23 else var13.inExperiencePresenceText
	else
		onlinePresenceText = var13.onlinePresenceText
	end
	var23 = p0.isConnecting
	local var24 = tonumber(useLocalUserId()) or 0
	local var25 = var24 == p0.user.userId
	local _ = nil
	local var26 = false
	local _ = false
	local _ = false
	local _ = false
	local _ = false
	local var27 = false
	local var28 = false
	local _ = false
	local var29 = false
	local var25_1 = false
	local var31 = false
	local _ = false
	local var32 = false
	
	if getFFlagEnableCrossExpVoice() then
		local var33 = useIsVoiceConnected()
		local var34 = useIsMicPermissionsError()
		local var35 = useParticipant(p0.user.userId)
		var25_1 = useIsVoiceConnecting() and var25
		var26 = useIsActiveParticipant(p0.user.userId)
		local var36 = useIsLocalPlayerPartyVoiceEligible()
		local var37 = useIsUserPartyVoiceEligible(p0.user.userId)
		local var38 = useIsCurrentSquadPartyVoiceEligible() == true
		var31 = var37 and (var38 and (not var25 and useIsParticipantMutedLocally(p0.user.userId) == true))
		var29 = useIsParticipantMuted(p0.user.userId) and not var31
		var27 = var38 and (var36 and (var37 and (not var33 or (not var35 or (useIsParticipantInOtherAudioContext(var24, p0.user.userId) == true or var34)))))
		var28 = var38 and (var36 and not var37)
		var32 = if fFlagEnablePartyVoiceChangersInLua and var35 then var35.isVoiceChangerActive else false
	end
	local var39 = react.useMemo(function() --[[ line: 186 ]]
		-- upvalues: crossExperienceVoiceModule (copy), var16 (ref), partyVoiceActivityIndicatorDebounceMs (copy)
		return crossExperienceVoiceModule.Utils.debounce(function(p2) --[[ line: 187 ]]
			-- upvalues: var16 (copy)
			var16(p2)
		end, partyVoiceActivityIndicatorDebounceMs)
	end, {})
	react.useEffect(function() --[[ line: 192 ]]
		-- upvalues: getFFlagEnableCrossExpVoice (copy), var26 (write), var39 (ref), var16 (ref)
		if getFFlagEnableCrossExpVoice() then
			if var26 then
				var39.cancel()
				var16(0)
				
				return
			end
			var39.call(1)
		end
	end, { var26 })
	local var40 = react.useMemo(function() --[[ line: 204 ]]
		-- upvalues: p0 (ref), squadUserPartyStatusModule (copy), var13 (ref), var23 (ref), var25_1 (write), onlinePresenceText (write)
		return if p0.user.partyStatus == squadUserPartyStatusModule.NoResponse then var13.noResponseText elseif p0.user.partyStatus == squadUserPartyStatusModule.Invited then var13.invitedText elseif var23 or var25_1 then var13.connectingText else onlinePresenceText
	end, {
		p0.user and p0.user.partyStatus, onlinePresenceText, var23, var25_1,
		var13.noResponse, var13.invitedText, var13.connectingText
	})
	local var41 = react.useMemo(function() --[[ line: 226 ]]
		-- upvalues: p0 (ref), squadUserPartyStatusModule (copy), react (copy), foundation (copy), iconSize (copy), var14 (ref), var23 (ref), var25_1 (write), var22 (ref)
		return if p0.user.partyStatus == squadUserPartyStatusModule.Invited then react.createElement(foundation.View, { tag = "auto-xy" }, {
			LoadingIcon = react.createElement(foundation.Loading, {
				LayoutOrder = 1,
				size = iconSize.Small,
				Padding = var14.Padding.XSmall
			})
		}) elseif p0.user.partyStatus == squadUserPartyStatusModule.NoResponse then nil elseif var23 or var25_1 then react.createElement(foundation.View, { tag = "auto-xy" }, {
			LoadingIcon = react.createElement(foundation.Loading, {
				LayoutOrder = 1,
				size = iconSize.Small,
				Padding = var14.Padding.XSmall
			})
		}) elseif var22 then react.createElement(foundation.Icon, {
			LayoutOrder = 1,
			name = "icons/common/play",
			size = iconSize.Small,
			style = var14.Color.Content.Emphasis
		}) else nil
	end, { p0.user and p0.user.partyStatus, var23, var25_1, var22 })
	local _ = nil
	
	return react.createElement(foundation.View, {
		LayoutOrder = p0.layoutOrder,
		Size = p0.size,
		backgroundStyle = var14.Color.Surface.Surface_200,
		cornerRadius = UDim.new(0, var14.Radius.Medium),
		isDisabled = var23 or (var25_1 or (if p0.user.partyStatus ~= squadUserPartyStatusModule.Invited then p0.user.partyStatus == squadUserPartyStatusModule.NoResponse else true)),
		onActivated = if p0.onActivated and (if fFlagEnableSquadUserCardHoverFix then not var25 and not (#useSquadUserDropdownMenuButtonsModule(p0.user.userId, p0.isInExperience) < 1) else not var25) then react.useCallback(function() --[[ line: 447 ]]
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
			BackgroundColor3 = var14.Color.Shift.Shift_300.Color3,
			BackgroundTransparency = var14.Color.Shift.Shift_300.Transparency,
			Image = var20
		}, {
			UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}),
		GradientFrame = react.createElement("Frame", {
			ZIndex = 1,
			Size = UDim2.fromScale(1, 0.5),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = var14.Color.Surface.Surface_100.Color3,
			BackgroundTransparency = var14.Color.Surface.Surface_100.Transparency
		}, {
			UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(0, var14.Radius.Medium) }),
			UIGradient = react.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			}, {})
		}),
		InactiveOverlay = if var23 or var27 or (var25_1 or p0.user.partyStatus == squadUserPartyStatusModule.Invited) or p0.user.partyStatus == squadUserPartyStatusModule.NoResponse then react.createElement(foundation.View, {
			tag = "size-full radius-medium",
			backgroundStyle = {
				Transparency = 0.25,
				Color3 = var14.Color.Surface.Surface_100.Color3
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
				PaddingBottom = UDim.new(0, var14.Padding.Medium),
				PaddingLeft = UDim.new(0, var14.Padding.Medium),
				PaddingRight = UDim.new(0, var14.Padding.Medium),
				PaddingTop = UDim.new(0, var14.Padding.Medium)
			}),
			Name = react.useMemo(function() --[[ line: 258 ]]
				-- upvalues: var19 (write), react (copy), var14 (ref), p0 (ref), foundation (copy), iconSize (copy), var31 (write), var29 (write), var27 (write), var28 (write), fFlagEnablePartyVoiceChangersInLua (copy), var32 (write), builderIconsModule (copy), fFlagEnableBlackbirdCheck (copy), var17 (ref)
				return if var19 == "" then nil else react.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.fromScale(1, 0)
				}, {
					UIListLayout = react.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = UDim.new(0, var14.Gap.XSmall + 2),
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					BlockedIcon = if p0.isBlocked then react.createElement(foundation.Icon, {
						LayoutOrder = 1,
						name = "icons/status/unavailable_small",
						size = iconSize.Small,
						style = var14.Color.Extended.Red.Red_800
					}) else nil,
					MutedLocallyIcon = if var31 then react.createElement(foundation.Icon, {
						LayoutOrder = 2,
						name = "icons/controls/voice/microphone_off_small_dark",
						size = iconSize.Small,
						style = var14.Color.Extended.Red.Red_800
					}) else nil,
					MutedIcon = if var29 then react.createElement(foundation.Icon, {
						LayoutOrder = 3,
						name = "icons/controls/microphoneMute_small",
						size = iconSize.Small,
						style = var14.Color.Content.Emphasis
					}) else nil,
					NotVoiceParticipantIcon = if var27 then react.createElement(foundation.Icon, {
						LayoutOrder = 4,
						name = "icons/controls/headphoneDeafen_small",
						size = iconSize.Small,
						style = var14.Color.Content.Emphasis
					}) else nil,
					NotEligibleVoiceParticipant = if var28 then react.createElement(foundation.Icon, {
						LayoutOrder = 5,
						name = "icons/controls/headphoneDeafen_small",
						size = iconSize.Small,
						style = var14.Color.System.Warning
					}) else nil,
					VoiceChangerActiveIcon = if fFlagEnablePartyVoiceChangersInLua and var32 then react.createElement(foundation.Icon, {
						LayoutOrder = 6,
						size = iconSize.Small,
						name = builderIconsModule.Icon.DiamondSimplified,
						style = var14.Color.Content.Emphasis
					}) else nil,
					NameTextLabel = if not fFlagEnableBlackbirdCheck then react.createElement(foundation.Text, {
						TextWrapped = false,
						AutomaticSize = Enum.AutomaticSize.Y,
						backgroundStyle = var14.Color.None,
						colorstyle = var14.Color.Content.Emphasis,
						fontStyle = var14.Typography.TitleMedium,
						LayoutOrder = if fFlagEnablePartyVoiceChangersInLua then 7 else 6,
						Text = var19,
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
							Padding = UDim.new(0, var14.Gap.XSmall),
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center
						}),
						FlexFill = react.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
						NameText = react.createElement(foundation.Text, {
							LayoutOrder = 1,
							TextWrapped = false,
							AutomaticSize = Enum.AutomaticSize.XY,
							backgroundStyle = var14.Color.None,
							colorstyle = var14.Color.Content.Emphasis,
							fontStyle = var14.Typography.TitleMedium,
							Text = var19,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Center,
							TextTruncate = Enum.TextTruncate.AtEnd
						}, {
							UIFlexItem = react.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink })
						}),
						SubscriptionBadge = if var17 then react.createElement(foundation.Icon, {
							LayoutOrder = 2,
							size = iconSize.Small,
							name = foundation.Enums.IconName.RobloxPlus,
							style = var14.Color.Content.Emphasis
						}) else nil
					}) else nil
				})
			end, {
				var19, var29, var31, p0.isBlocked, var14, var27, var28,
				if fFlagEnablePartyVoiceChangersInLua then var32 else nil,
				if fFlagEnableBlackbirdCheck then var17 else nil
			}),
			Presence = if not p0.isBlocked then react.useMemo(function() --[[ line: 394 ]]
				-- upvalues: react (copy), var14 (ref), var41 (ref), foundation (copy), var40 (ref)
				return react.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.fromScale(1, 0)
				}, {
					UIListLayout = react.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = UDim.new(0, var14.Gap.XSmall),
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					PresenceIcon = var41,
					PresenceTextLabel = react.createElement(foundation.Text, {
						LayoutOrder = 2,
						TextWrapped = false,
						AutomaticSize = Enum.AutomaticSize.Y,
						backgroundStyle = var14.Color.None,
						colorstyle = var14.Color.Content.Default,
						fontStyle = var14.Typography.BodyMedium,
						Text = var40,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						TextTruncate = Enum.TextTruncate.AtEnd
					}, {
						UIFlexItem = react.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
					})
				})
			end, {
				var23, var25_1, var22, var13.connectingText, onlinePresenceText, var14, var41,
				var40
			}) else nil
		}),
		ActiveBorder = react.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 4,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, -8, 1, -8)
		}, {
			UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(0, var14.Radius.Medium - 4) }),
			UIStroke = react.createElement("UIStroke", {
				Thickness = 4,
				Color = var14.Color.Extended.Green.Green_800.Color3,
				Transparency = var15
			})
		}),
		DefaultBorder = react.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, -2, 1, -2)
		}, {
			UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(0, var14.Radius.Medium - 1) }),
			UIStroke = react.createElement("UIStroke", {
				Thickness = 1,
				Color = var14.Color.Stroke.Default.Color3,
				Transparency = var15:map(function(p3) --[[ line: 571 ]]
					-- upvalues: var14 (ref)
					return if p3 < 0.9 then 1 else var14.Color.Stroke.Default.Transparency
				end)
			})
		})
	})
end