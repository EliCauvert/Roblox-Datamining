local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local CryoModule = require(Parent.Cryo)
local UserProfilesModule = require(Parent.UserProfiles)
local HorizontalFacepileGroupModule = require(Squads.Common.HorizontalFacepileGroup)
local DependenciesModule = require(Squads.dependencies)
local FFlagIntroduceTopBannerPartyStatesModule = require(Squads.Flags.FFlagIntroduceTopBannerPartyStates)
local _ = require(Squads.Enums.SquadActivityEnum)
local Foundation = DependenciesModule.Foundation
local React = DependenciesModule.React
local SharedFlags = DependenciesModule.SharedFlags
local SquadCoordinationUIChangesExperimentation = DependenciesModule.SocialExperiments.SquadCoordinationUIChangesExperimentation
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local ConstantsModule = require(Parent.SquadsCore.Constants)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local UseCurrentSquadParentChannelIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local UseTokensFunction = Foundation.Hooks.useTokens
local View = Foundation.View
local FFlagDebugAppChatEnableDomLocators = SharedFlags.FFlagDebugAppChatEnableDomLocators
local GetFFlagEnableCrossExpVoiceFunction = SharedFlags.GetFFlagEnableCrossExpVoice
local UseLastActiveParticipant = if GetFFlagEnableCrossExpVoiceFunction() then require(Parent.CrossExperienceVoice).Hooks.useLastActiveParticipant else nil

