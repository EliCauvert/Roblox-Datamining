local preferencesContextModule = require(script.Parent.PreferencesContext)
local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function()
	-- upvalues: reactModule (ref), preferencesContextModule (ref)
	return reactModule.useContext(preferencesContextModule)
end