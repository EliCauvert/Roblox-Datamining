local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local TodoListModule = require(script.Parent.TodoList)
local MatchesSearchQueryModule = require(BuildExperience.utils.matchesSearchQuery)
local Chip = FoundationModule.Chip
local Menu = FoundationModule.Menu
local SearchInput = FoundationModule.SearchInput
local View = FoundationModule.View
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local ChipSize = FoundationModule.Enums.ChipSize
local ChipVariant = FoundationModule.Enums.ChipVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local SubagentTaskStatus = require(Parent.DataHydration.CreatorAgentChat).SubagentTaskStatus
local BuildAgentDetailsStatusMenuWidth = game:DefineFastInt("BuildAgentDetailsStatusMenuWidth", 172)

local function _(List, Status)
	for _, value in List do
		if value.status == Status then
			return value.text
		end
	end
	return Status or "All"
end

local _ = function(p1, p2)
	-- upvalues: MatchesSearchQueryModule (copy)
	return MatchesSearchQueryModule(p1.text, p2) or MatchesSearchQueryModule(p1.description, p2)
end

local _ = function(p1, Status): boolean
	return Status == nil or p1.status == Status
end

local _ = function(p1, p2)
	-- upvalues: MatchesSearchQueryModule (copy)
	local SearchQuery = p2.searchQuery
	local MatchesSearchQueryModuleResult = MatchesSearchQueryModule(p1.text, SearchQuery) or MatchesSearchQueryModule(p1.description, SearchQuery)
	
	if MatchesSearchQueryModuleResult then
		local Status = p2.status
		
		if Status == nil then
			return true
		end
		MatchesSearchQueryModuleResult = p1.status == Status
	end
	return MatchesSearchQueryModuleResult
end

