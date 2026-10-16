local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local buttonModule = require(foundation.Components.Button)
local buttonGroupModule = require(foundation.Components.ButtonGroup)
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local dialogSizeModule = require(foundation.Enums.DialogSize)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local inputSizeModule = require(foundation.Enums.InputSize)
local matrixGridModule = require(foundation.Utility.Stories.Shared.MatrixGrid)
local sheetModule = require(foundation.Components.Sheet)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local matrixGrid = matrixGridModule.MatrixGrid
local matrixLabel = matrixGridModule.matrixLabel
local list = {
	dialogSizeModule.Small,
	dialogSizeModule.Medium,
	dialogSizeModule.Large
}
local list_1 = { dialogSizeModule.Medium, dialogSizeModule.Large }
local medium = dialogSizeModule.Medium
local list_2 = { "Side", "Center" }
local var1 = dashModule.map(list_2, function(p1)
	return p1
end)
local uDim = UDim.new(0, 80)

local function prefersCenter(p1)
	return p1 == "Center"
end

local function centerHeightFor(p1, p2)
	return if p1 == "Center" then p2 else nil
end

local function columnLabels(p1)
	-- upvalues: dashModule (ref)
	return dashModule.map(p1, function(p2)
		return p2.label
	end)
end

local function SheetMatrix(p1)
	-- upvalues: reactModule (ref), matrixGrid (ref), dashModule (ref)
	return reactModule.createElement(matrixGrid, dashModule.join({
		cellAlign = "left",
		headerTextAlign = "left",
		cellColumnWidth = 120
	}, p1))
end

local function variantRows(p1)
	-- upvalues: dashModule (ref), list_2 (ref), matrixLabel (ref)
	return dashModule.map(list_2, function(p2)
		-- upvalues: matrixLabel (copy), p1 (ref)
		return { label = matrixLabel(p2), cells = p1(p2) }
	end)
end

local function placeholderText(p1, p2)
	-- upvalues: reactModule (ref), textModule (ref)
	return reactModule.createElement(textModule, {
		tag = "auto-xy text-body-medium text-wrap text-align-x-left content-default",
		Text = p1,
		LayoutOrder = p2
	})
end

local function SlotPlaceholder(p1)
	-- upvalues: reactModule (ref), viewModule (ref), textModule (ref)
	local height = p1.height
	
	return reactModule.createElement(viewModule, {
		tag = if height then if p1.isSubject then "row align-x-center align-y-center size-full-0 padding-medium radius-medium bg-action-emphasis" else "row align-x-center align-y-center size-full-0 padding-medium radius-medium bg-shift-200" elseif p1.isSubject then "row align-x-center align-y-center size-full-0 auto-y padding-medium radius-medium bg-action-emphasis" else "row align-x-center align-y-center size-full-0 auto-y padding-medium radius-medium bg-shift-200",
		Size = if height then UDim2.new(1, 0, 0, height) else nil,
		LayoutOrder = p1.LayoutOrder
	}, {
		Label = reactModule.createElement(textModule, {
			LayoutOrder = 1,
			Text = p1.label,
			tag = if p1.isSubject then "auto-xy text-label-medium content-inverse-emphasis" else "auto-xy text-label-medium content-muted"
		})
	})
end

local function ContentList(p1)
	-- upvalues: reactModule (ref), textModule (ref), viewModule (ref)
	local t = {}
	
	for i = 1, p1.length do
		t[`Row{i}`] = reactModule.createElement(textModule, {
			Text = `{i}.`,
			tag = if p1.isSubject then "size-full-0 auto-y text-body-medium text-align-x-left content-inverse-emphasis" else "size-full-0 auto-y text-body-medium text-align-x-left content-muted",
			LayoutOrder = i
		})
	end
	return reactModule.createElement(viewModule, {
		tag = if p1.isSubject then "col gap-small size-full-0 auto-y padding-medium radius-medium bg-action-emphasis" else "col gap-small size-full-0 auto-y padding-medium radius-medium bg-shift-200",
		LayoutOrder = p1.LayoutOrder
	}, t)
end

local function makeActionButtons(p2)
	-- upvalues: buttonVariantModule (ref)
	local list = { "Primary", "Secondary", "Tertiary" }
	local list_1 = {
		buttonVariantModule.Emphasis,
		buttonVariantModule.Standard,
		buttonVariantModule.SoftEmphasis
	}
	local t = {}
	
	for i = 1, math.clamp(p2, 1, 3) do
		t[i] = {
			text = list[i],
			variant = list_1[i],
			onActivated = function() end
		}
	end
	return t
