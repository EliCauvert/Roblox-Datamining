local promiseModule = require(script:FindFirstAncestor("GameInvite").Parent.Promise)

return function(p1)
	-- upvalues: promiseModule (ref)
	local var1 = 0
	
	return {
		send = function(p2)
			-- upvalues: promiseModule (copy), p1 (ref), var1 (write)
			return promiseModule.new(function(p3, p4)
				-- upvalues: p1 (copy), var1 (copy), promiseModule (copy), p2 (ref)
				local var2 = p1.now()
				local maxValue = math.max(var2, var1)
				var1 = maxValue + p1.minIntervalSeconds
				
				local function dispatch()
					-- upvalues: promiseModule (copy), p2 (copy), p3 (ref), p4 (ref)
					promiseModule.try(p2):andThen(p3, p4)
				end
				
				local var3 = maxValue - var2
				
				if var3 <= 0 then
					promiseModule.try(p2):andThen(p3, p4)
					
					return
				end
				p1.delay(var3, dispatch)
			end)
		end,
		options = p1
	}
end