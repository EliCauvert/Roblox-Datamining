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
local var1 = if getFFlagEnableCrossExpVoice() then require(parent.CrossExperienceVoice).Hooks.useLastActiveParticipant else nil

function SquadTopBanner(p1)
	-- upvalues: react (ref), squadCoordinationUIChangesExperimentation (ref), fFlagIntroduceTopBannerPartyStatesModule (ref), getFFlagEnableCrossExpVoice (ref), var1 (write), useTokens (ref), useCurrentSquadParentChannelId (ref), squadExternalContractContext (ref), useLocalUserId (ref), constantsModule (ref), userProfilesModule (ref), useLocalization (ref), cryoModule (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), foundation (ref), fFlagDebugAppChatEnableDomLocators (ref), view (ref), horizontalFacepileGroupModule (ref)
	local var2
	react.useEffect(function()
		-- upvalues: squadCoordinationUIChangesExperimentation (copy)
		squadCoordinationUIChangesExperimentation.logExposure()
	end, {})
	local var3 = if fFlagIntroduceTopBannerPartyStatesModule and getFFlagEnableCrossExpVoice() then var1() else nil
	local var4 = if var3 then var3.userId else nil
	local var5 = useTokens()
	local var6 = if fFlagIntroduceTopBannerPartyStatesModule then "" else (if fFlagIntroduceTopBannerPartyStatesModule then nil else react.useContext(squadExternalContractContext)).useParentChannelTitleSelector((if fFlagIntroduceTopBannerPartyStatesModule then nil else useCurrentSquadParentChannelId()) or "") or ""
	local var7 = useLocalUserId()
	local data = nil
	local _ = false
	local var8 = react.useMemo(function()
		-- upvalues: p1 (ref), constantsModule (copy), var7 (ref)
		if p1.parentChannelType == constantsModule.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and p1.parentChannelParticipants then
			for i, v in ipairs(p1.parentChannelParticipants) do
				if v ~= var7 then
					return v
				end
			end
		end
		return ""
	end, {
		p1.parentChannelParticipants,
		p1.parentChannelType,
		var7
	})
	local useUserProfilesFetch = userProfilesModule.Hooks.useUserProfilesFetch
	local t = {}
	
	if var8 ~= "" then
		var2 = { var8 } or {}
	end
	t.userIds = var2
	t.query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	useUserProfilesFetch = useUserProfilesFetch(t)
	
	if useUserProfilesFetch.data then
		data = userProfilesModule.Selectors.getCombinedNameFromId(useUserProfilesFetch.data, var8 or "") or ""
	end
	local var9 = if p1.parentChannelType then p1.parentChannelType == constantsModule.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and (var8 ~= "" and not data) else not p1.parentChannelType
	local var10 = nil
	local var11 = nil
	
	if fFlagIntroduceTopBannerPartyStatesModule then
		local var12 = useLocalization({
			waitingForOthers = "Feature.Squads.Label.WaitingForOthers",
			numberInTheParty = "Feature.Squads.Label.PartyCountStatus",
			loading = "Feature.Squads.Label.Loading",
			waitingForCombinedName = "Feature.Squads.Label.WaitingForCombinedName"
		})
		var10 = react.useMemo(function()
			-- upvalues: var9 (write), var12 (ref), p1 (ref), constantsModule (copy), data (write)
			return if var9 then var12.loading elseif p1.parentChannelType == constantsModule.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and data and #p1.squadMemberList < 2 then var12.waitingForCombinedName:gsub("{(.-)}", { combinedName = data }) elseif p1.parentChannelType == constantsModule.CONVERSATION_CHANNEL_GROUP_TYPE and #p1.squadMemberList < 2 then var12.waitingForOthers else var12.numberInTheParty:gsub("{(.-)}", { partyCount = tostring(#p1.squadMemberList) })
		end, {
			var9,
			var12,
			data,
			p1.parentChannelType,
			p1.squadMemberList
		})
		local var13 = react.useCallback(function()
			-- upvalues: var7 (ref), p1 (ref)
			local t = {}
			
			if var7 == "-1" or not p1.squadMemberList then
				return t
			end
			for i, v in ipairs(p1.squadMemberList) do
				if tostring(v) ~= var7 then
					table.insert(t, tostring(v))
				end
			end
			table.insert(t, var7)
			
			return t
		end, { p1.squadMemberList })
		var11 = react.useMemo(function()
			-- upvalues: var13 (ref), cryoModule (copy), getStandardSizeAvatarHeadShotRbxthumb (copy)
			return cryoModule.List.map(var13(), function(p2)
				-- upvalues: getStandardSizeAvatarHeadShotRbxthumb (copy)
				return getStandardSizeAvatarHeadShotRbxthumb(p2)
			end)
		end, { var13 })
	end
	return react.createElement(foundation.View, {
		Size = UDim2.new(1, 0, 1, 0),
		backgroundStyle = var5.Color.None,
		testId = if fFlagDebugAppChatEnableDomLocators then constantsModule.SQUAD_TOP_BANNER_TEST_ID else nil,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, var5.Gap.Small),
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
				style = var5.Color.Extended.Gray.Gray_100
			})
		}) else nil,
		HorizontalFacepileGroup = if fFlagIntroduceTopBannerPartyStatesModule then react.createElement(view, {
			tag = "auto-xy",
			BackgroundTransparency = 1,
			LayoutOrder = 1
		}, {
			react.createElement(horizontalFacepileGroupModule, { avatarSize = var5.Size.Size_600, images = var11 })
		}) else nil,
		Title = react.createElement(foundation.Text, {
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.XY,
			textStyle = var5.Color.Extended.Gray.Gray_100,
			fontStyle = var5.Typography.TitleMedium,
			backgroundStyle = var5.Color.None,
			Text = if fFlagIntroduceTopBannerPartyStatesModule then var10 else var6,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left
		}, {
			UIFlexItem = react.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
		}),
		Avatar = if fFlagIntroduceTopBannerPartyStatesModule or not var4 then nil else react.createElement(foundation.Image, {
			LayoutOrder = 3,
			Size = UDim2.fromOffset(24, 24),
			backgroundStyle = var5.Color.Extended.Gray.Gray_700,
			cornerRadius = UDim.new(0, var5.Radius.Circle),
			Image = getStandardSizeAvatarHeadShotRbxthumb(tostring(var4))
		})
	})
end

return react.memo(SquadTopBanner)