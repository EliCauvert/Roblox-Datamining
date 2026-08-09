local parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local loadingIndicatorModule = require(script.Parent.LoadingIndicator)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local t = {
	Art = iconName.PaintBrush,
	Audio = iconName.FiveVerticalLinesWave,
	Gameplay = iconName.Controller,
	Marketing = iconName.Wallet
}

local function _(p0) --[[ line: 37 | named "getStatusText" ]]
	return if #p0.tasks == 0 then "Not started" elseif p0.isComplete then `{#p0.tasks} completed tasks` else "Building..."
end

return reactModule.memo(function(p1) --[[ line: 47 | named "AgentsList" ]]
	-- upvalues: t (ref), reactModule (ref), view (ref), text (ref), loadingIndicatorModule (ref), icon (ref), iconSize (ref)
	local testId = p1.testId or "build-agent-list"
	local t_1 = {}
	
	for i, v in p1.groups do
		local name = t[v.name]
		local t_2 = {}
		
		for i_1 = 1, math.min(3, #v.tasks) do
			local var7 = v.tasks[i_1]
			t_2[`Task{i_1}`] = reactModule.createElement(view, {
				tag = "row align-y-center gap-small size-full-0 auto-y",
				LayoutOrder = i_1
			}, {
				Label = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "fill auto-y text-body-small text-align-x-left text-truncate-end content-emphasis",
					Text = var7.text
				}),
				Status = reactModule.createElement(loadingIndicatorModule, {
					layoutOrder = 2,
					status = var7.status,
					testId = `{testId}-card-{i}-task-{i_1}`
				})
			})
		end
		t_1[`Card{i}`] = reactModule.createElement(view, {
			tag = "col gap-small size-full-0 auto-y padding-large stroke-standard stroke-emphasis radius-large",
			LayoutOrder = i,
			onActivated = function() --[[ line: 75 ]]
				-- upvalues: p1 (ref), v (ref)
				p1.onAgentActivated(v)
			end,
			testId = `{testId}-card-{i}`
		}, {
			Header = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "row align-y-center gap-small size-full-0 auto-y"
			}, {
				Icon = if name ~= nil then nil else reactModule.createElement(icon, {
					LayoutOrder = 1,
					tag = "auto-xy content-emphasis",
					name = name,
					size = iconSize.Small,
					testId = `{testId}-card-{i}-category-icon`
				}),
				Title = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "fill auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
					Text = v.name
				})
			}),
			Status = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
				Text = if #v.tasks == 0 then "Not started" elseif v.isComplete then `{#v.tasks} completed tasks` else "Building..."
			}),
			Tasks = reactModule.createElement(view, {
				LayoutOrder = 3,
				tag = "col gap-small size-full-0 auto-y padding-top-small"
			}, t_2)
		})
	end
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-x-large padding-y-medium",
		LayoutOrder = p1.LayoutOrder,
		testId = testId
	}, t_1)
end)