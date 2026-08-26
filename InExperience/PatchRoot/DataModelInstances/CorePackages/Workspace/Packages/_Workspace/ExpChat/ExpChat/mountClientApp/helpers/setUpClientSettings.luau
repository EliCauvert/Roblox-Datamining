local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local actions = script:FindFirstAncestor("ExpChat").Actions
local clientSettingsLoadedModule = require(actions.ClientSettingsLoaded)
local clientSettingsChangedModule = require(actions.ClientSettingsChanged)

return function(p1)
	-- upvalues: clientSettingsLoadedModule (ref), userGameSettingsService (ref), clientSettingsChangedModule (ref)
	p1:dispatch(clientSettingsLoadedModule({
		preferredTransparency = userGameSettingsService.PreferredTransparency
	}))
	userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
		-- upvalues: p1 (ref), clientSettingsChangedModule (copy), userGameSettingsService (copy)
		p1:dispatch(clientSettingsChangedModule("preferredTransparency", userGameSettingsService.PreferredTransparency))
	end)
end