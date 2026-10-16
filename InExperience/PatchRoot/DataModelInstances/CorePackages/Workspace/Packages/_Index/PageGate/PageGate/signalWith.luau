return function(p1, p2, p3) --[[ Line: 14 | Named "signalWith" ]]
	p1.defer(function() --[[ Line: 17 ]]
		-- upvalues: p1 (copy), p2 (copy), p3 (copy)
		if not p1.isEnabled() then return end
		local Success, Result = pcall(p1.getService)
		
		if not Success or Result == nil then return end
		local PageType = p1.resolveEnumItem("PageType", p2)
		local PageMilestoneType = p1.resolveEnumItem("PageMilestoneType", p3)
		
		if PageType == nil or PageMilestoneType == nil then
			p1.warn(`PageGate.signal: no enum for page "{p1}" / milestone "{p2}"`)
			
			return
		else
			Result:TriggerOnPageMilestone(PageType, PageMilestoneType)
		end
	end)
end