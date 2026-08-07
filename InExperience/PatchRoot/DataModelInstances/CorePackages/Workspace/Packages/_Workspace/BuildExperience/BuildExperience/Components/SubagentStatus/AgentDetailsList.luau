local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local todoListModule = require(script.Parent.TodoList)
local matchesSearchQueryModule = require(buildExperience.utils.matchesSearchQuery)
local chip = foundationModule.Chip
local menu = foundationModule.Menu
local searchInput = foundationModule.SearchInput
local view = foundationModule.View
local useScaledValue = foundationModule.Hooks.useScaledValue
local chipSize = foundationModule.Enums.ChipSize
local chipVariant = foundationModule.Enums.ChipVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local subagentTaskStatus = creatorAgentChatModule.SubagentTaskStatus
local buildAgentDetailsStatusMenuWidth = game:DefineFastInt("BuildAgentDetailsStatusMenuWidth", 172)
local list = {
	{
		id = "All",
		status = nil,
		text = localizationStringsModule.SUBAGENT_STATUS_ALL
	},
	{
		id = subagentTaskStatus.InProgress,
		status = subagentTaskStatus.InProgress,
		text = localizationStringsModule.SUBAGENT_STATUS_IN_PROGRESS
	},
	{
		id = subagentTaskStatus.Done,
		status = subagentTaskStatus.Done,
		text = localizationStringsModule.SUBAGENT_STATUS_DONE
	},
	{
		id = subagentTaskStatus.Pending,
		status = subagentTaskStatus.Pending,
		text = localizationStringsModule.SUBAGENT_STATUS_PENDING
	},
	{
		id = subagentTaskStatus.Error,
		status = subagentTaskStatus.Error,
		text = localizationStringsModule.SUBAGENT_STATUS_ERROR
	},
	{
		id = subagentTaskStatus.Deleted,
		status = subagentTaskStatus.Deleted,
		text = localizationStringsModule.SUBAGENT_STATUS_DELETED
	}
}

local function _(p0) --[[ line: 73 | named "getStatusFilterText" ]]
	-- upvalues: list (ref)
	for i, v in list do
		if v.status == p0 then
			return v.text
		end
	end
	return p0 or "All"
end

local _ = function(p1, p2) --[[ line: 82 | named "taskMatchesSearch" ]]
	-- upvalues: matchesSearchQueryModule (ref)
	return matchesSearchQueryModule(p1.text, p2) or matchesSearchQueryModule(p1.description, p2)
end

local _ = function(p3, p4) --[[ line: 86 | named "taskMatchesStatus" ]]
	return p4 == nil or p3.status == p4
end

local _ = function(p5, p6) --[[ line: 93 | named "shouldIncludeTask" ]]
	-- upvalues: matchesSearchQueryModule (ref)
	local searchQuery = p6.searchQuery
	local var9 = matchesSearchQueryModule(p5.text, searchQuery) or matchesSearchQueryModule(p5.description, searchQuery)
	
	if var9 then
		local status = p6.status
		
		if status == nil then
			return true
		end
		var9 = p5.status == status
	end
	return var9
end

