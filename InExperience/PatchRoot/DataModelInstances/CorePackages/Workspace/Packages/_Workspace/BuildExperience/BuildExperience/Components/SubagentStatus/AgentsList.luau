local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local loadingIndicatorModule = require(script.Parent.LoadingIndicator)
local icon = foundationModule.Icon
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useScaledValue = foundationModule.Hooks.useScaledValue
local useTokens = foundationModule.Hooks.useTokens
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local subagentTaskCategory = creatorAgentChatModule.SubagentTaskCategory
local list = {
	subagentTaskCategory.Gameplay,
	subagentTaskCategory.Art,
	subagentTaskCategory.Audio,
	subagentTaskCategory.Marketing
}
local t = {
	Art = iconName.TwoMakeupBrushes,
	Audio = iconName.FiveVerticalLinesWave,
	Gameplay = iconName.Controller,
	Marketing = iconName.Wallet
}

local function getDisplayGroups(p1)
	-- upvalues: list (ref)
	local t = {}
	
	for i, v in p1 do
		t[v.name] = v
	end
	local t_1 = {}
	
	for i_1, v_1 in list do
		table.insert(t_1, t[v_1] or {
			isComplete = false,
			isLoading = false,
			name = v_1,
			tasks = {}
		})
		t[v_1] = nil
	end
	for i_2, v_2 in p1 do
		if t[v_2.name] ~= nil then
			table.insert(t_1, v_2)
			t[v_2.name] = nil
		end
	end
	return t_1
end

local function _(p2)
	-- upvalues: localizationStringsModule (ref)
	return if #p2.tasks == 0 then localizationStringsModule.SUBAGENT_STATUS_NOT_STARTED elseif p2.isComplete then localizationStringsModule.formatSubagentStatusCompletedTasks(#p2.tasks) else localizationStringsModule.SUBAGENT_STATUS_BUILDING
end

local function AgentTaskList(p2)
	-- upvalues: reactModule (ref), scrollView (ref), scrollBarVisibility (ref), view (ref), stateLayerAffordance (ref)
	local var1, var2 = reactModule.useBinding(0)
	
	return reactModule.createElement(scrollView, {
		tag = "shrink",
		LayoutOrder = p2.LayoutOrder,
		Size = var1:map(function(p3)
			return UDim2.new(1, 0, 0, p3)
		end),
		onAbsoluteCanvasSizeChanged = reactModule.useCallback(function(p3)
			-- upvalues: var2 (ref)
			var2(p3.AbsoluteCanvasSize.Y)
		end, { var2 }),
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.new(1, 0, 0, 0),
			scrollBarVisibility = scrollBarVisibility.None,
			ScrollingDirection = Enum.ScrollingDirection.Y
		},
		testId = p2.testId
	}, {
		Content = reactModule.createElement(view, {
			tag = "col size-full-0 auto-y",
			onActivated = p2.onActivated,
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, p2.taskGap)
			},
			stateLayer = { affordance = stateLayerAffordance.None },
			testId = `{p2.testId}-content`
		}, p2.children)
	})
end

local function AgentCard(p2)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), t (ref), reactModule (ref), view (ref), text (ref), loadingIndicatorModule (ref), icon (ref), iconSize (ref), AgentTaskList (ref)
	local group = p2.group
	local var1 = if fFlagBuildLocalization then useLocalization({
		building = localizationStringsModule.SUBAGENT_STATUS_BUILDING,
		completedTasks = {
			localizationStringsModule.SUBAGENT_STATUS_COMPLETED_TASKS,
			COUNT = #group.tasks
		},
		notStarted = localizationStringsModule.SUBAGENT_STATUS_NOT_STARTED
	}) else nil
	local var2 = if fFlagBuildLocalization then if #group.tasks == 0 then var1.notStarted elseif group.isComplete then var1.completedTasks else var1.building elseif #group.tasks == 0 then localizationStringsModule.SUBAGENT_STATUS_NOT_STARTED elseif group.isComplete then localizationStringsModule.formatSubagentStatusCompletedTasks(#group.tasks) else localizationStringsModule.SUBAGENT_STATUS_BUILDING
	local name = t[group.name]
	local var3 = reactModule.useCallback(function()
		-- upvalues: p2 (ref), group (ref)
		p2.onAgentActivated(group)
	end, { p2.onAgentActivated, group })
	local t_1 = {}
	
	for i, v in group.tasks do
		t_1[`Task{i}`] = reactModule.createElement(view, {
			tag = "row align-y-center gap-small size-full-0 auto-y",
			LayoutOrder = i,
			testId = `{p2.testId}-card-{p2.index}-task-{i}`
		}, {
			Label = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "fill auto-y text-body-small text-align-x-left text-truncate-end content-emphasis",
				Text = v.text
			}),
			Status = reactModule.createElement(loadingIndicatorModule, {
				layoutOrder = 2,
				status = v.status,
				testId = `{p2.testId}-card-{p2.index}-task-{i}`
			})
		})
	end
	return reactModule.createElement(view, {
		tag = "col gap-large size-full-0 auto-y padding-large stroke-standard stroke-emphasis radius-large",
		LayoutOrder = p2.index,
		onActivated = if #group.tasks > 0 then var3 else nil,
		sizeConstraint = { MaxSize = Vector2.new(1e999, p2.maxHeight) },
		testId = `{p2.testId}-card-{p2.index}-container`
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-small size-full-0 auto-y",
			testId = `{p2.testId}-card-{p2.index}`
		}, {
			Icon = if name ~= nil then nil else reactModule.createElement(icon, {
				LayoutOrder = 1,
				tag = "auto-xy content-emphasis",
				name = name,
				size = iconSize.Small,
				testId = `{p2.testId}-card-{p2.index}-category-icon`
			}),
			Title = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = group.name
			}),
			Status = reactModule.createElement(text, {
				LayoutOrder = 3,
				tag = "auto-xy padding-left-large text-body-small text-align-x-right content-emphasis",
				Text = var2
			})
		}),
		Tasks = if #group.tasks > 0 then reactModule.createElement(AgentTaskList, {
			LayoutOrder = 2,
			onActivated = var3,
			taskGap = p2.taskGap,
			testId = `{p2.testId}-card-{p2.index}-tasks`
		}, t_1) else nil
	})
end

return reactModule.memo(function(p3)
	-- upvalues: useTokens (ref), useScaledValue (ref), getDisplayGroups (ref), reactModule (ref), AgentCard (ref), view (ref)
	local var4 = useTokens()
	local var5 = useScaledValue(156)
	local testId = p3.testId or "build-agent-list"
	local t = {}
	
	for i, v in getDisplayGroups(p3.groups) do
		t[`Card{i}`] = reactModule.createElement(AgentCard, {
			group = v,
			index = i,
			maxHeight = var5,
			onAgentActivated = p3.onAgentActivated,
			taskGap = var4.Gap.Small,
			testId = testId
		})
	end
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-y-medium",
		LayoutOrder = p3.LayoutOrder,
		testId = testId
	}, t)
end)