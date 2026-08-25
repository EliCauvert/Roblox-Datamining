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

function t.mockFromExploreApi(p0, p1)
	-- upvalues: t (ref), fFlagLuaAppChartsFilterOptionTextTag (ref), fFlagLuaAppChartsActiveFilterChips (ref)
	local var2 = t.fromExploreJsonData({
		filterType = "",
		filterDisplayName = "",
		filterId = p0,
		filterOptions = {
			{
				optionDisplayName = "",
				optionId = p0 .. "_option",
				optionContextTag = if fFlagLuaAppChartsFilterOptionTextTag then p0 .. "_context" else nil
			}
		},
		defaultOptionId = p0 .. "_option",
		selectedOptionId = p0 .. "_option",
		inactiveOptionIds = if fFlagLuaAppChartsActiveFilterChips then { p0 .. "_option" } else nil
	})
	var2.selectedOptionDisplayName = p1 or ""
	
	return var2
end

function t.fromExploreJsonData(p2)
	-- upvalues: t (ref), fFlagLuaAppChartsActiveFilterChips (ref), fFlagLuaAppChartsFilterOptionTextTag (ref), argCheckModule (ref)
	local var3 = t.new()
	var3.filterId = p2.filterId
	var3.filterType = p2.filterType
	var3.filterDisplayName = p2.filterDisplayName
	var3.defaultOptionId = p2.defaultOptionId
	var3.selectedOptionId = p2.selectedOptionId
	
	if fFlagLuaAppChartsActiveFilterChips and p2.inactiveOptionIds then
		local t_1 = {}
		
		for i, v in p2.inactiveOptionIds do
			t_1[v] = true
		end
		var3.inactiveOptionIds = t_1
	end
	local t_1 = {}
	
	for i, v in ipairs(p2.filterOptions) do
		table.insert(t_1, {
			optionId = v.optionId,
			optionDisplayName = v.optionDisplayName,
			optionContextTag = if fFlagLuaAppChartsFilterOptionTextTag then v.optionContextTag else nil
		})
		
		if v.optionId == p2.selectedOptionId then
			argCheckModule.assert(var3.selectedOptionDisplayName == nil, "Multiple selected options found")
			var3.selectedOptionDisplayName = v.optionDisplayName
		end
	end
	var3.filterOptions = t_1
	
	return var3
end

return t