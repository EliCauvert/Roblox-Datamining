return function(Callback)
	local v1 = nil
	
	local function _()
		-- upvalues: v1 (ref), Callback (copy)
		local v2 = v1
		
		if v2 == nil then
			local CallbackResult = Callback()
			v1 = CallbackResult
			
			return CallbackResult
		else
			return v2
		end
	end
	
	return {
		observe = function(p1, p2)
			-- upvalues: v1 (ref), Callback (copy)
			local v2 = v1
			local v3 = nil
			
			if v2 == nil then
				local CallbackResult = Callback()
				v1 = CallbackResult
				v3 = CallbackResult
			else
				v3 = v2
			end
			local ObserveEventResult = v3:observeEvent(p1, p2)
			
			return function()
				-- upvalues: ObserveEventResult (copy)
				ObserveEventResult:disconnect()
			end
		end
	}
end