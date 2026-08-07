local reactModule = require(script:FindFirstAncestor("EconomyCommonCoreScriptHooks").Parent.React)
local screenSizeContextModule = require(script.Parent.ScreenSizeContext)

return function() --[[ line: 7 | named "useScreenSize" ]]
	-- upvalues: reactModule (ref), screenSizeContextModule (ref)
	return reactModule.useContext(screenSizeContextModule)
end