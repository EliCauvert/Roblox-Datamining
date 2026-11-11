local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local _ = require(script.Parent.createMomentsStore)
local ParentModule = require(script.Parent)
local Context = ReactModule.createContext(nil)

return {
	MomentsSessionContext = Context,
	useMomentsSession = function()
		-- upvalues: ReactModule (copy), Context (copy), ParentModule (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		return if UseContextResult == nil then ParentModule() else UseContextResult
	end
}