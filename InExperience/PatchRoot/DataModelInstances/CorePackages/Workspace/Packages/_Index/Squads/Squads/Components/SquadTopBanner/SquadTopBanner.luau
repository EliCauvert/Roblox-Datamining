local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local getStandardSizeAvatarHeadShotRbxthumb = require(parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local cryoModule = require(parent.Cryo)
local userProfilesModule = require(parent.UserProfiles)
local horizontalFacepileGroupModule = require(squads.Common.HorizontalFacepileGroup)
local dependenciesModule = require(squads.dependencies)
local fFlagIntroduceTopBannerPartyStatesModule = require(squads.Flags.FFlagIntroduceTopBannerPartyStates)
local _ = require(squads.Enums.SquadActivityEnum)
local foundation = dependenciesModule.Foundation
local react = dependenciesModule.React
local sharedFlags = dependenciesModule.SharedFlags
local squadCoordinationUIChangesExperimentation = dependenciesModule.SocialExperiments.SquadCoordinationUIChangesExperimentation
local useLocalization = dependenciesModule.Hooks.useLocalization
local constantsModule = require(parent.SquadsCore.Constants)
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local useCurrentSquadParentChannelId = require(parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local useTokens = foundation.Hooks.useTokens
local view = foundation.View
local fFlagDebugAppChatEnableDomLocators = sharedFlags.FFlagDebugAppChatEnableDomLocators
local getFFlagEnableCrossExpVoice = sharedFlags.GetFFlagEnableCrossExpVoice
local _ = nil
local var7 = if getFFlagEnableCrossExpVoice() then require(parent.CrossExperienceVoice).Hooks.useLastActiveParticipant else nil

function SquadTopBanner(p0)
	-- upvalues: react (ref), squadCoordinationUIChangesExperimentation (ref), fFlagIntroduceTopBannerPartyStatesModule (ref), getFFlagEnableCrossExpVoice (ref), var7 (write), useTokens (ref), useCurrentSquadParentChannelId (ref), squadExternalContractContext (ref), useLocalUserId (ref), constantsModule (ref), userProfilesModule (ref), useLocalization (ref), cryoModule (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), foundation (ref), fFlagDebugAppChatEnableDomLocators (ref), view (ref), horizontalFacepileGroupModule (ref)
	local var16
	react.useEffect(function()
		-- upvalues: squadCoordinationUIChangesExperimentation (copy)
		if squadCoordinationUIChangesExperimentation.isLogExposureEnabled then
			squadCoordinationUIChangesExperimentation.logExposure()
		end
	end, {})
	local var8 = if fFlagIntroduceTopBannerPartyStatesModule and getFFlagEnableCrossExpVoice() then var7() else nil
	local var9 = if var8 then var8.userId else nil
	local var10 = useTokens()
	local var11 = if fFlagIntroduceTopBannerPartyStatesModule then "" else (if fFlagIntroduceTopBannerPartyStatesModule then nil else react.useContext(squadExternalContractContext)).useParentChannelTitleSelector((if fFlagIntroduceTopBannerPartyStatesModule then nil else useCurrentSquadParentChannelId()) or "") or ""
	local var12 = useLocalUserId()
	local data = nil
	local _ = false
	local var14 = react.useMemo(function()
		-- upvalues: p0 (ref), constantsModule (copy), var12 (ref)
		if p0.parentChannelType == constantsModule.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and p0.parentChannelParticipants then
			for i, v in ipairs(p0.parentChannelParticipants) do
				if v ~= var12 then
					return v
				end
			end
		end
		return ""
	end, {
		p0.parentChannelParticipants,
		p0.parentChannelType,
		var12
	})
	local useUserProfilesFetch = userProfilesModule.Hooks.useUserProfilesFetch
	local t = {}
	
	if var14 ~= "" then
		var16 = { var14 } or {}
	end
	t.userIds = var16
	t.query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	useUserProfilesFetch = useUserProfilesFetch(t)
	
	if useUserProfilesFetch.data then
		data = userProfilesModule.Selectors.getCombinedNameFromId(useUserProfilesFetch.data, var14 or "") or ""
	end
	local var17 = if p0.parentChannelType then p0.parentChannelType == constantsModule.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and (var14 ~= "" and not data) else not p0.parentChannelType
	local var18 = nil
	local var19 = nil
	
	if fFlagIntroduceTopBannerPartyStatesModule then
		local var20 = useLocalization({
			waitingForOthers = "Feature.Squads.Label.WaitingForOthers",
			numberInTheParty = "Feature.Squads.Label.PartyCountStatus",
			loading = "Feature.Squads.Label.Loading",
			waitingForCombinedName = "Feature.Squads.Label.WaitingForCombinedName"
		})
		var18 = react.useMemo(function()
			-- upvalues: var17 (write), var20 (ref), p0 (ref), constantsModule (copy), data (write)
			return if var17 then var20.loading elseif p0.parentChannelType == constantsModule.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and data and #p0.squadMemberList < 2 then var20.waitingForCombinedName:gsub("{(.-)}", { combinedName = data }) elseif p0.parentChannelType == constantsModule.CONVERSATION_CHANNEL_GROUP_TYPE and #p0.squadMemberList < 2 then var20.waitingForOthers else var20.numberInTheParty:gsub("{(.-)}", { partyCount = tostring(#p0.squadMemberList) })
		end, {
			var17,
			var20,
			data,
			p0.parentChannelType,
			p0.squadMemberList
		})
		local var21 = react.useCallback(function()
			-- upvalues: var12 (ref), p0 (ref)
			local t = {}
			
			if var12 == "-1" or not p0.squadMemberList then
				return t
			end
			for i, v in ipairs(p0.squadMemberList) do
				if tostring(v) ~= var12 then
					table.insert(t, tostring(v))
				end
			end
			table.insert(t, var12)
			
			return t
		end, { p0.squadMemberList })
		var19 = react.useMemo(function()
			-- upvalues: var21 (ref), cryoModule (copy), getStandardSizeAvatarHeadShotRbxthumb (copy)
			return cryoModule.List.map(var21(), function(p1)
				-- upvalues: getStandardSizeAvatarHeadShotRbxthumb (copy)
				return getStandardSizeAvatarHeadShotRbxthumb(p1)
			end)
		end, { var21 })
	end
	return react.createElement(foundation.View, {
		Size = UDim2.new(1, 0, 1, 0),
		backgroundStyle = var10.Color.None,
		testId = if fFlagDebugAppChatEnableDomLocators then constantsModule.SQUAD_TOP_BANNER_TEST_ID else nil,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, var10.Gap.Small),
			VerticalAlignment = Enum.VerticalAlignment.Center
		}
	}, {
		Icon = if not fFlagIntroduceTopBannerPartyStatesModule then react.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(20, 20)
		}, {
			react.createElement(foundation.Icon, {
				size = 28,
				name = "three-people",
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				style = var10.Color.Extended.Gray.Gray_100
			})
		}) else nil,
		HorizontalFacepileGroup = if fFlagIntroduceTopBannerPartyStatesModule then react.createElement(view, {
			tag = "auto-xy",
			BackgroundTransparency = 1,
			LayoutOrder = 1
		}, {
			react.createElement(horizontalFacepileGroupModule, { avatarSize = var10.Size.Size_600, images = var19 })
		}) else nil,
		Title = react.createElement(foundation.Text, {
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.XY,
			textStyle = var10.Color.Extended.Gray.Gray_100,
			fontStyle = var10.Typography.TitleMedium,
			backgroundStyle = var10.Color.None,
			Text = if fFlagIntroduceTopBannerPartyStatesModule then var18 else var11,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left
		}, {
			UIFlexItem = react.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
		}),
		Avatar = if fFlagIntroduceTopBannerPartyStatesModule or not var9 then nil else react.createElement(foundation.Image, {
			LayoutOrder = 3,
			Size = UDim2.fromOffset(24, 24),
			backgroundStyle = var10.Color.Extended.Gray.Gray_700,
			cornerRadius = UDim.new(0, var10.Radius.Circle),
			Image = getStandardSizeAvatarHeadShotRbxthumb(tostring(var9))
		})
	})
end

return react.memo(SquadTopBanner)