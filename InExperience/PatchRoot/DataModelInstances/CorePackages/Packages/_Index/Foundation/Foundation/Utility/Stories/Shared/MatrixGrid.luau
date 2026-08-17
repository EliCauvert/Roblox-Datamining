local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)

return {
	MatrixGrid = function(p0) --[[ line: 61 ]]
		-- upvalues: reactModule (ref), viewModule (ref), dashModule (ref), textModule (ref)
		local var5 = p0.showLabelColumn == nil or p0.showLabelColumn
		local var6 = p0.showHeader == nil or p0.showHeader
		local labelColumnWidth = p0.labelColumnWidth or 80
		local headerTextAlign = p0.headerTextAlign or "center"
		local cellAlign = p0.cellAlign or "center"
		local rowGap = p0.rowGap or "large"
		local var11 = if headerTextAlign == "left" then "text-align-x-left" else "text-align-x-center"
		local var12 = if cellAlign == "left" then "align-x-left" else "align-x-center"
		local text = "row align-y-center gap-" .. rowGap .. " auto-xy"
		local text_1 = "row align-y-center gap-" .. rowGap .. " auto-x"
		
		local function _(p1) --[[ line: 73 | named "getCellColumnWidth" ]]
			-- upvalues: p0 (ref)
			return if p0.cellColumnWidths then p0.cellColumnWidths[p1] else p0.cellColumnWidth
		end
		
		local var15 = 1
		local t = {}
		
		local function renderCells(p2) --[[ line: 83 ]]
			-- upvalues: p0 (ref), reactModule (copy), viewModule (copy), var12 (ref)
			local t = {}
			
			for i, v in p2 do
				local var22 = if p0.cellColumnWidths then p0.cellColumnWidths[i] else p0.cellColumnWidth
				t[`Cell-{i}`] = reactModule.createElement(viewModule, {
					tag = `col auto-xy {var12}`,
					Size = if var22 then UDim2.fromOffset(var22, 0) else nil,
					LayoutOrder = i
				}, { Content = v })
			end
			return t
		end
		
		if var6 then
			local var18 = dashModule.map(p0.columnHeaders, function(p3, p4) --[[ line: 100 ]]
				-- upvalues: p0 (ref), reactModule (copy), textModule (copy), var11 (ref)
				local var23 = if p0.cellColumnWidths then p0.cellColumnWidths[p4] else p0.cellColumnWidth
				
				return reactModule.createElement(textModule, {
					Text = p3,
					tag = `auto-xy text-caption-small content-muted {var11}`,
					Size = if var23 then UDim2.fromOffset(var23, 0) else nil,
					LayoutOrder = p4
				})
			end)
			
			if var5 then
				t.HeaderRow = reactModule.createElement(viewModule, { tag = `padding-y-small {text}`, LayoutOrder = var15 }, {
					Corner = reactModule.createElement(viewModule, {
						LayoutOrder = 1,
						Size = UDim2.fromOffset(labelColumnWidth, 0)
					}),
					Cells = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = text_1 }, var18)
				})
			else
				t.HeaderRow = reactModule.createElement(viewModule, { tag = `padding-y-small {text}`, LayoutOrder = var15 }, var18)
			end
			var15 += 1
		end
		for i, v in p0.rows do
			local t_1 = {}
			
			if var5 then
				t_1.Label = reactModule.createElement(viewModule, {
					tag = "col align-y-center size-full-0 auto-y clip",
					LayoutOrder = 1,
					Size = UDim2.fromOffset(labelColumnWidth, 0)
				}, { Content = v.label })
				t_1.Cells = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = text_1 }, renderCells(v.cells))
			else
				for i_1, v_1 in renderCells(v.cells) do
					t_1[i_1] = v_1
				end
			end
			local text_2 = "padding-y-small " .. (if v.rowTag then text .. " " .. v.rowTag else text)
			
			if v.backgroundStyle and v.stroke then
				t[`Row-{i}`] = reactModule.createElement(viewModule, {
					tag = text_2,
					backgroundStyle = v.backgroundStyle,
					stroke = {
						Color = v.stroke.Color,
						Transparency = v.stroke.Transparency,
						Thickness = v.stroke.Thickness
					},
					LayoutOrder = var15
				}, t_1)
			elseif v.backgroundStyle then
				t[`Row-{i}`] = reactModule.createElement(viewModule, {
					tag = text_2,
					backgroundStyle = v.backgroundStyle,
					LayoutOrder = var15
				}, t_1)
			elseif v.stroke then
				t[`Row-{i}`] = reactModule.createElement(viewModule, {
					tag = text_2,
					stroke = {
						Color = v.stroke.Color,
						Transparency = v.stroke.Transparency,
						Thickness = v.stroke.Thickness
					},
					LayoutOrder = var15
				}, t_1)
			else
				t[`Row-{i}`] = reactModule.createElement(viewModule, { tag = text_2, LayoutOrder = var15 }, t_1)
			end
			var15 += 1
		end
		return reactModule.createElement(viewModule, { tag = "col auto-xy" }, t)
	end,
	matrixLabel = function(p5) --[[ line: 37 ]]
		-- upvalues: reactModule (ref), textModule (ref)
		return reactModule.createElement(textModule, {
			tag = "auto-xy text-caption-small text-align-x-left content-default",
			Text = p5
		})
	end,
	matrixInfoLabel = function(p6, p7) --[[ line: 44 ]]
		-- upvalues: reactModule (ref), viewModule (ref), textModule (ref)
		return reactModule.createElement(viewModule, { tag = "col gap-xsmall size-full-0 auto-y" }, {
			Title = reactModule.createElement(textModule, {
				tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-left content-default",
				LayoutOrder = 1,
				Text = p6
			}),
			Subtitle = reactModule.createElement(textModule, {
				tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-left content-muted",
				LayoutOrder = 2,
				Text = p7
			})
		})
	end
}