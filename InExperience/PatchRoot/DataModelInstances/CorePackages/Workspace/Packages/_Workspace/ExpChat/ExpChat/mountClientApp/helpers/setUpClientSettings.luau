local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Actions = script:FindFirstAncestor("ExpChat").Actions
local ClientSettingsLoadedModule = require(Actions.ClientSettingsLoaded)
local ClientSettingsChangedModule = require(Actions.ClientSettingsChanged)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: ClientSettingsLoadedModule (copy), UserGameSettings (copy), ClientSettingsChangedModule (copy)
	p1:dispatch(ClientSettingsLoadedModule({
		preferredTransparency = UserGameSettings.PreferredTransparency
	}))
	UserGameSettings:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ Line: 14 ]]
		-- upvalues: p1 (copy), ClientSettingsChangedModule (upval), UserGameSettings (upval)
		p1:dispatch(ClientSettingsChangedModule("preferredTransparency", UserGameSettings.PreferredTransparency))
	end)
end