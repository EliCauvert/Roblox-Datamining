local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)
local MatrixGrid = require(Foundation.Utility.Stories.Shared.MatrixGrid).MatrixGrid

local function Section(Frame)
	-- upvalues: ReactModule (copy), ViewModule (copy), TextModule (copy)
	return ReactModule.createElement(ViewModule, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Title = if Frame.note then ReactModule.createElement(ViewModule, {
			tag = "col align-x-left gap-xsmall size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			Name = ReactModule.createElement(TextModule, {
				tag = "auto-xy text-label-medium text-align-x-left content-default",
				LayoutOrder = 1,
				Text = Frame.name
			}),
			Note = ReactModule.createElement(TextModule, {
				tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-left content-muted",
				LayoutOrder = 2,
				Text = Frame.note
			})
		}) else ReactModule.createElement(TextModule, {
			tag = "auto-xy text-label-medium text-align-x-left content-default",
			LayoutOrder = 1,
			Text = Frame.name
		}),
		Content = ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			tag = Frame.contentTag or "row gap-large align-y-top auto-xy wrap"
		}, Frame.children)
	})
end

local function StoryMatrixGrid(Frame)
	-- upvalues: ReactModule (copy), ViewModule (copy), MatrixGrid (copy)
	return ReactModule.createElement(ViewModule, { tag = "auto-xy", LayoutOrder = Frame.LayoutOrder }, {
		Content = ReactModule.createElement(MatrixGrid, {
			headerTextAlign = "left",
			cellAlign = "left",
			showLabelColumn = Frame.showLabelColumn,
			labelColumnWidth = Frame.labelColumnWidth,
			columnHeaders = Frame.columnHeaders,
			cellColumnWidth = Frame.cellColumnWidth,
			cellColumnWidths = Frame.cellColumnWidths,
			rowGap = Frame.rowGap,
			rowAlign = Frame.rowAlign,
			rows = Frame.rows
		})
	})
end

return {
	STORY_FRAME_TAG = "padding-y-large bg-surface-0",
	STORY_PAGE_TAG = "size-full-0 auto-y padding-y-large bg-surface-0",
	STORY_PAGE_COL_TAG = "col gap-xxlarge size-full-0 auto-y padding-y-large bg-surface-0",
	Section = Section,
	LabeledCell = function(Frame)
		-- upvalues: ReactModule (copy), ViewModule (copy), TextModule (copy)
		return ReactModule.createElement(ViewModule, {
			tag = Frame.tag or "col align-x-left gap-small auto-xy",
			LayoutOrder = Frame.LayoutOrder
		}, {
			Label = ReactModule.createElement(TextModule, {
				tag = "auto-xy text-caption-small text-align-x-left content-muted",
				LayoutOrder = 1,
				Text = Frame.label
			}),
			Content = ReactModule.createElement(ViewModule, { LayoutOrder = 2, tag = Frame.contentTag or "auto-xy" }, Frame.children)
		})
	end,
	StoryMatrixGrid = StoryMatrixGrid,
	MatrixSection = function(Frame)
		-- upvalues: ReactModule (copy), Section (copy), StoryMatrixGrid (copy)
		return ReactModule.createElement(Section, {
			LayoutOrder = Frame.LayoutOrder,
			name = Frame.name,
			note = Frame.note,
			contentTag = Frame.contentTag or "col auto-xy"
		}, {
			Grid = ReactModule.createElement(StoryMatrixGrid, {
				LayoutOrder = 1,
				showLabelColumn = Frame.showLabelColumn,
				labelColumnWidth = Frame.labelColumnWidth,
				columnHeaders = Frame.columnHeaders,
				cellColumnWidth = Frame.cellColumnWidth,
				cellColumnWidths = Frame.cellColumnWidths,
				rowGap = Frame.rowGap,
				rowAlign = Frame.rowAlign,
				rows = Frame.rows
			})
		})
	end
}