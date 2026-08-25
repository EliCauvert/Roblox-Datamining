local parent = script:FindFirstAncestor("GameFilters").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local mutedError = require(parent.Loggers).mutedError
local tModule = require(parent.t)
local t = {
	[appPage.Games] = tModule.strictInterface({
		absPositions = tModule.string,
		filterIds = tModule.string,
		selectedOptionIds = tModule.string,
		selectedOptionContextTags = if require(parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag then tModule.optional(tModule.string) else nil,
		gameSetTypeId = tModule.string,
		gameSetTargetId = tModule.optional(tModule.number),
		sortPos = tModule.number
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
		mutedError(string.format("Missing interface for eventContext %s to type check filterImpressions event parameters", p1))
	end
	p0:sendEventDeferred(p1, "filterImpressions", p2)
end