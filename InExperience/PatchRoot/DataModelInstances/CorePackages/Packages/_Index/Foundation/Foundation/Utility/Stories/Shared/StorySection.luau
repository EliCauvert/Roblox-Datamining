local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local matrixGridModule = require(foundation.Utility.Stories.Shared.MatrixGrid)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)
local matrixGrid = matrixGridModule.MatrixGrid

local function Section(p1)
	-- upvalues: reactModule (ref), viewModule (ref), textModule (ref)
	return reactModule.createElement(viewModule, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, {
		Title = if p1.note then reactModule.createElement(viewModule, {
			tag = "col align-x-left gap-xsmall size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			Name = reactModule.createElement(textModule, {
				tag = "auto-xy text-label-medium text-align-x-left content-default",
				LayoutOrder = 1,
				Text = p1.name
			}),
			Note = reactModule.createElement(textModule, {
				tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-left content-muted",
				LayoutOrder = 2,
				Text = p1.note
			})
		}) else reactModule.createElement(textModule, {
			tag = "auto-xy text-label-medium text-align-x-left content-default",
			LayoutOrder = 1,
			Text = p1.name
		}),
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = p1.contentTag or "row gap-large align-y-top auto-xy wrap"
		}, p1.children)
	})
end

local function StoryMatrixGrid(p1)
	-- upvalues: reactModule (ref), viewModule (ref), matrixGrid (ref)
	return reactModule.createElement(viewModule, { tag = "auto-xy", LayoutOrder = p1.LayoutOrder }, {
		Content = reactModule.createElement(matrixGrid, {
			headerTextAlign = "left",
			cellAlign = "left",
			showLabelColumn = p1.showLabelColumn,
			labelColumnWidth = p1.labelColumnWidth,
			columnHeaders = p1.columnHeaders,
			cellColumnWidth = p1.cellColumnWidth,
			cellColumnWidths = p1.cellColumnWidths,
			rowGap = p1.rowGap,
			rowAlign = p1.rowAlign,
			rows = p1.rows
		})
	})
end

return {
	STORY_FRAME_TAG = "padding-y-large bg-surface-0",
	STORY_PAGE_TAG = "size-full-0 auto-y padding-y-large bg-surface-0",
	STORY_PAGE_COL_TAG = "col gap-xxlarge size-full-0 auto-y padding-y-large bg-surface-0",
	Section = Section,
	LabeledCell = function(p1)
		-- upvalues: reactModule (ref), viewModule (ref), textModule (ref)
		return reactModule.createElement(viewModule, {
			tag = p1.tag or "col align-x-left gap-small auto-xy",
			LayoutOrder = p1.LayoutOrder
		}, {
			Label = reactModule.createElement(textModule, {
				tag = "auto-xy text-caption-small text-align-x-left content-muted",
				LayoutOrder = 1,
				Text = p1.label
			}),
			Content = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = p1.contentTag or "auto-xy" }, p1.children)
		})
	end,
	StoryMatrixGrid = StoryMatrixGrid,
	MatrixSection = function(p1)
		-- upvalues: reactModule (ref), Section (ref), StoryMatrixGrid (ref)
		return reactModule.createElement(Section, {
			LayoutOrder = p1.LayoutOrder,
			name = p1.name,
			note = p1.note,
			contentTag = p1.contentTag or "col auto-xy"
		}, {
			Grid = reactModule.createElement(StoryMatrixGrid, {
				LayoutOrder = 1,
				showLabelColumn = p1.showLabelColumn,
				labelColumnWidth = p1.labelColumnWidth,
				columnHeaders = p1.columnHeaders,
				cellColumnWidth = p1.cellColumnWidth,
				cellColumnWidths = p1.cellColumnWidths,
				rowGap = p1.rowGap,
				rowAlign = p1.rowAlign,
				rows = p1.rows
			})
		})
	end
}