local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local ButtonModule = require(Foundation.Components.Button)
local ButtonGroupModule = require(Foundation.Components.ButtonGroup)
local ButtonVariantModule = require(Foundation.Enums.ButtonVariant)
local DialogSizeModule = require(Foundation.Enums.DialogSize)
local FillBehaviorModule = require(Foundation.Enums.FillBehavior)
local InputSizeModule = require(Foundation.Enums.InputSize)
local MatrixGridModule = require(Foundation.Utility.Stories.Shared.MatrixGrid)
local SheetModule = require(Foundation.Components.Sheet)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local MatrixGrid = MatrixGridModule.MatrixGrid
local MatrixLabelFunction = MatrixGridModule.matrixLabel
local list = { "Side", "Center" }
local _UDim = UDim.new(0, 80)

local function SlotPlaceholder(Frame) --[[ Line: 147 ]]
	-- upvalues: ReactModule (copy), ViewModule (copy), TextModule (copy)
	local Height = Frame.height
	
	return ReactModule.createElement(ViewModule, {
		tag = if Height then if Frame.isSubject then "row align-x-center align-y-center size-full-0 padding-medium radius-medium bg-action-emphasis" else "row align-x-center align-y-center size-full-0 padding-medium radius-medium bg-shift-200" elseif Frame.isSubject then "row align-x-center align-y-center size-full-0 auto-y padding-medium radius-medium bg-action-emphasis" else "row align-x-center align-y-center size-full-0 auto-y padding-medium radius-medium bg-shift-200",
		Size = if Height then UDim2.new(1, 0, 0, Height) else nil,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Label = ReactModule.createElement(TextModule, {
			LayoutOrder = 1,
			Text = Frame.label,
			tag = if Frame.isSubject then "auto-xy text-label-medium content-inverse-emphasis" else "auto-xy text-label-medium content-muted"
		})
	})
end

local function ContentList(Frame) --[[ Line: 171 ]]
	-- upvalues: ReactModule (copy), TextModule (copy), ViewModule (copy)
	local Elements = {}
	
	for i = 1, Frame.length do
		local config = {
			Text = `{i}.`,
			tag = if Frame.isSubject then "size-full-0 auto-y text-body-medium text-align-x-left content-inverse-emphasis" else "size-full-0 auto-y text-body-medium text-align-x-left content-muted"
		}
		config.LayoutOrder = i
		Elements[`Row{i}`] = ReactModule.createElement(TextModule, config)
	end
	return ReactModule.createElement(ViewModule, {
		tag = if Frame.isSubject then "col gap-small size-full-0 auto-y padding-medium radius-medium bg-action-emphasis" else "col gap-small size-full-0 auto-y padding-medium radius-medium bg-shift-200",
		LayoutOrder = Frame.LayoutOrder
	}, Elements)
end

local function makeActionButtons(ActionCount: number) --[[ Line: 191 ]]
	-- upvalues: ButtonVariantModule (copy)
	local list = { "Primary", "Secondary", "Tertiary" }
	local list1 = {
		ButtonVariantModule.Emphasis,
		ButtonVariantModule.Standard,
		ButtonVariantModule.SoftEmphasis
	}
	local t = {}
	
	for i = 1, math.clamp(ActionCount, 1, 3) do
		t[i] = {
			text = list[i],
			variant = list1[i],
			onActivated = function() --[[ Line: 204 ]] end
		}
	end
	return t
end

local function _(p1) --[[ Line: 210 | Named "resolveFullBleedHeight" ]]
	-- upvalues: _UDim (copy)
	return if p1.fullBleedHeight or p1.fullBleedAspectRatio or p1.fullBleedUnboundedHeight then p1.fullBleedHeight else _UDim
end

