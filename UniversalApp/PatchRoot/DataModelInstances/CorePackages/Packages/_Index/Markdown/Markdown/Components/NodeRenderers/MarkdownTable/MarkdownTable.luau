local Markdown = script:FindFirstAncestor("Markdown")
local Parent = Markdown.Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ColumnWidthsModule = require(script.Parent.columnWidths)
local MergeContextsModule = require(Markdown.Utils.mergeContexts)
local _ = require(Markdown.Types)
local ScrollView = FoundationModule.ScrollView
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function getTableContext(Context)
	-- upvalues: MergeContextsModule (copy)
	return MergeContextsModule(Context, {
		textStyles = { textTags = "text-body-medium content-default" }
	})
end

local function _(p1): number
	local Child = p1.children[1]
	
	return if Child then #Child.children else 0
end

local function getCellPadding(UseMemoResult, p1)
	local v1 = (UseMemoResult.textStyles.textSize or p1.Typography.BodyMedium.FontSize) / p1.Typography.BodyMedium.FontSize
	
	return {
		x = math.round(p1.Padding.XLarge * v1),
		y = math.round(p1.Padding.Medium * v1),
		text = math.round(p1.Padding.XXSmall * v1)
	}
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), getTableContext (copy), ColumnWidthsModule (copy), DashModule (copy), getCellPadding (copy), FoundationModule (copy), View (copy), ScrollView (copy), MergeContextsModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: getTableContext (upval), p1 (copy)
		return getTableContext(p1.context)
	end, { p1.context })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), ColumnWidthsModule (upval), p1 (copy), UseMemoResult (copy), UseStateResult2_1 (copy), DashModule (upval)
		local Current = UseRefResult.current or ColumnWidthsModule.createWidthCache()
		UseRefResult.current = Current
		local MeasureColumnContentWidthsResult = ColumnWidthsModule.measureColumnContentWidths(p1.node, UseMemoResult, Current)
		UseStateResult2_1(function(p2)
			-- upvalues: DashModule (upval), MeasureColumnContentWidthsResult (copy)
			return if p2 and DashModule.shallowEqual(p2, MeasureColumnContentWidthsResult) then p2 else MeasureColumnContentWidthsResult
		end)
	end, { p1.node, UseMemoResult })
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize.X)
	end, {})
	local CellPadding = getCellPadding(UseMemoResult, UseTokensResult)
	local Child = p1.node.children[1]
	local CountChildren: number = if Child then #Child.children else 0
	local Ceiled = math.ceil(UseTokensResult.Stroke.Standard)
	local ScaledLargest = math.max(CountChildren - 1, 0) * UseTokensResult.Stroke.Standard
	local ColumnWidths = if UseStateResult1 and UseStateResult > 0 then ColumnWidthsModule.computeColumnWidths(ColumnWidthsModule.fillUnmeasuredColumns(UseStateResult1, CountChildren), UseStateResult - Ceiled * 2 - ScaledLargest, CellPadding.x * 2) else nil
	local NewSumResult: number = if ColumnWidths then DashModule.sum(ColumnWidths) + ScaledLargest + Ceiled * 2 else 0
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		onAbsoluteSizeChanged = UseResult
	}, {
		ScrollView = ReactModule.createElement(ScrollView, {
			tag = "size-full-0 auto-y",
			scroll = ReactModule.useMemo(function()
				-- upvalues: NewSumResult (copy), FoundationModule (upval)
				return {
					AutomaticSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromOffset(NewSumResult, 0),
					ScrollingDirection = Enum.ScrollingDirection.X,
					scrollBarVisibility = FoundationModule.Enums.Visibility.Always
				}
			end, { NewSumResult })
		}, {
			BorderInset = ReactModule.createElement(View, { tag = "auto-xy" }, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, Ceiled),
					PaddingBottom = UDim.new(0, Ceiled + (if UseStateResult < NewSumResult then UseTokensResult.Size.Size_150 + UseTokensResult.Gap.XSmall else 0)),
					PaddingLeft = UDim.new(0, Ceiled),
					PaddingRight = UDim.new(0, Ceiled)
				}),
				Table = ColumnWidths and ReactModule.createElement(View, {
					tag = "auto-xy col gap-none radius-medium stroke-standard stroke-default"
				}, UseMemoResult.processChildren(p1.node, MergeContextsModule(UseMemoResult, {
					tableColumnWidths = ColumnWidths,
					tableCellPadding = CellPadding,
					tableRowCount = #p1.node.children
				})))
			})
		})
	})
end