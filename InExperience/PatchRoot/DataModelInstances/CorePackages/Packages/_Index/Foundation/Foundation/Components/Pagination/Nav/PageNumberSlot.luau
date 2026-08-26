local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useChipVariantsModule = require(foundation.Components.Chip.useChipVariants)
local chipSizeModule = require(foundation.Enums.ChipSize)
local chipVariantModule = require(foundation.Enums.ChipVariant)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local flagsModule = require(foundation.Utility.Flags)
local paginationSizeModule = require(foundation.Enums.PaginationSize)
local presentationContextModule = require(foundation.Providers.Style.PresentationContext)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local paginationUtilsModule = require(script.Parent.Parent.paginationUtils)

local function PageNumberText(p1)
	-- upvalues: reactModule (ref), textModule (ref)
	return reactModule.createElement(textModule, {
		LayoutOrder = 1,
		Text = tostring(p1.page),
		textStyle = p1.textStyle,
		tag = p1.textTag,
		padding = p1.padding,
		testId = `{p1.testId}--text`
	})
end

local t = {
	isIconSize = true,
	colorNamespace = colorNamespaceModule.Color
}
local t_1 = {
	[paginationSizeModule.Small] = "size-0-600",
	[paginationSizeModule.Medium] = "size-0-800"
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokensModule (ref), paginationUtilsModule (ref), paginationSizeModule (ref), chipSizeModule (ref), useChipVariantsModule (ref), chipVariantModule (ref), t_1 (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), presentationContextModule (ref), flagsModule (ref), t (ref), colorNamespaceModule (ref), PageNumberText (ref)
	local var1 = useTokensModule()
	local var2 = not p1.isChecked
	local var3 = paginationUtilsModule.needsWidePageSlot(p1.page)
	local var4 = if p1.slotSize == paginationSizeModule.Small then chipSizeModule.Small else chipSizeModule.Medium
	local var5 = useChipVariantsModule(var1, var4, chipVariantModule.Utility, true, false, false)
	local var6 = useChipVariantsModule(var1, var4, chipVariantModule.Utility, false, false, false)
	local slotSize = `row align-x-center align-y-center auto-x radius-circle {t_1[p1.slotSize]}`
	local var7 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.onPageActivated(p1.page)
	end, { p1.onPageActivated, p1.page })
	local t_2 = {
		Selectable = var2 and p1.Selectable ~= false,
		NextSelectionLeft = p1.NextSelectionLeft,
		NextSelectionRight = p1.NextSelectionRight,
		NextSelectionUp = p1.NextSelectionUp,
		NextSelectionDown = p1.NextSelectionDown
	}
	
	return if var3 then if var2 then reactModule.createElement(viewModule, withCommonPropsModule({ LayoutOrder = p1.LayoutOrder, testId = p1.testId }, {
		backgroundStyle = var6.chip.backgroundStyle,
		padding = var6.chip.padding,
		cursor = paginationUtilsModule.getSlotCursor(var1),
		onActivated = var7,
		ref = p2,
		selection = t_2,
		tag = slotSize
	}), {
		Label = reactModule.createElement(presentationContextModule.Provider, {
			value = if flagsModule.FoundationStableContextValues then t else {
				isIconSize = true,
				colorNamespace = colorNamespaceModule.Color
			}
		}, {
			Text = reactModule.createElement(PageNumberText, {
				page = p1.page,
				textStyle = var6.text.contentStyle,
				textTag = var6.text.tag,
				padding = var6.text.padding,
				testId = p1.testId
			})
		})
	}) else reactModule.createElement(viewModule, withCommonPropsModule({ LayoutOrder = p1.LayoutOrder, testId = p1.testId }, {
		backgroundStyle = var5.chip.backgroundStyle,
		padding = var5.chip.padding,
		ref = p2,
		selection = { Selectable = false },
		tag = slotSize
	}), {
		Text = reactModule.createElement(PageNumberText, {
			page = p1.page,
			textStyle = var5.text.contentStyle,
			textTag = var5.text.tag,
			padding = var5.text.padding,
			testId = p1.testId
		})
	}) else reactModule.createElement(viewModule, withCommonPropsModule({ LayoutOrder = p1.LayoutOrder, testId = p1.testId }, {
		backgroundStyle = {
			Transparency = 1,
			Color3 = var1.Color.Surface.Surface_0.Color3
		},
		cursor = if var2 then paginationUtilsModule.getSlotCursor(var1) else nil,
		onActivated = if var2 then var7 else nil,
		ref = p2,
		selection = if var2 then t_2 else { Selectable = false },
		tag = paginationUtilsModule.getCircularSlotTag(p1.slotSize)
	}), {
		Text = reactModule.createElement(PageNumberText, {
			padding = nil,
			page = p1.page,
			textStyle = if p1.isChecked then var5.text.contentStyle else var1.Color.Content.Default,
			textTag = paginationUtilsModule.getPageLabelTextTag(p1.slotSize),
			testId = p1.testId
		})
	})
end))