local function makeSheetChildren(ChildrenOptions) --[[ Line: 217 ]]
	-- upvalues: ReactModule (copy), ContentList (copy), TextModule (copy), SlotPlaceholder (copy), SheetModule (copy), _UDim (copy), ButtonGroupModule (copy), makeActionButtons (copy), FillBehaviorModule (copy), InputSizeModule (copy)
	local ChildrenOptions1 = ChildrenOptions or {}
	local NoShowHeader = ChildrenOptions1.showHeader == nil or ChildrenOptions1.showHeader
	local NoShowContent = ChildrenOptions1.showContent == nil or ChildrenOptions1.showContent
	local NoShowActions = ChildrenOptions1.showActions == nil or ChildrenOptions1.showActions
	local IsShowFullBleed = ChildrenOptions1.showFullBleed == true
	local IsFullBleedSticky = ChildrenOptions1.fullBleedSticky == true
	local Inverted = not (IsShowFullBleed and IsFullBleedSticky)
	local HighlightedSlot = ChildrenOptions1.highlightedSlot
	local Elements = {}
	local ContentListLength: number = ChildrenOptions1.contentListLength
	local ContentLineCount: number = ChildrenOptions1.contentLineCount
	
	if ContentListLength and ContentListLength > 0 then
		Elements.List = ReactModule.createElement(ContentList, {
			LayoutOrder = 1,
			length = ContentListLength,
			isSubject = HighlightedSlot == "Content"
		})
	elseif ContentLineCount and ContentLineCount > 1 then
		for i = 1, ContentLineCount do
			Elements[`Line{i}`] = ReactModule.createElement(TextModule, {
				tag = "auto-xy text-body-medium text-wrap text-align-x-left content-default",
				Text = `This is a longer block of sheet content meant to exceed the available height and scroll. {i}`,
				LayoutOrder = i
			})
		end
	elseif ChildrenOptions1.contentText then
		Elements.Body = ReactModule.createElement(TextModule, {
			LayoutOrder = 1,
			tag = "auto-xy text-body-medium text-wrap text-align-x-left content-default",
			Text = ChildrenOptions1.contentText
		})
	else
		Elements.Body = ReactModule.createElement(SlotPlaceholder, {
			label = "Content",
			LayoutOrder = 1,
			isSubject = HighlightedSlot == "Content",
			height = ChildrenOptions1.contentHeight or 240
		})
	end
	return {
		FullBleed = if IsShowFullBleed then ReactModule.createElement(SheetModule.FullBleed, {
			media = ChildrenOptions1.fullBleedMedia or "rbxassetid://103403748802347",
			sticky = if IsFullBleedSticky then true else nil,
			height = if ChildrenOptions1.fullBleedHeight or ChildrenOptions1.fullBleedAspectRatio or ChildrenOptions1.fullBleedUnboundedHeight then ChildrenOptions1.fullBleedHeight else _UDim,
			aspectRatio = ChildrenOptions1.fullBleedAspectRatio,
			mediaStyle = ChildrenOptions1.fullBleedMediaStyle,
			backgroundStyle = ChildrenOptions1.fullBleedBackgroundStyle
		}, ChildrenOptions1.fullBleedChildren) else nil,
		Header = if NoShowHeader and Inverted then ReactModule.createElement(SheetModule.Header, { hasCloseAffordance = ChildrenOptions1.hasCloseAffordance }, {
			Title = if ChildrenOptions1.headerText then ReactModule.createElement(TextModule, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-medium text-wrap text-align-x-left content-default",
				Text = ChildrenOptions1.headerText
			}) else ReactModule.createElement(SlotPlaceholder, {
				label = "Header",
				LayoutOrder = 1,
				isSubject = HighlightedSlot == "Header",
				height = ChildrenOptions1.headerHeight
			})
		}) else nil,
		Content = if NoShowContent then ReactModule.createElement(SheetModule.Content, {
			isContentFullBleed = ChildrenOptions1.isContentFullBleed,
			isReversed = ChildrenOptions1.isContentReversed
		}, Elements) else nil,
		Actions = if NoShowActions then ReactModule.createElement(SheetModule.Actions, nil, {
			Buttons = if ChildrenOptions1.actionCount then ReactModule.createElement(ButtonGroupModule, {
				buttons = makeActionButtons(ChildrenOptions1.actionCount),
				fillBehavior = FillBehaviorModule.Fill,
				size = InputSizeModule.Medium
			}) else ReactModule.createElement(SlotPlaceholder, {
				label = "Actions",
				LayoutOrder = 1,
				isSubject = HighlightedSlot == "Actions"
			})
		}) else nil
	}
end

