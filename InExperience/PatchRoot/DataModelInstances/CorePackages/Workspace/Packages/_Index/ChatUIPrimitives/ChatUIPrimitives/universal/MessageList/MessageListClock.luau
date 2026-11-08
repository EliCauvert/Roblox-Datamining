local ReactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)
local MessageClockContextModule = require(script.Parent.Parent.Adornments.MessageClockContext)
local UseMessageClockModule = require(script.Parent.Parent.Adornments.useMessageClock)

return function(p1)
	-- upvalues: ReactModule (copy), MessageClockContextModule (copy), UseMessageClockModule (copy)
	local UseContextResult = ReactModule.useContext(MessageClockContextModule)
	local NoUseContextResult: boolean = p1.enabled and UseContextResult == nil
	local UseMessageClockModuleResult = UseMessageClockModule({ enabled = NoUseContextResult })
	
	return ReactModule.createElement(MessageClockContextModule.Provider, {
		value = if UseContextResult == nil then if NoUseContextResult then UseMessageClockModuleResult else nil else UseContextResult
	}, p1.children)
end