local parent = script:FindFirstAncestor("Foundation").Parent
local reactModule = require(parent.React)
local none = require(parent.Dash).None
local var1 = reactModule.createContext(none)

return {
	Provider = var1.Provider,
	useStyleSheet = function()
		-- upvalues: reactModule (ref), var1 (ref), none (ref)
		local var2 = reactModule.useContext(var1)
		
		return if var2 == none then nil else var2
	end
}