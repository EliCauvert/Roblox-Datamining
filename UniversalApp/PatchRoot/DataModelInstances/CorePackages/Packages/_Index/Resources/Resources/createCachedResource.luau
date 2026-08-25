local _ = require(script.Parent.types)

local function _(p0)
	local var0 = false
	
	return function()
		-- upvalues: var0 (write), p0 (ref)
		if not var0 then
			var0 = true
			p0()
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
				local var7 = var2
				var2 = nil
				var7()
			end
		end
	end
	
	local function constructResource()
		-- upvalues: var2 (write), var1 (write), p1 (ref)
		local var8, var9 = p1()
		var2 = var8
		var1 = var9
	end
	
	local function handleError(p2, ...)
		-- upvalues: var3 (write), var1 (write), var2 (write)
		if not p2 then
			var3 -= 1
			
			if var3 == 0 then
				var1 = nil
				
				if var2 ~= nil then
					local var10 = var2
					var2 = nil
					var10()
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
		local var11 = false
		
		return function()
			-- upvalues: var11 (write), disposeResource (ref)
			if not var11 then
				var11 = true
				disposeResource()
			end
		end, var1
	end
end