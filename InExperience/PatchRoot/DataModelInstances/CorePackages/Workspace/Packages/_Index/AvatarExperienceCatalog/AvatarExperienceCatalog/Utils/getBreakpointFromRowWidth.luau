local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local WidgetListBreakPointEnumModule = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local WidgetListBreakPointThresholdsModule = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointThresholds)

return function(p1, p2) --[[ Line: 14 | Named "getBreakpointFromRowWidth" ]]
	-- upvalues: WidgetListBreakPointEnumModule (copy), WidgetListBreakPointThresholdsModule (copy)
	local P1 = p2 or 1
	
	return if p1 then if p1 <= WidgetListBreakPointThresholdsModule.XSmall * P1 then WidgetListBreakPointEnumModule.XSmall elseif p1 <= WidgetListBreakPointThresholdsModule.Small * P1 then WidgetListBreakPointEnumModule.Small elseif p1 <= WidgetListBreakPointThresholdsModule.Medium * P1 then WidgetListBreakPointEnumModule.Medium elseif p1 <= WidgetListBreakPointThresholdsModule.Large * P1 then WidgetListBreakPointEnumModule.Large elseif p1 <= WidgetListBreakPointThresholdsModule.XLarge * P1 then WidgetListBreakPointEnumModule.XLarge else WidgetListBreakPointEnumModule.X2Large else WidgetListBreakPointEnumModule.Default
end