local ConsoleModule = require(script.Parent.console)
local ReactGlobalsModule = require(script.Parent.Parent.ReactGlobals)
local UninitializedStateModule = {}
setmetatable(UninitializedStateModule, {
	__metatable = "UninitializedState",
	__index = function(_, _)
		-- upvalues: ReactGlobalsModule (copy), ConsoleModule (copy)
		if ReactGlobalsModule.__DEV__ then
			ConsoleModule.warn("Attempted to access uninitialized state. Use setState to initialize state")
		end
		return nil
	end,
	__newindex = function(_, _)
		-- upvalues: ReactGlobalsModule (copy), ConsoleModule (copy)
		if ReactGlobalsModule.__DEV__ then
			ConsoleModule.error("Attempted to directly mutate state. Use setState to assign new values to state.")
		end
		return nil
	end,
	__tostring = function(_): string
		return "<uninitialized component state>"
	end
})

return UninitializedStateModule