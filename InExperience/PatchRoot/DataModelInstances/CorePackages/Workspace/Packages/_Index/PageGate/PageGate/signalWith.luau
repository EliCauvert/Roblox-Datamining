return function(value, p1, p2)
	value.defer(function()
		-- upvalues: value (ref), p1 (ref), p2 (ref)
		if not value.isEnabled() then return end
		local ok, status = pcall(value.getService)
		
		if not ok or status == nil then return end
		local pageType = value.resolveEnumItem("PageType", p1)
		local pageMilestoneType = value.resolveEnumItem("PageMilestoneType", p2)
		
		if pageType == nil or pageMilestoneType == nil then
			value.warn(`PageGate.signal: no enum for page "{p0}" / milestone "{p1}"`)
			
			return
		end
		status:TriggerOnPageMilestone(pageType, pageMilestoneType)
	end)
end