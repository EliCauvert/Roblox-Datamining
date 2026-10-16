local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local ReactModule = require(InExperienceShop.Parent.React)
local ConstantsModule = require(InExperienceShop.Constants)
local _ = require(InExperienceShop.Types)
local FFlagShopUseFuzzySearchModule = require(InExperienceShop.Flags.FFlagShopUseFuzzySearch)
local _ = require(script.Parent.SearchResultsView)
local SearchMatchersModule = require(script.Parent.searchMatchers)
local t = {}

local function _(p1): string --[[ Line: 37 | Named "compositeKey" ]]
	return p1.id .. "|" .. tostring(p1.itemType)
end

local function collectUniqueItems(Sections) --[[ Line: 41 ]]
	local t = {}
	local List = {}
	
	for _, section in Sections do
		for _, item in section.items do
			local Text = item.id .. "|" .. tostring(item.itemType)
			
			if not t[Text] then
				t[Text] = true
				table.insert(List, item)
			end
		end
	end
	return List
end

local _ = function(p1, p2): string --[[ Line: 58 | Named "computeState" ]]
	return if p1 == "" then "hint" elseif p2 == 0 then "empty" else "results"
end

return function(Frame) --[[ Line: 68 | Named "useSearchResultsViewModel" ]]
	-- upvalues: ReactModule (copy), collectUniqueItems (copy), FFlagShopUseFuzzySearchModule (copy), SearchMatchersModule (copy), ConstantsModule (copy), t (copy)
	local CommittedQuery = Frame.committedQuery
	local Sections = Frame.sections
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 72 ]]
		-- upvalues: CommittedQuery (copy), collectUniqueItems (upval), Sections (copy), FFlagShopUseFuzzySearchModule (upval), SearchMatchersModule (upval), ConstantsModule (upval)
		return if CommittedQuery == "" then {} else (if FFlagShopUseFuzzySearchModule then SearchMatchersModule.fuzzyMatch else SearchMatchersModule.substringMatch)(collectUniqueItems(Sections), CommittedQuery, ConstantsModule.MAX_SEARCH_RESULTS)
	end, { Sections, CommittedQuery })
	local Smallest = math.min(Frame.itemsPerRow, ConstantsModule.ITEMS_PER_SECTION)
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 86 ]]
		-- upvalues: UseMemoResult (copy), t (upval), Smallest (copy)
		if #UseMemoResult == 0 then
			return t
		end
		local List = {}
		
		for i = 1, #UseMemoResult, Smallest do
			local t1 = {}
			table.move(UseMemoResult, i, math.min(i + Smallest - 1, #UseMemoResult), 1, t1)
			table.insert(List, t1)
		end
		return List
	end, { UseMemoResult, Smallest })
	local CountUseMemoResult1 = #UseMemoResult1
	
	return {
		rows = UseMemoResult1,
		columnCount = Frame.itemsPerRow,
		onItemActivated = Frame.onItemActivated,
		LayoutOrder = Frame.LayoutOrder,
		state = if CommittedQuery == "" then "hint" elseif CountUseMemoResult1 == 0 then "empty" else "results"
	}
end