local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)

return function(p0) --[[ line: 26 | named "MatrixGrid" ]]
	-- upvalues: reactModule (ref), viewModule (ref), dashModule (ref), textModule (ref)
	local var5 = p0.showLabelColumn == nil or p0.showLabelColumn
	local var6 = p0.showHeader == nil or p0.showHeader
	local labelColumnWidth = p0.labelColumnWidth or 80
	local headerTextAlign = p0.headerTextAlign or "center"
	local cellAlign = p0.cellAlign or "center"
	local rowGap = p0.rowGap or "large"
	local var11 = if headerTextAlign == "left" then "text-align-x-left" else "text-align-x-center"
	local var12 = if cellAlign == "left" then "align-x-left" else "align-x-center"
	local var13 = `row align-y-center gap-{rowGap} auto-xy`
	local var14 = `row align-y-center gap-{rowGap} auto-x`
	local var15 = 1
	local t = {}
	
	local function renderCells(p1) --[[ line: 41 ]]
		-- upvalues: p0 (ref), reactModule (copy), viewModule (copy), var12 (ref)
		local t = {}
		
		for i, v in p1 do
			t[`Cell-{i}`] = reactModule.createElement(viewModule, {
				tag = `col auto-xy {var12}`,
				Size = if p0.cellColumnWidth then UDim2.fromOffset(p0.cellColumnWidth, 0) else nil,
				LayoutOrder = i
			}, { Content = v })
		end
		return t
	end
	
	if var6 then
		local var18 = dashModule.map(p0.columnHeaders, function(p2, p3) --[[ line: 57 ]]
			-- upvalues: p0 (ref), reactModule (copy), textModule (copy), var11 (ref)
			return reactModule.createElement(textModule, {
				Text = p2,
				tag = `auto-xy text-caption-small content-muted {var11}`,
				Size = if p0.cellColumnWidth then UDim2.fromOffset(p0.cellColumnWidth, 0) else nil,
				LayoutOrder = p3
			})
		end)
		
		if var5 then
			t.HeaderRow = reactModule.createElement(viewModule, { tag = `padding-y-small {var13}`, LayoutOrder = var15 }, {
				Corner = reactModule.createElement(viewModule, {
					LayoutOrder = 1,
					Size = UDim2.fromOffset(labelColumnWidth, 0)
				}),
				Cells = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = var14 }, var18)
			})
		else
			t.HeaderRow = reactModule.createElement(viewModule, { tag = `padding-y-small {var13}`, LayoutOrder = var15 }, var18)
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
			t_1.Cells = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = var14 }, renderCells(v.cells))
		else
			for i_1, v_1 in renderCells(v.cells) do
				t_1[i_1] = v_1
			end
		end
		t[`Row-{i}`] = reactModule.createElement(viewModule, { tag = `padding-y-small {var13}`, LayoutOrder = var15 }, t_1)
		var15 += 1
	end
	return reactModule.createElement(viewModule, { tag = "col auto-xy" }, t)
end