end

local function _(p3)
	-- upvalues: uDim (ref)
	return if p3.fullBleedHeight or p3.fullBleedAspectRatio or p3.fullBleedUnboundedHeight then p3.fullBleedHeight else uDim
end

local function makeSheetChildren(p3)
	-- upvalues: reactModule (ref), ContentList (ref), textModule (ref), SlotPlaceholder (ref), sheetModule (ref), uDim (ref), buttonGroupModule (ref), makeActionButtons (ref), fillBehaviorModule (ref), inputSizeModule (ref)
	p3 = p3 or {}
	local var2 = p3.showHeader ~= nil or p3.showHeader
	local var3 = p3.showContent ~= nil or p3.showContent
	local var4 = p3.showActions ~= nil or p3.showActions
	local var5 = p3.showFullBleed == true
	local var6 = p3.fullBleedSticky == true
	local var7 = not (var5 and var6)
	local highlightedSlot = p3.highlightedSlot
	local t = {}
	local contentListLength = p3.contentListLength
	local contentLineCount = p3.contentLineCount
	
	if contentListLength and contentListLength > 0 then
		t.List = reactModule.createElement(ContentList, {
			LayoutOrder = 1,
			length = contentListLength,
			isSubject = highlightedSlot == "Content"
		})
	elseif contentLineCount and contentLineCount > 1 then
		for i = 1, contentLineCount do
			t[`Line{i}`] = reactModule.createElement(textModule, {
				tag = "auto-xy text-body-medium text-wrap text-align-x-left content-default",
				Text = `This is a longer block of sheet content meant to exceed the available height and scroll. {i}`,
				LayoutOrder = i
			})
		end
	elseif p3.contentText then
		t.Body = reactModule.createElement(textModule, {
			LayoutOrder = 1,
			tag = "auto-xy text-body-medium text-wrap text-align-x-left content-default",
			Text = p3.contentText
		})
	else
		t.Body = reactModule.createElement(SlotPlaceholder, {
			label = "Content",
			LayoutOrder = 1,
			isSubject = highlightedSlot == "Content",
			height = p3.contentHeight or 240
		})
	end
	local createElement
	local t_1 = {}
	
	if var5 then
		createElement = reactModule.createElement
		createElement = createElement(sheetModule.FullBleed, {
			media = p3.fullBleedMedia or "rbxassetid://103403748802347",
			sticky = if var6 then true else nil,
			height = if p3.fullBleedHeight or p3.fullBleedAspectRatio or p3.fullBleedUnboundedHeight then p3.fullBleedHeight else uDim,
			aspectRatio = p3.fullBleedAspectRatio,
			mediaStyle = p3.fullBleedMediaStyle,
			backgroundStyle = p3.fullBleedBackgroundStyle
		}, p3.fullBleedChildren)
	else
		createElement = nil
	end
	t_1.FullBleed = createElement
	t_1.Header = if var2 and var7 then reactModule.createElement(sheetModule.Header, { hasCloseAffordance = p3.hasCloseAffordance }, {
		Title = if p3.headerText then reactModule.createElement(textModule, {
			LayoutOrder = 1,
			tag = "auto-xy text-body-medium text-wrap text-align-x-left content-default",
			Text = p3.headerText
		}) else reactModule.createElement(SlotPlaceholder, {
			label = "Header",
			LayoutOrder = 1,
			isSubject = highlightedSlot == "Header",
			height = p3.headerHeight
		})
	}) else nil
	t_1.Content = if var3 then reactModule.createElement(sheetModule.Content, { isContentFullBleed = p3.isContentFullBleed }, t) else nil
	t_1.Actions = if var4 then reactModule.createElement(sheetModule.Actions, nil, {
		Buttons = if p3.actionCount then reactModule.createElement(buttonGroupModule, {
			buttons = makeActionButtons(p3.actionCount),
			fillBehavior = fillBehaviorModule.Fill,
			size = inputSizeModule.Medium
		}) else reactModule.createElement(SlotPlaceholder, {
			label = "Actions",
			LayoutOrder = 1,
			isSubject = highlightedSlot == "Actions"
		})
	}) else nil
	
	return t_1
end

