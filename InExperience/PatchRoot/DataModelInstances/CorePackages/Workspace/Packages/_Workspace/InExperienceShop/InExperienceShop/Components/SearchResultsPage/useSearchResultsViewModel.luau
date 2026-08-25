local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local reactModule = require(inExperienceShop.Parent.React)
local constantsModule = require(inExperienceShop.Constants)
local _ = require(inExperienceShop.Types)
local fFlagShopUseFuzzySearchModule = require(inExperienceShop.Flags.FFlagShopUseFuzzySearch)
local _ = require(script.Parent.SearchResultsView)
local searchMatchersModule = require(script.Parent.searchMatchers)
local t = {}

local function _(p0)
	return p0.id .. "|" .. tostring(p0.itemType)
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

return function(p4)
	-- upvalues: reactModule (ref), collectUniqueItems (ref), fFlagShopUseFuzzySearchModule (ref), searchMatchersModule (ref), constantsModule (ref), t (ref)
	local committedQuery = p4.committedQuery
	local sections = p4.sections
	local var10 = reactModule.useMemo(function()
		-- upvalues: committedQuery (ref), collectUniqueItems (copy), sections (ref), fFlagShopUseFuzzySearchModule (copy), searchMatchersModule (copy), constantsModule (copy)
		return if committedQuery == "" then {} else (if fFlagShopUseFuzzySearchModule then searchMatchersModule.fuzzyMatch else searchMatchersModule.substringMatch)(collectUniqueItems(sections), committedQuery, constantsModule.MAX_SEARCH_RESULTS)
	end, { sections, committedQuery })
	local minValue = math.min(p4.itemsPerRow, constantsModule.ITEMS_PER_SECTION)
	local var12 = reactModule.useMemo(function()
		-- upvalues: var10 (ref), t (copy), minValue (ref)
		if #var10 == 0 then
			return t
		end
		local t_1 = {}
		
		for i = 1, #var10, minValue do
			local t_2 = {}
			table.move(var10, i, math.min(i + minValue - 1, #var10), 1, t_2)
			table.insert(t_1, t_2)
		end
		return t_1
	end, { var10, minValue })
	
	return {
		rows = var12,
		columnCount = p4.itemsPerRow,
		onItemActivated = p4.onItemActivated,
		LayoutOrder = p4.LayoutOrder,
		state = if committedQuery == "" then "hint" elseif #var12 == 0 then "empty" else "results"
	}
end