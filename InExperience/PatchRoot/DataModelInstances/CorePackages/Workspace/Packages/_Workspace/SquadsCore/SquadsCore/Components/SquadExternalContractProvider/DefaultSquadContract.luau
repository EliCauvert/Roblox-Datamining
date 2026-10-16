local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local PromiseModule = require(Parent.Promise)
local _ = require(SquadsCore.Enums.SquadExperienceInviteSource)
local SquadRootViewTypeModule = require(SquadsCore.Enums.SquadRootViewType)
local _ = require(script.Parent.SquadContractType)

return {
	closeSquadPrompt = function() --[[ Line: 16 ]] end,
	createConversation = function(_, _, _, _) --[[ Line: 19 ]]
		-- upvalues: PromiseModule (copy)
		return function(_) --[[ Line: 25 ]]
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject("No createConversation function supplied.")
		end
	end,
	createFriendConversation = function(_, _) --[[ Line: 29 ]] end,
	createExperienceInvite = if require(Parent.SharedFlags).FFlagEnableSquadRegroupExperimentation then function(_, _, _) --[[ Line: 33 ]]
		-- upvalues: PromiseModule (copy)
		return function(_) --[[ Line: 34 ]]
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject("No createExperienceInvite function supplied.")
		end
	end else nil,
	fetchParentChannelDetails = function(_, _) --[[ Line: 39 ]]
		return nil
	end,
	inviteToParentChannel = function(_, _, _) --[[ Line: 42 ]]
		return function(_) --[[ Line: 43 ]]
			return nil
		end
	end,
	navigateIntoSquadLobby = function(_, _) --[[ Line: 47 ]] end,
	removeUserFromParentChannel = function(_, _, _) --[[ Line: 50 ]]
		return function(_) --[[ Line: 51 ]]
			return nil
		end
	end,
	setSquadPrompt = function(_, _) --[[ Line: 55 ]] end,
	showSearchOverlay = function(_, _) --[[ Line: 58 ]] end,
	useIsChatEnabled = function(): boolean --[[ Line: 61 ]]
		return false
	end,
	useGetConversationFromId = function(_) --[[ Line: 64 ]]
		return nil
	end,
	useParentChannelHasGroupUp = function(_): boolean --[[ Line: 67 ]]
		return false
	end,
	useParentChannelHasSquadAccess = function(_): boolean --[[ Line: 70 ]]
		return false
	end,
	useParentChannelTitleSelector = function(_): string --[[ Line: 73 ]]
		return ""
	end,
	useParentChannelIsPartyVoiceEligible = function(_) --[[ Line: 76 ]]
		return nil
	end,
	useSquadRootView = function() --[[ Line: 79 ]]
		-- upvalues: SquadRootViewTypeModule (copy)
		return SquadRootViewTypeModule.None
	end,
	useSquadTopBannerManager = function() --[[ Line: 82 ]]
		return {
			disableSquadTopBanner = function(_, _) --[[ Line: 84 ]] end,
			useSquadTopBannerDisabled = function(): boolean --[[ Line: 85 ]]
				return false
			end
		}
	end,
	useIsChatUserMessagesEnabled = function(): boolean --[[ Line: 90 ]]
		return false
	end
}