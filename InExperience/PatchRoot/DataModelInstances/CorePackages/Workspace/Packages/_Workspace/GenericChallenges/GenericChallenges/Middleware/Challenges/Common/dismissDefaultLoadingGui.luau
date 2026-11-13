local function defaultHasJoinConnected(): boolean
	return game:FindService("NetworkClient") ~= nil
end

return function(p1, p2)
	-- upvalues: defaultHasJoinConnected (copy)
	if (p2 or defaultHasJoinConnected)() then return end
	local ReplicatedFirst = game:GetService("ReplicatedFirst")
	local P0 = p1 or ReplicatedFirst
	
	if not P0:IsDefaultLoadingGuiRemoved() then
		P0:SetDefaultLoadingGuiRemoved()
		
		return
	end
end