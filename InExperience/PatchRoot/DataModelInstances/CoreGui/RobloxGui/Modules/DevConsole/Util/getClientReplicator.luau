local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local var1 = nil

return function()
	-- upvalues: var1 (write)
	if var1 == nil then
		local networkClient = game:FindService("NetworkClient")
		
		if networkClient then
			var1 = networkClient:FindFirstChildOfClass("ClientReplicator")
		end
	end
	return if var1 and var1:IsDescendantOf(game) then var1 else nil
end