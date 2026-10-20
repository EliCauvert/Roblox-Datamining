local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local CloseAffordanceModule = require(Foundation.Components.CloseAffordance)
local CloseAffordanceVariantModule = require(Foundation.Enums.CloseAffordanceVariant)
local IconModule = require(Foundation.Components.Icon)
local InputSizeModule = require(Foundation.Enums.InputSize)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local EscapeRichTextModule = require(Foundation.Utility.escapeRichText)
local UseInternalNoticeLayoutModule = require(script.Parent.useInternalNoticeLayout)
local UseInternalNoticeVariantsPropsModule = require(script.Parent.useInternalNoticeVariantsProps)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), UseInternalNoticeLayoutModule (copy), UseInternalNoticeVariantsPropsModule (copy), IconModule (copy), ViewModule (copy), TextModule (copy), EscapeRichTextModule (copy), StateLayerAffordanceModule (copy), CloseAffordanceModule (copy), InputSizeModule (copy), CloseAffordanceVariantModule (copy), WithCommonPropsModule (copy)
	local TestId = p1.testId or "--foundation-internal-notice"
	local Size600 = UseTokensModule().Size.Size_600
	local _UDim2 = UDim2.fromOffset(0, Size600)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Size600 (copy)
		return { MinSize = Vector2.new(0, Size600) }
	end, { Size600 })
	local UseInternalNoticeLayoutModuleResult = UseInternalNoticeLayoutModule(p1.onAbsoluteSizeChanged)
	local IsStacked = UseInternalNoticeLayoutModuleResult.isStacked
	local UseInternalNoticeVariantsPropsModuleResult = UseInternalNoticeVariantsPropsModule(p1.variantProps, IsStacked, p1.truncation == true)
	local Config = if typeof(p1.icon) == "string" then { variant = nil, name = p1.icon } else p1.icon
	local Element = if Config then ReactModule.createElement(IconModule, {
		LayoutOrder = 1,
		name = Config.name,
		variant = Config.variant,
		size = UseInternalNoticeVariantsPropsModuleResult.icon.size,
		style = UseInternalNoticeVariantsPropsModuleResult.icon.style,
		testId = `{TestId}--icon`
	}) else nil
	local Element1 = if Element then ReactModule.createElement(ViewModule, {
		tag = "col align-y-center auto-x",
		LayoutOrder = 1,
		Size = _UDim2
	}, { Icon = Element }) else nil
	local Element2 = ReactModule.createElement(TextModule, {
		LayoutOrder = 2,
		Text = p1.text,
		tag = UseInternalNoticeVariantsPropsModuleResult.message.tag,
		padding = UseInternalNoticeVariantsPropsModuleResult.message.padding,
		testId = `{TestId}--message`
	})
	local Element21 = if p1.link then ReactModule.createElement(TextModule, {
		RichText = true,
		Text = `<u>{EscapeRichTextModule(p1.link.text)}</u>`,
		tag = UseInternalNoticeVariantsPropsModuleResult.link.tag,
		padding = UseInternalNoticeVariantsPropsModuleResult.link.padding,
		sizeConstraint = UseInternalNoticeLayoutModuleResult.stackedLinkConstraint,
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		onActivated = p1.link.onActivated,
		LayoutOrder = if IsStacked then 3 else 2,
		testId = `{TestId}--link`,
		onAbsoluteSizeChanged = UseInternalNoticeLayoutModuleResult.measureInlineLink
	}) else nil
	local Element3 = if p1.onClose then ReactModule.createElement(ViewModule, {
		tag = "col align-y-center auto-x",
		LayoutOrder = 3,
		Size = _UDim2
	}, {
		Close = ReactModule.createElement(CloseAffordanceModule, {
			hasPadding = false,
			LayoutOrder = 1,
			onActivated = p1.onClose,
			size = InputSizeModule.Small,
			variant = CloseAffordanceVariantModule.Utility,
			testId = `{TestId}--close`
		})
	}) else nil
	local Container = UseInternalNoticeVariantsPropsModuleResult.container
	local WithCommonPropsModuleResult = WithCommonPropsModule(p1, {
		tag = if Container then Container.tag else nil,
		backgroundStyle = if Container then Container.backgroundStyle else nil,
		ref = Ref
	})
	WithCommonPropsModuleResult.onAbsoluteSizeChanged = UseInternalNoticeLayoutModuleResult.onNoticeAbsoluteSizeChanged
	local Element4 = ReactModule.createElement(ViewModule, {
		tag = UseInternalNoticeVariantsPropsModuleResult.content.tag,
		padding = UseInternalNoticeVariantsPropsModuleResult.content.padding,
		LayoutOrder = if UseInternalNoticeVariantsPropsModuleResult.border then 2 else 1
	}, if IsStacked then {
		Icon = Element1,
		Stack = ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			tag = UseInternalNoticeVariantsPropsModuleResult.stack.tag,
			sizeConstraint = UseMemoResult,
			onAbsoluteSizeChanged = UseInternalNoticeLayoutModuleResult.onStackedColumnAbsoluteSizeChanged,
			testId = `{TestId}--stack`
		}, { Message = Element2, Link = Element21 }),
		Close = Element3
	} else {
		Leading = ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			tag = UseInternalNoticeVariantsPropsModuleResult.leading.tag,
			sizeConstraint = UseMemoResult,
			testId = `{TestId}--leading`
		}, { Icon = Element1, Message = Element2 }),
		Link = Element21,
		Close = Element3
	})
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModuleResult, if UseInternalNoticeVariantsPropsModuleResult.border then {
		TopBorder = ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			Size = UseInternalNoticeVariantsPropsModuleResult.border.Size,
			backgroundStyle = UseInternalNoticeVariantsPropsModuleResult.border.backgroundStyle,
			testId = `{TestId}--top-border`
		}),
		Main = Element4,
		BottomBorder = ReactModule.createElement(ViewModule, {
			LayoutOrder = 3,
			Size = UseInternalNoticeVariantsPropsModuleResult.border.Size,
			backgroundStyle = UseInternalNoticeVariantsPropsModuleResult.border.backgroundStyle,
			testId = `{TestId}--bottom-border`
		})
	} else { Main = Element4 })
end))