local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local SquadRootViewTypeModule = require(SquadsCore.Enums.SquadRootViewType)
local _ = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local _ = require(SquadsCore.Enums.SquadExperienceInviteSource)

return (require(Parent.React).createContext({
	showGroupOSADialog = nil,
	closeSquadPrompt = function() end,
	createConversation = function(_, _, _, _)
		-- upvalues: PromiseModule (copy)
		return function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject("No createConversation function supplied.")
		end
	end,
	createFriendConversation = function(_, _) end,
	createExperienceInvite = if require(Parent.SharedFlags).FFlagEnableSquadRegroupExperimentation then function(_, _)
		-- upvalues: PromiseModule (copy)
		return function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject("No createExperienceInvite function supplied.")
		end
	end else nil,
	disableSquadTopBanner = function(_, _) end,
	fetchParentChannelDetails = function(_, _)
		return nil
	end,
	fireSquadAnalytics = function(p1, p2)
		return p1, p2
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
	squadLocation = require(SquadsCore.Enums.SquadLocationEnum).Unknown,
	updateSquadViewFlags = function(_, _) end,
	useGetConversationFromId = function(_)
		return nil
	end,
	useIsChatEnabled = function(): boolean
		return false
	end,
	useIsLoadingChatSettings = function(): boolean
		return false
	end,
	useParentChannelHasGroupUp = function(_): boolean
		return false
	end,
	useParentChannelHasSquadAccess = function(_): boolean
		return false
	end,
	useParentChannelIsPartyVoiceEligible = function(_)
		return nil
	end,
	useParentChannelTitleSelector = function(_): string
		return ""
	end,
	useSquadRootView = function()
		-- upvalues: SquadRootViewTypeModule (copy)
		return SquadRootViewTypeModule.None
	end,
	useSquadTopBannerDisabled = function(): boolean
		return false
	end,
	useSquadViewFlags = function(): number
		return 0
	end,
	shouldShowOSAForConversation = function(): boolean
		return false
	end
}))