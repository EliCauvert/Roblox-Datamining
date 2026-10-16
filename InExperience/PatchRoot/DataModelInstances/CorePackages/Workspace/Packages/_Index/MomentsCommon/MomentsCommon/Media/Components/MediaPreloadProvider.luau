local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local ReactModule = require(MomentsCommon.Parent.React)
local _ = require(MomentsCommon.Media.MediaTypes)
local Context = ReactModule.createContext(nil)

return {
	Provider = function(p1) --[[ Line: 34 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.createElement(Context.Provider, { value = p1.controllerProvider }, p1.children)
	end,
	Context = Context,
	useMediaControllerProvider = function() --[[ Line: 40 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.useContext(Context)
	end
}