local function LabeledSheetTrigger(Frame) --[[ Line: 340 ]]
	-- upvalues: ReactModule (copy), ViewModule (copy), TextModule (copy), ButtonModule (copy), ButtonVariantModule (copy), SheetModule (copy), makeSheetChildren (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return ReactModule.createElement(ViewModule, {
		tag = "col gap-small auto-xy",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Label = if Frame.label then ReactModule.createElement(TextModule, {
			tag = "auto-xy text-caption-small text-align-x-left content-default",
			LayoutOrder = 1,
			Text = Frame.label
		}) else nil,
		OpenButton = ReactModule.createElement(ButtonModule, {
			LayoutOrder = 2,
			text = if UseStateResult then "Close" else "Open",
			onActivated = function() --[[ Line: 356 ]]
				-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
				UseStateResult2(not UseStateResult)
			end,
			variant = if UseStateResult then ButtonVariantModule.Standard else ButtonVariantModule.Emphasis
		}),
		SheetRoot = if UseStateResult then ReactModule.createElement(SheetModule.Root, {
			isOpen = true,
			size = Frame.size,
			preferCenterSheet = Frame.preferCenterSheet,
			centerSheetHeight = Frame.centerSheetHeight,
			snapPoints = Frame.snapPoints,
			defaultSnapPointIndex = Frame.defaultSnapPointIndex,
			onClose = function() --[[ Line: 370 ]]
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end
		}, Frame.children or makeSheetChildren(Frame.childrenOptions)) else nil
	})
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
	SIZE_ORDER = {
		DialogSizeModule.Small,
		DialogSizeModule.Medium,
		DialogSizeModule.Large
	},
	SIDE_SIZE_ORDER = { DialogSizeModule.Medium, DialogSizeModule.Large },
	DEFAULT_SIZE = DialogSizeModule.Medium,
	VARIANT_ORDER = list,
	VARIANT_HEADERS = DashModule.map(list, function(p1) --[[ Line: 82 ]]
		return p1
	end),
	prefersCenter = function(p1): boolean --[[ Line: 94 ]]
		return p1 == "Center"
	end,
	centerHeightFor = function(p1, p2) --[[ Line: 98 ]]
		return if p1 == "Center" then p2 else nil
	end,
	columnLabels = function(p1) --[[ Line: 102 ]]
		-- upvalues: DashModule (copy)
		return DashModule.map(p1, function(p2) --[[ Line: 103 ]]
			return p2.label
		end)
	end,
	SheetMatrix = function(p1) --[[ Line: 108 ]]
		-- upvalues: ReactModule (copy), MatrixGrid (copy), DashModule (copy)
		return ReactModule.createElement(MatrixGrid, DashModule.join({
			cellAlign = "left",
			headerTextAlign = "left",
			cellColumnWidth = 120
		}, p1))
	end,
	variantRows = function(Callback) --[[ Line: 119 ]]
		-- upvalues: DashModule (copy), list (copy), MatrixLabelFunction (copy)
		return DashModule.map(list, function(p1) --[[ Line: 120 ]]
			-- upvalues: MatrixLabelFunction (upval), Callback (copy)
			return { label = MatrixLabelFunction(p1), cells = Callback(p1) }
		end)
	end,
	variantTrigger = function(p1, p2) --[[ Line: 378 ]]
		-- upvalues: DashModule (copy), ReactModule (copy), LabeledSheetTrigger (copy)
		local JoinResult = DashModule.join(p2 or {})
		JoinResult.preferCenterSheet = p1 == "Center"
		local CenterSheetHeight = JoinResult.centerSheetHeight
		local IsCenter = p1 == "Center"
		JoinResult.centerSheetHeight = if IsCenter then CenterSheetHeight else nil
		
		return ReactModule.createElement(LabeledSheetTrigger, JoinResult)
	end,
	Section = function(Frame) --[[ Line: 301 ]]
		-- upvalues: ReactModule (copy), ViewModule (copy), TextModule (copy)
		return ReactModule.createElement(ViewModule, {
			tag = "col gap-medium size-full-0 auto-y",
			LayoutOrder = Frame.LayoutOrder
		}, {
			Title = if Frame.note then ReactModule.createElement(ViewModule, { tag = "col gap-xsmall auto-xy", LayoutOrder = 1 }, {
				Name = ReactModule.createElement(TextModule, {
					tag = "auto-xy text-label-medium content-default",
					LayoutOrder = 1,
					Text = Frame.name
				}),
				Note = ReactModule.createElement(TextModule, {
					tag = "auto-xy text-body-small content-muted",
					LayoutOrder = 2,
					Text = Frame.note
				})
			}) else ReactModule.createElement(TextModule, {
				tag = "auto-xy text-label-medium content-default",
				LayoutOrder = 1,
				Text = Frame.name
			}),
			Content = ReactModule.createElement(ViewModule, {
				LayoutOrder = 2,
				tag = Frame.contentTag or "row gap-large align-y-top auto-xy wrap"
			}, Frame.children)
		})
	end,
	LabeledSheetTrigger = LabeledSheetTrigger,
	makeSheetChildren = makeSheetChildren,
	makeActionButtons = makeActionButtons,
	placeholderText = function(Text, LayoutOrder) --[[ Line: 132 ]]
		-- upvalues: ReactModule (copy), TextModule (copy)
		return ReactModule.createElement(TextModule, {
			tag = "auto-xy text-body-medium text-wrap text-align-x-left content-default",
			Text = Text,
			LayoutOrder = LayoutOrder
		})
	end
}