local consoleModule = require(script.Parent.console)
local reactGlobalsModule = require(script.Parent.Parent.ReactGlobals)
local t = {}
setmetatable(t, {
	__metatable = "UninitializedState",
	__index = function(_, _) --[[ line: 26 ]]
		-- upvalues: reactGlobalsModule (ref), consoleModule (ref)
		if reactGlobalsModule.__DEV__ then
			consoleModule.warn("Attempted to access uninitialized state. Use setState to initialize state")
		end
		return nil
	end,
	__newindex = function(_, _) --[[ line: 34 ]]
		-- upvalues: reactGlobalsModule (ref), consoleModule (ref)
		if reactGlobalsModule.__DEV__ then
			consoleModule.error("Attempted to directly mutate state. Use setState to assign new values to state.")
		end
		return nil
	end,
	__tostring = function(_) --[[ line: 42 ]]
		return "<uninitialized component state>"
	end
})

return t