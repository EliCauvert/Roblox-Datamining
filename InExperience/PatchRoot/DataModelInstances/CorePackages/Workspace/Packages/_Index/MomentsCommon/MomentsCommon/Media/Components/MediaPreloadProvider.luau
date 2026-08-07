local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local reactModule = require(momentsCommon.Parent.React)
local _ = require(momentsCommon.Media.MediaTypes)
local var2 = reactModule.createContext(nil)

return {
	Provider = function(p0) --[[ line: 34 ]]
		-- upvalues: reactModule (ref), var2 (ref)
		return reactModule.createElement(var2.Provider, { value = p0.controllerProvider }, p0.children)
	end,
	Context = var2,
	useMediaControllerProvider = function() --[[ line: 40 ]]
		-- upvalues: reactModule (ref), var2 (ref)
		return reactModule.useContext(var2)
	end
}