function SquadTopBanner(p1)
	-- upvalues: React (copy), SquadCoordinationUIChangesExperimentation (copy), FFlagIntroduceTopBannerPartyStatesModule (copy), GetFFlagEnableCrossExpVoiceFunction (copy), UseLastActiveParticipant (ref), UseTokensFunction (copy), UseCurrentSquadParentChannelIdFunction (copy), SquadExternalContractContext (copy), UseLocalUserIdFunction (copy), ConstantsModule (copy), UserProfilesModule (copy), UseLocalizationFunction (copy), CryoModule (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), Foundation (copy), FFlagDebugAppChatEnableDomLocators (copy), View (copy), HorizontalFacepileGroupModule (copy)
	React.useEffect(function()
		-- upvalues: SquadCoordinationUIChangesExperimentation (upval)
		if SquadCoordinationUIChangesExperimentation.isLogExposureEnabled then
			SquadCoordinationUIChangesExperimentation.logExposure()
		end
	end, {})
	local UseLastActiveParticipantResult = if FFlagIntroduceTopBannerPartyStatesModule and GetFFlagEnableCrossExpVoiceFunction() then UseLastActiveParticipant() else nil
	local UserId = UseLastActiveParticipantResult and UseLastActiveParticipantResult.userId or nil
	local UseTokensResult = UseTokensFunction()
	local UseCurrentSquadParentChannelIdResult = if FFlagIntroduceTopBannerPartyStatesModule then nil else UseCurrentSquadParentChannelIdFunction()
	local UseContextResult = if FFlagIntroduceTopBannerPartyStatesModule then nil else React.useContext(SquadExternalContractContext)
	local UseParentChannelTitleSelectorResult = if FFlagIntroduceTopBannerPartyStatesModule then "" else UseContextResult.useParentChannelTitleSelector(UseCurrentSquadParentChannelIdResult or "") or ""
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local CombinedNameFromId = nil
	local NoParentChannelType = false
	local UseMemoResult = React.useMemo(function()
		-- upvalues: p1 (copy), ConstantsModule (upval), UseLocalUserIdResult (copy)
		if p1.parentChannelType == ConstantsModule.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and p1.parentChannelParticipants then
			for _, parentChannelParticipant in ipairs(p1.parentChannelParticipants) do
				if parentChannelParticipant ~= UseLocalUserIdResult then
					return parentChannelParticipant
				end
			end
		end
		return ""
	end, {
		p1.parentChannelParticipants,
		p1.parentChannelType,
		UseLocalUserIdResult
	})
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = if UseMemoResult == "" then {} else { UseMemoResult } or {},
		query = UserProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	
	if UseUserProfilesFetchResult.data then
		CombinedNameFromId = UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, UseMemoResult or "") or ""
	end
	NoParentChannelType = not p1.parentChannelType or p1.parentChannelType == ConstantsModule.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and (UseMemoResult ~= "" and not CombinedNameFromId)
	local UseMemoResult1 = nil
	local UseMemoResult11 = nil
	
	if FFlagIntroduceTopBannerPartyStatesModule then
		local UseLocalizationResult = UseLocalizationFunction({
			waitingForOthers = "Feature.Squads.Label.WaitingForOthers",
			numberInTheParty = "Feature.Squads.Label.PartyCountStatus",
			loading = "Feature.Squads.Label.Loading",
			waitingForCombinedName = "Feature.Squads.Label.WaitingForCombinedName"
		})
		UseMemoResult1 = React.useMemo(function()
			-- upvalues: NoParentChannelType (ref), UseLocalizationResult (copy), p1 (copy), ConstantsModule (upval), CombinedNameFromId (ref)
			return if NoParentChannelType then UseLocalizationResult.loading elseif p1.parentChannelType == ConstantsModule.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and CombinedNameFromId and #p1.squadMemberList < 2 then UseLocalizationResult.waitingForCombinedName:gsub("{(.-)}", { combinedName = CombinedNameFromId }) elseif p1.parentChannelType == ConstantsModule.CONVERSATION_CHANNEL_GROUP_TYPE and #p1.squadMemberList < 2 then UseLocalizationResult.waitingForOthers else UseLocalizationResult.numberInTheParty:gsub("{(.-)}", { partyCount = tostring(#p1.squadMemberList) })
		end, {
			NoParentChannelType,
			UseLocalizationResult,
			CombinedNameFromId,
			p1.parentChannelType,
			p1.squadMemberList
		})
		local UseResult = React.useCallback(function()
			-- upvalues: UseLocalUserIdResult (copy), p1 (copy)
			local List = {}
			
			if UseLocalUserIdResult == "-1" or not p1.squadMemberList then
				return List
			end
			for _, value in ipairs(p1.squadMemberList) do
				if tostring(value) ~= UseLocalUserIdResult then
					table.insert(List, (tostring(value)))
				end
			end
			table.insert(List, UseLocalUserIdResult)
			
			return List
		end, { p1.squadMemberList })
		UseMemoResult11 = React.useMemo(function()
			-- upvalues: UseResult (copy), CryoModule (upval), GetStandardSizeAvatarHeadShotRbxthumbFunction (upval)
			return CryoModule.List.map(UseResult(), function(p2)
				-- upvalues: GetStandardSizeAvatarHeadShotRbxthumbFunction (upval)
				return GetStandardSizeAvatarHeadShotRbxthumbFunction(p2)
			end)
		end, { UseResult })
	end
	return React.createElement(Foundation.View, {
		Size = UDim2.new(1, 0, 1, 0),
		backgroundStyle = UseTokensResult.Color.None,
		testId = if FFlagDebugAppChatEnableDomLocators then ConstantsModule.SQUAD_TOP_BANNER_TEST_ID else nil,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, UseTokensResult.Gap.Small),
			VerticalAlignment = Enum.VerticalAlignment.Center
		}
	}, {
		Icon = if FFlagIntroduceTopBannerPartyStatesModule then nil else React.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(20, 20)
		}, {
			React.createElement(Foundation.Icon, {
				size = 28,
				name = "three-people",
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				style = UseTokensResult.Color.Extended.Gray.Gray_100
			})
		}),
		HorizontalFacepileGroup = if FFlagIntroduceTopBannerPartyStatesModule then React.createElement(View, {
			tag = "auto-xy",
			BackgroundTransparency = 1,
			LayoutOrder = 1
		}, {
			React.createElement(HorizontalFacepileGroupModule, {
				avatarSize = UseTokensResult.Size.Size_600,
				images = UseMemoResult11
			})
		}) else nil,
		Title = React.createElement(Foundation.Text, {
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.XY,
			textStyle = UseTokensResult.Color.Extended.Gray.Gray_100,
			fontStyle = UseTokensResult.Typography.TitleMedium,
			backgroundStyle = UseTokensResult.Color.None,
			Text = if FFlagIntroduceTopBannerPartyStatesModule then UseMemoResult1 else UseParentChannelTitleSelectorResult,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left
		}, {
			UIFlexItem = React.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
		}),
		Avatar = if FFlagIntroduceTopBannerPartyStatesModule or not UserId then nil else React.createElement(Foundation.Image, {
			LayoutOrder = 3,
			Size = UDim2.fromOffset(24, 24),
			backgroundStyle = UseTokensResult.Color.Extended.Gray.Gray_700,
			cornerRadius = UDim.new(0, UseTokensResult.Radius.Circle),
			Image = GetStandardSizeAvatarHeadShotRbxthumbFunction((tostring(UserId)))
		})
	})
end

return React.memo(SquadTopBanner)