local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local t = {
	left = "text-align-x-left",
	center = "text-align-x-center"
}
local t_1 = { left = "align-x-left", center = "align-x-center" }
local t_2 = { top = "align-y-top", center = "align-y-center" }

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

local function rowView(p4)
	-- upvalues: reactModule (ref), viewModule (ref)
	return reactModule.createElement(viewModule, {
		tag = p4.tag,
		backgroundStyle = p4.row.backgroundStyle,
		stroke = if p4.row.stroke then {
			Color = p4.row.stroke.Color,
			Transparency = p4.row.stroke.Transparency,
			Thickness = p4.row.stroke.Thickness
		} else nil,
		LayoutOrder = p4.LayoutOrder
	}, p4.children)
end

return {
	MatrixGrid = function(p4)
		-- upvalues: t (ref), t_1 (ref), t_2 (ref), dashModule (ref), reactModule (ref), textModule (ref), viewModule (ref), renderCells (ref), rowView (ref)
		local var2 = p4.showLabelColumn == nil or p4.showLabelColumn
		local var3 = p4.showHeader == nil or p4.showHeader
		local labelColumnWidth = p4.labelColumnWidth or 80
		local headerTextAlign = p4.headerTextAlign or "center"
		local cellAlign = p4.cellAlign or "center"
		local rowAlign = p4.rowAlign or "center"
		local rowGap = p4.rowGap or "large"
		local var4 = t[headerTextAlign]
		local var5 = t_1[cellAlign]
		local var6 = t_2[rowAlign]
		local var7 = `row {var6} gap-{rowGap} auto-xy`
		local var8 = `row {var6} gap-{rowGap} auto-xy`
		local var9 = 1
		local t_3 = {}
		
		if var3 then
			local var10 = dashModule.map(p4.columnHeaders, function(p5, p6)
				-- upvalues: p4 (ref), reactModule (copy), textModule (copy), var4 (ref)
				local var11 = if p4.cellColumnWidths then p4.cellColumnWidths[p6] else p4.cellColumnWidth
				
				return reactModule.createElement(textModule, {
					Text = p5,
					tag = `auto-xy text-caption-small content-muted {var4}`,
					Size = if var11 then UDim2.fromOffset(var11, 0) else nil,
					LayoutOrder = p6
				})
			end)
			
			if var2 then
				t_3.HeaderRow = reactModule.createElement(viewModule, { tag = `padding-y-small {var7}`, LayoutOrder = var9 }, {
					Corner = reactModule.createElement(viewModule, {
						LayoutOrder = 1,
						Size = UDim2.fromOffset(labelColumnWidth, 0)
					}),
					Cells = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = var8 }, var10)
				})
			else
				t_3.HeaderRow = reactModule.createElement(viewModule, { tag = `padding-y-small {var7}`, LayoutOrder = var9 }, var10)
			end
			var9 += 1
		end
		for i, v in p4.rows do
			local t_4 = {}
			
			if var2 then
				t_4.Label = reactModule.createElement(viewModule, {
					LayoutOrder = 1,
					tag = `col size-full-0 auto-y clip {var6}`,
					Size = UDim2.fromOffset(labelColumnWidth, 0)
				}, { Content = v.label })
				t_4.Cells = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = var8 }, renderCells(p4, v.cells, var5))
			else
				for i_1, v_1 in renderCells(p4, v.cells, var5) do
					t_4[i_1] = v_1
				end
			end
			t_3[`Row-{i}`] = reactModule.createElement(rowView, {
				tag = "padding-y-small " .. (if v.rowTag then var7 .. " " .. v.rowTag else var7),
				LayoutOrder = var9,
				row = v,
				children = t_4
			})
			var9 += 1
		end
		return reactModule.createElement(viewModule, { tag = "col auto-xy" }, t_3)
	end,
	matrixLabel = matrixLabel,
	matrixInfoLabel = matrixInfoLabel
}