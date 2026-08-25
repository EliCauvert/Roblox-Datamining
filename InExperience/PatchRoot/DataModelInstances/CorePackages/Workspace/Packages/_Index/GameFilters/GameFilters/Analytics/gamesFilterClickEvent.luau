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

return function(p0, p1, p2)
	-- upvalues: t (ref), mutedError (ref)
	local var2 = t[p1]
	
	if var2 then
		local var3, var4 = var2(p2)
		
		if not var3 then
			mutedError(var4)
		end
	else
		mutedError(string.format("Missing interface for eventContext %s to type check gamesFilterClick event parameters", p1))
	end
	p0:sendEventDeferred(p1, "gamesFilterClick", p2)
end