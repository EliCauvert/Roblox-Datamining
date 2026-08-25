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
	closeSquadPrompt = function() end,
	createConversation = function(_, _, _, _)
		-- upvalues: promiseModule (ref)
		return function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.reject("No createConversation function supplied.")
		end
	end,
	createFriendConversation = function(_, _) end,
	createExperienceInvite = if sharedFlagsModule.FFlagEnableSquadRegroupExperimentation then function(_, _)
		-- upvalues: promiseModule (ref)
		return function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.reject("No createExperienceInvite function supplied.")
		end
	end else nil,
	disableSquadTopBanner = function(_, _) end,
	fetchParentChannelDetails = function(_, _)
		return nil
	end,
	fireSquadAnalytics = function(p0, p1)
		return p0, p1
	end,
	inviteToParentChannel = function(_, _, _)
		return nil
	end,
	navigateIntoSquadLobby = function(_, _) end,
	removeUserFromParentChannel = function(_, _, _)
		return nil
	end,
	setSquadPrompt = function(_, _) end,
	showSearchOverlay = function(_, _) end,
	squadLocation = if sharedFlagsModule.FFlagEnableSquadCoplayAnalytic then squadLocationEnumModule.Unknown else nil,
	updateSquadViewFlags = function(_, _) end,
	useGetConversationFromId = function(_)
		return nil
	end,
	useIsChatEnabled = function()
		return false
	end,
	useIsLoadingChatSettings = function()
		return false
	end,
	useParentChannelHasGroupUp = function(_)
		return false
	end,
	useParentChannelHasSquadAccess = function(_)
		return false
	end,
	useParentChannelIsPartyVoiceEligible = function(_)
		return nil
	end,
	useParentChannelTitleSelector = function(_)
		return ""
	end,
	useSquadRootView = function()
		-- upvalues: squadRootViewTypeModule (ref)
		return squadRootViewTypeModule.None
	end,
	useSquadTopBannerDisabled = function()
		return false
	end,
	useSquadViewFlags = function()
		return 0
	end,
	shouldShowOSAForConversation = function()
		return false
	end
})