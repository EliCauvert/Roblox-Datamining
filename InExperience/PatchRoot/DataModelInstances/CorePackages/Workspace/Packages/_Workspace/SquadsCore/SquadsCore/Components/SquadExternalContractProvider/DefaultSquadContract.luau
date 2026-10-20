local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local PromiseModule = require(Parent.Promise)
local _ = require(SquadsCore.Enums.SquadExperienceInviteSource)
local SquadRootViewTypeModule = require(SquadsCore.Enums.SquadRootViewType)
local _ = require(script.Parent.SquadContractType)

return {
	closeSquadPrompt = function() end,
	createConversation = function(_, _, _, _)
		-- upvalues: PromiseModule (copy)
		return function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject("No createConversation function supplied.")
		end
	end,
	createFriendConversation = function(_, _) end,
	createExperienceInvite = if require(Parent.SharedFlags).FFlagEnableSquadRegroupExperimentation then function(_, _, _)
		-- upvalues: PromiseModule (copy)
		return function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject("No createExperienceInvite function supplied.")
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
	useIsChatEnabled = function(): boolean
		return false
	end,
	useGetConversationFromId = function(_)
		return nil
	end,
	useParentChannelHasGroupUp = function(_): boolean
		return false
	end,
	useParentChannelHasSquadAccess = function(_): boolean
		return false
	end,
	useParentChannelTitleSelector = function(_): string
		return ""
	end,
	useParentChannelIsPartyVoiceEligible = function(_)
		return nil
	end,
	useSquadRootView = function()
		-- upvalues: SquadRootViewTypeModule (copy)
		return SquadRootViewTypeModule.None
	end,
	useSquadTopBannerManager = function()
		return {
			disableSquadTopBanner = function(_, _) end,
			useSquadTopBannerDisabled = function(): boolean
				return false
			end
		}
	end,
	useIsChatUserMessagesEnabled = function(): boolean
		return false
	end
}