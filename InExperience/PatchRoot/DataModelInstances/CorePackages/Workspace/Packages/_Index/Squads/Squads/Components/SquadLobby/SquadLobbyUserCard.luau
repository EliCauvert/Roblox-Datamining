local Squads = script:FindFirstAncestor("Squads")
local DependenciesModule = require(Squads.dependencies)
local Parent = Squads.Parent
local CrossExperienceVoiceModule = require(Parent.CrossExperienceVoice)
local UserProfilesModule = require(Parent.UserProfiles)
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local BuilderIconsModule = require(Parent.BuilderIcons)
local HooksModule = require(Parent.SquadsCore.Hooks)
local PresenceType = DependenciesModule.RoduxPresence.Enums.PresenceType
local Foundation = DependenciesModule.Foundation
local React = DependenciesModule.React
local SharedFlags = DependenciesModule.SharedFlags
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local FFlagSquadsPresenceStoreMigration = require(Parent.SquadsCore.Flags).FFlagSquadsPresenceStoreMigration
local FFlagSquadsEnableFoundationTestIdsModule = require(Squads.Flags.FFlagSquadsEnableFoundationTestIds)
local UseGetPresenceByUserId = if FFlagSquadsPresenceStoreMigration then require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local PresenceType1 = if FFlagSquadsPresenceStoreMigration then require(Parent.DataHydration).Presence.PresenceEnums.PresenceType else nil
local UseParticipantFunction = CrossExperienceVoiceModule.Hooks.useParticipant
local UseIsVoiceConnectedFunction = CrossExperienceVoiceModule.Hooks.useIsVoiceConnected
local UseIsActiveParticipantFunction = CrossExperienceVoiceModule.Hooks.useIsActiveParticipant
local UseAnimatedTransparencyFunction = CrossExperienceVoiceModule.Hooks.useAnimatedTransparency
local UseIsParticipantMutedFunction = CrossExperienceVoiceModule.Hooks.useIsParticipantMuted
local UseIsVoiceConnectingFunction = CrossExperienceVoiceModule.Hooks.useIsVoiceConnecting
local UseIsMicPermissionsErrorFunction = CrossExperienceVoiceModule.Hooks.useIsMicPermissionsError
local UseIsParticipantInOtherAudioContextFunction = CrossExperienceVoiceModule.Hooks.useIsParticipantInOtherAudioContext
local UseIsParticipantMutedLocallyFunction = CrossExperienceVoiceModule.Hooks.useIsParticipantMutedLocally
local UseTokensFunction = Foundation.Hooks.useTokens
local UseSquadUserDropdownMenuButtonsModule = require(Squads.Hooks.useSquadUserDropdownMenuButtons)
local UseIsLocalPlayerPartyVoiceEligibleFunction = HooksModule.useIsLocalPlayerPartyVoiceEligible
local UseIsUserPartyVoiceEligibleFunction = HooksModule.useIsUserPartyVoiceEligible
local UseIsCurrentSquadPartyVoiceEligibleFunction = HooksModule.useIsCurrentSquadPartyVoiceEligible
local GetFFlagEnableCrossExpVoiceFunction = SharedFlags.GetFFlagEnableCrossExpVoice
local IconSize = Foundation.Enums.IconSize
local ImageSetLabel = require(Parent.UIBlox).Core.ImageSet.ImageSetLabel
local _ = require(Squads.Common.ModelTypes)
local SquadUserPartyStatusModule = require(Squads.Enums.SquadUserPartyStatus)
local PartyVoiceActivityIndicatorDebounceMs = game:DefineFastInt("PartyVoiceActivityIndicatorDebounceMs", 100)
local PartyVoiceActivityIndicatorAnimationMs = game:DefineFastInt("PartyVoiceActivityIndicatorAnimationMs", 100)
local FFlagEnablePartyVoiceChangersInLua = SharedFlags.FFlagEnablePartyVoiceChangersInLua
local FFlagEnableBlackbirdCheck = SharedFlags.FFlagEnableBlackbirdCheck
local UseIsRobloxSubscriberFunction = UserProfilesModule.Hooks.useIsRobloxSubscriber

