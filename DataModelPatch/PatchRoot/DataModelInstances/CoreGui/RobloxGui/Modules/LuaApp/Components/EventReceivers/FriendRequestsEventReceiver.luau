local CorePackages = game:GetService("CorePackages")
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local EventNetworkingModule = require(script.Parent.EventNetworking)

local function _(p1)
	return ({
		FriendshipRequested = true,
		FriendshipDeclined = true,
		FriendshipCreated = true
	})[p1]
end

local FriendRequestsEventReceiver = require(CorePackages.Packages.Roact).PureComponent:extend("FriendRequestsEventReceiver")

function FriendRequestsEventReceiver.init(p1)
	-- upvalues: EventNetworkingModule (copy)
	p1.tokens = {
		p1.props.RobloxEventReceiver:observeEvent("FriendshipNotifications", function(p2)
			-- upvalues: p1 (copy), EventNetworkingModule (upval)
			if ({
				FriendshipRequested = true,
				FriendshipDeclined = true,
				FriendshipCreated = true
			})[p2.Type] and not p1.props.friendRequestCountStatus ~= EventNetworkingModule.RoduxNetworking.Enum.NetworkStatus.Fetching then
				p1.props.dispatchFetchFriendRequestsCount(p1.props.localUserId)
				p1.props.updateNewFriendRequestsCount(p1.props.localUserId)
			end
		end)
	}
end

function FriendRequestsEventReceiver:render()
	return nil
end

function FriendRequestsEventReceiver.willUnmount(p1)
	for _, token in pairs(p1.tokens) do
		token:disconnect()
	end
end

return RoactRoduxModule.connect(function(p2)
	-- upvalues: EventNetworkingModule (copy)
	return {
		localUserId = p2.LocalUserId,
		friendRequestCountStatus = EventNetworkingModule.FriendsNetworking.GetFriendRequestsCount.getStatus(p2)
	}
end, function(Callback, _)
	-- upvalues: EventNetworkingModule (copy)
	return {
		dispatchFetchFriendRequestsCount = function(p2)
			-- upvalues: Callback (copy), EventNetworkingModule (upval)
			return Callback(EventNetworkingModule.FriendsNetworking.GetFriendRequestsCount.API(p2))
		end,
		updateNewFriendRequestsCount = function(p2)
			-- upvalues: Callback (copy), EventNetworkingModule (upval)
			return Callback(EventNetworkingModule.FriendsNetworking.GetNewFriendRequestsCount.API(p2))
		end
	}
end)(FriendRequestsEventReceiver)