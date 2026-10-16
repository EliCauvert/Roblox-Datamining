local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ClientReplicator = nil

return function() --[[ Line: 4 | Named "getClientReplicator" ]]
	-- upvalues: ClientReplicator (ref)
	if ClientReplicator == nil then
		local NetworkClient = game:FindService("NetworkClient")
		
		if NetworkClient then
			ClientReplicator = NetworkClient:FindFirstChildOfClass("ClientReplicator")
		end
	end
	return if ClientReplicator and ClientReplicator:IsDescendantOf(game) then ClientReplicator else nil
end