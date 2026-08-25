local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)

return {
	MatrixGrid = function(p1)
		-- upvalues: reactModule (ref), viewModule (ref), dashModule (ref), textModule (ref)
		local var1 = p1.showLabelColumn == nil or p1.showLabelColumn
		local var2 = p1.showHeader == nil or p1.showHeader
		local labelColumnWidth = p1.labelColumnWidth or 80
		local headerTextAlign = p1.headerTextAlign or "center"
		local cellAlign = p1.cellAlign or "center"
		local rowGap = p1.rowGap or "large"
		local var3 = if headerTextAlign == "left" then "text-align-x-left" else "text-align-x-center"
		local var4 = if cellAlign == "left" then "align-x-left" else "align-x-center"
		local text = "row align-y-center gap-" .. rowGap .. " auto-xy"
		local text_1 = "row align-y-center gap-" .. rowGap .. " auto-x"
		
		local function _(p1)
			-- upvalues: p1 (ref)
			return if p1.cellColumnWidths then p1.cellColumnWidths[p1] else p1.cellColumnWidth
		end
		
		local var1 = 1
		local t = {}
		
		local function renderCells(p1)
			-- upvalues: p1 (ref), reactModule (copy), viewModule (copy), var4 (ref)
			local t = {}
			
			for i, v in p1 do
				local var1 = if p1.cellColumnWidths then p1.cellColumnWidths[i] else p1.cellColumnWidth
				t[`Cell-{i}`] = reactModule.createElement(viewModule, {
					tag = `col auto-xy {var4}`,
					Size = if var1 then UDim2.fromOffset(var1, 0) else nil,
					LayoutOrder = i
				}, { Content = v })
			end
			return t
		end
		
		if var2 then
			local var2 = dashModule.map(p1.columnHeaders, function(p1, p2)
				-- upvalues: p1 (ref), reactModule (copy), textModule (copy), var3 (ref)
				local var1 = if p1.cellColumnWidths then p1.cellColumnWidths[p2] else p1.cellColumnWidth
				
				return reactModule.createElement(textModule, {
					Text = p1,
					tag = `auto-xy text-caption-small content-muted {var3}`,
					Size = if var1 then UDim2.fromOffset(var1, 0) else nil,
					LayoutOrder = p2
				})
			end)
			
			if var1 then
				t.HeaderRow = reactModule.createElement(viewModule, { tag = `padding-y-small {text}`, LayoutOrder = var1 }, {
					Corner = reactModule.createElement(viewModule, {
						LayoutOrder = 1,
						Size = UDim2.fromOffset(labelColumnWidth, 0)
					}),
					Cells = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = text_1 }, var2)
				})
			else
				t.HeaderRow = reactModule.createElement(viewModule, { tag = `padding-y-small {text}`, LayoutOrder = var1 }, var2)
			end
			var1 += 1
		end
		for i, v in p1.rows do
			local t_1 = {}
			
			if var1 then
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
					LayoutOrder = var1
				}, t_1)
			elseif v.backgroundStyle then
				t[`Row-{i}`] = reactModule.createElement(viewModule, {
					tag = text_2,
					backgroundStyle = v.backgroundStyle,
					LayoutOrder = var1
				}, t_1)
			elseif v.stroke then
				t[`Row-{i}`] = reactModule.createElement(viewModule, {
					tag = text_2,
					stroke = {
						Color = v.stroke.Color,
						Transparency = v.stroke.Transparency,
						Thickness = v.stroke.Thickness
					},
					LayoutOrder = var1
				}, t_1)
			else
				t[`Row-{i}`] = reactModule.createElement(viewModule, { tag = text_2, LayoutOrder = var1 }, t_1)
			end
			var1 += 1
		end
		return reactModule.createElement(viewModule, { tag = "col auto-xy" }, t)
	end,
	matrixLabel = function(p1)
		-- upvalues: reactModule (ref), textModule (ref)
		return reactModule.createElement(textModule, {
			tag = "auto-xy text-caption-small text-align-x-left content-default",
			Text = p1
		})
	end,
	matrixInfoLabel = function(p1, p2)
		-- upvalues: reactModule (ref), viewModule (ref), textModule (ref)
		return reactModule.createElement(viewModule, { tag = "col gap-xsmall size-full-0 auto-y" }, {
			Title = reactModule.createElement(textModule, {
				tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-left content-default",
				LayoutOrder = 1,
				Text = p1
			}),
			Subtitle = reactModule.createElement(textModule, {
				tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-left content-muted",
				LayoutOrder = 2,
				Text = p2
			})
		})
	end
}