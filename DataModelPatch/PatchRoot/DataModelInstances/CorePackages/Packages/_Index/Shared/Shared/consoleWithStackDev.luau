local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Console = LuauPolyfillModule.console
local Array = LuauPolyfillModule.Array
local ReactSharedInternalsModule = require(script.Parent.ReactSharedInternals)
local Callback = nil
local ConsoleWithStackDevModule = {
	warn = function(p1, ...)
		-- upvalues: ReactGlobalsModule (copy), Callback (ref)
		if ReactGlobalsModule.__DEV__ then
			Callback("warn", p1, { ... })
		end
	end,
	error = function(p1, ...)
		-- upvalues: ReactGlobalsModule (copy), Callback (ref)
		if ReactGlobalsModule.__DEV__ then
			Callback("error", p1, { ... })
		end
	end
}

Callback = function(p1, Text: string, List)
	-- upvalues: ReactGlobalsModule (copy), ReactSharedInternalsModule (copy), Array (copy), Console (copy)
	if ReactGlobalsModule.__DEV__ then
		local StackAddendum = ReactSharedInternalsModule.ReactDebugCurrentFrame.getStackAddendum()
		
		if StackAddendum ~= "" then
			Text ..= "%s"
			List = Array.slice(List, 1)
			table.insert(List, StackAddendum)
		end
		local MapResult = Array.map(List, tostring)
		table.insert(MapResult, 1, "Warning: " .. Text)
		Console[p1](unpack(MapResult))
	end
end

return ConsoleWithStackDevModule