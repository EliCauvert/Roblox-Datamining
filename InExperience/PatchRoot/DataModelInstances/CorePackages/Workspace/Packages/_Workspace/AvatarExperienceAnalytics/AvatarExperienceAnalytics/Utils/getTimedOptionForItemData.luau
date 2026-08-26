local unifiedEventLogEnumsModule = require(script.Parent.Parent.UnifiedEventLogEnums)
local t = {
	[0] = unifiedEventLogEnumsModule.MarketplaceTimedOption.PERMANENT,
	[3] = unifiedEventLogEnumsModule.MarketplaceTimedOption.DAYS_3,
	[7] = unifiedEventLogEnumsModule.MarketplaceTimedOption.DAYS_7,
	[14] = unifiedEventLogEnumsModule.MarketplaceTimedOption.DAYS_14
}

function getTimedOptionForItemData(p1)
	-- upvalues: t (ref), unifiedEventLogEnumsModule (ref)
	if not p1 or not p1.timedOptions then
		return unifiedEventLogEnumsModule.MarketplaceTimedOption.PERMANENT
	end
	for i, v in p1.timedOptions do
		if v.selected then
			return t[v.days]
		end
	end
	return unifiedEventLogEnumsModule.MarketplaceTimedOption.PERMANENT
end

return getTimedOptionForItemData