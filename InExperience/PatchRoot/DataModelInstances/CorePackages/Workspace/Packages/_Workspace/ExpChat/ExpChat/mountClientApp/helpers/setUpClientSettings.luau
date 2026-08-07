local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local actions = script:FindFirstAncestor("ExpChat").Actions
local clientSettingsLoadedModule = require(actions.ClientSettingsLoaded)
local clientSettingsChangedModule = require(actions.ClientSettingsChanged)

return function(p0) --[[ line: 9 ]]
	-- upvalues: clientSettingsLoadedModule (ref), userGameSettingsService (ref), clientSettingsChangedModule (ref)
	p0:dispatch(clientSettingsLoadedModule({
		preferredTransparency = userGameSettingsService.PreferredTransparency
	}))
	userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ line: 14 ]]
		-- upvalues: p0 (ref), clientSettingsChangedModule (copy), userGameSettingsService (copy)
		p0:dispatch(clientSettingsChangedModule("preferredTransparency", userGameSettingsService.PreferredTransparency))
	end)
end