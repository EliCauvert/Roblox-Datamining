-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:06 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useChipVariantsModule = require(foundation.Components.Chip.useChipVariants)
local chipSizeModule = require(foundation.Enums.ChipSize)
local chipVariantModule = require(foundation.Enums.ChipVariant)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local paginationSizeModule = require(foundation.Enums.PaginationSize)
local presentationContextModule = require(foundation.Providers.Style.PresentationContext)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local paginationUtilsModule = require(script.Parent.Parent.paginationUtils)

local function PageNumberText(p0) --[[ line: 43 ]]
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
	[paginationSizeModule.Small] = "size-0-600",
	[paginationSizeModule.Medium] = "size-0-800"
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2) --[[ line: 65 | named "PageNumberSlot" ]]
	-- upvalues: useTokensModule (ref), paginationUtilsModule (ref), paginationSizeModule (ref), chipSizeModule (ref), useChipVariantsModule (ref), chipVariantModule (ref), t (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), presentationContextModule (ref), colorNamespaceModule (ref), PageNumberText (ref)
	local var15 = useTokensModule()
	local var16 = not p1.isChecked
	local var17 = paginationUtilsModule.needsWidePageSlot(p1.page)
	local var18 = if p1.slotSize == paginationSizeModule.Small then chipSizeModule.Small else chipSizeModule.Medium
	local var19 = useChipVariantsModule(var15, var18, chipVariantModule.Utility, true, false, false)
	local var20 = useChipVariantsModule(var15, var18, chipVariantModule.Utility, false, false, false)
	local slotSize = `row align-x-center align-y-center auto-x radius-circle {t[p1.slotSize]}`
	local var22 = reactModule.useCallback(function() --[[ line: 76 ]]
		-- upvalues: p1 (ref)
		p1.onPageActivated(p1.page)
	end, { p1.onPageActivated, p1.page })
	local t_1 = {
		Selectable = var16 and p1.Selectable ~= false,
		NextSelectionLeft = p1.NextSelectionLeft,
		NextSelectionRight = p1.NextSelectionRight,
		NextSelectionUp = p1.NextSelectionUp,
		NextSelectionDown = p1.NextSelectionDown
	}
	
	return if var17 then if var16 then reactModule.createElement(viewModule, withCommonPropsModule({ LayoutOrder = p1.layoutOrder, testId = p1.testId }, {
		backgroundStyle = var20.chip.backgroundStyle,
		padding = var20.chip.padding,
		cursor = paginationUtilsModule.getSlotCursor(var15),
		onActivated = var22,
		ref = p2,
		selection = t_1,
		tag = slotSize
	}), {
		Label = reactModule.createElement(presentationContextModule.Provider, {
			value = {
				isIconSize = true,
				colorNamespace = colorNamespaceModule.Color
			}
		}, {
			Text = reactModule.createElement(PageNumberText, {
				page = p1.page,
				textStyle = var20.text.contentStyle,
				textTag = var20.text.tag,
				padding = var20.text.padding,
				testId = p1.testId
			})
		})
	}) else reactModule.createElement(viewModule, withCommonPropsModule({ LayoutOrder = p1.layoutOrder, testId = p1.testId }, {
		backgroundStyle = var19.chip.backgroundStyle,
		padding = var19.chip.padding,
		ref = p2,
		selection = { Selectable = false },
		tag = slotSize
	}), {
		Text = reactModule.createElement(PageNumberText, {
			page = p1.page,
			textStyle = var19.text.contentStyle,
			textTag = var19.text.tag,
			padding = var19.text.padding,
			testId = p1.testId
		})
	}) else reactModule.createElement(viewModule, withCommonPropsModule({ LayoutOrder = p1.layoutOrder, testId = p1.testId }, {
		backgroundStyle = {
			Transparency = 1,
			Color3 = var15.Color.Surface.Surface_0.Color3
		},
		cursor = if var16 then paginationUtilsModule.getSlotCursor(var15) else nil,
		onActivated = if var16 then var22 else nil,
		ref = p2,
		selection = if var16 then t_1 else { Selectable = false },
		tag = paginationUtilsModule.getCircularSlotTag(p1.slotSize)
	}), {
		Text = reactModule.createElement(PageNumberText, {
			padding = nil,
			page = p1.page,
			textStyle = if p1.isChecked then var19.text.contentStyle else var15.Color.Content.Default,
			textTag = paginationUtilsModule.getPageLabelTextTag(p1.slotSize),
			testId = p1.testId
		})
	})
end))