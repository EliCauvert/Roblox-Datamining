local ReactModule = require(script:FindFirstAncestor("Impressions").Parent.React)

return function(p1) --[[ Line: 17 | Named "useBatchedImpressions" ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef({})
	local UseRefResult3 = ReactModule.useRef({})
	local UseRefResult4 = ReactModule.useRef(0)
	local UseRefResult5 = ReactModule.useRef(p1.onFlush)
	UseRefResult5.current = p1.onFlush
	local UseResult = ReactModule.useCallback(function() --[[ Line: 26 ]]
		-- upvalues: UseRefResult (copy), UseRefResult5 (copy), UseRefResult3 (copy), UseRefResult2 (copy), UseRefResult4 (copy)
		if #UseRefResult.current == 0 then return end
		local CurrentFunction: (any, any) -> () = UseRefResult5.current
		
		if not CurrentFunction then
			UseRefResult.current = {}
			UseRefResult3.current = {}
			
			return
		end
		local Items = {}
		
		for _, value in UseRefResult.current do
			UseRefResult2.current[value.key] = true
			table.insert(Items, value.item)
		end
		if #Items > 0 then
			UseRefResult4.current += 1
			CurrentFunction(Items, UseRefResult4.current)
		end
		UseRefResult.current = {}
		UseRefResult3.current = {}
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Key, p2, p3) --[[ Line: 53 ]]
		-- upvalues: UseRefResult2 (copy), UseRefResult3 (copy), p1 (copy), UseRefResult (copy), UseRefResult1 (copy), UseResult (copy)
		if not Key or not p2 or UseRefResult2.current[Key] or UseRefResult3.current[Key] then return end
		local MapItemResult = p1.mapItem(Key, p2, p3)
		
		if not MapItemResult then return end
		UseRefResult3.current[Key] = true
		table.insert(UseRefResult.current, { key = Key, item = MapItemResult })
		
		if UseRefResult1.current then
			pcall(task.cancel, UseRefResult1.current)
		end
		UseRefResult1.current = task.delay(p1.batchTimeMs * 0.001, UseResult)
	end, { p1.batchTimeMs, p1.mapItem, UseResult })
	ReactModule.useEffect(function() --[[ Line: 75 ]]
		-- upvalues: UseRefResult1 (copy), UseResult (copy)
		return function() --[[ Line: 76 ]]
			-- upvalues: UseRefResult1 (upval), UseResult (upval)
			if UseRefResult1.current then
				pcall(task.cancel, UseRefResult1.current)
			end
			UseRefResult1.current = nil
			UseResult()
		end
	end, { UseResult })
	
	return ReactModule.useMemo(function() --[[ Line: 85 ]]
		-- upvalues: UseResult1 (copy)
		return { addImpression = UseResult1 }
	end, { UseResult1 })
end