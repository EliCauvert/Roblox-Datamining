local Markdown = script:FindFirstAncestor("Markdown")
local Parent = Markdown.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local GetRowContextModule = require(script.getRowContext)
local MarkdownTableModule = require(script.MarkdownTable)
local RenderInlineModule = require(Markdown.Components.NodeRenderers.renderInline)
local ShouldUseTopPaddingModule = require(Markdown.Utils.shouldUseTopPadding)
local TableAlignmentModule = require(Markdown.Enums.TableAlignment)
local _ = require(Markdown.Types)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = {
	[TableAlignmentModule.Left] = Enum.HorizontalAlignment.Left,
	[TableAlignmentModule.Center] = Enum.HorizontalAlignment.Center,
	[TableAlignmentModule.Right] = Enum.HorizontalAlignment.Right
}

local function TableDivider(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	local Standard = UseTokensResult.Stroke.Standard
	
	return ReactModule.createElement(View, {
		tag = "self-stretch",
		Size = if Frame.isVertical then UDim2.fromOffset(Standard, 0) else UDim2.fromOffset(0, Standard),
		backgroundStyle = UseTokensResult.Color.Stroke.Default,
		LayoutOrder = Frame.LayoutOrder
	})
end

local function renderTableRowCells(Node, Context, Ref, OnAbsoluteSizeChanged)
	-- upvalues: GetRowContextModule (copy), ReactModule (copy), TableDivider (copy), View (copy)
	local ProcessChildrenResult = Context.processChildren(Node, GetRowContextModule(Node, Context))
	
	for i = 2, #Node.children do
		table.insert(ProcessChildrenResult, ReactModule.createElement(TableDivider, {
			isVertical = true,
			key = `Divider{i}`,
			LayoutOrder = i * 2 - 1
		}))
	end
	return ReactModule.createElement(View, {
		tag = "auto-xy row items-start",
		LayoutOrder = 2,
		onAbsoluteSizeChanged = OnAbsoluteSizeChanged,
		ref = Ref
	}, ProcessChildrenResult)
end

local function TableRow(p1)
	-- upvalues: ReactModule (copy), View (copy), TableDivider (copy), renderTableRowCells (copy)
	local Node = p1.node
	local IsTABLEHEADER = Node.name == "TABLE_HEADER"
	local IsIndexMatch = Node.index == p1.context.tableRowCount
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize)
	end, {})
	ReactModule.useLayoutEffect(function()
		-- upvalues: IsTABLEHEADER (copy), UseRefResult (copy), UseStateResult2 (copy)
		if IsTABLEHEADER and UseRefResult.current then
			UseStateResult2(UseRefResult.current.AbsoluteSize)
		end
	end, { IsTABLEHEADER })
	
	return ReactModule.createElement(View, {
		tag = "auto-xy col items-stretch",
		LayoutOrder = Node.index
	}, {
		Divider = if Node.index > 1 then ReactModule.createElement(TableDivider, { LayoutOrder = 1, isVertical = false }) else nil,
		Content = ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 2 }, {
			Background = if IsTABLEHEADER then ReactModule.createElement(View, {
				ZIndex = 0,
				tag = {
					["bg-shift-100"] = true,
					["radius-medium"] = IsIndexMatch,
					["radius-top-medium"] = not IsIndexMatch
				},
				Size = UDim2.fromOffset(UseStateResult.X, UseStateResult.Y)
			}) else nil,
			Cells = renderTableRowCells(Node, p1.context, UseRefResult, if IsTABLEHEADER then UseResult else nil)
		})
	})
end

return {
	renderTable = function(Node, Context)
		-- upvalues: ReactModule (copy), View (copy), ShouldUseTopPaddingModule (copy), MarkdownTableModule (copy)
		return ReactModule.createElement(View, {
			tag = "size-full-0 auto-y col",
			key = tostring(Node.index),
			LayoutOrder = Node.index
		}, {
			UIPadding = ShouldUseTopPaddingModule(Node) and ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 10) }),
			Table = ReactModule.createElement(MarkdownTableModule, { node = Node, context = Context })
		})
	end,
	renderTableRow = function(Node, Context)
		-- upvalues: ReactModule (copy), TableRow (copy)
		return ReactModule.createElement(TableRow, {
			key = tostring(Node.index),
			node = Node,
			context = Context
		})
	end,
	renderTableCell = function(p1, p2)
		-- upvalues: ReactModule (copy), View (copy), RenderInlineModule (copy), config (copy)
		local Index = p1.index or 1
		local Alignment = p1.attributes and p1.attributes.alignment
		local TableCellPadding = p2.tableCellPadding or { x = 0, y = 0, text = 0 }
		
		return ReactModule.createElement(View, {
			tag = "auto-y",
			key = tostring(Index),
			Size = UDim2.fromOffset((if p2.tableColumnWidths then p2.tableColumnWidths[Index] else nil) or 0, 0),
			LayoutOrder = Index * 2
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, TableCellPadding.y),
				PaddingBottom = UDim.new(0, TableCellPadding.y),
				PaddingLeft = UDim.new(0, TableCellPadding.x),
				PaddingRight = UDim.new(0, TableCellPadding.x)
			}),
			Text = ReactModule.createElement(View, { tag = "size-full-0 auto-y" }, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, TableCellPadding.text),
					PaddingBottom = UDim.new(0, TableCellPadding.text)
				}),
				InlineLayout = RenderInlineModule(p1, p2, if Alignment then config[Alignment] else nil)
			})
		})
	end
}