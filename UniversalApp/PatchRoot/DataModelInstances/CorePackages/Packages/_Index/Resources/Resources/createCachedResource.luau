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

return function(p1)
	local var1 = nil
	local var2 = nil
	local var3 = 0
	
	local function disposeResource()
		-- upvalues: var3 (write), var1 (write), var2 (write)
		var3 -= 1
		
		if var3 == 0 then
			var1 = nil
			
			if var2 ~= nil then
				local var4 = var2
				var2 = nil
				var4()
			end
		end
	end
	
	local function constructResource()
		-- upvalues: var2 (write), var1 (write), p1 (ref)
		local var4, var5 = p1()
		var2 = var4
		var1 = var5
	end
	
	local function handleError(p2, ...)
		-- upvalues: var3 (write), var1 (write), var2 (write)
		if not p2 then
			var3 -= 1
			
			if var3 == 0 then
				var1 = nil
				
				if var2 ~= nil then
					local var4 = var2
					var2 = nil
					var4()
				end
			end
			error(...)
		end
	end
	
	return function()
		-- upvalues: var3 (write), handleError (ref), constructResource (ref), disposeResource (ref), var1 (write)
		var3 += 1
		
		if var3 == 1 then
			handleError(pcall(constructResource))
		end
		local var4 = false
		
		return function()
			-- upvalues: var4 (write), disposeResource (ref)
			if not var4 then
				var4 = true
				disposeResource()
			end
		end, var1
	end
end