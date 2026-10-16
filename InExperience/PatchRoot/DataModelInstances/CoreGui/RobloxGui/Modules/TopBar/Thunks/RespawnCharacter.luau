local AvatarEditorService = game:GetService("AvatarEditorService")
local Players = game:GetService("Players")

return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateRespawnRodux) then nil else function(p1) --[[ Line: 13 ]]
	-- upvalues: AvatarEditorService (copy), Players (copy)
	local State = p1:getState()
	AvatarEditorService:BustAvatarFetchCache()
	
	if State.respawn.customCallback then
		State.respawn.customCallback:Fire()
		
		return
	end
	local Character = Players.LocalPlayer.Character
	
	if Character ~= nil then
		local Humanoid = Character:FindFirstChild("Humanoid")
		
		if Humanoid ~= nil and Humanoid:IsA("Humanoid") then
			Humanoid.Health = 0
		end
	end
end