local function LabeledSheetTrigger(p4)
	-- upvalues: reactModule (ref), viewModule (ref), textModule (ref), buttonModule (ref), buttonVariantModule (ref), sheetModule (ref), makeSheetChildren (ref)
	local var8
	local var9, var10 = reactModule.useState(false)
	local createElement = reactModule.createElement
	local t = {
		tag = "col gap-small auto-xy",
		LayoutOrder = p4.LayoutOrder
	}
	local t_1 = {
		Label = if p4.label then reactModule.createElement(textModule, {
			tag = "auto-xy text-caption-small text-align-x-left content-default",
			LayoutOrder = 1,
			Text = p4.label
		}) else nil,
		OpenButton = reactModule.createElement(buttonModule, {
			LayoutOrder = 2,
			text = if var9 then "Close" else "Open",
			onActivated = function()
				-- upvalues: var10 (ref), var9 (ref)
				var10(not var9)
			end,
			variant = if var9 then buttonVariantModule.Standard else buttonVariantModule.Emphasis
		})
	}
	
	if var9 then
		var8 = reactModule.createElement
		var8 = var8(sheetModule.Root, {
			isOpen = true,
			size = p4.size,
			preferCenterSheet = p4.preferCenterSheet,
			centerSheetHeight = p4.centerSheetHeight,
			snapPoints = p4.snapPoints,
			defaultSnapPointIndex = p4.defaultSnapPointIndex,
			onClose = function()
				-- upvalues: var10 (ref)
				var10(false)
			end
		}, p4.children or makeSheetChildren(p4.childrenOptions))
	else
		var8 = nil
	end
	t_1.SheetRoot = var8
	
	return createElement(viewModule, t, t_1)
end

return {
	MATRIX_CELL_WIDTH = 120,
	WIDE_CELL_WIDTH = 280,
	OVERFLOW_LIST_LENGTH = 40,
	PLAYGROUND_TAG = "auto-xy padding-y-large bg-surface-0",
	PAGE_TAG = "col gap-xxlarge size-full-0 auto-y padding-y-large bg-surface-0",
	MATRIX_SECTION_TAG = "col gap-large size-full-0 auto-y",
	MEDIA = "rbxassetid://103403748802347",
	TITLE_TEXT = "Title",
	CONTENT_TEXT = "Content",
	LONG_CONTENT_TEXT = "This is a longer block of sheet content meant to exceed the available height and scroll.",
	SIZE_ORDER = list,
	SIDE_SIZE_ORDER = list_1,
	DEFAULT_SIZE = medium,
	VARIANT_ORDER = list_2,
	VARIANT_HEADERS = var1,
	prefersCenter = prefersCenter,
	centerHeightFor = centerHeightFor,
	columnLabels = columnLabels,
	SheetMatrix = SheetMatrix,
	variantRows = variantRows,
	variantTrigger = function(p4, p5)
		-- upvalues: dashModule (ref), reactModule (ref), LabeledSheetTrigger (ref)
		local var8 = dashModule.join(p5 or {})
		var8.preferCenterSheet = p4 == "Center"
		var8.centerSheetHeight = if p4 == "Center" then var8.centerSheetHeight else nil
		
		return reactModule.createElement(LabeledSheetTrigger, var8)
	end,
	Section = function(p4)
		-- upvalues: reactModule (ref), viewModule (ref), textModule (ref)
		return reactModule.createElement(viewModule, {
			tag = "col gap-medium size-full-0 auto-y",
			LayoutOrder = p4.LayoutOrder
		}, {
			Title = if p4.note then reactModule.createElement(viewModule, { tag = "col gap-xsmall auto-xy", LayoutOrder = 1 }, {
				Name = reactModule.createElement(textModule, {
					tag = "auto-xy text-label-medium content-default",
					LayoutOrder = 1,
					Text = p4.name
				}),
				Note = reactModule.createElement(textModule, {
					tag = "auto-xy text-body-small content-muted",
					LayoutOrder = 2,
					Text = p4.note
				})
			}) else reactModule.createElement(textModule, {
				tag = "auto-xy text-label-medium content-default",
				LayoutOrder = 1,
				Text = p4.name
			}),
			Content = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = p4.contentTag or "row gap-large align-y-top auto-xy wrap"
			}, p4.children)
		})
	end,
	LabeledSheetTrigger = LabeledSheetTrigger,
	makeSheetChildren = makeSheetChildren,
	makeActionButtons = makeActionButtons,
	placeholderText = placeholderText
}