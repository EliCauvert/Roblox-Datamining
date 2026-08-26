local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local reactModule = require(momentsCommon.Parent.React)
local _ = require(momentsCommon.Media.MediaTypes)
local var1 = reactModule.createContext(nil)

return {
	Provider = function(p1)
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.createElement(var1.Provider, { value = p1.controllerProvider }, p1.children)
	end,
	Context = var1,
	useMediaControllerProvider = function()
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.useContext(var1)
	end
}