local PreferencesContextModule = require(script.Parent.PreferencesContext)
local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function() --[[ Line: 9 | Named "usePreferences" ]]
	-- upvalues: ReactModule (copy), PreferencesContextModule (copy)
	return (ReactModule.useContext(PreferencesContextModule))
end