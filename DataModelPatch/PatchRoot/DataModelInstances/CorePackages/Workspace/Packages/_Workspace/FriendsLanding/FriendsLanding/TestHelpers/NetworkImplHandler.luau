local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local RoduxNetworking = require(FriendsLanding.dependencies).RoduxNetworking
require(FriendsLanding.devDependencies).JestGlobals.beforeAll(function()
	-- upvalues: RoduxNetworking (copy)
	RoduxNetworking.setNetworkImpl(function(p1)
		error(string.format("\n🔥 Should have replaced network implementation for url: %s\n", (tostring(p1))))
	end)
end)