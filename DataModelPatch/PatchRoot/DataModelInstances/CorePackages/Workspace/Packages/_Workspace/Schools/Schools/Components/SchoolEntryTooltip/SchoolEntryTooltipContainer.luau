local Schools = script:FindFirstAncestor("Schools")
local ReactModule = require(Schools.Parent.React)
local _ = require(Schools.Common.Enums)
local UseSchoolEntryTooltipVariantModule = require(Schools.Hooks.useSchoolEntryTooltipVariant)
local SchoolEntryTooltipModule = require(script.Parent.SchoolEntryTooltip)
local SchoolEntryTooltipDurationSeconds = game:DefineFastInt("SchoolEntryTooltipDurationSeconds", 3)

return function(p1)
	-- upvalues: UseSchoolEntryTooltipVariantModule (copy), ReactModule (copy), SchoolEntryTooltipDurationSeconds (copy), SchoolEntryTooltipModule (copy)
	local UseSchoolEntryTooltipVariantModuleResult, UseSchoolEntryTooltipVariantModuleResult2 = UseSchoolEntryTooltipVariantModule()
	ReactModule.useImperativeHandle(p1.dismissTooltipRef, function()
		-- upvalues: UseSchoolEntryTooltipVariantModuleResult2 (copy)
		return UseSchoolEntryTooltipVariantModuleResult2
	end, { UseSchoolEntryTooltipVariantModuleResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseSchoolEntryTooltipVariantModuleResult (copy), SchoolEntryTooltipDurationSeconds (upval), UseSchoolEntryTooltipVariantModuleResult2 (copy)
		if UseSchoolEntryTooltipVariantModuleResult == nil then return end
		local DelayedThread = task.delay(SchoolEntryTooltipDurationSeconds, UseSchoolEntryTooltipVariantModuleResult2)
		
		return function()
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, {
		UseSchoolEntryTooltipVariantModuleResult,
		UseSchoolEntryTooltipVariantModuleResult2
	})
	
	return if UseSchoolEntryTooltipVariantModuleResult == nil then nil else ReactModule.createElement(SchoolEntryTooltipModule, {
		variant = UseSchoolEntryTooltipVariantModuleResult,
		anchorRef = p1.anchorRef
	})
end