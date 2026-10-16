local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseChipVariantsModule = require(Foundation.Components.Chip.useChipVariants)
local ChipSizeModule = require(Foundation.Enums.ChipSize)
local ChipVariantModule = require(Foundation.Enums.ChipVariant)
local PaginationSizeModule = require(Foundation.Enums.PaginationSize)
local PresentationContextModule = require(Foundation.Providers.Style.PresentationContext)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local PaginationUtilsModule = require(script.Parent.Parent.paginationUtils)

local function PageNumberText(p1) --[[ Line: 43 ]]
	-- upvalues: ReactModule (copy), TextModule (copy)
	return ReactModule.createElement(TextModule, {
		LayoutOrder = 1,
		Text = tostring(p1.page),
		textStyle = p1.textStyle,
		tag = p1.textTag,
		padding = p1.padding,
		testId = `{p1.testId}--text`
	})
end

local config = {
	isIconSize = true,
	colorNamespace = require(Foundation.Enums.ColorNamespace).Color
}
local config1 = {
	[PaginationSizeModule.Small] = "size-0-600",
	[PaginationSizeModule.Medium] = "size-0-800"
}

return ReactModule.memo(ReactModule.forwardRef(function(Frame: Frame, Ref) --[[ Line: 67 | Named "PageNumberSlot" ]]
	-- upvalues: UseTokensModule (copy), PaginationUtilsModule (copy), PaginationSizeModule (copy), ChipSizeModule (copy), UseChipVariantsModule (copy), ChipVariantModule (copy), config1 (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), PresentationContextModule (copy), config (copy), PageNumberText (copy)
	local UseTokensModuleResult = UseTokensModule()
	local NoIsChecked = not Frame.isChecked
	local NeedsWidePageSlotResult = PaginationUtilsModule.needsWidePageSlot(Frame.page)
	local Small = if Frame.slotSize == PaginationSizeModule.Small then ChipSizeModule.Small else ChipSizeModule.Medium
	local UseChipVariantsModuleResult = UseChipVariantsModule(UseTokensModuleResult, Small, ChipVariantModule.Utility, true, false, false)
	local UseChipVariantsModuleResult1 = UseChipVariantsModule(UseTokensModuleResult, Small, ChipVariantModule.Utility, false, false, false)
	local Message: string = `row align-x-center align-y-center auto-x radius-circle {config1[Frame.slotSize]}`
	local UseResult = ReactModule.useCallback(function() --[[ Line: 78 ]]
		-- upvalues: Frame (copy)
		Frame.onPageActivated(Frame.page)
	end, { Frame.onPageActivated, Frame.page })
	local Selection = {
		Selectable = NoIsChecked and Frame.Selectable ~= false,
		NextSelectionLeft = Frame.NextSelectionLeft,
		NextSelectionRight = Frame.NextSelectionRight,
		NextSelectionUp = Frame.NextSelectionUp,
		NextSelectionDown = Frame.NextSelectionDown
	}
	
	return if NeedsWidePageSlotResult then if NoIsChecked then ReactModule.createElement(ViewModule, WithCommonPropsModule({ LayoutOrder = Frame.LayoutOrder, testId = Frame.testId }, {
		backgroundStyle = UseChipVariantsModuleResult1.chip.backgroundStyle,
		padding = UseChipVariantsModuleResult1.chip.padding,
		cursor = PaginationUtilsModule.getSlotCursor(UseTokensModuleResult),
		onActivated = UseResult,
		ref = Ref,
		selection = Selection,
		tag = Message
	}), {
		Label = ReactModule.createElement(PresentationContextModule.Provider, { value = config }, {
			Text = ReactModule.createElement(PageNumberText, {
				page = Frame.page,
				textStyle = UseChipVariantsModuleResult1.text.contentStyle,
				textTag = UseChipVariantsModuleResult1.text.tag,
				padding = UseChipVariantsModuleResult1.text.padding,
				testId = Frame.testId
			})
		})
	}) else ReactModule.createElement(ViewModule, WithCommonPropsModule({ LayoutOrder = Frame.LayoutOrder, testId = Frame.testId }, {
		backgroundStyle = UseChipVariantsModuleResult.chip.backgroundStyle,
		padding = UseChipVariantsModuleResult.chip.padding,
		ref = Ref,
		selection = { Selectable = false },
		tag = Message
	}), {
		Text = ReactModule.createElement(PageNumberText, {
			page = Frame.page,
			textStyle = UseChipVariantsModuleResult.text.contentStyle,
			textTag = UseChipVariantsModuleResult.text.tag,
			padding = UseChipVariantsModuleResult.text.padding,
			testId = Frame.testId
		})
	}) else ReactModule.createElement(ViewModule, WithCommonPropsModule({ LayoutOrder = Frame.LayoutOrder, testId = Frame.testId }, {
		backgroundStyle = {
			Transparency = 1,
			Color3 = UseTokensModuleResult.Color.Surface.Surface_0.Color3
		},
		cursor = if NoIsChecked then PaginationUtilsModule.getSlotCursor(UseTokensModuleResult) else nil,
		onActivated = if NoIsChecked then UseResult else nil,
		ref = Ref,
		selection = if NoIsChecked then Selection else { Selectable = false },
		tag = PaginationUtilsModule.getCircularSlotTag(Frame.slotSize)
	}), {
		Text = ReactModule.createElement(PageNumberText, {
			padding = nil,
			page = Frame.page,
			textStyle = if Frame.isChecked then UseChipVariantsModuleResult.text.contentStyle else UseTokensModuleResult.Color.Content.Default,
			textTag = PaginationUtilsModule.getPageLabelTextTag(Frame.slotSize),
			testId = Frame.testId
		})
	})
end))