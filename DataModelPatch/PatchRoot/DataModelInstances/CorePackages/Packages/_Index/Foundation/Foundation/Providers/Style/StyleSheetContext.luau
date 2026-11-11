local Parent = script:FindFirstAncestor("Foundation").Parent
local ReactModule = require(Parent.React)
local None = require(Parent.Dash).None
local Context = ReactModule.createContext(None)

return {
	Provider = Context.Provider,
	useStyleSheet = function()
		-- upvalues: ReactModule (copy), Context (copy), None (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		return if UseContextResult == None then nil else UseContextResult
	end
}