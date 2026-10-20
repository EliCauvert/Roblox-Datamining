local DependenciesModule = require(script.Parent.dependencies)
local RoactRodux = DependenciesModule.RoactRodux
local RoduxFriends = DependenciesModule.RoduxFriends
local SocialTabEventReceiver = DependenciesModule.Roact.Component:extend("SocialTabEventReceiver")

function SocialTabEventReceiver.init(p1)
	local RobloxEventReceiver = p1.props.robloxEventReceiver
	p1.lastSeqNumByNamespace = {}
	p1.lastConnectionState = Enum.ConnectionState.Connected
	p1.tokens = {
		RobloxEventReceiver:observeEvent("FriendshipNotifications", function(p2)
			-- upvalues: p1 (copy)
			if p2.Type == "FriendshipDestroyed" and p2.EventArgs then
				local Text = tostring(p2.EventArgs.UserId1)
				local Text1 = tostring(p2.EventArgs.UserId2)
				
				if Text == p1.props.localUserId then
					Text = "localUserId"
				end
				if Text1 == p1.props.localUserId then
					Text1 = "localUserId"
				end
				p1.props.friendshipDestroyed(Text, Text1)
			end
		end),
		RobloxEventReceiver:observeEvent("AppShellNotifications", function(_, p2)
			-- upvalues: p1 (copy)
			if p2 == "StartConversationWithUserId" or p2 == "StartConversationWithId" then
				p1.props.goToChat()
			end
		end),
		RobloxEventReceiver:observeEvent("AppInput", function(_, p2)
			-- upvalues: p1 (copy)
			if p2 == "Focused" then
				p1.props.showTabBar()
			end
		end)
	}
end

function SocialTabEventReceiver:render()
	return nil
end

function SocialTabEventReceiver.willUnmount(p1)
	for _, token in pairs(p1.tokens) do
		token:disconnect()
	end
end

return RoactRodux.connect(function(p2)
	return { localUserId = p2.LocalUserId }
end, function(Callback)
	-- upvalues: RoduxFriends (copy)
	return {
		friendshipDestroyed = function(p2, p3)
			-- upvalues: Callback (copy), RoduxFriends (upval)
			return Callback(RoduxFriends.Actions.FriendshipDestroyed(p2, p3))
		end
	}
end)(SocialTabEventReceiver)