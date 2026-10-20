local Parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(Parent.DataHydration.CreatorAgentChat)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local LoadingIndicatorModule = require(script.Parent.LoadingIndicator)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local config = {
	Art = IconName.PaintBrush,
	Audio = IconName.FiveVerticalLinesWave,
	Gameplay = IconName.Controller,
	Marketing = IconName.Wallet
}

local function _(p1): string
	return if #p1.tasks == 0 then "Not started" elseif p1.isComplete then `{#p1.tasks} completed tasks` else "Building..."
end

return ReactModule.memo(function(Frame)
	-- upvalues: config (copy), ReactModule (copy), View (copy), Text (copy), LoadingIndicatorModule (copy), Icon (copy), IconSize (copy)
	local TestId = Frame.testId or "build-agent-list"
	local Elements = {}
	
	for LayoutOrder, group in Frame.groups do
		local Entry = config[group.name]
		local Elements1 = {}
		
		for i = 1, math.min(3, #group.tasks) do
			local Task = group.tasks[i]
			Elements1[`Task{i}`] = ReactModule.createElement(View, {
				tag = "row align-y-center gap-small size-full-0 auto-y",
				LayoutOrder = i
			}, {
				Label = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "fill auto-y text-body-small text-align-x-left text-truncate-end content-emphasis",
					Text = Task.text
				}),
				Status = ReactModule.createElement(LoadingIndicatorModule, {
					layoutOrder = 2,
					status = Task.status,
					testId = `{TestId}-card-{LayoutOrder}-task-{i}`
				})
			})
		end
		Elements[`Card{LayoutOrder}`] = ReactModule.createElement(View, {
			tag = "col gap-small size-full-0 auto-y padding-large stroke-standard stroke-emphasis radius-large",
			LayoutOrder = LayoutOrder,
			onActivated = function()
				-- upvalues: Frame (copy), group (copy)
				Frame.onAgentActivated(group)
			end,
			testId = `{TestId}-card-{LayoutOrder}`
		}, {
			Header = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row align-y-center gap-small size-full-0 auto-y"
			}, {
				Icon = if Entry == nil then nil else ReactModule.createElement(Icon, {
					LayoutOrder = 1,
					tag = "auto-xy content-emphasis",
					name = Entry,
					size = IconSize.Small,
					testId = `{TestId}-card-{LayoutOrder}-category-icon`
				}),
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "fill auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
					Text = group.name
				})
			}),
			Status = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
				Text = if #group.tasks == 0 then "Not started" elseif group.isComplete then `{#group.tasks} completed tasks` else "Building..."
			}),
			Tasks = ReactModule.createElement(View, {
				LayoutOrder = 3,
				tag = "col gap-small size-full-0 auto-y padding-top-small"
			}, Elements1)
		})
	end
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y padding-y-medium",
		LayoutOrder = Frame.LayoutOrder,
		testId = TestId
	}, Elements)
end)