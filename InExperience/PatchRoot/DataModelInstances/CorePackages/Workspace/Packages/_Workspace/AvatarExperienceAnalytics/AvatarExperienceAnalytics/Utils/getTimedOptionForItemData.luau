local UnifiedEventLogEnumsModule = require(script.Parent.Parent.UnifiedEventLogEnums)
local config = {
	[0] = UnifiedEventLogEnumsModule.MarketplaceTimedOption.PERMANENT,
	[3] = UnifiedEventLogEnumsModule.MarketplaceTimedOption.DAYS_3,
	[7] = UnifiedEventLogEnumsModule.MarketplaceTimedOption.DAYS_7,
	[14] = UnifiedEventLogEnumsModule.MarketplaceTimedOption.DAYS_14
}

function getTimedOptionForItemData(p1) --[[ Line: 10 ]]
	-- upvalues: config (copy), UnifiedEventLogEnumsModule (copy)
	if not p1 or not p1.timedOptions then
		return UnifiedEventLogEnumsModule.MarketplaceTimedOption.PERMANENT
	end
	for _, timedOption in p1.timedOptions do
		if timedOption.selected then
			return config[timedOption.days]
		end
	end
	return UnifiedEventLogEnumsModule.MarketplaceTimedOption.PERMANENT
end

return getTimedOptionForItemData