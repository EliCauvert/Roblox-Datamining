local avatarEditorService = game:GetService("AvatarEditorService")
local playersService = game:GetService("Players")
local parent = script.Parent.Parent
local closeMenuModule = require(parent.Thunks.CloseMenu)
local setRespawningModule = require(parent.Actions.SetRespawning)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)

return function(p0)
	-- upvalues: avatarEditorService (ref), playersService (ref), setRespawningModule (ref), closeMenuModule (ref), sendAnalyticsModule (ref), constantsModule (ref)
	local state = p0:getState()
	
	if state.respawn.enabled then
		avatarEditorService:BustAvatarFetchCache()
		
		if state.respawn.customCallback then
			state.respawn.customCallback:Fire()
		else
			local character = playersService.LocalPlayer.Character
			
			if character ~= nil then
				local humanoid = character:FindFirstChild("Humanoid")
				
				if humanoid ~= nil and humanoid:IsA("Humanoid") then
					humanoid.Health = 0
				end
			end
		end
	end
	p0:dispatch(setRespawningModule(false))
	p0:dispatch(closeMenuModule)
	sendAnalyticsModule(constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsRespawnCharacterName, { confirmed = constantsModule.AnalyticsConfirmedName })
end