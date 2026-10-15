local textService = game:GetService("TextService")
local parent = script:FindFirstAncestor("Gifting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local _ = require(parent.ReactFocusNavigation)
local iconButton = foundationModule.IconButton
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local dialogSize = foundationModule.Enums.DialogSize
local iconName = foundationModule.Enums.IconName
local useTextSize = foundationModule.Hooks.useTextSize
local useTextSizeOffset = foundationModule.Hooks.useTextSizeOffset
local useTokens = foundationModule.Hooks.useTokens
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum

local function useFooterLayout(p1)
	-- upvalues: useTokens (ref), useTextSizeOffset (ref), reactModule (ref), foundationFontFaceMigration (ref), useTextSize (ref), textService (ref)
	local var1 = useTokens()
	local var2 = useTextSizeOffset()
	local captionSmall = var1.Typography.CaptionSmall
	local var3, var4 = reactModule.useState(0)
	local var5 = if foundationFontFaceMigration then useTextSize(if var3 > 0 then p1 else nil, {
		Font = captionSmall.Font,
		FontSize = captionSmall.FontSize + var2
	}, Vector2.new(var3, 1e999)) else nil
	
	return {
		topInset = var1.Padding.Medium - var1.Margin.Small,
		captionHeight = reactModule.useMemo(function()
			-- upvalues: p1 (ref), var3 (ref), foundationFontFaceMigration (copy), captionSmall (ref), var5 (ref), var2 (ref), textService (copy)
			return if p1 == nil or var3 <= 0 then 0 elseif foundationFontFaceMigration then captionSmall.LineHeight * (if var5 then var5.Y else captionSmall.FontSize + var2) else captionSmall.LineHeight * textService:GetTextSize(p1, captionSmall.FontSize + var2, captionSmall.Font, Vector2.new(var3, 1e999)).Y
		end, {
			p1,
			var3,
			captionSmall,
			var2,
			var5
		}),
		onAbsoluteSizeChanged = if p1 then reactModule.useCallback(function(p2)
			-- upvalues: var4 (ref)
			local floored = math.floor(p2.AbsoluteSize.X)
			var4(function(p3)
				-- upvalues: floored (ref)
				return if p3 == floored then p3 else floored
			end)
		end, {}) else nil
	}
end

local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

local function useSheetFocusRoot(p1)
	-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref)
	local onBack = p1.onBack or p1.onClose
	
	return useFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		eventMap = t,
		eventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), onBack (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p2)
						-- upvalues: onBack (copy)
						p2:cancel()
						onBack()
					end)
				}
			}
		end, { onBack }),
		isFocusable = p1.isOpen
	})
end

return reactModule.memo(function(p1)
	-- upvalues: useFooterLayout (ref), useSheetFocusRoot (ref), reactModule (ref), sheet (ref), dialogSize (ref), iconButton (ref), iconName (ref), text (ref), view (ref)
	local var1 = useFooterLayout(p1.captionText)
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		testId = "GiftSheetLayoutView",
		ref = useSheetFocusRoot(p1),
		isOpen = p1.isOpen,
		size = dialogSize.Medium,
		centerSheetHeight = p1.centerSheetHeight,
		snapPoints = p1.snapPoints,
		onClose = p1.onClose
	}, {
		Header = reactModule.createElement(sheet.Header, {}, {
			Back = if p1.onBack then reactModule.createElement(iconButton, {
				testId = "gift-sheet-layout-back",
				LayoutOrder = 1,
				icon = iconName.ChevronLargeLeft,
				onActivated = p1.onBack
			}) else nil,
			Title = reactModule.createElement(text, {
				tag = "fill auto-y text-heading-small text-align-x-left content-emphasis",
				testId = "gift-sheet-layout-title",
				LayoutOrder = 2,
				Text = p1.titleText
			})
		}),
		Content = reactModule.createElement(sheet.Content, { testId = "gift-sheet-layout-content" }, {
			Body = reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y padding-bottom-xsmall padding-top-xxsmall",
				testId = "gift-sheet-layout-body"
			}, {
				Main = reactModule.createElement(view, {
					tag = "col size-full-0 auto-y",
					testId = "gift-sheet-layout-main",
					LayoutOrder = 1
				}, p1.content)
			})
		}),
		Actions = if if p1.actions == nil then p1.captionText ~= nil else true then reactModule.createElement(sheet.Actions, {}, {
			Footer = reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y",
				testId = "gift-sheet-layout-footer",
				padding = { top = UDim.new(0, var1.topInset) },
				onAbsoluteSizeChanged = var1.onAbsoluteSizeChanged
			}, {
				Actions = if p1.actions then reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, p1.actions) else nil,
				Caption = if p1.captionText then reactModule.createElement(text, {
					tag = "text-caption-small text-wrap text-align-x-left text-align-y-top content-muted",
					testId = "gift-sheet-layout-caption",
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, var1.captionHeight),
					Text = p1.captionText
				}) else nil
			})
		}) else nil
	})
end)