local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local config = {
	left = "text-align-x-left",
	center = "text-align-x-center"
}
local config1 = { left = "align-x-left", center = "align-x-center" }
local config2 = { top = "align-y-top", center = "align-y-center" }

local function _(p1, p2)
	return if p1.cellColumnWidths then p1.cellColumnWidths[p2] else p1.cellColumnWidth
end

local function renderCells(p1, Cells, p2)
	-- upvalues: ReactModule (copy), ViewModule (copy)
	local Elements = {}
	
	for LayoutOrder, cell in Cells do
		local CellColumnWidth = if p1.cellColumnWidths then p1.cellColumnWidths[LayoutOrder] else p1.cellColumnWidth
		Elements[`Cell-{LayoutOrder}`] = ReactModule.createElement(ViewModule, {
			tag = `col auto-xy {p2}`,
			Size = if CellColumnWidth then UDim2.fromOffset(CellColumnWidth, 0) else nil,
			LayoutOrder = LayoutOrder
		}, { Content = cell })
	end
	return Elements
end

local function renderHeaderRow(p3, p4, XOffset, NoShowLabelColumn, Message, Tag, LayoutOrder)
	-- upvalues: DashModule (copy), ReactModule (copy), TextModule (copy), ViewModule (copy)
	local MapResult = DashModule.map(p3.columnHeaders, function(Text, LayoutOrder)
		-- upvalues: p3 (copy), ReactModule (upval), TextModule (upval), p4 (copy)
		local CellColumnWidth = if p3.cellColumnWidths then p3.cellColumnWidths[LayoutOrder] else p3.cellColumnWidth
		
		return ReactModule.createElement(TextModule, {
			Text = Text,
			tag = `auto-xy text-caption-small content-muted {p4}`,
			Size = if CellColumnWidth then UDim2.fromOffset(CellColumnWidth, 0) else nil,
			LayoutOrder = LayoutOrder
		})
	end)
	
	return if NoShowLabelColumn then ReactModule.createElement(ViewModule, {
		tag = `padding-y-small {Message}`,
		LayoutOrder = LayoutOrder
	}, {
		Corner = ReactModule.createElement(ViewModule, {
			tag = "col auto-y",
			LayoutOrder = 1,
			Size = UDim2.fromOffset(XOffset, 0)
		}, {
			Content = if p3.labelColumnHeader == nil then nil else ReactModule.createElement(TextModule, {
				Text = p3.labelColumnHeader,
				tag = `auto-xy text-caption-small content-muted {p4}`,
				Size = UDim2.fromOffset(XOffset, 0)
			})
		}),
		Cells = ReactModule.createElement(ViewModule, { LayoutOrder = 2, tag = Tag }, MapResult)
	}) else ReactModule.createElement(ViewModule, {
		tag = `padding-y-small {Message}`,
		LayoutOrder = LayoutOrder
	}, MapResult)
end

local function rowView(Frame)
	-- upvalues: ReactModule (copy), ViewModule (copy)
	return ReactModule.createElement(ViewModule, {
		tag = Frame.tag,
		backgroundStyle = Frame.row.backgroundStyle,
		stroke = if Frame.row.stroke then {
			Color = Frame.row.stroke.Color,
			Transparency = Frame.row.stroke.Transparency,
			Thickness = Frame.row.stroke.Thickness
		} else nil,
		LayoutOrder = Frame.LayoutOrder
	}, Frame.children)
end

return {
	MatrixGrid = function(p3)
		-- upvalues: config (copy), config1 (copy), config2 (copy), renderHeaderRow (copy), ReactModule (copy), ViewModule (copy), renderCells (copy), rowView (copy)
		local NoShowLabelColumn = p3.showLabelColumn == nil or p3.showLabelColumn
		local LabelColumnWidth = p3.labelColumnWidth or 80
		local RowGap = p3.rowGap or "large"
		local Entry = config[p3.headerTextAlign or "center"]
		local Entry1 = config1[p3.cellAlign or "center"]
		local Entry2 = config2[p3.rowAlign or "top"]
		local Message: string = `row {Entry2} gap-{RowGap} auto-xy`
		local Message1: string = `row {Entry2} gap-{RowGap} auto-xy`
		local LayoutOrder = 1
		local Elements = {}
		
		if p3.showHeader == nil or p3.showHeader then
			Elements.HeaderRow = renderHeaderRow(p3, Entry, LabelColumnWidth, NoShowLabelColumn, Message, Message1, LayoutOrder)
			LayoutOrder += 1
		end
		for i, row in p3.rows do
			local Children = {}
			
			if NoShowLabelColumn then
				Children.Label = ReactModule.createElement(ViewModule, {
					LayoutOrder = 1,
					tag = `col size-full-0 auto-y clip {Entry2}`,
					Size = UDim2.fromOffset(LabelColumnWidth, 0)
				}, { Content = row.label })
				Children.Cells = ReactModule.createElement(ViewModule, { LayoutOrder = 2, tag = Message1 }, (renderCells(p3, row.cells, Entry1)))
			else
				for i1, value in renderCells(p3, row.cells, Entry1) do
					Children[i1] = value
				end
			end
			Elements[`Row-{i}`] = ReactModule.createElement(rowView, {
				tag = "padding-y-small " .. (if row.rowTag then Message .. " " .. row.rowTag else Message),
				LayoutOrder = LayoutOrder,
				row = row,
				children = Children
			})
			LayoutOrder += 1
		end
		return ReactModule.createElement(ViewModule, { tag = "col auto-xy" }, Elements)
	end,
	enumHeaders = function(p4)
		-- upvalues: DashModule (copy)
		return DashModule.map(p4, function(p5): string
			return (tostring(p5))
		end)
	end,
	matrixLabel = function(Text)
		-- upvalues: ReactModule (copy), TextModule (copy)
		return ReactModule.createElement(TextModule, {
			tag = "auto-xy text-caption-small text-align-x-left content-default",
			Text = Text
		})
	end,
	matrixInfoLabel = function(Text, Text1)
		-- upvalues: ReactModule (copy), ViewModule (copy), TextModule (copy)
		return ReactModule.createElement(ViewModule, { tag = "col gap-xsmall size-full-0 auto-y" }, {
			Title = ReactModule.createElement(TextModule, {
				tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-left content-default",
				LayoutOrder = 1,
				Text = Text
			}),
			Subtitle = ReactModule.createElement(TextModule, {
				tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-left content-muted",
				LayoutOrder = 2,
				Text = Text1
			})
		})
	end
}