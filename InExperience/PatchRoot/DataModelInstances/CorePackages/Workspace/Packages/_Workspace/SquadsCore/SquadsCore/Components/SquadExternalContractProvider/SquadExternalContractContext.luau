local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local SquadRootViewTypeModule = require(SquadsCore.Enums.SquadRootViewType)
local _ = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local _ = require(SquadsCore.Enums.SquadExperienceInviteSource)

return (require(Parent.React).createContext({
	showGroupOSADialog = nil,
	closeSquadPrompt = function() --[[ Line: 57 ]] end,
	createConversation = function(_, _, _, _) --[[ Line: 58 ]]
		-- upvalues: PromiseModule (copy)
		return function(_) --[[ Line: 64 ]]
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject("No createConversation function supplied.")
		end
	end,
	createFriendConversation = function(_, _) --[[ Line: 68 ]] end,
	createExperienceInvite = if require(Parent.SharedFlags).FFlagEnableSquadRegroupExperimentation then function(_, _) --[[ Line: 70 ]]
		-- upvalues: PromiseModule (copy)
		return function(_) --[[ Line: 71 ]]
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject("No createExperienceInvite function supplied.")
		end
	end else nil,
	disableSquadTopBanner = function(_, _) --[[ Line: 76 ]] end,
	fetchParentChannelDetails = function(_, _) --[[ Line: 77 ]]
		return nil
	end,
	fireSquadAnalytics = function(p1, p2) --[[ Line: 80 ]]
		return p1, p2
	end,
	inviteToParentChannel = function(_, _, _) --[[ Line: 83 ]]
		return nil
	end,
	navigateIntoSquadLobby = function(_, _) --[[ Line: 86 ]] end,
	removeUserFromParentChannel = function(_, _, _) --[[ Line: 87 ]]
		return nil
	end,
	setSquadPrompt = function(_, _) --[[ Line: 90 ]] end,
	showSearchOverlay = function(_, _) --[[ Line: 91 ]] end,
	squadLocation = require(SquadsCore.Enums.SquadLocationEnum).Unknown,
	updateSquadViewFlags = function(_, _) --[[ Line: 93 ]] end,
	useGetConversationFromId = function(_) --[[ Line: 94 ]]
		return nil
	end,
	useIsChatEnabled = function(): boolean --[[ Line: 97 ]]
		return false
	end,
	useIsLoadingChatSettings = function(): boolean --[[ Line: 100 ]]
		return false
	end,
	useParentChannelHasGroupUp = function(_): boolean --[[ Line: 103 ]]
		return false
	end,
	useParentChannelHasSquadAccess = function(_): boolean --[[ Line: 106 ]]
		return false
	end,
	useParentChannelIsPartyVoiceEligible = function(_) --[[ Line: 109 ]]
		return nil
	end,
	useParentChannelTitleSelector = function(_): string --[[ Line: 112 ]]
		return ""
	end,
	useSquadRootView = function() --[[ Line: 115 ]]
		-- upvalues: SquadRootViewTypeModule (copy)
		return SquadRootViewTypeModule.None
	end,
	useSquadTopBannerDisabled = function(): boolean --[[ Line: 118 ]]
		return false
	end,
	useSquadViewFlags = function(): number --[[ Line: 121 ]]
		return 0
	end,
	shouldShowOSAForConversation = function(): boolean --[[ Line: 124 ]]
		return false
	end
}))