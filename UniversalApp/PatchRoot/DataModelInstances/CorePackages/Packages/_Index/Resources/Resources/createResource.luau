local _ = require(script.Parent.types)

local function _(p0) --[[ line: 5 | named "once" ]]
	local var1 = false
	
	return function() --[[ line: 7 | named "notAgain" ]]
		-- upvalues: var1 (write), p0 (ref)
		if not var1 then
			var1 = true
			p0()
		end
	end
end

local function disposeChildren(p1) --[[ line: 16 ]]
	local t = {}
	
	for i = #p1, 1, -1 do
		local ok, status = pcall(p1[i])
		
		if not ok then
			table.insert(t, status)
		end
	end
	if #t > 0 then
		error(table.concat(t, "\n"))
	end
end

return function(p2) --[[ line: 32 | named "createResource" ]]
	-- upvalues: disposeChildren (ref)
	local var3 = false
	local t = {}
	
	local function dispose() --[[ line: 37 ]]
		-- upvalues: var3 (write), t (write), disposeChildren (copy)
		if not var3 then
			var3 = true
			local var7 = t
			t = {}
			disposeChildren(var7)
		end
	end
	
	local function _(p3) --[[ line: 46 | named "capture" ]]
		-- upvalues: var3 (write), t (write)
		if var3 then
			error("attempted to track a child after the resource has been disposed")
			
			return
		end
		table.insert(t, p3)
	end
	
	local var6 = false
	
	return function() --[[ line: 7 | named "notAgain" ]]
		-- upvalues: var6 (write), dispose (ref)
		if not var6 then
			var6 = true
			dispose()
		end
	end, (function(p5, ...) --[[ line: 59 | named "handleError" ]]
		-- upvalues: var3 (write), t (write), disposeChildren (copy)
		if not p5 then
			if not var3 then
				var3 = true
				local var8 = t
				t = {}
				disposeChildren(var8)
			end
			error(select(1, ...))
		end
		return ...
	end)(pcall(p2, function(p4, ...) --[[ line: 54 | named "own" ]]
		-- upvalues: var3 (write), t (write)
		if var3 then
			error("attempted to track a child after the resource has been disposed")
		else
			table.insert(t, p4)
		end
		return ...
	end))
end