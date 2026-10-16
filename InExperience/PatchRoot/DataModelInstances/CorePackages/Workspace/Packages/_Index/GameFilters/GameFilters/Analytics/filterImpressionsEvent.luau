local Parent = script:FindFirstAncestor("GameFilters").Parent
local MutedErrorFunction = require(Parent.Loggers).mutedError
local TModule = require(Parent.t)
local config = {
	[require(Parent.RobloxAppEnums).AppPage.Games] = TModule.strictInterface({
		absPositions = TModule.string,
		filterIds = TModule.string,
		selectedOptionIds = TModule.string,
		selectedOptionContextTags = if require(Parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag then TModule.optional(TModule.string) else nil,
		gameSetTypeId = TModule.string,
		gameSetTargetId = TModule.optional(TModule.number),
		sortPos = TModule.number
	})
}

return function(p1, p2, p3) --[[ Line: 27 | Named "filterImpressionsEvent" ]]
	-- upvalues: config (copy), MutedErrorFunction (copy)
	local Entry = config[p2]
	
	if Entry then
		local EntryResult, EntryResult2 = Entry(p3)
		
		if not EntryResult then
			MutedErrorFunction(EntryResult2)
		end
	else
		MutedErrorFunction(string.format("Missing interface for eventContext %s to type check filterImpressions event parameters", p2))
	end
	p1:sendEventDeferred(p2, "filterImpressions", p3)
end