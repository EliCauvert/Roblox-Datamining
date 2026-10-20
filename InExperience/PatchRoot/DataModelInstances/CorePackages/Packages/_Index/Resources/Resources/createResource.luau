local _ = require(script.Parent.types)

local function _(p1)
	local v1 = false
	
	return function()
		-- upvalues: v1 (ref), p1 (copy)
		if not v1 then
			v1 = true
			p1()
		end
	end
end

local function disposeChildren(p1)
	local List = {}
	
	for i = #p1, 1, -1 do
		local Success, Result = pcall(p1[i])
		
		if not Success then
			table.insert(List, Result)
		end
	end
	if #List > 0 then
		error(table.concat(List, "\n"))
	end
end

return function(p2)
	-- upvalues: disposeChildren (copy)
	local Flag = false
	local List = {}
	
	local function dispose()
		-- upvalues: Flag (ref), List (ref), disposeChildren (upval)
		if not Flag then
			Flag = true
			local List1 = List
			List = {}
			disposeChildren(List1)
		end
	end
	
	local function _(p3)
		-- upvalues: Flag (ref), List (ref)
		if Flag then
			error("attempted to track a child after the resource has been disposed")
			
			return
		else
			table.insert(List, p3)
		end
	end
	
	local v1 = false
	
	return function()
		-- upvalues: v1 (ref), dispose (copy)
		if not v1 then
			v1 = true
			dispose()
		end
	end, (function(p3, ...)
		-- upvalues: Flag (ref), List (ref), disposeChildren (upval)
		if not p3 then
			if not Flag then
				Flag = true
				local List1 = List
				List = {}
				disposeChildren(List1)
			end
			error((select(1, ...)))
		end
		return ...
	end)(pcall(p2, function(p3, ...)
		-- upvalues: Flag (ref), List (ref)
		if Flag then
			error("attempted to track a child after the resource has been disposed")
		else
			table.insert(List, p3)
		end
		return ...
	end))
end