local avatarEditorService = game:GetService("AvatarEditorService")
local playersService = game:GetService("Players")

return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateRespawnRodux) then nil else function(p1)
	-- upvalues: avatarEditorService (ref), playersService (ref)
	local state = p1:getState()
	avatarEditorService:BustAvatarFetchCache()
	
	if state.respawn.customCallback then
		state.respawn.customCallback:Fire()
		
		return
	end
	local character = playersService.LocalPlayer.Character
	
	if character ~= nil then
		local humanoid = character:FindFirstChild("Humanoid")
		
		if humanoid ~= nil and humanoid:IsA("Humanoid") then
			humanoid.Health = 0
		end
	end
end