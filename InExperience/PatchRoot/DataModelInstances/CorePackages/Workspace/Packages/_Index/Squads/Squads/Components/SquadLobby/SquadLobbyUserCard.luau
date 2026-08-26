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
local var1 = if fFlagSquadsPresenceStoreMigration then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local var2 = if fFlagSquadsPresenceStoreMigration then require(parent.DataHydration).Presence.PresenceEnums.PresenceType else nil
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

return function(p1)
	-- upvalues: useLocalization (ref), useTokens (ref), useAnimatedTransparency (ref), partyVoiceActivityIndicatorAnimationMs (ref), useIsRobloxSubscriber (ref), fFlagEnableBlackbirdCheck (ref), userProfilesModule (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), react (ref), fFlagSquadsPresenceStoreMigration (ref), var1 (ref), useSelector (ref), var2 (ref), presenceType (ref), useLocalUserId (ref), getFFlagEnableCrossExpVoice (ref), useIsVoiceConnected (ref), useIsMicPermissionsError (ref), useParticipant (ref), useIsVoiceConnecting (ref), useIsActiveParticipant (ref), useIsLocalPlayerPartyVoiceEligible (ref), useIsUserPartyVoiceEligible (ref), useIsCurrentSquadPartyVoiceEligible (ref), useIsParticipantMutedLocally (ref), useIsParticipantMuted (ref), useIsParticipantInOtherAudioContext (ref), fFlagEnablePartyVoiceChangersInLua (ref), crossExperienceVoiceModule (ref), partyVoiceActivityIndicatorDebounceMs (ref), squadUserPartyStatusModule (ref), foundation (ref), iconSize (ref), builderIconsModule (ref), fFlagEnableSquadUserCardHoverFix (ref), useSquadUserDropdownMenuButtonsModule (ref), imageSetLabel (ref)
	local var3, onlinePresenceText
	local var4 = useLocalization({
		connectingText = "Feature.Squads.Label.Connecting",
		inExperiencePresenceText = "Common.Presence.Label.InExperience",
		invitedText = "Feature.Squads.Description.Invited",
		noResponseText = "Feature.Squads.Description.NoResponse",
		onlinePresenceText = "Common.Presence.Label.Online"
	})
	local var5 = useTokens()
	local var6, var7 = useAnimatedTransparency(1, partyVoiceActivityIndicatorAnimationMs, Enum.EasingStyle.Cubic)
	local var8 = useIsRobloxSubscriber(if fFlagEnableBlackbirdCheck then tostring(p1.user.userId) else nil)
	local var9 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { tostring(p1.user.userId) },
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local var10 = if var9.data then userProfilesModule.Selectors.getCombinedNameFromId(var9.data, p1.user.userId) else ""
	local var11 = getStandardSizeAvatarHeadShotRbxthumb(tostring(p1.user.userId))
	local var12 = if fFlagSquadsPresenceStoreMigration then var1(tostring(p1.user.userId)) else useSelector(react.useCallback(function(p2)
		-- upvalues: p1 (ref)
		return p2.Squad.Presence.byUserId[tostring(p1.user.userId)]
	end, { p1.user.userId }))
	local var13 = var12 and var12.userPresenceType == (if fFlagSquadsPresenceStoreMigration then var2.InGame else presenceType.InGame)
	local _ = nil
	
	if var13 then
		var3 = if fFlagSquadsPresenceStoreMigration then var12 and var12.lastLocation else var12.lastLocation
		onlinePresenceText = if var3 and var3 ~= "" then var3 else var4.inExperiencePresenceText
	else
		onlinePresenceText = var4.onlinePresenceText
	end
	var3 = p1.isConnecting
	local var14 = tonumber(useLocalUserId()) or 0
	local var15 = var14 == p1.user.userId
	local _ = nil
	local var16 = false
	local _ = false
	local _ = false
	local _ = false
	local _ = false
	local var17 = false
	local var18 = false
	local _ = false
	local var19 = false
	local var20 = false
	local var21 = false
	local _ = false
	local var22 = false
	
	if getFFlagEnableCrossExpVoice() then
		local var23 = useIsVoiceConnected()
		local var24 = useIsMicPermissionsError()
		local var25 = useParticipant(p1.user.userId)
		var20 = useIsVoiceConnecting() and var15
		var16 = useIsActiveParticipant(p1.user.userId)
		local var26 = useIsLocalPlayerPartyVoiceEligible()
		local var27 = useIsUserPartyVoiceEligible(p1.user.userId)
		local var28 = useIsCurrentSquadPartyVoiceEligible() == true
		var21 = var27 and (var28 and (not var15 and useIsParticipantMutedLocally(p1.user.userId) == true))
		var19 = useIsParticipantMuted(p1.user.userId) and not var21
		var17 = var28 and (var26 and (var27 and (not var23 or (not var25 or (useIsParticipantInOtherAudioContext(var14, p1.user.userId) == true or var24)))))
		var18 = var28 and (var26 and not var27)
		var22 = if fFlagEnablePartyVoiceChangersInLua and var25 then var25.isVoiceChangerActive else false
	end
	local var29 = react.useMemo(function()
		-- upvalues: crossExperienceVoiceModule (copy), var7 (ref), partyVoiceActivityIndicatorDebounceMs (copy)
		return crossExperienceVoiceModule.Utils.debounce(function(p2)
			-- upvalues: var7 (copy)
			var7(p2)
		end, partyVoiceActivityIndicatorDebounceMs)
	end, {})
	react.useEffect(function()
		-- upvalues: getFFlagEnableCrossExpVoice (copy), var16 (write), var29 (ref), var7 (ref)
		if getFFlagEnableCrossExpVoice() then
			if var16 then
				var29.cancel()
				var7(0)
				
				return
			end
			var29.call(1)
		end
	end, { var16 })
	local var30 = react.useMemo(function()
		-- upvalues: p1 (ref), squadUserPartyStatusModule (copy), var4 (ref), var3 (ref), var20 (write), onlinePresenceText (write)
		return if p1.user.partyStatus == squadUserPartyStatusModule.NoResponse then var4.noResponseText elseif p1.user.partyStatus == squadUserPartyStatusModule.Invited then var4.invitedText elseif var3 or var20 then var4.connectingText else onlinePresenceText
	end, {
		p1.user and p1.user.partyStatus, onlinePresenceText, var3, var20,
		var4.noResponse, var4.invitedText, var4.connectingText
	})
	local var31 = react.useMemo(function()
		-- upvalues: p1 (ref), squadUserPartyStatusModule (copy), react (copy), foundation (copy), iconSize (copy), var5 (ref), var3 (ref), var20 (write), var13 (ref)
		return if p1.user.partyStatus == squadUserPartyStatusModule.Invited then react.createElement(foundation.View, { tag = "auto-xy" }, {
			LoadingIcon = react.createElement(foundation.Loading, {
				LayoutOrder = 1,
				size = iconSize.Small,
				Padding = var5.Padding.XSmall
			})
		}) elseif p1.user.partyStatus == squadUserPartyStatusModule.NoResponse then nil elseif var3 or var20 then react.createElement(foundation.View, { tag = "auto-xy" }, {
			LoadingIcon = react.createElement(foundation.Loading, {
				LayoutOrder = 1,
				size = iconSize.Small,
				Padding = var5.Padding.XSmall
			})
		}) elseif var13 then react.createElement(foundation.Icon, {
			LayoutOrder = 1,
			name = "icons/common/play",
			size = iconSize.Small,
			style = var5.Color.Content.Emphasis
		}) else nil
	end, { p1.user and p1.user.partyStatus, var3, var20, var13 })
	local _ = nil
	
	return react.createElement(foundation.View, {
		LayoutOrder = p1.layoutOrder,
		Size = p1.size,
		backgroundStyle = var5.Color.Surface.Surface_200,
		cornerRadius = UDim.new(0, var5.Radius.Medium),
		isDisabled = var3 or (var20 or (if p1.user.partyStatus ~= squadUserPartyStatusModule.Invited then p1.user.partyStatus == squadUserPartyStatusModule.NoResponse else true)),
		onActivated = if p1.onActivated and (if fFlagEnableSquadUserCardHoverFix then not var15 and not (#useSquadUserDropdownMenuButtonsModule(p1.user.userId, p1.isInExperience) < 1) else not var15) then react.useCallback(function()
			-- upvalues: p1 (ref)
			if p1.onActivated then
				p1.onActivated(tostring(p1.user.userId))
			end
		end, { p1.onActivated, p1.user.userId }) else nil
	}, {
		AvatarImage = react.createElement(imageSetLabel, {
			ZIndex = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(96, 96),
			BackgroundColor3 = var5.Color.Shift.Shift_300.Color3,
			BackgroundTransparency = var5.Color.Shift.Shift_300.Transparency,
			Image = var11
		}, {
			UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}),
		GradientFrame = react.createElement("Frame", {
			ZIndex = 1,
			Size = UDim2.fromScale(1, 0.5),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = var5.Color.Surface.Surface_100.Color3,
			BackgroundTransparency = var5.Color.Surface.Surface_100.Transparency
		}, {
			UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(0, var5.Radius.Medium) }),
			UIGradient = react.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			}, {})
		}),
		InactiveOverlay = if var3 or var17 or (var20 or p1.user.partyStatus == squadUserPartyStatusModule.Invited) or p1.user.partyStatus == squadUserPartyStatusModule.NoResponse then react.createElement(foundation.View, {
			tag = "size-full radius-medium",
			backgroundStyle = {
				Transparency = 0.25,
				Color3 = var5.Color.Surface.Surface_100.Color3
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
				PaddingBottom = UDim.new(0, var5.Padding.Medium),
				PaddingLeft = UDim.new(0, var5.Padding.Medium),
				PaddingRight = UDim.new(0, var5.Padding.Medium),
				PaddingTop = UDim.new(0, var5.Padding.Medium)
			}),
			Name = react.useMemo(function()
				-- upvalues: var10 (write), react (copy), var5 (ref), p1 (ref), foundation (copy), iconSize (copy), var21 (write), var19 (write), var17 (write), var18 (write), fFlagEnablePartyVoiceChangersInLua (copy), var22 (write), builderIconsModule (copy), fFlagEnableBlackbirdCheck (copy), var8 (ref)
				return if var10 == "" then nil else react.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.fromScale(1, 0)
				}, {
					UIListLayout = react.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = UDim.new(0, var5.Gap.XSmall + 2),
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					BlockedIcon = if p1.isBlocked then react.createElement(foundation.Icon, {
						LayoutOrder = 1,
						name = "icons/status/unavailable_small",
						size = iconSize.Small,
						style = var5.Color.Extended.Red.Red_800
					}) else nil,
					MutedLocallyIcon = if var21 then react.createElement(foundation.Icon, {
						LayoutOrder = 2,
						name = "icons/controls/voice/microphone_off_small_dark",
						size = iconSize.Small,
						style = var5.Color.Extended.Red.Red_800
					}) else nil,
					MutedIcon = if var19 then react.createElement(foundation.Icon, {
						LayoutOrder = 3,
						name = "icons/controls/microphoneMute_small",
						size = iconSize.Small,
						style = var5.Color.Content.Emphasis
					}) else nil,
					NotVoiceParticipantIcon = if var17 then react.createElement(foundation.Icon, {
						LayoutOrder = 4,
						name = "icons/controls/headphoneDeafen_small",
						size = iconSize.Small,
						style = var5.Color.Content.Emphasis
					}) else nil,
					NotEligibleVoiceParticipant = if var18 then react.createElement(foundation.Icon, {
						LayoutOrder = 5,
						name = "icons/controls/headphoneDeafen_small",
						size = iconSize.Small,
						style = var5.Color.System.Warning
					}) else nil,
					VoiceChangerActiveIcon = if fFlagEnablePartyVoiceChangersInLua and var22 then react.createElement(foundation.Icon, {
						LayoutOrder = 6,
						size = iconSize.Small,
						name = builderIconsModule.Icon.DiamondSimplified,
						style = var5.Color.Content.Emphasis
					}) else nil,
					NameTextLabel = if not fFlagEnableBlackbirdCheck then react.createElement(foundation.Text, {
						TextWrapped = false,
						AutomaticSize = Enum.AutomaticSize.Y,
						backgroundStyle = var5.Color.None,
						colorstyle = var5.Color.Content.Emphasis,
						fontStyle = var5.Typography.TitleMedium,
						LayoutOrder = if fFlagEnablePartyVoiceChangersInLua then 7 else 6,
						Text = var10,
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
							Padding = UDim.new(0, var5.Gap.XSmall),
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center
						}),
						FlexFill = react.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
						NameText = react.createElement(foundation.Text, {
							LayoutOrder = 1,
							TextWrapped = false,
							AutomaticSize = Enum.AutomaticSize.XY,
							backgroundStyle = var5.Color.None,
							colorstyle = var5.Color.Content.Emphasis,
							fontStyle = var5.Typography.TitleMedium,
							Text = var10,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Center,
							TextTruncate = Enum.TextTruncate.AtEnd
						}, {
							UIFlexItem = react.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink })
						}),
						SubscriptionBadge = if var8 then react.createElement(foundation.Icon, {
							LayoutOrder = 2,
							size = iconSize.Small,
							name = foundation.Enums.IconName.RobloxPlus,
							style = var5.Color.Content.Emphasis
						}) else nil
					}) else nil
				})
			end, {
				var10, var19, var21, p1.isBlocked, var5, var17, var18,
				if fFlagEnablePartyVoiceChangersInLua then var22 else nil,
				if fFlagEnableBlackbirdCheck then var8 else nil
			}),
			Presence = if not p1.isBlocked then react.useMemo(function()
				-- upvalues: react (copy), var5 (ref), var31 (ref), foundation (copy), var30 (ref)
				return react.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.fromScale(1, 0)
				}, {
					UIListLayout = react.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = UDim.new(0, var5.Gap.XSmall),
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					PresenceIcon = var31,
					PresenceTextLabel = react.createElement(foundation.Text, {
						LayoutOrder = 2,
						TextWrapped = false,
						AutomaticSize = Enum.AutomaticSize.Y,
						backgroundStyle = var5.Color.None,
						colorstyle = var5.Color.Content.Default,
						fontStyle = var5.Typography.BodyMedium,
						Text = var30,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						TextTruncate = Enum.TextTruncate.AtEnd
					}, {
						UIFlexItem = react.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
					})
				})
			end, {
				var3, var20, var13, var4.connectingText, onlinePresenceText, var5, var31,
				var30
			}) else nil
		}),
		ActiveBorder = react.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 4,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, -8, 1, -8)
		}, {
			UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(0, var5.Radius.Medium - 4) }),
			UIStroke = react.createElement("UIStroke", {
				Thickness = 4,
				Color = var5.Color.Extended.Green.Green_800.Color3,
				Transparency = var6
			})
		}),
		DefaultBorder = react.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, -2, 1, -2)
		}, {
			UICorner = react.createElement("UICorner", { CornerRadius = UDim.new(0, var5.Radius.Medium - 1) }),
			UIStroke = react.createElement("UIStroke", {
				Thickness = 1,
				Color = var5.Color.Stroke.Default.Color3,
				Transparency = var6:map(function(p2)
					-- upvalues: var5 (ref)
					return if p2 < 0.9 then 1 else var5.Color.Stroke.Default.Transparency
				end)
			})
		})
	})
end