return function(p1) --[[ Line: 83 ]]
	-- upvalues: UseLocalizationFunction (copy), UseTokensFunction (copy), UseAnimatedTransparencyFunction (copy), PartyVoiceActivityIndicatorAnimationMs (copy), UseIsRobloxSubscriberFunction (copy), FFlagEnableBlackbirdCheck (copy), UserProfilesModule (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), React (copy), FFlagSquadsPresenceStoreMigration (copy), UseGetPresenceByUserId (copy), UseSelectorFunction (copy), PresenceType1 (copy), PresenceType (copy), UseLocalUserIdFunction (copy), GetFFlagEnableCrossExpVoiceFunction (copy), UseIsVoiceConnectedFunction (copy), UseIsMicPermissionsErrorFunction (copy), UseParticipantFunction (copy), UseIsVoiceConnectingFunction (copy), UseIsActiveParticipantFunction (copy), UseIsLocalPlayerPartyVoiceEligibleFunction (copy), UseIsUserPartyVoiceEligibleFunction (copy), UseIsCurrentSquadPartyVoiceEligibleFunction (copy), UseIsParticipantMutedLocallyFunction (copy), UseIsParticipantMutedFunction (copy), UseIsParticipantInOtherAudioContextFunction (copy), FFlagEnablePartyVoiceChangersInLua (copy), CrossExperienceVoiceModule (copy), PartyVoiceActivityIndicatorDebounceMs (copy), SquadUserPartyStatusModule (copy), Foundation (copy), IconSize (copy), FFlagSquadsEnableFoundationTestIdsModule (copy), BuilderIconsModule (copy), UseSquadUserDropdownMenuButtonsModule (copy), ImageSetLabel (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		connectingText = "Feature.Squads.Label.Connecting",
		inExperiencePresenceText = "Common.Presence.Label.InExperience",
		invitedText = "Feature.Squads.Description.Invited",
		noResponseText = "Feature.Squads.Description.NoResponse",
		onlinePresenceText = "Common.Presence.Label.Online"
	})
	local UseTokensResult = UseTokensFunction()
	local UseAnimatedTransparencyResult, UseAnimatedTransparencyResult2 = UseAnimatedTransparencyFunction(1, PartyVoiceActivityIndicatorAnimationMs, Enum.EasingStyle.Cubic)
	local UseIsRobloxSubscriberResult = UseIsRobloxSubscriberFunction(if FFlagEnableBlackbirdCheck then tostring(p1.user.userId) else nil)
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { (tostring(p1.user.userId)) },
		query = UserProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local CombinedNameFromId = if UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, p1.user.userId) else ""
	local StandardSizeAvatarHeadShotRbxthumb = GetStandardSizeAvatarHeadShotRbxthumbFunction((tostring(p1.user.userId)))
	local SocialName: string = `--social-squad-lobby-user-card-{p0.user.userId}`
	local UseResult = React.useCallback(function(p2) --[[ Line: 111 ]]
		-- upvalues: p1 (copy)
		return p2.Squad.Presence.byUserId[tostring(p1.user.userId)]
	end, { p1.user.userId })
	local UseGetPresenceByUserIdResult = if FFlagSquadsPresenceStoreMigration then UseGetPresenceByUserId((tostring(p1.user.userId))) else UseSelectorFunction(UseResult)
	local IsUserPresenceTypeMatch: boolean = UseGetPresenceByUserIdResult and UseGetPresenceByUserIdResult.userPresenceType == (if FFlagSquadsPresenceStoreMigration then PresenceType1.InGame else PresenceType.InGame)
	local LastLocation1 = nil
	
	if IsUserPresenceTypeMatch then
		local LastLocation = if FFlagSquadsPresenceStoreMigration then UseGetPresenceByUserIdResult and UseGetPresenceByUserIdResult.lastLocation else UseGetPresenceByUserIdResult.lastLocation
		LastLocation1 = if LastLocation and LastLocation ~= "" then LastLocation else UseLocalizationResult.inExperiencePresenceText
	else
		LastLocation1 = UseLocalizationResult.onlinePresenceText
	end
	local IsConnecting = p1.isConnecting
	local Number: number = tonumber(UseLocalUserIdFunction()) or 0
	local IsNumberMatch = Number == p1.user.userId
	local v1 = false
	local v2 = false
	local v3 = false
	local v4 = false
	local v5 = false
	local v6 = false
	local IsVoiceChangerActive = false
	
	if GetFFlagEnableCrossExpVoiceFunction() then
		local UseIsVoiceConnectedResult = UseIsVoiceConnectedFunction()
		local UseIsMicPermissionsErrorResult = UseIsMicPermissionsErrorFunction()
		local UseParticipantResult = UseParticipantFunction(p1.user.userId)
		v5 = UseIsVoiceConnectingFunction() and IsNumberMatch
		v1 = UseIsActiveParticipantFunction(p1.user.userId)
		local UseIsLocalPlayerPartyVoiceEligibleResult = UseIsLocalPlayerPartyVoiceEligibleFunction()
		local UseIsUserPartyVoiceEligibleResult = UseIsUserPartyVoiceEligibleFunction(p1.user.userId)
		local IsUseIsCurrentSquadPartyVoiceEligibleResult = UseIsCurrentSquadPartyVoiceEligibleFunction() == true
		local IsUseIsParticipantMutedLocallyResult = UseIsParticipantMutedLocallyFunction(p1.user.userId) == true
		v6 = UseIsUserPartyVoiceEligibleResult and (IsUseIsCurrentSquadPartyVoiceEligibleResult and (not IsNumberMatch and IsUseIsParticipantMutedLocallyResult))
		v4 = UseIsParticipantMutedFunction(p1.user.userId) and not v6
		local IsUseIsParticipantInOtherAudioContextResult = UseIsParticipantInOtherAudioContextFunction(Number, p1.user.userId) == true
		v2 = IsUseIsCurrentSquadPartyVoiceEligibleResult and (UseIsLocalPlayerPartyVoiceEligibleResult and (UseIsUserPartyVoiceEligibleResult and (not UseIsVoiceConnectedResult or (not UseParticipantResult or (IsUseIsParticipantInOtherAudioContextResult or UseIsMicPermissionsErrorResult)))))
		v3 = IsUseIsCurrentSquadPartyVoiceEligibleResult and (UseIsLocalPlayerPartyVoiceEligibleResult and not UseIsUserPartyVoiceEligibleResult)
		IsVoiceChangerActive = if FFlagEnablePartyVoiceChangersInLua and UseParticipantResult then UseParticipantResult.isVoiceChangerActive else false
	end
	local UseMemoResult = React.useMemo(function() --[[ Line: 186 ]]
		-- upvalues: CrossExperienceVoiceModule (upval), UseAnimatedTransparencyResult2 (copy), PartyVoiceActivityIndicatorDebounceMs (upval)
		return CrossExperienceVoiceModule.Utils.debounce(function(p2) --[[ Line: 187 ]]
			-- upvalues: UseAnimatedTransparencyResult2 (upval)
			UseAnimatedTransparencyResult2(p2)
		end, PartyVoiceActivityIndicatorDebounceMs)
	end, {})
	React.useEffect(function() --[[ Line: 192 ]]
		-- upvalues: GetFFlagEnableCrossExpVoiceFunction (upval), v1 (ref), UseMemoResult (copy), UseAnimatedTransparencyResult2 (copy)
		if GetFFlagEnableCrossExpVoiceFunction() then
			if v1 then
				UseMemoResult.cancel()
				UseAnimatedTransparencyResult2(0)
				
				return
			else
				UseMemoResult.call(1)
			end
		end
	end, { v1 })
	local UseMemoResult1 = React.useMemo(function() --[[ Line: 204 ]]
		-- upvalues: p1 (copy), SquadUserPartyStatusModule (upval), UseLocalizationResult (copy), IsConnecting (copy), v5 (ref), LastLocation1 (ref)
		return if p1.user.partyStatus == SquadUserPartyStatusModule.NoResponse then UseLocalizationResult.noResponseText elseif p1.user.partyStatus == SquadUserPartyStatusModule.Invited then UseLocalizationResult.invitedText elseif IsConnecting or v5 then UseLocalizationResult.connectingText else LastLocation1
	end, {
		p1.user and p1.user.partyStatus, LastLocation1, IsConnecting, v5,
		UseLocalizationResult.noResponse, UseLocalizationResult.invitedText,
		UseLocalizationResult.connectingText
	})
	local UseMemoResult2 = React.useMemo(function() --[[ Line: 226 ]]
		-- upvalues: p1 (copy), SquadUserPartyStatusModule (upval), React (upval), Foundation (upval), IconSize (upval), UseTokensResult (copy), FFlagSquadsEnableFoundationTestIdsModule (upval), SocialName (copy), IsConnecting (copy), v5 (ref), IsUserPresenceTypeMatch (copy)
		return if p1.user.partyStatus == SquadUserPartyStatusModule.Invited then React.createElement(Foundation.View, { tag = "auto-xy" }, {
			LoadingIcon = React.createElement(Foundation.Loading, {
				LayoutOrder = 1,
				size = IconSize.Small,
				Padding = UseTokensResult.Padding.XSmall,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then `{SocialName}--loading` else nil
			})
		}) elseif p1.user.partyStatus == SquadUserPartyStatusModule.NoResponse then nil elseif IsConnecting or v5 then React.createElement(Foundation.View, { tag = "auto-xy" }, {
			LoadingIcon = React.createElement(Foundation.Loading, {
				LayoutOrder = 1,
				size = IconSize.Small,
				Padding = UseTokensResult.Padding.XSmall,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then `{SocialName}--loading` else nil
			})
		}) elseif IsUserPresenceTypeMatch then React.createElement(Foundation.Icon, {
			LayoutOrder = 1,
			name = "icons/common/play",
			size = IconSize.Small,
			style = UseTokensResult.Color.Content.Emphasis,
			testId = if FFlagSquadsEnableFoundationTestIdsModule then `{SocialName}--in-game-icon` else nil
		}) else nil
	end, {
		p1.user and p1.user.partyStatus,
		IsConnecting,
		v5,
		IsUserPresenceTypeMatch,
		SocialName
	})
	local UseMemoResult3 = React.useMemo(function() --[[ Line: 261 ]]
		-- upvalues: CombinedNameFromId (ref), React (upval), UseTokensResult (copy), p1 (copy), Foundation (upval), IconSize (upval), FFlagSquadsEnableFoundationTestIdsModule (upval), SocialName (copy), v6 (ref), v4 (ref), v2 (ref), v3 (ref), FFlagEnablePartyVoiceChangersInLua (upval), IsVoiceChangerActive (ref), BuilderIconsModule (upval), FFlagEnableBlackbirdCheck (upval), UseIsRobloxSubscriberResult (copy)
		return if CombinedNameFromId == "" then nil else React.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			UIListLayout = React.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, UseTokensResult.Gap.XSmall + 2),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			BlockedIcon = if p1.isBlocked then React.createElement(Foundation.Icon, {
				LayoutOrder = 1,
				name = "icons/status/unavailable_small",
				size = IconSize.Small,
				style = UseTokensResult.Color.Extended.Red.Red_800,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then `{SocialName}--blocked-icon` else nil
			}) else nil,
			MutedLocallyIcon = if v6 then React.createElement(Foundation.Icon, {
				LayoutOrder = 2,
				name = "icons/controls/voice/microphone_off_small_dark",
				size = IconSize.Small,
				style = UseTokensResult.Color.Extended.Red.Red_800,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then `{SocialName}--muted-locally-icon` else nil
			}) else nil,
			MutedIcon = if v4 then React.createElement(Foundation.Icon, {
				LayoutOrder = 3,
				name = "icons/controls/microphoneMute_small",
				size = IconSize.Small,
				style = UseTokensResult.Color.Content.Emphasis,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then `{SocialName}--muted-icon` else nil
			}) else nil,
			NotVoiceParticipantIcon = if v2 then React.createElement(Foundation.Icon, {
				LayoutOrder = 4,
				name = "icons/controls/headphoneDeafen_small",
				size = IconSize.Small,
				style = UseTokensResult.Color.Content.Emphasis,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then `{SocialName}--not-voice-participant-icon` else nil
			}) else nil,
			NotEligibleVoiceParticipant = if v3 then React.createElement(Foundation.Icon, {
				LayoutOrder = 5,
				name = "icons/controls/headphoneDeafen_small",
				size = IconSize.Small,
				style = UseTokensResult.Color.System.Warning,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then `{SocialName}--not-eligible-voice-participant-icon` else nil
			}) else nil,
			VoiceChangerActiveIcon = if FFlagEnablePartyVoiceChangersInLua and IsVoiceChangerActive then React.createElement(Foundation.Icon, {
				LayoutOrder = 6,
				size = IconSize.Small,
				name = BuilderIconsModule.Icon.DiamondSimplified,
				style = UseTokensResult.Color.Content.Emphasis,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then `{SocialName}--voice-changer-icon` else nil
			}) else nil,
			NameTextLabel = if FFlagEnableBlackbirdCheck then nil else React.createElement(Foundation.Text, {
				TextWrapped = false,
				AutomaticSize = Enum.AutomaticSize.Y,
				backgroundStyle = UseTokensResult.Color.None,
				colorstyle = UseTokensResult.Color.Content.Emphasis,
				fontStyle = UseTokensResult.Typography.TitleMedium,
				LayoutOrder = if FFlagEnablePartyVoiceChangersInLua then 7 else 6,
				Text = CombinedNameFromId,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then `{SocialName}--name` else nil
			}, {
				UIFlexItem = React.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
			}),
			NameAndBadge = if FFlagEnableBlackbirdCheck then React.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(0, 0),
				LayoutOrder = if FFlagEnablePartyVoiceChangersInLua then 7 else 6
			}, {
				Layout = React.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, UseTokensResult.Gap.XSmall),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				FlexFill = React.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
				NameText = React.createElement(Foundation.Text, {
					LayoutOrder = 1,
					TextWrapped = false,
					AutomaticSize = Enum.AutomaticSize.XY,
					backgroundStyle = UseTokensResult.Color.None,
					colorstyle = UseTokensResult.Color.Content.Emphasis,
					fontStyle = UseTokensResult.Typography.TitleMedium,
					Text = CombinedNameFromId,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextTruncate = Enum.TextTruncate.AtEnd,
					testId = if FFlagSquadsEnableFoundationTestIdsModule then `{SocialName}--name` else nil
				}, {
					UIFlexItem = React.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink })
				}),
				SubscriptionBadge = if UseIsRobloxSubscriberResult then React.createElement(Foundation.Icon, {
					LayoutOrder = 2,
					size = IconSize.Small,
					name = Foundation.Enums.IconName.RobloxPlus,
					style = UseTokensResult.Color.Content.Emphasis,
					testId = if FFlagSquadsEnableFoundationTestIdsModule then `{SocialName}--subscription-badge` else nil
				}) else nil
			}) else nil
		})
	end, {
		CombinedNameFromId, v4, v6, p1.isBlocked, UseTokensResult, v2, v3,
		if FFlagEnablePartyVoiceChangersInLua then IsVoiceChangerActive else nil,
		if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberResult else nil,
		SocialName
	})
	local UseMemoResult4 = React.useMemo(function() --[[ Line: 413 ]]
		-- upvalues: React (upval), UseTokensResult (copy), UseMemoResult2 (copy), Foundation (upval), UseMemoResult1 (copy), FFlagSquadsEnableFoundationTestIdsModule (upval), SocialName (copy)
		return React.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			UIListLayout = React.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, UseTokensResult.Gap.XSmall),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			PresenceIcon = UseMemoResult2,
			PresenceTextLabel = React.createElement(Foundation.Text, {
				LayoutOrder = 2,
				TextWrapped = false,
				AutomaticSize = Enum.AutomaticSize.Y,
				backgroundStyle = UseTokensResult.Color.None,
				colorstyle = UseTokensResult.Color.Content.Default,
				fontStyle = UseTokensResult.Typography.BodyMedium,
				Text = UseMemoResult1,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then `{SocialName}--presence` else nil
			}, {
				UIFlexItem = React.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
			})
		})
	end, {
		IsConnecting, v5, IsUserPresenceTypeMatch,
		UseLocalizationResult.connectingText, LastLocation1, UseTokensResult,
		UseMemoResult2, UseMemoResult1, SocialName
	})
	local v7 = #UseSquadUserDropdownMenuButtonsModule(p1.user.userId, p1.isInExperience) < 1
	local NoV62: boolean = not IsNumberMatch and not v7
	local UseResult1 = React.useCallback(function() --[[ Line: 461 ]]
		-- upvalues: p1 (copy)
		if p1.onActivated then
			p1.onActivated((tostring(p1.user.userId)))
		end
	end, { p1.onActivated, p1.user.userId })
	
	return React.createElement(Foundation.View, {
		LayoutOrder = p1.layoutOrder,
		Size = p1.size,
		backgroundStyle = UseTokensResult.Color.Surface.Surface_200,
		cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium),
		isDisabled = IsConnecting or (v5 or (p1.user.partyStatus == SquadUserPartyStatusModule.Invited or p1.user.partyStatus == SquadUserPartyStatusModule.NoResponse)),
		onActivated = if p1.onActivated and NoV62 then UseResult1 else nil,
		testId = if FFlagSquadsEnableFoundationTestIdsModule then SocialName else nil
	}, {
		AvatarImage = React.createElement(ImageSetLabel, {
			ZIndex = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(96, 96),
			BackgroundColor3 = UseTokensResult.Color.Shift.Shift_300.Color3,
			BackgroundTransparency = UseTokensResult.Color.Shift.Shift_300.Transparency,
			Image = StandardSizeAvatarHeadShotRbxthumb
		}, {
			UICorner = React.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}),
		GradientFrame = React.createElement("Frame", {
			ZIndex = 1,
			Size = UDim2.fromScale(1, 0.5),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = UseTokensResult.Color.Surface.Surface_100.Color3,
			BackgroundTransparency = UseTokensResult.Color.Surface.Surface_100.Transparency
		}, {
			UICorner = React.createElement("UICorner", {
				CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
			}),
			UIGradient = React.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			}, {})
		}),
		InactiveOverlay = if IsConnecting or v2 or v5 or p1.user.partyStatus == SquadUserPartyStatusModule.Invited or p1.user.partyStatus == SquadUserPartyStatusModule.NoResponse then React.createElement(Foundation.View, {
			tag = "size-full radius-medium",
			backgroundStyle = {
				Transparency = 0.25,
				Color3 = UseTokensResult.Color.Surface.Surface_100.Color3
			}
		}, {}) else nil,
		TextContainer = React.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1),
			Size = UDim2.fromScale(1, 0)
		}, {
			UIListLayout = React.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Bottom
			}),
			UIPadding = React.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, UseTokensResult.Padding.Medium),
				PaddingLeft = UDim.new(0, UseTokensResult.Padding.Medium),
				PaddingRight = UDim.new(0, UseTokensResult.Padding.Medium),
				PaddingTop = UDim.new(0, UseTokensResult.Padding.Medium)
			}),
			Name = UseMemoResult3,
			Presence = if p1.isBlocked then nil else UseMemoResult4
		}),
		ActiveBorder = React.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 4,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, -8, 1, -8)
		}, {
			UICorner = React.createElement("UICorner", {
				CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium - 4)
			}),
			UIStroke = React.createElement("UIStroke", {
				Thickness = 4,
				Color = UseTokensResult.Color.Extended.Green.Green_800.Color3,
				Transparency = UseAnimatedTransparencyResult
			})
		}),
		DefaultBorder = React.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, -2, 1, -2)
		}, {
			UICorner = React.createElement("UICorner", {
				CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium - 1)
			}),
			UIStroke = React.createElement("UIStroke", {
				Thickness = 1,
				Color = UseTokensResult.Color.Stroke.Default.Color3,
				Transparency = UseAnimatedTransparencyResult:map(function(p2: number) --[[ Line: 586 ]]
					-- upvalues: UseTokensResult (copy)
					return if p2 < 0.9 then 1 else UseTokensResult.Color.Stroke.Default.Transparency
				end)
			})
		})
	})
end