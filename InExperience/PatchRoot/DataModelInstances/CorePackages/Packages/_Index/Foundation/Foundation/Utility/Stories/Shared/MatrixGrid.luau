local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)

local function matrixLabel(p0)
	-- upvalues: reactModule (ref), textModule (ref)
	return reactModule.createElement(textModule, {
		tag = "auto-xy text-caption-small text-align-x-left content-default",
		Text = p0
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

local function _(p3, p4)
	return if p3.cellColumnWidths then p3.cellColumnWidths[p4] else p3.cellColumnWidth
end

local function renderCells(p5, p6, p7)
	-- upvalues: reactModule (ref), viewModule (ref)
	local t = {}
	
	for i, v in p6 do
		local var9 = if p5.cellColumnWidths then p5.cellColumnWidths[i] else p5.cellColumnWidth
		t[`Cell-{i}`] = reactModule.createElement(viewModule, {
			tag = `col auto-xy {p7}`,
			Size = if var9 then UDim2.fromOffset(var9, 0) else nil,
			LayoutOrder = i
		}, { Content = v })
	end
	return t
end

return {
	MatrixGrid = function(p8)
		-- upvalues: dashModule (ref), reactModule (ref), textModule (ref), viewModule (ref), renderCells (ref)
		local var10 = p8.showLabelColumn == nil or p8.showLabelColumn
		local var11 = p8.showHeader == nil or p8.showHeader
		local labelColumnWidth = p8.labelColumnWidth or 80
		local headerTextAlign = p8.headerTextAlign or "center"
		local cellAlign = p8.cellAlign or "center"
		local rowGap = p8.rowGap or "large"
		local var16 = if headerTextAlign == "left" then "text-align-x-left" else "text-align-x-center"
		local var17 = if cellAlign == "left" then "align-x-left" else "align-x-center"
		local text = "row align-y-center gap-" .. rowGap .. " auto-xy"
		local text_1 = "row align-y-center gap-" .. rowGap .. " auto-x"
		local var20 = 1
		local t = {}
		
		if var11 then
			local var22 = dashModule.map(p8.columnHeaders, function(p9, p10)
				-- upvalues: p8 (ref), reactModule (copy), textModule (copy), var16 (ref)
				local var25 = if p8.cellColumnWidths then p8.cellColumnWidths[p10] else p8.cellColumnWidth
				
				return reactModule.createElement(textModule, {
					Text = p9,
					tag = `auto-xy text-caption-small content-muted {var16}`,
					Size = if var25 then UDim2.fromOffset(var25, 0) else nil,
					LayoutOrder = p10
				})
			end)
			
			if var10 then
				t.HeaderRow = reactModule.createElement(viewModule, { tag = `padding-y-small {text}`, LayoutOrder = var20 }, {
					Corner = reactModule.createElement(viewModule, {
						LayoutOrder = 1,
						Size = UDim2.fromOffset(labelColumnWidth, 0)
					}),
					Cells = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = text_1 }, var22)
				})
			else
				t.HeaderRow = reactModule.createElement(viewModule, { tag = `padding-y-small {text}`, LayoutOrder = var20 }, var22)
			end
			var20 += 1
		end
		for i, v in p8.rows do
			local t_1 = {}
			
			if var10 then
				t_1.Label = reactModule.createElement(viewModule, {
					tag = "col align-y-center size-full-0 auto-y clip",
					LayoutOrder = 1,
					Size = UDim2.fromOffset(labelColumnWidth, 0)
				}, { Content = v.label })
				t_1.Cells = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = text_1 }, renderCells(p8, v.cells, var17))
			else
				for i_1, v_1 in renderCells(p8, v.cells, var17) do
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
					LayoutOrder = var20
				}, t_1)
			elseif v.backgroundStyle then
				t[`Row-{i}`] = reactModule.createElement(viewModule, {
					tag = text_2,
					backgroundStyle = v.backgroundStyle,
					LayoutOrder = var20
				}, t_1)
			elseif v.stroke then
				t[`Row-{i}`] = reactModule.createElement(viewModule, {
					tag = text_2,
					stroke = {
						Color = v.stroke.Color,
						Transparency = v.stroke.Transparency,
						Thickness = v.stroke.Thickness
					},
					LayoutOrder = var20
				}, t_1)
			else
				t[`Row-{i}`] = reactModule.createElement(viewModule, { tag = text_2, LayoutOrder = var20 }, t_1)
			end
			var20 += 1
		end
		return reactModule.createElement(viewModule, { tag = "col auto-xy" }, t)
	end,
	matrixLabel = matrixLabel,
	matrixInfoLabel = matrixInfoLabel
}