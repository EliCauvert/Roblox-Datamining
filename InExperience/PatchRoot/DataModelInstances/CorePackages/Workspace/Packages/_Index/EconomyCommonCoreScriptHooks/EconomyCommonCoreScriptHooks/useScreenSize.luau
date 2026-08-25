local reactModule = require(script:FindFirstAncestor("EconomyCommonCoreScriptHooks").Parent.React)
local screenSizeContextModule = require(script.Parent.ScreenSizeContext)

return function()
	-- upvalues: reactModule (ref), screenSizeContextModule (ref)
	return reactModule.useContext(screenSizeContextModule)
end