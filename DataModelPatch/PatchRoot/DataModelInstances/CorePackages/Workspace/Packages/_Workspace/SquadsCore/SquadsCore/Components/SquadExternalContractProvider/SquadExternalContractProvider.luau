local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local SquadExternalContractContextModule = require(script.Parent.SquadExternalContractContext)
local _ = require(script.Parent.SquadContractType)
local SquadViewFlagsModule = require(script.Parent.SquadViewFlags)
local AnalyticsModule = require(SquadsCore.Analytics)
local _ = require(SquadsCore.Enums.SquadLocationEnum)
local _ = require(SquadsCore.Enums.SquadExperienceInviteSource)
local UseCurrentSquadIdFunction = require(SquadsCore.Hooks).useCurrentSquadId
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableSquadTopBannerWideMode = SharedFlagsModule.FFlagEnableSquadTopBannerWideMode
local FFlagEnableSquadCoplayAnalytic = SharedFlagsModule.FFlagEnableSquadCoplayAnalytic
local FFlagEnableSquadRegroupExperimentation = SharedFlagsModule.FFlagEnableSquadRegroupExperimentation

return function(p1)
	-- upvalues: ReactModule (copy), SquadViewFlagsModule (copy), FFlagEnableSquadTopBannerWideMode (copy), AnalyticsModule (copy), UseCurrentSquadIdFunction (copy), CryoModule (copy), FFlagEnableSquadCoplayAnalytic (copy), FFlagEnableSquadRegroupExperimentation (copy), SquadExternalContractContextModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(SquadViewFlagsModule.None)
	local UseSquadTopBannerManagerResult = if FFlagEnableSquadTopBannerWideMode then p1.contract.useSquadTopBannerManager() else ReactModule.useMemo(function()
		return {
			disableSquadTopBanner = function(_, _) end,
			useSquadTopBannerDisabled = function(): boolean
				return false
			end
		}
	end, {})
	local UseMemoResult = ReactModule.useMemo(AnalyticsModule.Analytics, {})
	local UseCurrentSquadIdResult = UseCurrentSquadIdFunction()
	local config = {
		closeSquadPrompt = p1.contract.closeSquadPrompt,
		createFriendConversation = p1.contract.createFriendConversation,
		createConversation = p1.contract.createConversation,
		disableSquadTopBanner = UseSquadTopBannerManagerResult.disableSquadTopBanner,
		fetchParentChannelDetails = p1.contract.fetchParentChannelDetails,
		fireSquadAnalytics = ReactModule.useCallback(function(p2, p3)
			-- upvalues: CryoModule (upval), UseCurrentSquadIdResult (copy), p1 (copy), UseMemoResult (copy)
			UseMemoResult.fireAnalyticsEvent(p2, (CryoModule.Dictionary.join(p3, {
				squadId = UseCurrentSquadIdResult,
				squadLocation = p1.squadLocation
			})))
		end, { UseCurrentSquadIdResult, p1.squadLocation }),
		inviteToParentChannel = p1.contract.inviteToParentChannel,
		navigateIntoSquadLobby = p1.contract.navigateIntoSquadLobby,
		removeUserFromParentChannel = p1.contract.removeUserFromParentChannel,
		setSquadPrompt = p1.contract.setSquadPrompt,
		showSearchOverlay = p1.contract.showSearchOverlay,
		squadLocation = if FFlagEnableSquadCoplayAnalytic then p1.squadLocation else nil,
		updateSquadViewFlags = ReactModule.useCallback(function(Mask, p2)
			-- upvalues: UseStateResult2 (copy)
			if p2 then
				UseStateResult2(function(Value: number): number
					-- upvalues: Mask (copy)
					return (bit32.bor(Value, Mask))
				end)
				
				return
			else
				UseStateResult2(function(Value: number): number
					-- upvalues: Mask (copy)
					return (bit32.band(Value, (bit32.bnot(Mask))))
				end)
			end
		end, {}),
		useGetConversationFromId = p1.contract.useGetConversationFromId,
		useIsChatUserMessagesEnabled = p1.contract.useIsChatUserMessagesEnabled,
		useParentChannelHasGroupUp = p1.contract.useParentChannelHasGroupUp,
		useParentChannelHasSquadAccess = p1.contract.useParentChannelHasSquadAccess,
		useParentChannelIsPartyVoiceEligible = p1.contract.useParentChannelIsPartyVoiceEligible,
		useParentChannelTitleSelector = p1.contract.useParentChannelTitleSelector,
		useSquadRootView = p1.contract.useSquadRootView,
		useSquadTopBannerDisabled = UseSquadTopBannerManagerResult.useSquadTopBannerDisabled,
		useIsChatEnabled = p1.contract.useIsChatEnabled,
		useIsLoadingChatSettings = p1.contract.useIsLoadingChatSettings,
		useSquadViewFlags = ReactModule.useCallback(function()
			-- upvalues: UseStateResult (copy)
			return UseStateResult
		end, { UseStateResult }),
		shouldShowOSAForConversation = p1.contract.shouldShowOSAForConversation,
		showGroupOSADialog = p1.contract.showGroupOSADialog
	}
	
	if FFlagEnableSquadRegroupExperimentation and p1.contract.createExperienceInvite then
		function config.createExperienceInvite(p2, p3)
			-- upvalues: p1 (copy), config (copy)
			return p1.contract.createExperienceInvite(p2, config, p3)
		end
	end
	return ReactModule.createElement(SquadExternalContractContextModule.Provider, { value = config }, p1.children)
end