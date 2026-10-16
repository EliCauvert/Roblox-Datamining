local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local LoadingIndicatorModule = require(script.Parent.LoadingIndicator)
local Icon = FoundationModule.Icon
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseTokensFunction = FoundationModule.Hooks.useTokens
local SubagentTaskCategory = require(Parent.DataHydration.CreatorAgentChat).SubagentTaskCategory
local Names = {
	SubagentTaskCategory.Gameplay,
	SubagentTaskCategory.Art,
	SubagentTaskCategory.Audio,
	SubagentTaskCategory.Marketing
}
local config = {
	Art = IconName.TwoMakeupBrushes,
	Audio = IconName.FiveVerticalLinesWave,
	Gameplay = IconName.Controller,
	Marketing = IconName.Wallet
}

local function getDisplayGroups(List) --[[ Line: 50 ]]
	-- upvalues: Names (copy)
	local t = {}
	
	for _, value in List do
		t[value.name] = value
	end
	local List1 = {}
	
	for _, name in Names do
		table.insert(List1, t[name] or {
			isComplete = false,
			isLoading = false,
			name = name,
			tasks = {}
		})
		t[name] = nil
	end
	for _, value1 in List do
		if t[value1.name] ~= nil then
			table.insert(List1, value1)
			t[value1.name] = nil
		end
	end
	return List1
end

local function AgentTaskList(Frame) --[[ Line: 86 ]]
	-- upvalues: ReactModule (copy), ScrollView (copy), ScrollBarVisibility (copy), View (copy), StateLayerAffordance (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	
	return ReactModule.createElement(ScrollView, {
		tag = "shrink",
		LayoutOrder = Frame.LayoutOrder,
		Size = UseBindingResult:map(function(YOffset): UDim2 --[[ Line: 88 ]]
			return UDim2.new(1, 0, 0, YOffset)
		end),
		onAbsoluteCanvasSizeChanged = ReactModule.useCallback(function(ScrollFrame) --[[ Line: 91 ]]
			-- upvalues: UseBindingResult2 (copy)
			UseBindingResult2(ScrollFrame.AbsoluteCanvasSize.Y)
		end, { UseBindingResult2 }),
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.new(1, 0, 0, 0),
			scrollBarVisibility = ScrollBarVisibility.None,
			ScrollingDirection = Enum.ScrollingDirection.Y
		},
		testId = Frame.testId
	}, {
		Content = ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y",
			onActivated = Frame.onActivated,
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, Frame.taskGap)
			},
			stateLayer = { affordance = StateLayerAffordance.None },
			testId = `{Frame.testId}-content`
		}, Frame.children)
	})
end

local function AgentCard(p1) --[[ Line: 132 ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), config (copy), ReactModule (copy), View (copy), Text (copy), LoadingIndicatorModule (copy), Icon (copy), IconSize (copy), AgentTaskList (copy)
	local Group = p1.group
	local UseLocalizationResult = UseLocalizationFunction({
		building = LocalizationStringsModule.SUBAGENT_STATUS_BUILDING,
		completedTasks = {
			LocalizationStringsModule.SUBAGENT_STATUS_COMPLETED_TASKS,
			COUNT = #Group.tasks
		},
		notStarted = LocalizationStringsModule.SUBAGENT_STATUS_NOT_STARTED
	})
	local NotStarted = if #Group.tasks == 0 then UseLocalizationResult.notStarted elseif Group.isComplete then UseLocalizationResult.completedTasks else UseLocalizationResult.building
	local Entry = config[Group.name]
	local UseResult = ReactModule.useCallback(function() --[[ Line: 151 ]]
		-- upvalues: p1 (copy), Group (copy)
		p1.onAgentActivated(Group)
	end, { p1.onAgentActivated, Group })
	local Elements = {}
	
	for LayoutOrder, _task in Group.tasks do
		Elements[`Task{LayoutOrder}`] = ReactModule.createElement(View, {
			tag = "row align-y-center gap-small size-full-0 auto-y",
			LayoutOrder = LayoutOrder,
			testId = `{p1.testId}-card-{p1.index}-task-{LayoutOrder}`
		}, {
			Label = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "fill auto-y text-body-small text-align-x-left text-truncate-end content-emphasis",
				Text = _task.text
			}),
			Status = ReactModule.createElement(LoadingIndicatorModule, {
				layoutOrder = 2,
				status = _task.status,
				testId = `{p1.testId}-card-{p1.index}-task-{LayoutOrder}`
			})
		})
	end
	return ReactModule.createElement(View, {
		tag = "col gap-large size-full-0 auto-y padding-large stroke-standard stroke-emphasis radius-large",
		LayoutOrder = p1.index,
		onActivated = if #Group.tasks > 0 then UseResult else nil,
		sizeConstraint = { MaxSize = Vector2.new(1e999, p1.maxHeight) },
		testId = `{p1.testId}-card-{p1.index}-container`
	}, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-small size-full-0 auto-y",
			testId = `{p1.testId}-card-{p1.index}`
		}, {
			Icon = if Entry == nil then nil else ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				tag = "auto-xy content-emphasis",
				name = Entry,
				size = IconSize.Small,
				testId = `{p1.testId}-card-{p1.index}-category-icon`
			}),
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "fill auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = Group.name
			}),
			Status = ReactModule.createElement(Text, {
				LayoutOrder = 3,
				tag = "auto-xy padding-left-large text-body-small text-align-x-right content-emphasis",
				Text = NotStarted
			})
		}),
		Tasks = if #Group.tasks > 0 then ReactModule.createElement(AgentTaskList, {
			LayoutOrder = 2,
			onActivated = UseResult,
			taskGap = p1.taskGap,
			testId = `{p1.testId}-card-{p1.index}-tasks`
		}, Elements) else nil
	})
end

return ReactModule.memo(function(Frame) --[[ Line: 220 | Named "AgentsList" ]]
	-- upvalues: UseTokensFunction (copy), UseScaledValueFunction (copy), getDisplayGroups (copy), ReactModule (copy), AgentCard (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	local UseScaledValueResult = UseScaledValueFunction(156)
	local TestId = Frame.testId or "build-agent-list"
	local Elements = {}
	
	for Index, Group in getDisplayGroups(Frame.groups) do
		Elements[`Card{Index}`] = ReactModule.createElement(AgentCard, {
			group = Group,
			index = Index,
			maxHeight = UseScaledValueResult,
			onAgentActivated = Frame.onAgentActivated,
			taskGap = UseTokensResult.Gap.Small,
			testId = TestId
		})
	end
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y padding-y-medium",
		LayoutOrder = Frame.LayoutOrder,
		testId = TestId
	}, Elements)
end)