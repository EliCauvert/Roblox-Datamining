local _ = require(script:FindFirstAncestor("Moments").Parent.ViewRecycler)

return function(p1) --[[ Line: 27 | Named "createCommentsListRevealTracker" ]]
	local Schedule = p1.schedule or function(Callback) --[[ Line: 28 ]]
		task.defer(Callback)
	end
	local t = {}
	local v1 = nil
	local Flag = false
	local Flag1 = false
	
	local function reveal() --[[ Line: 36 ]]
		-- upvalues: Flag (ref), p1 (copy)
		if not Flag then
			Flag = true
			p1.onReady()
			
			return
		end
	end
	
	local function isVisibleRangeMeasured(): boolean --[[ Line: 44 ]]
		-- upvalues: v1 (ref), p1 (copy), t (copy)
		local v2 = v1
		
		if v2 == nil or v2.lastIndex < v2.firstIndex then
			return false
		end
		for i = v2.firstIndex, v2.lastIndex do
			local ItemKey = p1.getItemKey(i)
			
			if ItemKey == nil or not t[ItemKey] then
				return false
			end
		end
		return true
	end
	
	local function check() --[[ Line: 58 ]]
		-- upvalues: Flag1 (ref), Flag (ref), isVisibleRangeMeasured (copy), p1 (copy)
		Flag1 = false
		
		if not Flag and isVisibleRangeMeasured() then
			if Flag then return end
			Flag = true
			p1.onReady()
		end
	end
	
	local function _() --[[ Line: 65 | Named "scheduleCheck" ]]
		-- upvalues: Flag (ref), Flag1 (ref), Schedule (copy), check (copy)
		if not Flag and not Flag1 then
			Flag1 = true
			Schedule(check)
			
			return
		end
	end
	
	local Layout = p1.layout
	local UpdateItemMeasurementFunction = Layout.updateItemMeasurement
	
	function Layout.updateItemMeasurement(p2) --[[ Line: 76 ]]
		-- upvalues: UpdateItemMeasurementFunction (copy), Flag (ref), t (copy), Flag1 (ref), Schedule (copy), check (copy)
		local UpdateItemMeasurementResult = UpdateItemMeasurementFunction(p2)
		
		if UpdateItemMeasurementResult.accepted and not Flag then
			t[p2.itemKey] = true
			
			if not Flag then
				if Flag1 then
					return UpdateItemMeasurementResult
				end
				Flag1 = true
				Schedule(check)
			end
		end
		return UpdateItemMeasurementResult
	end
	
	return {
		onVisibleRangeChanged = function(p2) --[[ Line: 86 ]]
			-- upvalues: v1 (ref), Flag (ref), Flag1 (ref), Schedule (copy), check (copy)
			v1 = p2
			
			if not Flag then
				if Flag1 then return end
				Flag1 = true
				Schedule(check)
			end
		end,
		reveal = reveal,
		destroy = function() --[[ Line: 91 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	}
end