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

local function Section(p0)
	-- upvalues: reactModule (ref), viewModule (ref), textModule (ref)
	return reactModule.createElement(viewModule, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p0.LayoutOrder
	}, {
		Title = reactModule.createElement(textModule, {
			tag = "auto-xy text-label-medium content-default",
			LayoutOrder = 1,
			Text = p0.name
		}),
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = p0.contentTag or "row gap-large align-y-start auto-xy wrap"
		}, p0.children)
	})
end

local function Page(p1)
	-- upvalues: reactModule (ref), viewModule (ref)
	return reactModule.createElement(viewModule, {
		tag = "col gap-xxlarge size-full-0 auto-y padding-y-large bg-surface-0"
	}, p1.children)
end

local function createItems(p2, p3)
	-- upvalues: reactModule (ref), noop (ref)
	local t = {}
	
	for i, v in p3 do
		t[`Item-{i}`] = reactModule.createElement(p2, {
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
	create = function(p4)
		-- upvalues: reactModule (ref), viewModule (ref), createItems (ref), Page (ref), Section (ref), dashModule (ref), list (ref), staticItems (ref), inputSizeModule (ref), list_1 (ref), list_2 (ref), list_1 (ref)
		return {
			summary = p4.summary,
			stories = {
				{
					name = "Playground",
					story = function(value)
						-- upvalues: reactModule (copy), p4 (ref), viewModule (copy), createItems (copy)
						local controls = value.controls
						local var16, var17 = reactModule.useState({ true, false, true, false })
						local t = {}
						
						for i, v in p4.labels do
							t[i] = {
								label = v,
								hint = if controls.showHints then p4.hints[i] else nil,
								isChecked = var16[i],
								onActivated = function(p5)
									-- upvalues: var17 (ref), i (ref)
									var17(function(p6)
										-- upvalues: i (copy), p5 (ref)
										local cloned = table.clone(p6)
										cloned[i] = p5
										
										return cloned
									end)
								end
							}
						end
						return reactModule.createElement(viewModule, { tag = "auto-xy padding-medium" }, {
							Group = reactModule.createElement(p4.Group, {
								legend = controls.legend,
								size = controls.size,
								placement = controls.placement
							}, createItems(p4.Item, t))
						})
					end
				},
				{
					name = "Sizing",
					story = function()
						-- upvalues: reactModule (copy), Page (copy), Section (copy), dashModule (copy), list (copy), p4 (ref), createItems (copy), staticItems (copy)
						return reactModule.createElement(Page, nil, {
							Size = reactModule.createElement(Section, {
								LayoutOrder = 1,
								name = "Size",
								contentTag = "row gap-xxlarge align-y-start auto-xy wrap"
							}, dashModule.map(list, function(p7, p8)
								-- upvalues: reactModule (copy), p4 (copy), createItems (copy), staticItems (copy)
								return reactModule.createElement(p4.Group, { legend = p7, size = p7, LayoutOrder = p8 }, createItems(p4.Item, staticItems()))
							end))
						})
					end
				},
				{
					name = "States",
					story = function()
						-- upvalues: reactModule (copy), Page (copy), Section (copy), p4 (ref), inputSizeModule (copy), createItems (copy)
						return reactModule.createElement(Page, nil, {
							States = reactModule.createElement(Section, {
								LayoutOrder = 1,
								name = "Item states",
								contentTag = "auto-xy"
							}, {
								Group = reactModule.createElement(p4.Group, { size = inputSizeModule.Medium }, createItems(p4.Item, p4.states))
							})
						})
					end
				},
				{
					name = "Placement",
					summary = `placement positions each item's label relative to its {string.lower(p4.itemName)}.`,
					story = function()
						-- upvalues: reactModule (copy), Page (copy), Section (copy), dashModule (copy), list_1 (copy), p4 (ref), createItems (copy), staticItems (copy)
						return reactModule.createElement(Page, nil, {
							Placement = reactModule.createElement(Section, {
								LayoutOrder = 1,
								name = "Placement",
								contentTag = "row gap-xxlarge align-y-start auto-xy wrap"
							}, dashModule.map(list_1, function(p9, p10)
								-- upvalues: reactModule (copy), p4 (copy), createItems (copy), staticItems (copy)
								return reactModule.createElement(p4.Group, { legend = p9, placement = p9, LayoutOrder = p10 }, createItems(p4.Item, staticItems()))
							end))
						})
					end
				}
			},
			controls = {
				showHints = false,
				legend = p4.defaultLegend,
				size = list_2,
				placement = list_1
			}
		}
	end
}