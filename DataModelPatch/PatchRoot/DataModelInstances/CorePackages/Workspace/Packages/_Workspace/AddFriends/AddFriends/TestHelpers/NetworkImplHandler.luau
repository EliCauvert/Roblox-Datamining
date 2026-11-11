local Parent = script:FindFirstAncestor("AddFriends").Parent
local MyRoduxNetworking = require(Parent.AddFriendsState).Networking.myRoduxNetworking
require(Parent.Dev.JestGlobals).beforeAll(function()
	-- upvalues: MyRoduxNetworking (copy)
	MyRoduxNetworking.setNetworkImpl(function(p1)
		error(string.format("\n🔥 Should have replaced network implementation for url: %s\n", (tostring(p1))))
	end)
end)