local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local widgetListBreakPointEnumModule = require(avatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local widgetListBreakPointThresholdsModule = require(avatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointThresholds)

return function(p0, p1) --[[ line: 14 | named "getBreakpointFromRowWidth" ]]
	-- upvalues: widgetListBreakPointEnumModule (ref), widgetListBreakPointThresholdsModule (ref)
	p1 = p1 or 1
	
	return if p0 then if p0 <= widgetListBreakPointThresholdsModule.XSmall * p1 then widgetListBreakPointEnumModule.XSmall elseif p0 <= widgetListBreakPointThresholdsModule.Small * p1 then widgetListBreakPointEnumModule.Small elseif p0 <= widgetListBreakPointThresholdsModule.Medium * p1 then widgetListBreakPointEnumModule.Medium elseif p0 <= widgetListBreakPointThresholdsModule.Large * p1 then widgetListBreakPointEnumModule.Large elseif p0 <= widgetListBreakPointThresholdsModule.XLarge * p1 then widgetListBreakPointEnumModule.XLarge else widgetListBreakPointEnumModule.X2Large else widgetListBreakPointEnumModule.Default
end