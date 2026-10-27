local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local CreateScrollIntervalPerformanceTrackerFunction = require(Parent.IntervalPerformanceTracker).createScrollIntervalPerformanceTracker

local function _(p1)
	local Current = p1.current
	
	if Current == nil then
		return nil
	else
		local NativeScrollRef = Current:getNativeScrollRef()
		
		return if NativeScrollRef == nil or NativeScrollRef._nativeRef == nil then nil else NativeScrollRef._nativeRef.current
	end
end

return function(p1, p2, p3)
	-- upvalues: ReactModule (copy), CreateScrollIntervalPerformanceTrackerFunction (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), p2 (copy), CreateScrollIntervalPerformanceTrackerFunction (upval)
		if p1 == nil then return end
		local Current = p2.current
		local Current1 = nil
		
		if Current == nil then
			Current1 = nil
		else
			local NativeScrollRef = Current:getNativeScrollRef()
			Current1 = if NativeScrollRef == nil or NativeScrollRef._nativeRef == nil then nil else NativeScrollRef._nativeRef.current
		end
		if Current1 == nil then return end
		local ScrollIntervalPerformanceTracker = CreateScrollIntervalPerformanceTrackerFunction(p1, Current1)
		local Connection = Current1:GetPropertyChangedSignal("CanvasPosition"):Connect(ScrollIntervalPerformanceTracker.onScrollTick)
		
		return function()
			-- upvalues: Connection (copy), ScrollIntervalPerformanceTracker (copy)
			Connection:Disconnect()
			ScrollIntervalPerformanceTracker.cleanup()
		end
	end, { p1, p2, p3 })
end