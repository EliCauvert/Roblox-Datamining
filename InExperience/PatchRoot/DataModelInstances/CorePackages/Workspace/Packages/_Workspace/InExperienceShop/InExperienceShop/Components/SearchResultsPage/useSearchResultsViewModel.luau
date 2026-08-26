local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local reactModule = require(inExperienceShop.Parent.React)
local constantsModule = require(inExperienceShop.Constants)
local _ = require(inExperienceShop.Types)
local fFlagShopUseFuzzySearchModule = require(inExperienceShop.Flags.FFlagShopUseFuzzySearch)
local _ = require(script.Parent.SearchResultsView)
local searchMatchersModule = require(script.Parent.searchMatchers)
local t = {}

local function _(p1)
	return p1.id .. "|" .. tostring(p1.itemType)
end

local function collectUniqueItems(p1)
	local t = {}
	local t_1 = {}
	
	for i, v in p1 do
		for i_1, v_1 in v.items do
			local text = v_1.id .. "|" .. tostring(v_1.itemType)
			
			if not t[text] then
				t[text] = true
				table.insert(t_1, v_1)
			end
		end
	end
	return t_1
end

local _ = function(p2, p3)
	return if p2 == "" then "hint" elseif p3 == 0 then "empty" else "results"
end

return function(p2)
	-- upvalues: reactModule (ref), collectUniqueItems (ref), fFlagShopUseFuzzySearchModule (ref), searchMatchersModule (ref), constantsModule (ref), t (ref)
	local committedQuery = p2.committedQuery
	local sections = p2.sections
	local var1 = reactModule.useMemo(function()
		-- upvalues: committedQuery (ref), collectUniqueItems (copy), sections (ref), fFlagShopUseFuzzySearchModule (copy), searchMatchersModule (copy), constantsModule (copy)
		return if committedQuery == "" then {} else (if fFlagShopUseFuzzySearchModule then searchMatchersModule.fuzzyMatch else searchMatchersModule.substringMatch)(collectUniqueItems(sections), committedQuery, constantsModule.MAX_SEARCH_RESULTS)
	end, { sections, committedQuery })
	local minValue = math.min(p2.itemsPerRow, constantsModule.ITEMS_PER_SECTION)
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), t (copy), minValue (ref)
		if #var1 == 0 then
			return t
		end
		local t_1 = {}
		
		for i = 1, #var1, minValue do
			local t_2 = {}
			table.move(var1, i, math.min(i + minValue - 1, #var1), 1, t_2)
			table.insert(t_1, t_2)
		end
		return t_1
	end, { var1, minValue })
	
	return {
		rows = var2,
		columnCount = p2.itemsPerRow,
		onItemActivated = p2.onItemActivated,
		LayoutOrder = p2.LayoutOrder,
		state = if committedQuery == "" then "hint" elseif #var2 == 0 then "empty" else "results"
	}
end