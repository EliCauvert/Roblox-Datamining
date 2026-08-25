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

local function getDisplayGroups(p0)
	-- upvalues: list (ref)
	local t = {}
	
	for i, v in p0 do
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
	for i_2, v_2 in p0 do
		if t[v_2.name] ~= nil then
			table.insert(t_1, v_2)
			t[v_2.name] = nil
		end
	end
	return t_1
end

local function _(p1)
	-- upvalues: localizationStringsModule (ref)
	return if #p1.tasks == 0 then localizationStringsModule.SUBAGENT_STATUS_NOT_STARTED elseif p1.isComplete then localizationStringsModule.formatSubagentStatusCompletedTasks(#p1.tasks) else localizationStringsModule.SUBAGENT_STATUS_BUILDING
end

local function AgentTaskList(p2)
	-- upvalues: reactModule (ref), scrollView (ref), scrollBarVisibility (ref), view (ref), stateLayerAffordance (ref)
	local var14, var15 = reactModule.useBinding(0)
	
	return reactModule.createElement(scrollView, {
		tag = "shrink",
		LayoutOrder = p2.LayoutOrder,
		Size = var14:map(function(p3)
			return UDim2.new(1, 0, 0, p3)
		end),
		onAbsoluteCanvasSizeChanged = reactModule.useCallback(function(p4)
			-- upvalues: var15 (ref)
			var15(p4.AbsoluteCanvasSize.Y)
		end, { var15 }),
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

local function AgentCard(p5)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), t (ref), reactModule (ref), view (ref), text (ref), loadingIndicatorModule (ref), icon (ref), iconSize (ref), AgentTaskList (ref)
	local group = p5.group
	local var16 = if fFlagBuildLocalization then useLocalization({
		building = localizationStringsModule.SUBAGENT_STATUS_BUILDING,
		completedTasks = {
			localizationStringsModule.SUBAGENT_STATUS_COMPLETED_TASKS,
			COUNT = #group.tasks
		},
		notStarted = localizationStringsModule.SUBAGENT_STATUS_NOT_STARTED
	}) else nil
	local var17 = if fFlagBuildLocalization then if #group.tasks == 0 then var16.notStarted elseif group.isComplete then var16.completedTasks else var16.building elseif #group.tasks == 0 then localizationStringsModule.SUBAGENT_STATUS_NOT_STARTED elseif group.isComplete then localizationStringsModule.formatSubagentStatusCompletedTasks(#group.tasks) else localizationStringsModule.SUBAGENT_STATUS_BUILDING
	local name = t[group.name]
	local var18 = reactModule.useCallback(function()
		-- upvalues: p5 (ref), group (ref)
		p5.onAgentActivated(group)
	end, { p5.onAgentActivated, group })
	local t_1 = {}
	
	for i, v in group.tasks do
		t_1[`Task{i}`] = reactModule.createElement(view, {
			tag = "row align-y-center gap-small size-full-0 auto-y",
			LayoutOrder = i,
			testId = `{p5.testId}-card-{p5.index}-task-{i}`
		}, {
			Label = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "fill auto-y text-body-small text-align-x-left text-truncate-end content-emphasis",
				Text = v.text
			}),
			Status = reactModule.createElement(loadingIndicatorModule, {
				layoutOrder = 2,
				status = v.status,
				testId = `{p5.testId}-card-{p5.index}-task-{i}`
			})
		})
	end
	return reactModule.createElement(view, {
		tag = "col gap-large size-full-0 auto-y padding-large stroke-standard stroke-emphasis radius-large",
		LayoutOrder = p5.index,
		onActivated = if #group.tasks > 0 then var18 else nil,
		sizeConstraint = { MaxSize = Vector2.new(1e999, p5.maxHeight) },
		testId = `{p5.testId}-card-{p5.index}-container`
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-small size-full-0 auto-y",
			testId = `{p5.testId}-card-{p5.index}`
		}, {
			Icon = if name ~= nil then nil else reactModule.createElement(icon, {
				LayoutOrder = 1,
				tag = "auto-xy content-emphasis",
				name = name,
				size = iconSize.Small,
				testId = `{p5.testId}-card-{p5.index}-category-icon`
			}),
			Title = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = group.name
			}),
			Status = reactModule.createElement(text, {
				LayoutOrder = 3,
				tag = "auto-xy padding-left-large text-body-small text-align-x-right content-emphasis",
				Text = var17
			})
		}),
		Tasks = if #group.tasks > 0 then reactModule.createElement(AgentTaskList, {
			LayoutOrder = 2,
			onActivated = var18,
			taskGap = p5.taskGap,
			testId = `{p5.testId}-card-{p5.index}-tasks`
		}, t_1) else nil
	})
end

return reactModule.memo(function(p6)
	-- upvalues: useTokens (ref), useScaledValue (ref), getDisplayGroups (ref), reactModule (ref), AgentCard (ref), view (ref)
	local var20 = useTokens()
	local var21 = useScaledValue(156)
	local testId = p6.testId or "build-agent-list"
	local t = {}
	
	for i, v in getDisplayGroups(p6.groups) do
		t[`Card{i}`] = reactModule.createElement(AgentCard, {
			group = v,
			index = i,
			maxHeight = var21,
			onAgentActivated = p6.onAgentActivated,
			taskGap = var20.Gap.Small,
			testId = testId
		})
	end
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-y-medium",
		LayoutOrder = p6.LayoutOrder,
		testId = testId
	}, t)
end)