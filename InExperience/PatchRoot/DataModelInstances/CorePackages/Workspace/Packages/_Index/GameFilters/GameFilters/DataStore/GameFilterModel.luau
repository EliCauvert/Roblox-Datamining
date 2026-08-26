local parent = script:FindFirstAncestor("GameFilters").Parent
local argCheckModule = require(parent.ArgCheck)
local _ = require(parent.DiscoveryTypes)
local fFlagLuaAppChartsActiveFilterChips = require(parent.SharedFlags).FFlagLuaAppChartsActiveFilterChips
local fFlagLuaAppChartsFilterOptionTextTag = require(parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag
local t = {
	new = function()
		return {}
	end
}

function t.mockFromExploreApi(p1, p2)
	-- upvalues: t (ref), fFlagLuaAppChartsFilterOptionTextTag (ref), fFlagLuaAppChartsActiveFilterChips (ref)
	local var1 = t.fromExploreJsonData({
		filterType = "",
		filterDisplayName = "",
		filterId = p1,
		filterOptions = {
			{
				optionDisplayName = "",
				optionId = p1 .. "_option",
				optionContextTag = if fFlagLuaAppChartsFilterOptionTextTag then p1 .. "_context" else nil
			}
		},
		defaultOptionId = p1 .. "_option",
		selectedOptionId = p1 .. "_option",
		inactiveOptionIds = if fFlagLuaAppChartsActiveFilterChips then { p1 .. "_option" } else nil
	})
	var1.selectedOptionDisplayName = p2 or ""
	
	return var1
end

function t.fromExploreJsonData(p1)
	-- upvalues: t (ref), fFlagLuaAppChartsActiveFilterChips (ref), fFlagLuaAppChartsFilterOptionTextTag (ref), argCheckModule (ref)
	local var1 = t.new()
	var1.filterId = p1.filterId
	var1.filterType = p1.filterType
	var1.filterDisplayName = p1.filterDisplayName
	var1.defaultOptionId = p1.defaultOptionId
	var1.selectedOptionId = p1.selectedOptionId
	
	if fFlagLuaAppChartsActiveFilterChips and p1.inactiveOptionIds then
		local t_1 = {}
		
		for i, v in p1.inactiveOptionIds do
			t_1[v] = true
		end
		var1.inactiveOptionIds = t_1
	end
	local t_1 = {}
	
	for i, v in ipairs(p1.filterOptions) do
		table.insert(t_1, {
			optionId = v.optionId,
			optionDisplayName = v.optionDisplayName,
			optionContextTag = if fFlagLuaAppChartsFilterOptionTextTag then v.optionContextTag else nil
		})
		
		if v.optionId == p1.selectedOptionId then
			argCheckModule.assert(var1.selectedOptionDisplayName == nil, "Multiple selected options found")
			var1.selectedOptionDisplayName = v.optionDisplayName
		end
	end
	var1.filterOptions = t_1
	
	return var1
end

return t