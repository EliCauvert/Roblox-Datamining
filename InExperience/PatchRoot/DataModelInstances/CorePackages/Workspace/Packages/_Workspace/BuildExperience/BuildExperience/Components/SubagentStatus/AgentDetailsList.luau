local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
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

local function _(p0, p1)
	for i, v in p0 do
		if v.status == p1 then
			return v.text
		end
	end
	return p1 or "All"
end

local _ = function(p2, p3)
	-- upvalues: matchesSearchQueryModule (ref)
	return matchesSearchQueryModule(p2.text, p3) or matchesSearchQueryModule(p2.description, p3)
end

local _ = function(p4, p5)
	return p5 == nil or p4.status == p5
end

local _ = function(p6, p7)
	-- upvalues: matchesSearchQueryModule (ref)
	local searchQuery = p7.searchQuery
	local var10 = matchesSearchQueryModule(p6.text, searchQuery) or matchesSearchQueryModule(p6.description, searchQuery)
	
	if var10 then
		local status = p7.status
		
		if status == nil then
			return true
		end
		var10 = p6.status == status
	end
	return var10
end

return reactModule.memo(function(p8)
	-- upvalues: reactModule (ref), useScaledValue (ref), buildAgentDetailsStatusMenuWidth (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), list (ref), subagentTaskStatus (ref), matchesSearchQueryModule (ref), view (ref), searchInput (ref), menu (ref), popoverAlign (ref), popoverSide (ref), inputSize (ref), chip (ref), iconName (ref), chipVariant (ref), chipSize (ref), todoListModule (ref)
	local SUBAGENT_STATUS_SEARCH_TASKS
	local var11, var12 = reactModule.useState("")
	local var13, var14 = reactModule.useState(nil)
	local var15, var16 = reactModule.useState(false)
	local var17 = useScaledValue(buildAgentDetailsStatusMenuWidth)
	local var18 = if fFlagBuildLocalization then useLocalization({
		all = localizationStringsModule.SUBAGENT_STATUS_ALL,
		deleted = localizationStringsModule.SUBAGENT_STATUS_DELETED,
		done = localizationStringsModule.SUBAGENT_STATUS_DONE,
		error = localizationStringsModule.SUBAGENT_STATUS_ERROR,
		inProgress = localizationStringsModule.SUBAGENT_STATUS_IN_PROGRESS,
		pending = localizationStringsModule.SUBAGENT_STATUS_PENDING,
		searchTasks = localizationStringsModule.SUBAGENT_STATUS_SEARCH_TASKS,
		version = localizationStringsModule.SUBAGENT_STATUS_VERSION
	}) else nil
	local _ = nil
	local SUBAGENT_STATUS_VERSION = nil
	
	if fFlagBuildLocalization then
		SUBAGENT_STATUS_SEARCH_TASKS = var18.searchTasks
		SUBAGENT_STATUS_VERSION = var18.version
	else
		SUBAGENT_STATUS_SEARCH_TASKS = localizationStringsModule.SUBAGENT_STATUS_SEARCH_TASKS
		SUBAGENT_STATUS_VERSION = localizationStringsModule.SUBAGENT_STATUS_VERSION
	end
	local var19 = if fFlagBuildLocalization then {
		{ id = "All", status = nil, text = var18.all },
		{
			id = subagentTaskStatus.InProgress,
			status = subagentTaskStatus.InProgress,
			text = var18.inProgress
		},
		{
			id = subagentTaskStatus.Done,
			status = subagentTaskStatus.Done,
			text = var18.done
		},
		{
			id = subagentTaskStatus.Pending,
			status = subagentTaskStatus.Pending,
			text = var18.pending
		},
		{
			id = subagentTaskStatus.Error,
			status = subagentTaskStatus.Error,
			text = var18.error
		},
		{
			id = subagentTaskStatus.Deleted,
			status = subagentTaskStatus.Deleted,
			text = var18.deleted
		}
	} else list
	local t = { searchQuery = var11, status = var13 }
	local t_1 = {}
	
	for i, v in p8.group.tasks do
		local searchQuery = t.searchQuery
		local var37 = matchesSearchQueryModule(v.text, searchQuery) or matchesSearchQueryModule(v.description, searchQuery)
		
		if var37 then
			local status = t.status
			var37 = status == nil or v.status == status
		end
		if var37 then
			table.insert(t_1, {
				title = v.text,
				description = v.description,
				status = v.status,
				testId = `{p8.testId or "build-agent-details-list"}-item-{i}`
			})
		end
	end
	local var13_1
	local function buildStatusMenuItems()
		-- upvalues: var19 (write), var13 (ref)
		local t = {}
		
		for i, v in var19 do
			table.insert(t, {
				isDisabled = false,
				id = v.id,
				text = v.text,
				isChecked = var13 == v.status
			})
		end
		return t
	end
	
	local var23 = if fFlagBuildLocalization then buildStatusMenuItems() else reactModule.useMemo(buildStatusMenuItems, { var13 })
	local var24 = reactModule.useCallback(function()
		-- upvalues: var16 (ref)
		var16(function(p9)
			return not p9
		end)
	end, {})
	local var25 = reactModule.useCallback(function()
		-- upvalues: var16 (ref)
		var16(false)
	end, {})
	local var26 = reactModule.useCallback(function(p10)
		-- upvalues: var14 (ref), var16 (ref)
		var14(if p10 == "All" then nil else p10)
		var16(false)
	end, {})
	local createElement = reactModule.createElement
	local t_2 = {
		tag = "col gap-xxlarge size-full-0 auto-y padding-y-small",
		LayoutOrder = p8.LayoutOrder,
		testId = p8.testId or "build-agent-details-list"
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
			text = var11,
			placeholder = SUBAGENT_STATUS_SEARCH_TASKS,
			onChanged = var12,
			width = UDim.new(1, 0),
			testId = `{p8.testId or "build-agent-details-list"}-search-input`
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
		isOpen = var15,
		items = var23,
		onActivated = var26,
		onPressedOutside = var25,
		side = popoverSide.Bottom,
		size = inputSize.Medium,
		width = UDim.new(0, var17)
	}
	local t_9 = {}
	local createElement_4 = reactModule.createElement
	local t_10 = { LayoutOrder = 1 }
	
	for i_1, v_1 in var19 do
		if v_1.status == var13 then
			var13_1 = v_1.text
			t_10.text = var13_1
			t_10.trailing = iconName.ChevronLargeDown
			t_10.variant = chipVariant.Standard
			t_10.size = chipSize.Medium
			t_10.onActivated = var24
			t_10.testId = `{p8.testId or "build-agent-details-list"}-status-filter-chip`
			t_9.StatusChip = createElement_4(chip, t_10)
			t_7.StatusMenu = createElement_3(menu, t_8, t_9)
			t_5.Chips = createElement_2(view, t_6, t_7)
			t_3.Filters = createElement_1(view, t_4, t_5)
			t_3.List = reactModule.createElement(todoListModule, { layoutOrder = 2, items = t_1 })
			
			return createElement(view, t_2, t_3)
		end
	end
	var13_1 = var13 or "All"
end)