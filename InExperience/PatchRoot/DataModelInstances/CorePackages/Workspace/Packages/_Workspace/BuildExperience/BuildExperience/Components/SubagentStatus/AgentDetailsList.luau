local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
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

local function _(p1, p2)
	for i, v in p1 do
		if v.status == p2 then
			return v.text
		end
	end
	return p2 or "All"
end

local _ = function(p3, p4)
	-- upvalues: matchesSearchQueryModule (ref)
	return matchesSearchQueryModule(p3.text, p4) or matchesSearchQueryModule(p3.description, p4)
end

local _ = function(p3, p4)
	return p4 == nil or p3.status == p4
end

local _ = function(p3, p4)
	-- upvalues: matchesSearchQueryModule (ref)
	local searchQuery = p4.searchQuery
	local var1 = matchesSearchQueryModule(p3.text, searchQuery) or matchesSearchQueryModule(p3.description, searchQuery)
	
	if var1 then
		local status = p4.status
		
		if status == nil then
			return true
		end
		var1 = p3.status == status
	end
	return var1
end

return reactModule.memo(function(p3)
	-- upvalues: reactModule (ref), useScaledValue (ref), buildAgentDetailsStatusMenuWidth (ref), useLocalization (ref), localizationStringsModule (ref), subagentTaskStatus (ref), matchesSearchQueryModule (ref), view (ref), searchInput (ref), menu (ref), popoverAlign (ref), popoverSide (ref), inputSize (ref), chip (ref), iconName (ref), chipVariant (ref), chipSize (ref), todoListModule (ref)
	local var1, var2 = reactModule.useState("")
	local var3, var4 = reactModule.useState(nil)
	local var5, var6 = reactModule.useState(false)
	local var7 = useScaledValue(buildAgentDetailsStatusMenuWidth)
	local var8 = useLocalization({
		all = localizationStringsModule.SUBAGENT_STATUS_ALL,
		deleted = localizationStringsModule.SUBAGENT_STATUS_DELETED,
		done = localizationStringsModule.SUBAGENT_STATUS_DONE,
		error = localizationStringsModule.SUBAGENT_STATUS_ERROR,
		inProgress = localizationStringsModule.SUBAGENT_STATUS_IN_PROGRESS,
		pending = localizationStringsModule.SUBAGENT_STATUS_PENDING,
		searchTasks = localizationStringsModule.SUBAGENT_STATUS_SEARCH_TASKS,
		version = localizationStringsModule.SUBAGENT_STATUS_VERSION
	})
	local searchTasks = var8.searchTasks
	local _ = var8.version
	local list = {
		{ id = "All", status = nil, text = var8.all },
		{
			id = subagentTaskStatus.InProgress,
			status = subagentTaskStatus.InProgress,
			text = var8.inProgress
		},
		{
			id = subagentTaskStatus.Done,
			status = subagentTaskStatus.Done,
			text = var8.done
		},
		{
			id = subagentTaskStatus.Pending,
			status = subagentTaskStatus.Pending,
			text = var8.pending
		},
		{
			id = subagentTaskStatus.Error,
			status = subagentTaskStatus.Error,
			text = var8.error
		},
		{
			id = subagentTaskStatus.Deleted,
			status = subagentTaskStatus.Deleted,
			text = var8.deleted
		}
	}
	local t = { searchQuery = var1, status = var3 }
	local t_1 = {}
	
	for i, v in p3.group.tasks do
		local searchQuery = t.searchQuery
		local var9 = matchesSearchQueryModule(v.text, searchQuery) or matchesSearchQueryModule(v.description, searchQuery)
		
		if var9 then
			local status = t.status
			var9 = status == nil or v.status == status
		end
		if var9 then
			table.insert(t_1, {
				title = v.text,
				description = v.description,
				status = v.status,
				testId = `{p3.testId or "build-agent-details-list"}-item-{i}`
			})
		end
	end
	local var10
	local var11 = (function()
		-- upvalues: list (ref), var3 (ref)
		local t = {}
		
		for i, v in list do
			table.insert(t, {
				isDisabled = false,
				id = v.id,
				text = v.text,
				isChecked = var3 == v.status
			})
		end
		return t
	end)()
	local var12 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		var6(function(p4)
			return not p4
		end)
	end, {})
	local var13 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		var6(false)
	end, {})
	local var14 = reactModule.useCallback(function(p4)
		-- upvalues: var4 (ref), var6 (ref)
		var4(if p4 == "All" then nil else p4)
		var6(false)
	end, {})
	local createElement = reactModule.createElement
	local t_2 = {
		tag = "col gap-xxlarge size-full-0 auto-y padding-y-small",
		LayoutOrder = p3.LayoutOrder,
		testId = p3.testId or "build-agent-details-list"
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
			text = var1,
			placeholder = searchTasks,
			onChanged = var2,
			width = UDim.new(1, 0),
			testId = `{p3.testId or "build-agent-details-list"}-search-input`
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
		isOpen = var5,
		items = var11,
		onActivated = var14,
		onPressedOutside = var13,
		side = popoverSide.Bottom,
		size = inputSize.Medium,
		width = UDim.new(0, var7)
	}
	local t_9 = {}
	local createElement_4 = reactModule.createElement
	local t_10 = { LayoutOrder = 1 }
	
	for i_1, v_1 in list do
		if v_1.status == var3 then
			var10 = v_1.text
			t_10.text = var10
			t_10.trailing = iconName.ChevronLargeDown
			t_10.variant = chipVariant.Standard
			t_10.size = chipSize.Medium
			t_10.onActivated = var12
			t_10.testId = `{p3.testId or "build-agent-details-list"}-status-filter-chip`
			t_9.StatusChip = createElement_4(chip, t_10)
			t_7.StatusMenu = createElement_3(menu, t_8, t_9)
			t_5.Chips = createElement_2(view, t_6, t_7)
			t_3.Filters = createElement_1(view, t_4, t_5)
			t_3.List = reactModule.createElement(todoListModule, { layoutOrder = 2, items = t_1 })
			
			return createElement(view, t_2, t_3)
		end
	end
	var10 = var3 or "All"
end)