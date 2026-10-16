local parent = script:FindFirstAncestor("GameFilters").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local mutedError = require(parent.Loggers).mutedError
local tModule = require(parent.t)
local fFlagLuaAppChartsFilterOptionTextTag = require(parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag
local t = {
	[appPage.Games] = tModule.strictInterface({
		buttonName = tModule.string,
		filterId = tModule.string,
		selectedOptionId = tModule.string,
		previousOptionId = tModule.optional(tModule.string),
		selectedOptionContextTag = if fFlagLuaAppChartsFilterOptionTextTag then tModule.optional(tModule.string) else nil,
		previousOptionContextTag = if fFlagLuaAppChartsFilterOptionTextTag then tModule.optional(tModule.string) else nil,
		gameSetTypeId = tModule.string,
		gameSetTargetId = tModule.optional(tModule.number),
		sortPos = tModule.number,
		isActive = if require(parent.SharedFlags).FFlagLuaAppChartsActiveFilterChips then tModule.optional(tModule.boolean) else nil
	})
}

return function(p1, p2, p3)
	-- upvalues: t (ref), mutedError (ref)
	local var1 = t[p2]
	
	if var1 then
		local var2, var3 = var1(p3)
		
		if not var2 then
			mutedError(var3)
		end
	else
		mutedError(string.format("Missing interface for eventContext %s to type check gamesFilterClick event parameters", p2))
	end
	p1:sendEventDeferred(p2, "gamesFilterClick", p3)
end