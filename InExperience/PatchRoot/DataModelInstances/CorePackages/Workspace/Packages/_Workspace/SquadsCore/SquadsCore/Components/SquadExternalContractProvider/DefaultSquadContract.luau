local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local promiseModule = require(parent.Promise)
local _ = require(squadsCore.Enums.SquadExperienceInviteSource)
local squadRootViewTypeModule = require(squadsCore.Enums.SquadRootViewType)
local _ = require(script.Parent.SquadContractType)

return {
	closeSquadPrompt = function() end,
	createConversation = function(_, _, _, _)
		-- upvalues: promiseModule (ref)
		return function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.reject("No createConversation function supplied.")
		end
	end,
	createFriendConversation = function(_, _) end,
	createExperienceInvite = if require(parent.SharedFlags).FFlagEnableSquadRegroupExperimentation then function(_, _, _)
		-- upvalues: promiseModule (ref)
		return function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.reject("No createExperienceInvite function supplied.")
		end
	end else nil,
	fetchParentChannelDetails = function(_, _)
		return nil
	end,
	inviteToParentChannel = function(_, _, _)
		return function(_)
			return nil
		end
	end,
	navigateIntoSquadLobby = function(_, _) end,
	removeUserFromParentChannel = function(_, _, _)
		return function(_)
			return nil
		end
	end,
	setSquadPrompt = function(_, _) end,
	showSearchOverlay = function(_, _) end,
	useIsChatEnabled = function()
		return false
	end,
	useGetConversationFromId = function(_)
		return nil
	end,
	useParentChannelHasGroupUp = function(_)
		return false
	end,
	useParentChannelHasSquadAccess = function(_)
		return false
	end,
	useParentChannelTitleSelector = function(_)
		return ""
	end,
	useParentChannelIsPartyVoiceEligible = function(_)
		return nil
	end,
	useSquadRootView = function()
		-- upvalues: squadRootViewTypeModule (ref)
		return squadRootViewTypeModule.None
	end,
	useSquadTopBannerManager = function()
		return {
			disableSquadTopBanner = function(_, _) end,
			useSquadTopBannerDisabled = function()
				return false
			end
		}
	end,
	useIsChatUserMessagesEnabled = function()
		return false
	end
}