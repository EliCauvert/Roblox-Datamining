local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local squadExternalContractContextModule = require(script.Parent.SquadExternalContractContext)
local _ = require(script.Parent.SquadContractType)
local squadViewFlagsModule = require(script.Parent.SquadViewFlags)
local analyticsModule = require(squadsCore.Analytics)
local _ = require(squadsCore.Enums.SquadLocationEnum)
local _ = require(squadsCore.Enums.SquadExperienceInviteSource)
local useCurrentSquadId = require(squadsCore.Hooks).useCurrentSquadId
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableSquadTopBannerWideMode = sharedFlagsModule.FFlagEnableSquadTopBannerWideMode
local fFlagEnableSquadCoplayAnalytic = sharedFlagsModule.FFlagEnableSquadCoplayAnalytic
local fFlagEnableSquadRegroupExperimentation = sharedFlagsModule.FFlagEnableSquadRegroupExperimentation

return function(p0) --[[ line: 30 ]]
	-- upvalues: reactModule (ref), squadViewFlagsModule (ref), fFlagEnableSquadTopBannerWideMode (ref), analyticsModule (ref), useCurrentSquadId (ref), cryoModule (ref), fFlagEnableSquadCoplayAnalytic (ref), fFlagEnableSquadRegroupExperimentation (ref), squadExternalContractContextModule (ref)
	local var7, var8 = reactModule.useState(squadViewFlagsModule.None)
	local var9 = if fFlagEnableSquadTopBannerWideMode then p0.contract.useSquadTopBannerManager() else reactModule.useMemo(function() --[[ line: 35 ]]
		return {
			disableSquadTopBanner = function(_, _) --[[ line: 37 ]] end,
			useSquadTopBannerDisabled = function() --[[ line: 38 ]]
				return false
			end
		}
	end, {})
	local var10 = reactModule.useMemo(analyticsModule.Analytics, {})
	local var11 = useCurrentSquadId()
	local t = {
		closeSquadPrompt = p0.contract.closeSquadPrompt,
		createFriendConversation = p0.contract.createFriendConversation,
		createConversation = p0.contract.createConversation,
		disableSquadTopBanner = var9.disableSquadTopBanner,
		fetchParentChannelDetails = p0.contract.fetchParentChannelDetails,
		fireSquadAnalytics = reactModule.useCallback(function(p1, p2) --[[ line: 46 ]]
			-- upvalues: cryoModule (copy), var11 (ref), p0 (ref), var10 (ref)
			var10.fireAnalyticsEvent(p1, cryoModule.Dictionary.join(p2, { squadId = var11, squadLocation = p0.squadLocation }))
		end, { var11, p0.squadLocation }),
		inviteToParentChannel = p0.contract.inviteToParentChannel,
		navigateIntoSquadLobby = p0.contract.navigateIntoSquadLobby,
		removeUserFromParentChannel = p0.contract.removeUserFromParentChannel,
		setSquadPrompt = p0.contract.setSquadPrompt,
		showSearchOverlay = p0.contract.showSearchOverlay,
		squadLocation = if fFlagEnableSquadCoplayAnalytic then p0.squadLocation else nil,
		updateSquadViewFlags = reactModule.useCallback(function(p3, p4) --[[ line: 69 ]]
			-- upvalues: var8 (ref)
			if p4 then
				var8(function(p5) --[[ line: 71 ]]
					-- upvalues: p3 (ref)
					return bit32.bor(p5, p3)
				end)
				
				return
			end
			var8(function(p6) --[[ line: 75 ]]
				-- upvalues: p3 (ref)
				return bit32.band(p6, bit32.bnot(p3))
			end)
		end, {}),
		useGetConversationFromId = p0.contract.useGetConversationFromId,
		useIsChatUserMessagesEnabled = p0.contract.useIsChatUserMessagesEnabled,
		useParentChannelHasGroupUp = p0.contract.useParentChannelHasGroupUp,
		useParentChannelHasSquadAccess = p0.contract.useParentChannelHasSquadAccess,
		useParentChannelIsPartyVoiceEligible = p0.contract.useParentChannelIsPartyVoiceEligible,
		useParentChannelTitleSelector = p0.contract.useParentChannelTitleSelector,
		useSquadRootView = p0.contract.useSquadRootView,
		useSquadTopBannerDisabled = var9.useSquadTopBannerDisabled,
		useIsChatEnabled = p0.contract.useIsChatEnabled,
		useIsLoadingChatSettings = p0.contract.useIsLoadingChatSettings,
		useSquadViewFlags = reactModule.useCallback(function() --[[ line: 90 ]]
			-- upvalues: var7 (ref)
			return var7
		end, { var7 }),
		shouldShowOSAForConversation = p0.contract.shouldShowOSAForConversation,
		showGroupOSADialog = p0.contract.showGroupOSADialog
	}
	
	if fFlagEnableSquadRegroupExperimentation and p0.contract.createExperienceInvite then
		function t.createExperienceInvite(p7, p8) --[[ line: 98 ]]
			-- upvalues: p0 (ref), t (ref)
			return p0.contract.createExperienceInvite(p7, t, p8)
		end
	end
	return reactModule.createElement(squadExternalContractContextModule.Provider, { value = t }, p0.children)
end