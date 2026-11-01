local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local NetworkModule = require(PurchasePrompt.Services.Network)
local ThunkModule = require(PurchasePrompt.Thunk)
local SearchUsersModule = require(PurchasePrompt.Network.searchUsers)
local list = { NetworkModule }

return function(p1)
	-- upvalues: ThunkModule (copy), list (copy), SearchUsersModule (copy), NetworkModule (copy)
	return ThunkModule.new(script.Name, list, function(_, p2)
		-- upvalues: SearchUsersModule (upval), NetworkModule (upval), p1 (copy)
		return SearchUsersModule(p2[NetworkModule], p1)
	end)
end