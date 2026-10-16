local TextService = game:GetService("TextService")
local Parent = script:FindFirstAncestor("Gifting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(Parent.ReactFocusNavigation)
local IconButton = FoundationModule.IconButton
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local DialogSize = FoundationModule.Enums.DialogSize
local IconName = FoundationModule.Enums.IconName
local UseTextSizeFunction = FoundationModule.Hooks.useTextSize
local UseTextSizeOffsetFunction = FoundationModule.Hooks.useTextSizeOffset
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum

local function useFooterLayout(CaptionText) --[[ Line: 55 ]]
	-- upvalues: UseTokensFunction (copy), UseTextSizeOffsetFunction (copy), ReactModule (copy), FoundationFontFaceMigration (copy), UseTextSizeFunction (copy), TextService (copy)
	local UseTokensResult = UseTokensFunction()
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local CaptionSmall = UseTokensResult.Typography.CaptionSmall
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 61 ]]
		-- upvalues: UseStateResult2 (copy)
		local Floored = math.floor(Frame.AbsoluteSize.X)
		UseStateResult2(function(Floored1) --[[ Line: 63 ]]
			-- upvalues: Floored (copy)
			return if Floored1 == Floored then Floored1 else Floored
		end)
	end, {})
	local UseTextSizeResult = if FoundationFontFaceMigration then UseTextSizeFunction(if UseStateResult > 0 then CaptionText else nil, {
		Font = CaptionSmall.Font,
		FontSize = CaptionSmall.FontSize + UseTextSizeOffsetResult
	}, Vector2.new(UseStateResult, 1e999)) else nil
	
	return {
		topInset = UseTokensResult.Padding.Medium - UseTokensResult.Margin.Small,
		captionHeight = ReactModule.useMemo(function() --[[ Line: 76 ]]
			-- upvalues: CaptionText (copy), UseStateResult (copy), FoundationFontFaceMigration (upval), CaptionSmall (copy), UseTextSizeResult (copy), UseTextSizeOffsetResult (copy), TextService (upval)
			return if CaptionText == nil or UseStateResult <= 0 then 0 elseif FoundationFontFaceMigration then CaptionSmall.LineHeight * (if UseTextSizeResult then UseTextSizeResult.Y else CaptionSmall.FontSize + UseTextSizeOffsetResult) else CaptionSmall.LineHeight * TextService:GetTextSize(CaptionText, CaptionSmall.FontSize + UseTextSizeOffsetResult, CaptionSmall.Font, Vector2.new(UseStateResult, 1e999)).Y
		end, {
			CaptionText,
			UseStateResult,
			CaptionSmall,
			UseTextSizeOffsetResult,
			UseTextSizeResult
		}),
		onAbsoluteSizeChanged = if CaptionText then UseResult else nil
	}
end

local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function useSheetFocusRoot(p1) --[[ Line: 112 ]]
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy)
	local OnBack = p1.onBack or p1.onClose
	
	return UseFocusRootFunction({
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function() --[[ Line: 114 ]]
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnBack (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2) --[[ Line: 117 ]]
						-- upvalues: OnBack (upval)
						p2:cancel()
						OnBack()
					end)
				}
			}
		end, { OnBack }),
		isFocusable = p1.isOpen
	})
end

return ReactModule.memo(function(p1) --[[ Line: 134 | Named "GiftSheetLayoutView" ]]
	-- upvalues: useFooterLayout (copy), useSheetFocusRoot (copy), ReactModule (copy), Sheet (copy), DialogSize (copy), IconButton (copy), IconName (copy), Text (copy), View (copy)
	local HasActions: boolean = p1.actions ~= nil or p1.captionText ~= nil
	local UseFooterLayoutResult = useFooterLayout(p1.captionText)
	
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		testId = "GiftSheetLayoutView",
		ref = useSheetFocusRoot(p1),
		isOpen = p1.isOpen,
		size = DialogSize.Medium,
		centerSheetHeight = p1.centerSheetHeight,
		snapPoints = p1.snapPoints,
		onClose = p1.onClose
	}, {
		Header = ReactModule.createElement(Sheet.Header, {}, {
			Back = if p1.onBack then ReactModule.createElement(IconButton, {
				testId = "gift-sheet-layout-back",
				LayoutOrder = 1,
				icon = IconName.ChevronLargeLeft,
				onActivated = p1.onBack
			}) else nil,
			Title = ReactModule.createElement(Text, {
				tag = "fill auto-y text-heading-small text-align-x-left content-emphasis",
				testId = "gift-sheet-layout-title",
				LayoutOrder = 2,
				Text = p1.titleText
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, { testId = "gift-sheet-layout-content" }, {
			Body = ReactModule.createElement(View, {
				tag = "col gap-medium size-full-0 auto-y padding-bottom-xsmall padding-top-xxsmall",
				testId = "gift-sheet-layout-body"
			}, {
				Main = ReactModule.createElement(View, {
					tag = "col size-full-0 auto-y",
					testId = "gift-sheet-layout-main",
					LayoutOrder = 1
				}, p1.content)
			})
		}),
		Actions = if HasActions then ReactModule.createElement(Sheet.Actions, {}, {
			Footer = ReactModule.createElement(View, {
				tag = "col gap-medium size-full-0 auto-y",
				testId = "gift-sheet-layout-footer",
				padding = { top = UDim.new(0, UseFooterLayoutResult.topInset) },
				onAbsoluteSizeChanged = UseFooterLayoutResult.onAbsoluteSizeChanged
			}, {
				Actions = if p1.actions then ReactModule.createElement(View, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, p1.actions) else nil,
				Caption = if p1.captionText then ReactModule.createElement(Text, {
					tag = "text-caption-small text-wrap text-align-x-left text-align-y-top content-muted",
					testId = "gift-sheet-layout-caption",
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, UseFooterLayoutResult.captionHeight),
					Text = p1.captionText
				}) else nil
			})
		}) else nil
	})
end)