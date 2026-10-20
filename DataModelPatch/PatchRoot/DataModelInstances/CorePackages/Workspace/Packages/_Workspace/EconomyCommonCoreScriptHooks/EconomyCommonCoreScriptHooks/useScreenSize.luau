local ReactModule = require(script:FindFirstAncestor("EconomyCommonCoreScriptHooks").Parent.React)
local ScreenSizeContextModule = require(script.Parent.ScreenSizeContext)

return function()
	-- upvalues: ReactModule (copy), ScreenSizeContextModule (copy)
	return ReactModule.useContext(ScreenSizeContextModule)
end