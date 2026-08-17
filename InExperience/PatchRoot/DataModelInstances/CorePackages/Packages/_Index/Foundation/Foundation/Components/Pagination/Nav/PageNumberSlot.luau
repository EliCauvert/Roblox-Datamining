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

local function PageNumberText(p0) --[[ line: 44 ]]
	-- upvalues: reactModule (ref), textModule (ref)
	return reactModule.createElement(textModule, {
		LayoutOrder = 1,
		Text = tostring(p0.page),
		textStyle = p0.textStyle,
		tag = p0.textTag,
		padding = p0.padding,
		testId = `{p0.testId}--text`
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

return reactModule.memo(reactModule.forwardRef(function(p1, p2) --[[ line: 68 | named "PageNumberSlot" ]]
	-- upvalues: useTokensModule (ref), paginationUtilsModule (ref), paginationSizeModule (ref), chipSizeModule (ref), useChipVariantsModule (ref), chipVariantModule (ref), t_1 (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), presentationContextModule (ref), flagsModule (ref), t (ref), colorNamespaceModule (ref), PageNumberText (ref)
	local var17 = useTokensModule()
	local var18 = not p1.isChecked
	local var19 = paginationUtilsModule.needsWidePageSlot(p1.page)
	local var20 = if p1.slotSize == paginationSizeModule.Small then chipSizeModule.Small else chipSizeModule.Medium
	local var21 = useChipVariantsModule(var17, var20, chipVariantModule.Utility, true, false, false)
	local var22 = useChipVariantsModule(var17, var20, chipVariantModule.Utility, false, false, false)
	local slotSize = `row align-x-center align-y-center auto-x radius-circle {t_1[p1.slotSize]}`
	local var24 = reactModule.useCallback(function() --[[ line: 79 ]]
		-- upvalues: p1 (ref)
		p1.onPageActivated(p1.page)
	end, { p1.onPageActivated, p1.page })
	local t_2 = {
		Selectable = var18 and p1.Selectable ~= false,
		NextSelectionLeft = p1.NextSelectionLeft,
		NextSelectionRight = p1.NextSelectionRight,
		NextSelectionUp = p1.NextSelectionUp,
		NextSelectionDown = p1.NextSelectionDown
	}
	
	return if var19 then if var18 then reactModule.createElement(viewModule, withCommonPropsModule({ LayoutOrder = p1.LayoutOrder, testId = p1.testId }, {
		backgroundStyle = var22.chip.backgroundStyle,
		padding = var22.chip.padding,
		cursor = paginationUtilsModule.getSlotCursor(var17),
		onActivated = var24,
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
				textStyle = var22.text.contentStyle,
				textTag = var22.text.tag,
				padding = var22.text.padding,
				testId = p1.testId
			})
		})
	}) else reactModule.createElement(viewModule, withCommonPropsModule({ LayoutOrder = p1.LayoutOrder, testId = p1.testId }, {
		backgroundStyle = var21.chip.backgroundStyle,
		padding = var21.chip.padding,
		ref = p2,
		selection = { Selectable = false },
		tag = slotSize
	}), {
		Text = reactModule.createElement(PageNumberText, {
			page = p1.page,
			textStyle = var21.text.contentStyle,
			textTag = var21.text.tag,
			padding = var21.text.padding,
			testId = p1.testId
		})
	}) else reactModule.createElement(viewModule, withCommonPropsModule({ LayoutOrder = p1.LayoutOrder, testId = p1.testId }, {
		backgroundStyle = {
			Transparency = 1,
			Color3 = var17.Color.Surface.Surface_0.Color3
		},
		cursor = if var18 then paginationUtilsModule.getSlotCursor(var17) else nil,
		onActivated = if var18 then var24 else nil,
		ref = p2,
		selection = if var18 then t_2 else { Selectable = false },
		tag = paginationUtilsModule.getCircularSlotTag(p1.slotSize)
	}), {
		Text = reactModule.createElement(PageNumberText, {
			padding = nil,
			page = p1.page,
			textStyle = if p1.isChecked then var21.text.contentStyle else var17.Color.Content.Default,
			textTag = paginationUtilsModule.getPageLabelTextTag(p1.slotSize),
			testId = p1.testId
		})
	})
end))