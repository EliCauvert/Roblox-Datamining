local configModule = require(script.Parent.Config)

local function _(p1)
	return if p1:sub(-1, -1) == "\n" then p1:sub(1, -2) else p1
end

return function(p1, p2, p3)
	-- upvalues: configModule (ref)
	if typeof(p2) ~= "string" then
		error("Bad argument #2 - expected a string for the name of the library")
	end
	if typeof(p3) ~= "table" then
		error("Bad argument #3 - expected a default config table for the library")
	end
	local t = {}
	local var1 = configModule.new(p3)
	
	function t.init(p4)
		-- upvalues: t (ref), var1 (ref), p1 (ref), p2 (ref)
		setmetatable(t, nil)
		
		if p4 then
			var1.set(p4)
		end
		t.Config = var1.get()
		local var2 = p1(t.Config)
		
		for i, v in pairs(var2) do
			t[i] = v
		end
		local trac = debug.traceback()
		local var3 = if trac:sub(-1, -1) == "\n" then trac:sub(1, -2) else trac
		
		function t.init(p5)
			-- upvalues: p4 (ref), p2 (copy), var3 (ref)
			if p5 == p4 then
				return
			end
			local trac = debug.traceback()
			warn(string.format("%s has already been configured\nFirst init traceback:\n%s\nCurrent init traceback:\n%s", p2, var3, if trac:sub(-1, -1) == "\n" then trac:sub(1, -2) else trac))
		end
		
		return if _G.__UIBLOX_TRACK_USAGE__ then setmetatable(t, getmetatable(var2)) else setmetatable(t, {
			__index = function(_, p5)
				-- upvalues: p2 (copy)
				error(("%q (%s) is not a valid member of %s"):format(tostring(p5), typeof(p5), p2), 2)
			end,
			__newindex = function(_, p5, _)
				-- upvalues: p2 (copy)
				error(("%q (%s) is not a valid member of %s"):format(tostring(p5), typeof(p5), p2), 2)
			end
		})
	end
	
	return setmetatable(t, {
		__index = function(_, _)
			-- upvalues: p2 (ref)
			error(("You must call %s.init(config) before using it!"):format(p2), 2)
		end,
		__newindex = function(_, _, _)
			-- upvalues: p2 (ref)
			error(("You must call %s.init(config) before using it!"):format(p2), 2)
		end
	})
end