local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local Llama = require(CorePackages.Packages.LuaSocialLibrariesDeps).llama
local RoactModule = require(Modules.Common.Roact)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local FriendshipCreatedModule = require(Modules.LuaApp.Thunks.FriendshipCreated)
local FriendshipDestroyedModule = require(Modules.LuaApp.Thunks.FriendshipDestroyed)
local EventNetworkingModule = require(script.Parent.EventNetworking)
local UseHandleFriendshipEventFunction = require(CorePackages.Workspace.Packages.FriendsCommon).Hooks.useHandleFriendshipEvent
local GetUnreadConversationCount = require(CorePackages.Workspace.Packages.SocialTabState).Requests.GetUnreadConversationCount
local FriendshipEventReceiver = RoactModule.Component:extend("FriendshipEventReceiver")

function FriendshipEventReceiver.init(p1)
	local FriendshipCreatedFunction = p1.props.friendshipCreated
	local FriendshipDestroyedFunction = p1.props.friendshipDestroyed
	local Networking = p1.props.networking
	p1.tokens = {
		p1.props.RobloxEventReceiver:observeEvent("FriendshipNotifications", function(p2)
			-- upvalues: p1 (copy), FriendshipDestroyedFunction (copy), FriendshipCreatedFunction (copy), Networking (copy)
			local Text = tostring(p1.props.localUserId)
			
			if p2.Type == "FriendshipDestroyed" then
				local Text1: string = Text == tostring(p2.EventArgs.UserId1) and tostring(p2.EventArgs.UserId2) or tostring(p2.EventArgs.UserId1)
				p1.props.fetchFriendCount(Text)
				FriendshipDestroyedFunction({ otherUser = Text1, localUserId = Text })
				p1.props.handleFriendshipEvent({ removedUserId = Text1 })
				p1.props.fetchGetUnreadConversationCount()
				
				return
			end
			if p2.Type == "FriendshipCreated" then
				local Text2: string = Text == tostring(p2.EventArgs.UserId1) and tostring(p2.EventArgs.UserId2) or tostring(p2.EventArgs.UserId1)
				p1.props.fetchFriendCount(Text)
				FriendshipCreatedFunction(Networking, Text2)
				p1.props.handleFriendshipEvent({ addedUserId = Text2 })
				p1.props.fetchGetUnreadConversationCount()
			end
		end)
	}
end

function FriendshipEventReceiver:render() end

function FriendshipEventReceiver.willUnmount(p1)
	for _, token in pairs(p1.tokens) do
		token:disconnect()
	end
end

local v1 = RoactServices.connect({ networking = RoactNetworkingModule })((RoactRoduxModule.connect(function(p2)
	return { localUserId = p2.LocalUserId }
end, function(Callback)
	-- upvalues: EventNetworkingModule (copy), FriendshipDestroyedModule (copy), FriendshipCreatedModule (copy), GetUnreadConversationCount (copy)
	return {
		friendshipCreated = function(...)
			-- upvalues: Callback (copy), FriendshipCreatedModule (upval)
			return Callback(FriendshipCreatedModule(...))
		end,
		friendshipDestroyed = function(p2)
			-- upvalues: Callback (copy), EventNetworkingModule (upval), FriendshipDestroyedModule (upval)
			Callback(EventNetworkingModule.RoduxFriends.Actions.FriendshipDestroyed(p2.otherUser, p2.localUserId))
			
			return Callback(FriendshipDestroyedModule(p2.otherUser))
		end,
		fetchFriendCount = function(p2)
			-- upvalues: Callback (copy), EventNetworkingModule (upval)
			Callback(EventNetworkingModule.FriendsNetworking.GetFriendsCountFromUserId.API(p2))
		end,
		fetchGetUnreadConversationCount = function()
			-- upvalues: Callback (copy), GetUnreadConversationCount (upval)
			Callback(GetUnreadConversationCount.API())
		end
	}
end)(FriendshipEventReceiver)))

return function(p2)
	-- upvalues: UseHandleFriendshipEventFunction (copy), RoactModule (copy), v1 (ref), Llama (copy)
	return RoactModule.createElement(v1, Llama.Dictionary.join(p2, {
		handleFriendshipEvent = UseHandleFriendshipEventFunction()
	}))
end