local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)

local function matrixLabel(p1)
	-- upvalues: reactModule (ref), textModule (ref)
	return reactModule.createElement(textModule, {
		tag = "auto-xy text-caption-small text-align-x-left content-default",
		Text = p1
	})
end

local function matrixInfoLabel(p1, p2)
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

local function _(p1, p2)
	return if p1.cellColumnWidths then p1.cellColumnWidths[p2] else p1.cellColumnWidth
end

local function renderCells(p1, p2, p3)
	-- upvalues: reactModule (ref), viewModule (ref)
	local t = {}
	
	for i, v in p2 do
		local var1 = if p1.cellColumnWidths then p1.cellColumnWidths[i] else p1.cellColumnWidth
		t[`Cell-{i}`] = reactModule.createElement(viewModule, {
			tag = `col auto-xy {p3}`,
			Size = if var1 then UDim2.fromOffset(var1, 0) else nil,
			LayoutOrder = i
		}, { Content = v })
	end
	return t
end

return {
	MatrixGrid = function(p4)
		-- upvalues: dashModule (ref), reactModule (ref), textModule (ref), viewModule (ref), renderCells (ref)
		local var2 = p4.showLabelColumn == nil or p4.showLabelColumn
		local var3 = p4.showHeader == nil or p4.showHeader
		local labelColumnWidth = p4.labelColumnWidth or 80
		local headerTextAlign = p4.headerTextAlign or "center"
		local cellAlign = p4.cellAlign or "center"
		local rowGap = p4.rowGap or "large"
		local var4 = if headerTextAlign == "left" then "text-align-x-left" else "text-align-x-center"
		local var5 = if cellAlign == "left" then "align-x-left" else "align-x-center"
		local text = "row align-y-center gap-" .. rowGap .. " auto-xy"
		local text_1 = "row align-y-center gap-" .. rowGap .. " auto-x"
		local var6 = 1
		local t = {}
		
		if var3 then
			local var7 = dashModule.map(p4.columnHeaders, function(p5, p6)
				-- upvalues: p4 (ref), reactModule (copy), textModule (copy), var4 (ref)
				local var8 = if p4.cellColumnWidths then p4.cellColumnWidths[p6] else p4.cellColumnWidth
				
				return reactModule.createElement(textModule, {
					Text = p5,
					tag = `auto-xy text-caption-small content-muted {var4}`,
					Size = if var8 then UDim2.fromOffset(var8, 0) else nil,
					LayoutOrder = p6
				})
			end)
			
			if var2 then
				t.HeaderRow = reactModule.createElement(viewModule, { tag = `padding-y-small {text}`, LayoutOrder = var6 }, {
					Corner = reactModule.createElement(viewModule, {
						LayoutOrder = 1,
						Size = UDim2.fromOffset(labelColumnWidth, 0)
					}),
					Cells = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = text_1 }, var7)
				})
			else
				t.HeaderRow = reactModule.createElement(viewModule, { tag = `padding-y-small {text}`, LayoutOrder = var6 }, var7)
			end
			var6 += 1
		end
		for i, v in p4.rows do
			local t_1 = {}
			
			if var2 then
				t_1.Label = reactModule.createElement(viewModule, {
					tag = "col align-y-center size-full-0 auto-y clip",
					LayoutOrder = 1,
					Size = UDim2.fromOffset(labelColumnWidth, 0)
				}, { Content = v.label })
				t_1.Cells = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = text_1 }, renderCells(p4, v.cells, var5))
			else
				for i_1, v_1 in renderCells(p4, v.cells, var5) do
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
					LayoutOrder = var6
				}, t_1)
			elseif v.backgroundStyle then
				t[`Row-{i}`] = reactModule.createElement(viewModule, {
					tag = text_2,
					backgroundStyle = v.backgroundStyle,
					LayoutOrder = var6
				}, t_1)
			elseif v.stroke then
				t[`Row-{i}`] = reactModule.createElement(viewModule, {
					tag = text_2,
					stroke = {
						Color = v.stroke.Color,
						Transparency = v.stroke.Transparency,
						Thickness = v.stroke.Thickness
					},
					LayoutOrder = var6
				}, t_1)
			else
				t[`Row-{i}`] = reactModule.createElement(viewModule, { tag = text_2, LayoutOrder = var6 }, t_1)
			end
			var6 += 1
		end
		return reactModule.createElement(viewModule, { tag = "col auto-xy" }, t)
	end,
	matrixLabel = matrixLabel,
	matrixInfoLabel = matrixInfoLabel
}