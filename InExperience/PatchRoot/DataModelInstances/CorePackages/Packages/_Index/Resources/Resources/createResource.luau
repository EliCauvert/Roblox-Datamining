local _ = require(script.Parent.types)

local function _(p1)
	local var1 = false
	
	return function()
		-- upvalues: var1 (write), p1 (ref)
		if not var1 then
			var1 = true
			p1()
		end
	end
end

local function disposeChildren(p1)
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

return function(p2)
	-- upvalues: disposeChildren (ref)
	local var1 = false
	local t = {}
	
	local function dispose()
		-- upvalues: var1 (write), t (write), disposeChildren (copy)
		if not var1 then
			var1 = true
			local var2 = t
			t = {}
			disposeChildren(var2)
		end
	end
	
	local function _(p3)
		-- upvalues: var1 (write), t (write)
		if var1 then
			error("attempted to track a child after the resource has been disposed")
			
			return
		end
		table.insert(t, p3)
	end
	
	local var2 = false
	
	return function()
		-- upvalues: var2 (write), dispose (ref)
		if not var2 then
			var2 = true
			dispose()
		end
	end, (function(p3, ...)
		-- upvalues: var1 (write), t (write), disposeChildren (copy)
		if not p3 then
			if not var1 then
				var1 = true
				local var3 = t
				t = {}
				disposeChildren(var3)
			end
			error(select(1, ...))
		end
		return ...
	end)(pcall(p2, function(p4, ...)
		-- upvalues: var1 (write), t (write)
		if var1 then
			error("attempted to track a child after the resource has been disposed")
		else
			table.insert(t, p4)
		end
		return ...
	end))
end