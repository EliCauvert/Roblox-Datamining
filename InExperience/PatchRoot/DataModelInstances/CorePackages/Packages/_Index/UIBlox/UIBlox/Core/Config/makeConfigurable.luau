local configModule = require(script.Parent.Config)

local function _(p0) --[[ line: 4 | named "trimTrailingNewline" ]]
	return if p0:sub(-1, -1) == "\n" then p0:sub(1, -2) else p0
end

return function(p1, p2, p3) --[[ line: 12 ]]
	-- upvalues: configModule (ref)
	if typeof(p2) ~= "string" then
		error("Bad argument #2 - expected a string for the name of the library")
	end
	if typeof(p3) ~= "table" then
		error("Bad argument #3 - expected a default config table for the library")
	end
	local t = {}
	local var2 = configModule.new(p3)
	
	function t.init(p4) --[[ line: 23 ]]
		-- upvalues: t (ref), var2 (ref), p1 (ref), p2 (ref)
		setmetatable(t, nil)
		
		if p4 then
			var2.set(p4)
		end
		t.Config = var2.get()
		local var3 = p1(t.Config)
		
		for i, v in pairs(var3) do
			t[i] = v
		end
		local trac = debug.traceback()
		local var5 = if trac:sub(-1, -1) == "\n" then trac:sub(1, -2) else trac
		
		function t.init(p5) --[[ line: 38 ]]
			-- upvalues: p4 (ref), p2 (copy), var5 (ref)
			if p5 == p4 then
				return
			end
			local trac = debug.traceback()
			warn(string.format("%s has already been configured\nFirst init traceback:\n%s\nCurrent init traceback:\n%s", p2, var5, if trac:sub(-1, -1) == "\n" then trac:sub(1, -2) else trac))
		end
		
		return if _G.__UIBLOX_TRACK_USAGE__ then setmetatable(t, getmetatable(var3)) else setmetatable(t, {
			__index = function(_, p6) --[[ line: 63 ]]
				-- upvalues: p2 (copy)
				error(("%q (%s) is not a valid member of %s"):format(tostring(p6), typeof(p6), p2), 2)
			end,
			__newindex = function(_, p7, _) --[[ line: 69 ]]
				-- upvalues: p2 (copy)
				error(("%q (%s) is not a valid member of %s"):format(tostring(p7), typeof(p7), p2), 2)
			end
		})
	end
	
	return setmetatable(t, {
		__index = function(_, _) --[[ line: 78 ]]
			-- upvalues: p2 (ref)
			error(("You must call %s.init(config) before using it!"):format(p2), 2)
		end,
		__newindex = function(_, _, _) --[[ line: 82 ]]
			-- upvalues: p2 (ref)
			error(("You must call %s.init(config) before using it!"):format(p2), 2)
		end
	})
end