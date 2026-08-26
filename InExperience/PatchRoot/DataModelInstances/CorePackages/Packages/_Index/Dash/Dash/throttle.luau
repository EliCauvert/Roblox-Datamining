local assignModule = require(script.Parent.assign)

return function(p1, p2, p3)
	-- upvalues: assignModule (ref)
	local var1 = assignModule({ leading = true, trailing = true }, p3)
	local maxValue = math.max(0, p2)
	local leading = var1.leading
	local trailing = var1.trailing
	local var2 = -1e999
	local var3 = nil
	local t = {}
	
	local function _()
		-- upvalues: var3 (write)
		if var3 then
			task.cancel(var3)
			var3 = nil
		end
	end
	
	local function invoke()
		-- upvalues: var2 (write), var3 (write), p1 (ref), t (write)
		var2 = os.clock()
		var3 = nil
		p1(table.unpack(t))
	end
	
	return function(...)
		-- upvalues: t (write), var2 (write), leading (ref), maxValue (ref), var3 (write), p1 (ref), trailing (ref), invoke (ref)
		local processTime = os.clock()
		t = { ... }
		
		if leading and maxValue <= processTime - var2 then
			if var3 then
				task.cancel(var3)
				var3 = nil
			end
			var2 = os.clock()
			var3 = nil
			p1(table.unpack(t))
			
			return
		elseif trailing and not var3 then
			local var4 = maxValue - (processTime - (if var2 == -1e999 then processTime else var2))
			
			if var4 < 0 then
				var4 = 0
			end
			var3 = task.delay(var4, invoke)
		end
	end
end