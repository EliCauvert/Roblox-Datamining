local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)
local InputPlacementModule = require(Foundation.Enums.InputPlacement)
local InputSizeModule = require(Foundation.Enums.InputSize)
local list = {
	InputSizeModule.XSmall,
	InputSizeModule.Small,
	InputSizeModule.Medium
}
local Placement = { InputPlacementModule.Start, InputPlacementModule.End }
local Size = {
	InputSizeModule.Medium,
	InputSizeModule.XSmall,
	InputSizeModule.Small
}

local function noop() --[[ Line: 55 ]] end

local function Section(Frame) --[[ Line: 57 ]]
	-- upvalues: ReactModule (copy), ViewModule (copy), TextModule (copy)
	return ReactModule.createElement(ViewModule, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Title = ReactModule.createElement(TextModule, {
			tag = "auto-xy text-label-medium content-default",
			LayoutOrder = 1,
			Text = Frame.name
		}),
		Content = ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			tag = Frame.contentTag or "row gap-large align-y-top auto-xy wrap"
		}, Frame.children)
	})
end

local function Page(p1) --[[ Line: 79 ]]
	-- upvalues: ReactModule (copy), ViewModule (copy)
	return ReactModule.createElement(ViewModule, {
		tag = "col gap-xxlarge size-full-0 auto-y padding-y-large bg-surface-0"
	}, p1.children)
end

local function createItems(Item, States) --[[ Line: 87 ]]
	-- upvalues: ReactModule (copy), noop (copy)
	local Elements = {}
	
	for LayoutOrder, state in States do
		Elements[`Item-{LayoutOrder}`] = ReactModule.createElement(Item, {
			label = state.label,
			hint = state.hint,
			isChecked = state.isChecked,
			isDisabled = state.isDisabled,
			isIndeterminate = state.isIndeterminate,
			onActivated = state.onActivated or noop,
			LayoutOrder = LayoutOrder
		})
	end
	return Elements
end

local function staticItems() --[[ Line: 105 ]]
	return {
		{ label = "Option A", isChecked = true },
		{ label = "Option B", isChecked = false },
		{ label = "Option C", isChecked = true }
	}
end

return {
	create = function(p1) --[[ Line: 113 ]]
		-- upvalues: ReactModule (copy), ViewModule (copy), createItems (copy), Page (copy), Section (copy), DashModule (copy), list (copy), staticItems (copy), InputSizeModule (copy), Placement (copy), Size (copy), Placement (copy)
		return {
			summary = p1.summary,
			stories = {
				{
					name = "Playground",
					story = function(p2) --[[ Line: 114 ]]
						-- upvalues: ReactModule (upval), p1 (copy), ViewModule (upval), createItems (upval)
						local Controls = p2.controls
						local UseStateResult, UseStateResult2 = ReactModule.useState({ true, false, true, false })
						local t = {}
						
						for i, label in p1.labels do
							t[i] = {
								label = label,
								hint = if Controls.showHints then p1.hints[i] else nil,
								isChecked = UseStateResult[i],
								onActivated = function(p3) --[[ Line: 131 ]]
									-- upvalues: UseStateResult2 (copy), i (copy)
									UseStateResult2(function(Tbl) --[[ Line: 132 ]]
										-- upvalues: i (upval), p3 (copy)
										local Copy = table.clone(Tbl)
										Copy[i] = p3
										
										return Copy
									end)
								end
							}
						end
						return ReactModule.createElement(ViewModule, { tag = "auto-xy padding-medium" }, {
							Group = ReactModule.createElement(p1.Group, {
								legend = Controls.legend,
								size = Controls.size,
								placement = Controls.placement
							}, (createItems(p1.Item, t)))
						})
					end
				},
				{
					name = "Sizing",
					story = function() --[[ Line: 152 ]]
						-- upvalues: ReactModule (upval), Page (upval), Section (upval), DashModule (upval), list (upval), p1 (copy), createItems (upval), staticItems (upval)
						return ReactModule.createElement(Page, nil, {
							Size = ReactModule.createElement(Section, {
								LayoutOrder = 1,
								name = "Size",
								contentTag = "row gap-xxlarge auto-xy wrap"
							}, DashModule.map(list, function(Legend, LayoutOrder) --[[ Line: 161 ]]
								-- upvalues: ReactModule (upval), p1 (upval), createItems (upval), staticItems (upval)
								return ReactModule.createElement(p1.Group, {
									legend = Legend,
									size = Legend,
									LayoutOrder = LayoutOrder
								}, (createItems(p1.Item, (staticItems()))))
							end))
						})
					end
				},
				{
					name = "States",
					story = function() --[[ Line: 172 ]]
						-- upvalues: ReactModule (upval), Page (upval), Section (upval), p1 (copy), InputSizeModule (upval), createItems (upval)
						return ReactModule.createElement(Page, nil, {
							States = ReactModule.createElement(Section, {
								LayoutOrder = 1,
								name = "Item states",
								contentTag = "auto-xy"
							}, {
								Group = ReactModule.createElement(p1.Group, { size = InputSizeModule.Medium }, (createItems(p1.Item, p1.states)))
							})
						})
					end
				},
				{
					name = "Placement",
					story = function() --[[ Line: 188 ]]
						-- upvalues: ReactModule (upval), Page (upval), Section (upval), DashModule (upval), Placement (upval), p1 (copy), createItems (upval), staticItems (upval)
						return ReactModule.createElement(Page, nil, {
							Placement = ReactModule.createElement(Section, {
								LayoutOrder = 1,
								name = "Placement",
								contentTag = "row gap-xxlarge auto-xy wrap"
							}, DashModule.map(Placement, function(Legend, LayoutOrder) --[[ Line: 197 ]]
								-- upvalues: ReactModule (upval), p1 (upval), createItems (upval), staticItems (upval)
								return ReactModule.createElement(p1.Group, {
									legend = Legend,
									placement = Legend,
									LayoutOrder = LayoutOrder
								}, (createItems(p1.Item, (staticItems()))))
							end))
						})
					end
				}
			},
			controls = {
				showHints = false,
				legend = p1.defaultLegend,
				size = Size,
				placement = Placement
			}
		}
	end
}