return function(value, p0, p1)
	value.defer(function()
		-- upvalues: value (ref), p0 (ref), p1 (ref)
		if not value.isEnabled() then return end
		local ok, status = pcall(value.getService)
		
		if not ok or status == nil then return end
		local pageType = value.resolveEnumItem("PageType", p0)
		local pageMilestoneType = value.resolveEnumItem("PageMilestoneType", p1)
		
		if pageType == nil or pageMilestoneType == nil then
			value.warn(`PageGate.signal: no enum for page "{p0}" / milestone "{p1}"`)
			
			return
		end
		status:TriggerOnPageMilestone(pageType, pageMilestoneType)
	end)
end