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

return function(p1)
	-- upvalues: reactModule (ref), squadViewFlagsModule (ref), fFlagEnableSquadTopBannerWideMode (ref), analyticsModule (ref), useCurrentSquadId (ref), cryoModule (ref), fFlagEnableSquadCoplayAnalytic (ref), fFlagEnableSquadRegroupExperimentation (ref), squadExternalContractContextModule (ref)
	local var1, var2 = reactModule.useState(squadViewFlagsModule.None)
	local var3 = if fFlagEnableSquadTopBannerWideMode then p1.contract.useSquadTopBannerManager() else reactModule.useMemo(function()
		return {
			disableSquadTopBanner = function(_, _) end,
			useSquadTopBannerDisabled = function()
				return false
			end
		}
	end, {})
	local var4 = reactModule.useMemo(analyticsModule.Analytics, {})
	local var5 = useCurrentSquadId()
	local t = {
		closeSquadPrompt = p1.contract.closeSquadPrompt,
		createFriendConversation = p1.contract.createFriendConversation,
		createConversation = p1.contract.createConversation,
		disableSquadTopBanner = var3.disableSquadTopBanner,
		fetchParentChannelDetails = p1.contract.fetchParentChannelDetails,
		fireSquadAnalytics = reactModule.useCallback(function(p2, p3)
			-- upvalues: cryoModule (copy), var5 (ref), p1 (ref), var4 (ref)
			var4.fireAnalyticsEvent(p2, cryoModule.Dictionary.join(p3, { squadId = var5, squadLocation = p1.squadLocation }))
		end, { var5, p1.squadLocation }),
		inviteToParentChannel = p1.contract.inviteToParentChannel,
		navigateIntoSquadLobby = p1.contract.navigateIntoSquadLobby,
		removeUserFromParentChannel = p1.contract.removeUserFromParentChannel,
		setSquadPrompt = p1.contract.setSquadPrompt,
		showSearchOverlay = p1.contract.showSearchOverlay,
		squadLocation = if fFlagEnableSquadCoplayAnalytic then p1.squadLocation else nil,
		updateSquadViewFlags = reactModule.useCallback(function(p2, p3)
			-- upvalues: var2 (ref)
			if p3 then
				var2(function(p4)
					-- upvalues: p2 (ref)
					return bit32.bor(p4, p2)
				end)
				
				return
			end
			var2(function(p4)
				-- upvalues: p2 (ref)
				return bit32.band(p4, bit32.bnot(p2))
			end)
		end, {}),
		useGetConversationFromId = p1.contract.useGetConversationFromId,
		useIsChatUserMessagesEnabled = p1.contract.useIsChatUserMessagesEnabled,
		useParentChannelHasGroupUp = p1.contract.useParentChannelHasGroupUp,
		useParentChannelHasSquadAccess = p1.contract.useParentChannelHasSquadAccess,
		useParentChannelIsPartyVoiceEligible = p1.contract.useParentChannelIsPartyVoiceEligible,
		useParentChannelTitleSelector = p1.contract.useParentChannelTitleSelector,
		useSquadRootView = p1.contract.useSquadRootView,
		useSquadTopBannerDisabled = var3.useSquadTopBannerDisabled,
		useIsChatEnabled = p1.contract.useIsChatEnabled,
		useIsLoadingChatSettings = p1.contract.useIsLoadingChatSettings,
		useSquadViewFlags = reactModule.useCallback(function()
			-- upvalues: var1 (ref)
			return var1
		end, { var1 }),
		shouldShowOSAForConversation = p1.contract.shouldShowOSAForConversation,
		showGroupOSADialog = p1.contract.showGroupOSADialog
	}
	
	if fFlagEnableSquadRegroupExperimentation and p1.contract.createExperienceInvite then
		function t.createExperienceInvite(p2, p3)
			-- upvalues: p1 (ref), t (ref)
			return p1.contract.createExperienceInvite(p2, t, p3)
		end
	end
	return reactModule.createElement(squadExternalContractContextModule.Provider, { value = t }, p1.children)
end