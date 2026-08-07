local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local promiseModule = require(parent.Promise)
local _ = require(squadsCore.Enums.SquadExperienceInviteSource)
local squadRootViewTypeModule = require(squadsCore.Enums.SquadRootViewType)
local _ = require(script.Parent.SquadContractType)

return {
	closeSquadPrompt = function() --[[ line: 16 ]] end,
	createConversation = function(_, _, _, _) --[[ line: 19 ]]
		-- upvalues: promiseModule (ref)
		return function(_) --[[ line: 25 ]]
			-- upvalues: promiseModule (copy)
			return promiseModule.reject("No createConversation function supplied.")
		end
	end,
	createFriendConversation = function(_, _) --[[ line: 29 ]] end,
	createExperienceInvite = if require(parent.SharedFlags).FFlagEnableSquadRegroupExperimentation then function(_, _, _) --[[ line: 33 ]]
		-- upvalues: promiseModule (ref)
		return function(_) --[[ line: 34 ]]
			-- upvalues: promiseModule (copy)
			return promiseModule.reject("No createExperienceInvite function supplied.")
		end
	end else nil,
	fetchParentChannelDetails = function(_, _) --[[ line: 39 ]]
		return nil
	end,
	inviteToParentChannel = function(_, _, _) --[[ line: 42 ]]
		return function(_) --[[ line: 43 ]]
			return nil
		end
	end,
	navigateIntoSquadLobby = function(_, _) --[[ line: 47 ]] end,
	removeUserFromParentChannel = function(_, _, _) --[[ line: 50 ]]
		return function(_) --[[ line: 51 ]]
			return nil
		end
	end,
	setSquadPrompt = function(_, _) --[[ line: 55 ]] end,
	showSearchOverlay = function(_, _) --[[ line: 58 ]] end,
	useIsChatEnabled = function() --[[ line: 61 ]]
		return false
	end,
	useGetConversationFromId = function(_) --[[ line: 64 ]]
		return nil
	end,
	useParentChannelHasGroupUp = function(_) --[[ line: 67 ]]
		return false
	end,
	useParentChannelHasSquadAccess = function(_) --[[ line: 70 ]]
		return false
	end,
	useParentChannelTitleSelector = function(_) --[[ line: 73 ]]
		return ""
	end,
	useParentChannelIsPartyVoiceEligible = function(_) --[[ line: 76 ]]
		return nil
	end,
	useSquadRootView = function() --[[ line: 79 ]]
		-- upvalues: squadRootViewTypeModule (ref)
		return squadRootViewTypeModule.None
	end,
	useSquadTopBannerManager = function() --[[ line: 82 ]]
		return {
			disableSquadTopBanner = function(_, _) --[[ line: 84 ]] end,
			useSquadTopBannerDisabled = function() --[[ line: 85 ]]
				return false
			end
		}
	end,
	useIsChatUserMessagesEnabled = function() --[[ line: 90 ]]
		return false
	end
}