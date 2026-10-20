local Parent = script:FindFirstAncestor("GameFilters").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local _ = require(Parent.DiscoveryTypes)
local FFlagLuaAppChartsFilterOptionTextTag = require(Parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag
local GameFilterModelModule = {
	new = function()
		return {}
	end
}

function GameFilterModelModule.mockFromExploreApi(Text, p1)
	-- upvalues: GameFilterModelModule (copy), FFlagLuaAppChartsFilterOptionTextTag (copy)
	local FromExploreJsonDataResult = GameFilterModelModule.fromExploreJsonData({
		filterType = "",
		filterDisplayName = "",
		filterId = Text,
		filterOptions = {
			{
				optionDisplayName = "",
				optionId = Text .. "_option",
				optionContextTag = if FFlagLuaAppChartsFilterOptionTextTag then Text .. "_context" else nil
			}
		},
		defaultOptionId = Text .. "_option",
		selectedOptionId = Text .. "_option",
		inactiveOptionIds = { Text .. "_option" }
	})
	FromExploreJsonDataResult.selectedOptionDisplayName = p1 or ""
	
	return FromExploreJsonDataResult
end

function GameFilterModelModule.fromExploreJsonData(p1)
	-- upvalues: GameFilterModelModule (copy), FFlagLuaAppChartsFilterOptionTextTag (copy), ArgCheckModule (copy)
	local NewGameFilterModel = GameFilterModelModule.new()
	NewGameFilterModel.filterId = p1.filterId
	NewGameFilterModel.filterType = p1.filterType
	NewGameFilterModel.filterDisplayName = p1.filterDisplayName
	NewGameFilterModel.defaultOptionId = p1.defaultOptionId
	NewGameFilterModel.selectedOptionId = p1.selectedOptionId
	
	if p1.inactiveOptionIds then
		local InactiveOptionIds = {}
		
		for _, inactiveOptionId in p1.inactiveOptionIds do
			InactiveOptionIds[inactiveOptionId] = true
		end
		NewGameFilterModel.inactiveOptionIds = InactiveOptionIds
	end
	local FilterOptions = {}
	
	for _, filterOption in ipairs(p1.filterOptions) do
		table.insert(FilterOptions, {
			optionId = filterOption.optionId,
			optionDisplayName = filterOption.optionDisplayName,
			optionContextTag = if FFlagLuaAppChartsFilterOptionTextTag then filterOption.optionContextTag else nil
		})
		
		if filterOption.optionId == p1.selectedOptionId then
			ArgCheckModule.assert(NewGameFilterModel.selectedOptionDisplayName == nil, "Multiple selected options found")
			NewGameFilterModel.selectedOptionDisplayName = filterOption.optionDisplayName
		end
	end
	NewGameFilterModel.filterOptions = FilterOptions
	
	return NewGameFilterModel
end

return GameFilterModelModule