local Parent = script:FindFirstAncestor("GameFilters").Parent
local MutedErrorFunction = require(Parent.Loggers).mutedError
local TModule = require(Parent.t)
local FFlagLuaAppChartsFilterOptionTextTag = require(Parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag
local config = {
	[require(Parent.RobloxAppEnums).AppPage.Games] = TModule.strictInterface({
		buttonName = TModule.string,
		filterId = TModule.string,
		selectedOptionId = TModule.string,
		previousOptionId = TModule.optional(TModule.string),
		selectedOptionContextTag = if FFlagLuaAppChartsFilterOptionTextTag then TModule.optional(TModule.string) else nil,
		previousOptionContextTag = if FFlagLuaAppChartsFilterOptionTextTag then TModule.optional(TModule.string) else nil,
		gameSetTypeId = TModule.string,
		gameSetTargetId = TModule.optional(TModule.number),
		sortPos = TModule.number,
		isActive = TModule.optional(TModule.boolean)
	})
}

return function(p1, p2, p3) --[[ Line: 30 | Named "gamesFilterClickEvent" ]]
	-- upvalues: config (copy), MutedErrorFunction (copy)
	local Entry = config[p2]
	
	if Entry then
		local EntryResult, EntryResult2 = Entry(p3)
		
		if not EntryResult then
			MutedErrorFunction(EntryResult2)
		end
	else
		MutedErrorFunction(string.format("Missing interface for eventContext %s to type check gamesFilterClick event parameters", p2))
	end
	p1:sendEventDeferred(p2, "gamesFilterClick", p3)
end