return ReactModule.memo(function(Frame)
	-- upvalues: ReactModule (copy), UseScaledValueFunction (copy), BuildAgentDetailsStatusMenuWidth (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), SubagentTaskStatus (copy), MatchesSearchQueryModule (copy), View (copy), SearchInput (copy), Menu (copy), PopoverAlign (copy), PopoverSide (copy), InputSize (copy), Chip (copy), IconName (copy), ChipVariant (copy), ChipSize (copy), TodoListModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseScaledValueResult = UseScaledValueFunction(BuildAgentDetailsStatusMenuWidth)
	local UseLocalizationResult = UseLocalizationFunction({
		all = LocalizationStringsModule.SUBAGENT_STATUS_ALL,
		deleted = LocalizationStringsModule.SUBAGENT_STATUS_DELETED,
		done = LocalizationStringsModule.SUBAGENT_STATUS_DONE,
		error = LocalizationStringsModule.SUBAGENT_STATUS_ERROR,
		inProgress = LocalizationStringsModule.SUBAGENT_STATUS_IN_PROGRESS,
		pending = LocalizationStringsModule.SUBAGENT_STATUS_PENDING,
		searchTasks = LocalizationStringsModule.SUBAGENT_STATUS_SEARCH_TASKS,
		version = LocalizationStringsModule.SUBAGENT_STATUS_VERSION
	})
	local SearchTasks = UseLocalizationResult.searchTasks
	local _ = UseLocalizationResult.version
	local list = {
		{
			id = "All",
			status = nil,
			text = UseLocalizationResult.all
		},
		{
			id = SubagentTaskStatus.InProgress,
			status = SubagentTaskStatus.InProgress,
			text = UseLocalizationResult.inProgress
		},
		{
			id = SubagentTaskStatus.Done,
			status = SubagentTaskStatus.Done,
			text = UseLocalizationResult.done
		},
		{
			id = SubagentTaskStatus.Pending,
			status = SubagentTaskStatus.Pending,
			text = UseLocalizationResult.pending
		},
		{
			id = SubagentTaskStatus.Error,
			status = SubagentTaskStatus.Error,
			text = UseLocalizationResult.error
		},
		{
			id = SubagentTaskStatus.Deleted,
			status = SubagentTaskStatus.Deleted,
			text = UseLocalizationResult.deleted
		}
	}
	local config = { searchQuery = UseStateResult, status = UseStateResult1 }
	local Items = {}
	
	for i, _task in Frame.group.tasks do
		local SearchQuery = config.searchQuery
		local MatchesSearchQueryModuleResult = MatchesSearchQueryModule(_task.text, SearchQuery) or MatchesSearchQueryModule(_task.description, SearchQuery)
		
		if MatchesSearchQueryModuleResult then
			local Status = config.status
			MatchesSearchQueryModuleResult = Status == nil or _task.status == Status
		end
		if MatchesSearchQueryModuleResult then
			table.insert(Items, {
				title = _task.text,
				description = _task.description,
				status = _task.status,
				testId = `{Frame.testId or "build-agent-details-list"}-item-{i}`
			})
		end
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(function(p1): boolean
			return not p1
		end)
	end, {})
	local CreateElementFunction4 = ReactModule.createElement
	local config1 = {
		tag = "col gap-xxlarge size-full-0 auto-y padding-y-small",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId or "build-agent-details-list"
	}
	local t = {}
	local CreateElementFunction3 = ReactModule.createElement
	local config11 = {
		LayoutOrder = 1,
		tag = "col gap-small size-full-0 auto-y"
	}
	local config2 = {
		Search = ReactModule.createElement(SearchInput, {
			LayoutOrder = 1,
			text = UseStateResult,
			placeholder = SearchTasks,
			onChanged = UseStateResult2,
			width = UDim.new(1, 0),
			testId = `{Frame.testId or "build-agent-details-list"}-search-input`
		})
	}
	local CreateElementFunction2 = ReactModule.createElement
	local config3 = {
		LayoutOrder = 2,
		tag = "row align-y-center gap-small size-full-0 auto-y"
	}
	local config4 = { VersionChip = nil }
	local CreateElementFunction1 = ReactModule.createElement
	local config5 = {
		LayoutOrder = 2,
		align = PopoverAlign.Start,
		isOpen = UseStateResult3,
		items = (function()
			-- upvalues: list (copy), UseStateResult1 (copy)
			local List = {}
			
			for _, value in list do
				table.insert(List, {
					isDisabled = false,
					id = value.id,
					text = value.text,
					isChecked = UseStateResult1 == value.status
				})
			end
			return List
		end)(),
		onActivated = ReactModule.useCallback(function(p1)
			-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy)
			UseStateResult2_1(if p1 == "All" then nil else p1)
			UseStateResult2_2(false)
		end, {}),
		onPressedOutside = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2_2 (copy)
			UseStateResult2_2(false)
		end, {}),
		side = PopoverSide.Bottom,
		size = InputSize.Medium,
		width = UDim.new(0, UseScaledValueResult)
	}
	local t1 = {}
	local CreateElementFunction = ReactModule.createElement
	local config6 = { LayoutOrder = 1 }
	local UseStateResult1_1 = nil
	
	for _, value in list do
		if value.status == UseStateResult1 then
			UseStateResult1_1 = value.text
			config6.text = UseStateResult1_1
			config6.trailing = IconName.ChevronLargeDown
			config6.variant = ChipVariant.Standard
			config6.size = ChipSize.Medium
			config6.onActivated = UseResult
			config6.testId = `{Frame.testId or "build-agent-details-list"}-status-filter-chip`
			t1.StatusChip = CreateElementFunction(Chip, config6)
			config4.StatusMenu = CreateElementFunction1(Menu, config5, t1)
			config2.Chips = CreateElementFunction2(View, config3, config4)
			t.Filters = CreateElementFunction3(View, config11, config2)
			t.List = ReactModule.createElement(TodoListModule, { layoutOrder = 2, items = Items })
			
			return CreateElementFunction4(View, config1, t)
		end
	end
	UseStateResult1_1 = UseStateResult1 or "All"
end)