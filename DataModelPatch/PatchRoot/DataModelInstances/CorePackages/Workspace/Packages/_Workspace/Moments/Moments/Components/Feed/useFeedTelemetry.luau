local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(script.Parent.FeedTypes)

return function(p1, p2)
	-- upvalues: ReactModule (copy), SignalsModule (copy)
	local Active = p2.active
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(1)
	local UseRefResult2 = ReactModule.useRef(0)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(p2.telemetry)
	UseRefResult4.current = p2.telemetry
	local UseRefResult5 = ReactModule.useRef(p2.recommendationSource)
	UseRefResult5.current = p2.recommendationSource
	local UseRefResult6 = ReactModule.useRef(p2.getAttribution)
	UseRefResult6.current = p2.getAttribution
	local UseRefResult7 = ReactModule.useRef(p2.onItemBecameActive)
	UseRefResult7.current = p2.onItemBecameActive
	local UseRefResult8 = ReactModule.useRef(Active)
	UseRefResult8.current = Active
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult4 (copy), UseRefResult1 (copy), UseRefResult5 (copy)
		local Current = UseRefResult.current
		
		if Current == nil then return end
		local Current1 = UseRefResult2.current
		
		if UseRefResult3.current ~= nil then
			Current1 += os.clock() - UseRefResult3.current
		end
		UseRefResult.current = nil
		UseRefResult3.current = nil
		UseRefResult2.current = 0
		
		if Current1 > 0 then
			UseRefResult4.current.logView(Current, {
				durationSeconds = Current1,
				itemPosition = UseRefResult1.current,
				recommendationSource = UseRefResult5.current
			})
			
			return
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), p1 (copy), UseResult (copy), UseRefResult6 (copy), UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult8 (copy), UseRefResult7 (copy)
		local Effect = SignalsModule.createEffect(function(p3)
			-- upvalues: p1 (upval), UseResult (upval), UseRefResult6 (upval), UseRefResult (upval), UseRefResult1 (upval), UseRefResult2 (upval), UseRefResult3 (upval), UseRefResult8 (upval), UseRefResult7 (upval)
			local CurrentItem = p1.getCurrentItem(p3)
			UseResult()
			
			if CurrentItem == nil then return end
			local CurrentResult = UseRefResult6.current(CurrentItem)
			
			if CurrentResult == nil then return end
			UseRefResult.current = CurrentResult
			UseRefResult1.current = p1.getCurrentIndex(false)
			UseRefResult2.current = 0
			UseRefResult3.current = if UseRefResult8.current then os.clock() else nil
			
			if UseRefResult8.current and UseRefResult7.current then
				UseRefResult7.current(CurrentItem)
			end
		end)
		
		return function()
			-- upvalues: Effect (copy), UseResult (upval)
			Effect()
			UseResult()
		end
	end, { p1, UseResult })
	ReactModule.useEffect(function()
		-- upvalues: Active (copy), UseRefResult (copy), UseRefResult3 (copy), UseRefResult2 (copy)
		if Active then
			if UseRefResult.current ~= nil and UseRefResult3.current == nil then
				UseRefResult3.current = os.clock()
				
				return
			end
		elseif UseRefResult3.current ~= nil then
			UseRefResult2.current += os.clock() - UseRefResult3.current
			UseRefResult3.current = nil
		end
	end, { Active })
	
	return { flushView = UseResult }
end