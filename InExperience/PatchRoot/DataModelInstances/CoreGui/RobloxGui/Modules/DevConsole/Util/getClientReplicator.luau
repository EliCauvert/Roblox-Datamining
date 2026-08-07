local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local var0 = nil

return function() --[[ line: 4 | named "getClientReplicator" ]]
	-- upvalues: var0 (write)
	if var0 == nil then
		local networkClient = game:FindService("NetworkClient")
		
		if networkClient then
			var0 = networkClient:FindFirstChildOfClass("ClientReplicator")
		end
	end
	return if var0 and var0:IsDescendantOf(game) then var0 else nil
end