return reactModule.memo(function(p7) --[[ line: 97 | named "AgentDetailsList" ]]
	-- upvalues: reactModule (ref), useScaledValue (ref), buildAgentDetailsStatusMenuWidth (ref), matchesSearchQueryModule (ref), list (ref), view (ref), searchInput (ref), localizationStringsModule (ref), menu (ref), popoverAlign (ref), popoverSide (ref), inputSize (ref), chip (ref), iconName (ref), chipVariant (ref), chipSize (ref), todoListModule (ref)
	local var10, var11 = reactModule.useState("")
	local var12, var13 = reactModule.useState(nil)
	local var14, var15 = reactModule.useState(false)
	local var16 = useScaledValue(buildAgentDetailsStatusMenuWidth)
	local t = { searchQuery = var10, status = var12 }
	local t_1 = {}
	
	for i, v in p7.group.tasks do
		local searchQuery = t.searchQuery
		local var33 = matchesSearchQueryModule(v.text, searchQuery) or matchesSearchQueryModule(v.description, searchQuery)
		
		if var33 then
			local status = t.status
			var33 = status == nil or v.status == status
		end
		if var33 then
			table.insert(t_1, {
				title = v.text,
				description = v.description,
				status = v.status,
				testId = `{p7.testId or "build-agent-details-list"}-item-{i}`
			})
		end
	end
	local var12_1
	local var19 = reactModule.useMemo(function() --[[ line: 120 ]]
		-- upvalues: list (copy), var12 (ref)
		local t = {}
		
		for i, v in list do
			table.insert(t, {
				isDisabled = false,
				id = v.id,
				text = v.text,
				isChecked = var12 == v.status
			})
		end
		return t
	end, { var12 })
	local var20 = reactModule.useCallback(function() --[[ line: 133 ]]
		-- upvalues: var15 (ref)
		var15(function(p8) --[[ line: 134 ]]
			return not p8
		end)
	end, {})
	local var21 = reactModule.useCallback(function() --[[ line: 139 ]]
		-- upvalues: var15 (ref)
		var15(false)
	end, {})
	local var22 = reactModule.useCallback(function(p9) --[[ line: 143 ]]
		-- upvalues: var13 (ref), var15 (ref)
		var13(if p9 == "All" then nil else p9)
		var15(false)
	end, {})
	local createElement = reactModule.createElement
	local t_2 = {
		tag = "col gap-xxlarge size-full-0 auto-y padding-y-small",
		LayoutOrder = p7.LayoutOrder,
		testId = p7.testId or "build-agent-details-list"
	}
	local t_3 = {}
	local createElement_1 = reactModule.createElement
	local t_4 = {
		LayoutOrder = 1,
		tag = "col gap-small size-full-0 auto-y"
	}
	local t_5 = {
		Search = reactModule.createElement(searchInput, {
			LayoutOrder = 1,
			text = var10,
			placeholder = localizationStringsModule.SUBAGENT_STATUS_SEARCH_TASKS,
			onChanged = var11,
			width = UDim.new(1, 0),
			testId = `{p7.testId or "build-agent-details-list"}-search-input`
		})
	}
	local createElement_2 = reactModule.createElement
	local t_6 = {
		LayoutOrder = 2,
		tag = "row align-y-center gap-small size-full-0 auto-y"
	}
	local t_7 = { VersionChip = nil }
	local createElement_3 = reactModule.createElement
	local t_8 = {
		LayoutOrder = 2,
		align = popoverAlign.Start,
		isOpen = var14,
		items = var19,
		onActivated = var22,
		onPressedOutside = var21,
		side = popoverSide.Bottom,
		size = inputSize.Medium,
		width = UDim.new(0, var16)
	}
	local t_9 = {}
	local createElement_4 = reactModule.createElement
	local t_10 = { LayoutOrder = 1 }
	
	for i_1, v_1 in list do
		if v_1.status == var12 then
			var12_1 = v_1.text
			t_10.text = var12_1
			t_10.trailing = iconName.ChevronLargeDown
			t_10.variant = chipVariant.Standard
			t_10.size = chipSize.Medium
			t_10.onActivated = var20
			t_10.testId = `{p7.testId or "build-agent-details-list"}-status-filter-chip`
			t_9.StatusChip = createElement_4(chip, t_10)
			t_7.StatusMenu = createElement_3(menu, t_8, t_9)
			t_5.Chips = createElement_2(view, t_6, t_7)
			t_3.Filters = createElement_1(view, t_4, t_5)
			t_3.List = reactModule.createElement(todoListModule, { layoutOrder = 2, items = t_1 })
			
			return createElement(view, t_2, t_3)
		end
	end
	var12_1 = var12 or "All"
end)