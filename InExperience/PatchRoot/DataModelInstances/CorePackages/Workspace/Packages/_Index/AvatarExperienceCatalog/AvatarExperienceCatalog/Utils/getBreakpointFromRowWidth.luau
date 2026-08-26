local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local widgetListBreakPointEnumModule = require(avatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local widgetListBreakPointThresholdsModule = require(avatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointThresholds)

return function(p1, p2)
	-- upvalues: widgetListBreakPointEnumModule (ref), widgetListBreakPointThresholdsModule (ref)
	p2 = p2 or 1
	
	return if p1 then if p1 <= widgetListBreakPointThresholdsModule.XSmall * p2 then widgetListBreakPointEnumModule.XSmall elseif p1 <= widgetListBreakPointThresholdsModule.Small * p2 then widgetListBreakPointEnumModule.Small elseif p1 <= widgetListBreakPointThresholdsModule.Medium * p2 then widgetListBreakPointEnumModule.Medium elseif p1 <= widgetListBreakPointThresholdsModule.Large * p2 then widgetListBreakPointEnumModule.Large elseif p1 <= widgetListBreakPointThresholdsModule.XLarge * p2 then widgetListBreakPointEnumModule.XLarge else widgetListBreakPointEnumModule.X2Large else widgetListBreakPointEnumModule.Default
end