local ConfigModule = require(script.Parent.Config)

local function _(Text: string): string --[[ Line: 4 | Named "trimTrailingNewline" ]]
	return if Text:sub(-1, -1) == "\n" then Text:sub(1, -2) else Text
end

return function(Callback, p1: string, p2) --[[ Line: 12 ]]
	-- upvalues: ConfigModule (copy)
	if typeof(p1) ~= "string" then
		error("Bad argument #2 - expected a string for the name of the library")
	end
	if typeof(p2) ~= "table" then
		error("Bad argument #3 - expected a default config table for the library")
	end
	local t = {}
	local NewConfig = ConfigModule.new(p2)
	
	function t.init(p3) --[[ Line: 23 ]]
		-- upvalues: t (copy), NewConfig (copy), Callback (copy), p1 (copy)
		setmetatable(t, nil)
		
		if p3 then
			NewConfig.set(p3)
		end
		t.Config = NewConfig.get()
		local CallbackResult = Callback(t.Config)
		
		for i, value in pairs(CallbackResult) do
			t[i] = value
		end
		local Traceback: string = debug.traceback()
		local Segment = if Traceback:sub(-1, -1) == "\n" then Traceback:sub(1, -2) else Traceback
		
		function t.init(p4) --[[ Line: 38 ]]
			-- upvalues: p3 (copy), p1 (upval), Segment (copy)
			if p4 ~= p3 then
				local Traceback: string = debug.traceback()
				warn(string.format("%s has already been configured\nFirst init traceback:\n%s\nCurrent init traceback:\n%s", p1, Segment, if Traceback:sub(-1, -1) == "\n" then Traceback:sub(1, -2) else Traceback))
				
				return
			end
		end
		
		return if _G.__UIBLOX_TRACK_USAGE__ then setmetatable(t, (getmetatable(CallbackResult))) else setmetatable(t, {
			__index = function(_, p4) --[[ Line: 63 ]]
				-- upvalues: p1 (upval)
				error(("%q (%s) is not a valid member of %s"):format(tostring(p4), typeof(p4), p1), 2)
			end,
			__newindex = function(_, p4, _) --[[ Line: 69 ]]
				-- upvalues: p1 (upval)
				error(("%q (%s) is not a valid member of %s"):format(tostring(p4), typeof(p4), p1), 2)
			end
		})
	end
	
	return (setmetatable(t, {
		__index = function(_, _) --[[ Line: 78 ]]
			-- upvalues: p1 (copy)
			error(("You must call %s.init(config) before using it!"):format(p1), 2)
		end,
		__newindex = function(_, _, _) --[[ Line: 82 ]]
			-- upvalues: p1 (copy)
			error(("You must call %s.init(config) before using it!"):format(p1), 2)
		end
	}))
end