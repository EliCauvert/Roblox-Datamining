local assignModule = require(script.Parent.assign)

return function(p0, p1, p2)
	-- upvalues: assignModule (ref)
	local var1 = assignModule({ leading = true, trailing = true }, p2)
	local maxValue = math.max(0, p1)
	local leading = var1.leading
	local trailing = var1.trailing
	local var3 = -1e999
	local var4 = nil
	local t = {}
	
	local function _()
		-- upvalues: var4 (write)
		if var4 then
			task.cancel(var4)
			var4 = nil
		end
	end
	
	local function invoke()
		-- upvalues: var3 (write), var4 (write), p0 (ref), t (write)
		var3 = os.clock()
		var4 = nil
		p0(table.unpack(t))
	end
	
	return function(...)
		-- upvalues: t (write), var3 (write), leading (ref), maxValue (ref), var4 (write), p0 (ref), trailing (ref), invoke (ref)
		local processTime = os.clock()
		t = { ... }
		
		if leading and maxValue <= processTime - var3 then
			if var4 then
				task.cancel(var4)
				var4 = nil
			end
			var3 = os.clock()
			var4 = nil
			p0(table.unpack(t))
			
			return
		elseif trailing and not var4 then
			local var8 = maxValue - (processTime - (if var3 == -1e999 then processTime else var3))
			
			if var8 < 0 then
				var8 = 0
			end
			var4 = task.delay(var8, invoke)
		end
	end
end