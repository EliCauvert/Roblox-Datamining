local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)
local inputPlacementModule = require(foundation.Enums.InputPlacement)
local inputSizeModule = require(foundation.Enums.InputSize)
local list = {
	inputSizeModule.XSmall,
	inputSizeModule.Small,
	inputSizeModule.Medium
}
local list_1 = { inputPlacementModule.Start, inputPlacementModule.End }
local list_2 = {
	inputSizeModule.Medium,
	inputSizeModule.XSmall,
	inputSizeModule.Small
}

local function noop() end

local function Section(p1)
	-- upvalues: reactModule (ref), viewModule (ref), textModule (ref)
	return reactModule.createElement(viewModule, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, {
		Title = reactModule.createElement(textModule, {
			tag = "auto-xy text-label-medium content-default",
			LayoutOrder = 1,
			Text = p1.name
		}),
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = p1.contentTag or "row gap-large auto-xy wrap"
		}, p1.children)
	})
end

local function Page(p1)
	-- upvalues: reactModule (ref), viewModule (ref)
	return reactModule.createElement(viewModule, {
		tag = "col gap-xxlarge size-full-0 auto-y padding-y-large bg-surface-0"
	}, p1.children)
end

local function createItems(p1, p2)
	-- upvalues: reactModule (ref), noop (ref)
	local t = {}
	
	for i, v in p2 do
		t[`Item-{i}`] = reactModule.createElement(p1, {
			label = v.label,
			hint = v.hint,
			isChecked = v.isChecked,
			isDisabled = v.isDisabled,
			isIndeterminate = v.isIndeterminate,
			onActivated = v.onActivated or noop,
			LayoutOrder = i
		})
	end
	return t
end

local function staticItems()
	return {
		{ label = "Option A", isChecked = true },
		{ label = "Option B", isChecked = false },
		{ label = "Option C", isChecked = true }
	}
end

return {
	create = function(p3)
		-- upvalues: reactModule (ref), viewModule (ref), createItems (ref), Page (ref), Section (ref), dashModule (ref), list (ref), staticItems (ref), inputSizeModule (ref), list_1 (ref), list_2 (ref), list_1 (ref)
		return {
			summary = p3.summary,
			stories = {
				{
					name = "Playground",
					story = function(value)
						-- upvalues: reactModule (copy), p3 (ref), viewModule (copy), createItems (copy)
						local controls = value.controls
						local var1, var2 = reactModule.useState({ true, false, true, false })
						local t = {}
						
						for i, v in p3.labels do
							t[i] = {
								label = v,
								hint = if controls.showHints then p3.hints[i] else nil,
								isChecked = var1[i],
								onActivated = function(p4)
									-- upvalues: var2 (ref), i (ref)
									var2(function(p5)
										-- upvalues: i (copy), p4 (ref)
										local cloned = table.clone(p5)
										cloned[i] = p4
										
										return cloned
									end)
								end
							}
						end
						return reactModule.createElement(viewModule, { tag = "auto-xy padding-medium" }, {
							Group = reactModule.createElement(p3.Group, {
								legend = controls.legend,
								size = controls.size,
								placement = controls.placement
							}, createItems(p3.Item, t))
						})
					end
				},
				{
					name = "Sizing",
					story = function()
						-- upvalues: reactModule (copy), Page (copy), Section (copy), dashModule (copy), list (copy), p3 (ref), createItems (copy), staticItems (copy)
						return reactModule.createElement(Page, nil, {
							Size = reactModule.createElement(Section, {
								LayoutOrder = 1,
								name = "Size",
								contentTag = "row gap-xxlarge auto-xy wrap"
							}, dashModule.map(list, function(p4, p5)
								-- upvalues: reactModule (copy), p3 (copy), createItems (copy), staticItems (copy)
								return reactModule.createElement(p3.Group, { legend = p4, size = p4, LayoutOrder = p5 }, createItems(p3.Item, staticItems()))
							end))
						})
					end
				},
				{
					name = "States",
					story = function()
						-- upvalues: reactModule (copy), Page (copy), Section (copy), p3 (ref), inputSizeModule (copy), createItems (copy)
						return reactModule.createElement(Page, nil, {
							States = reactModule.createElement(Section, {
								LayoutOrder = 1,
								name = "Item states",
								contentTag = "auto-xy"
							}, {
								Group = reactModule.createElement(p3.Group, { size = inputSizeModule.Medium }, createItems(p3.Item, p3.states))
							})
						})
					end
				},
				{
					name = "Placement",
					summary = `placement positions each item's label relative to its {string.lower(p4.itemName)}.`,
					story = function()
						-- upvalues: reactModule (copy), Page (copy), Section (copy), dashModule (copy), list_1 (copy), p3 (ref), createItems (copy), staticItems (copy)
						return reactModule.createElement(Page, nil, {
							Placement = reactModule.createElement(Section, {
								LayoutOrder = 1,
								name = "Placement",
								contentTag = "row gap-xxlarge auto-xy wrap"
							}, dashModule.map(list_1, function(p4, p5)
								-- upvalues: reactModule (copy), p3 (copy), createItems (copy), staticItems (copy)
								return reactModule.createElement(p3.Group, { legend = p4, placement = p4, LayoutOrder = p5 }, createItems(p3.Item, staticItems()))
							end))
						})
					end
				}
			},
			controls = {
				showHints = false,
				legend = p3.defaultLegend,
				size = list_2,
				placement = list_1
			}
		}
	end
}