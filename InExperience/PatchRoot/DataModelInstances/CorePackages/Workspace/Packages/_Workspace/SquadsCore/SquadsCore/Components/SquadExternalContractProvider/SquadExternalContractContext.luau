local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local squadLocationEnumModule = require(squadsCore.Enums.SquadLocationEnum)
local squadRootViewTypeModule = require(squadsCore.Enums.SquadRootViewType)
local _ = require(parent.LuauPolyfill)
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(squadsCore.Enums.SquadExperienceInviteSource)

return reactModule.createContext({
	showGroupOSADialog = nil,
	closeSquadPrompt = function() --[[ line: 58 ]] end,
	createConversation = function(_, _, _, _) --[[ line: 59 ]]
		-- upvalues: promiseModule (ref)
		return function(_) --[[ line: 65 ]]
			-- upvalues: promiseModule (copy)
			return promiseModule.reject("No createConversation function supplied.")
		end
	end,
	createFriendConversation = function(_, _) --[[ line: 69 ]] end,
	createExperienceInvite = if sharedFlagsModule.FFlagEnableSquadRegroupExperimentation then function(_, _) --[[ line: 71 ]]
		-- upvalues: promiseModule (ref)
		return function(_) --[[ line: 72 ]]
			-- upvalues: promiseModule (copy)
			return promiseModule.reject("No createExperienceInvite function supplied.")
		end
	end else nil,
	disableSquadTopBanner = function(_, _) --[[ line: 77 ]] end,
	fetchParentChannelDetails = function(_, _) --[[ line: 78 ]]
		return nil
	end,
	fireSquadAnalytics = function(p0, p1) --[[ line: 81 ]]
		return p0, p1
	end,
	inviteToParentChannel = function(_, _, _) --[[ line: 84 ]]
		return nil
	end,
	navigateIntoSquadLobby = function(_, _) --[[ line: 87 ]] end,
	removeUserFromParentChannel = function(_, _, _) --[[ line: 88 ]]
		return nil
	end,
	setSquadPrompt = function(_, _) --[[ line: 91 ]] end,
	showSearchOverlay = function(_, _) --[[ line: 92 ]] end,
	squadLocation = if sharedFlagsModule.FFlagEnableSquadCoplayAnalytic then squadLocationEnumModule.Unknown else nil,
	updateSquadViewFlags = function(_, _) --[[ line: 94 ]] end,
	useGetConversationFromId = function(_) --[[ line: 95 ]]
		return nil
	end,
	useIsChatEnabled = function() --[[ line: 98 ]]
		return false
	end,
	useIsLoadingChatSettings = function() --[[ line: 101 ]]
		return false
	end,
	useParentChannelHasGroupUp = function(_) --[[ line: 104 ]]
		return false
	end,
	useParentChannelHasSquadAccess = function(_) --[[ line: 107 ]]
		return false
	end,
	useParentChannelIsPartyVoiceEligible = function(_) --[[ line: 110 ]]
		return nil
	end,
	useParentChannelTitleSelector = function(_) --[[ line: 113 ]]
		return ""
	end,
	useSquadRootView = function() --[[ line: 116 ]]
		-- upvalues: squadRootViewTypeModule (ref)
		return squadRootViewTypeModule.None
	end,
	useSquadTopBannerDisabled = function() --[[ line: 119 ]]
		return false
	end,
	useSquadViewFlags = function() --[[ line: 122 ]]
		return 0
	end,
	shouldShowOSAForConversation = function() --[[ line: 125 ]]
		return false
	end
})