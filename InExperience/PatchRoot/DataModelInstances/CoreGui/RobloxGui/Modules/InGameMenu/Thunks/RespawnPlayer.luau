local AvatarEditorService = game:GetService("AvatarEditorService")
local Players = game:GetService("Players")
local Parent = script.Parent.Parent
local CloseMenuModule = require(Parent.Thunks.CloseMenu)
local SetRespawningModule = require(Parent.Actions.SetRespawning)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)

return function(p1) --[[ Line: 12 ]]
	-- upvalues: AvatarEditorService (copy), Players (copy), SetRespawningModule (copy), CloseMenuModule (copy), SendAnalyticsModule (copy), ConstantsModule (copy)
	local State = p1:getState()
	
	if State.respawn.enabled then
		AvatarEditorService:BustAvatarFetchCache()
		
		if State.respawn.customCallback then
			State.respawn.customCallback:Fire()
		else
			local Character = Players.LocalPlayer.Character
			
			if Character ~= nil then
				local Humanoid = Character:FindFirstChild("Humanoid")
				
				if Humanoid ~= nil and Humanoid:IsA("Humanoid") then
					Humanoid.Health = 0
				end
			end
		end
	end
	p1:dispatch(SetRespawningModule(false))
	p1:dispatch(CloseMenuModule)
	SendAnalyticsModule(ConstantsModule.AnalyticsInGameMenuName, ConstantsModule.AnalyticsRespawnCharacterName, { confirmed = ConstantsModule.AnalyticsConfirmedName })
end