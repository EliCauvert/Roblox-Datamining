local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local closeAffordanceModule = require(foundation.Components.CloseAffordance)
local closeAffordanceVariantModule = require(foundation.Enums.CloseAffordanceVariant)
local iconModule = require(foundation.Components.Icon)
local inputSizeModule = require(foundation.Enums.InputSize)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local escapeRichTextModule = require(foundation.Utility.escapeRichText)
local useInternalNoticeLayoutModule = require(script.Parent.useInternalNoticeLayout)
local useInternalNoticeVariantsPropsModule = require(script.Parent.useInternalNoticeVariantsProps)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokensModule (ref), reactModule (ref), useInternalNoticeLayoutModule (ref), useInternalNoticeVariantsPropsModule (ref), iconModule (ref), viewModule (ref), textModule (ref), escapeRichTextModule (ref), stateLayerAffordanceModule (ref), closeAffordanceModule (ref), inputSizeModule (ref), closeAffordanceVariantModule (ref), withCommonPropsModule (ref)
	local testId = p1.testId or "--foundation-internal-notice"
	local size600 = useTokensModule().Size.Size_600
	local uDim2 = UDim2.fromOffset(0, size600)
	local var1 = reactModule.useMemo(function()
		-- upvalues: size600 (ref)
		return { MinSize = Vector2.new(0, size600) }
	end, { size600 })
	local var2 = useInternalNoticeLayoutModule(p1.onAbsoluteSizeChanged)
	local isStacked = var2.isStacked
	local var3 = useInternalNoticeVariantsPropsModule(p1.variantProps, isStacked, p1.truncation == true)
	local var4 = if typeof(p1.icon) == "string" then { variant = nil, name = p1.icon } else p1.icon
	local var5 = if var4 then reactModule.createElement(iconModule, {
		LayoutOrder = 1,
		name = var4.name,
		variant = var4.variant,
		size = var3.icon.size,
		style = var3.icon.style,
		testId = `{testId}--icon`
	}) else nil
	local var6 = if var5 then reactModule.createElement(viewModule, {
		tag = "col align-y-center auto-x",
		LayoutOrder = 1,
		Size = uDim2
	}, { Icon = var5 }) else nil
	local var7 = reactModule.createElement(textModule, {
		LayoutOrder = 2,
		Text = p1.text,
		tag = var3.message.tag,
		padding = var3.message.padding,
		testId = `{testId}--message`
	})
	local var8 = if p1.link then reactModule.createElement(textModule, {
		RichText = true,
		Text = `<u>{escapeRichTextModule(p1.link.text)}</u>`,
		tag = var3.link.tag,
		padding = var3.link.padding,
		sizeConstraint = var2.stackedLinkConstraint,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		onActivated = p1.link.onActivated,
		LayoutOrder = if isStacked then 3 else 2,
		testId = `{testId}--link`,
		onAbsoluteSizeChanged = var2.measureInlineLink
	}) else nil
	local var9 = if p1.onClose then reactModule.createElement(viewModule, {
		tag = "col align-y-center auto-x",
		LayoutOrder = 3,
		Size = uDim2
	}, {
		Close = reactModule.createElement(closeAffordanceModule, {
			hasPadding = false,
			LayoutOrder = 1,
			onActivated = p1.onClose,
			size = inputSizeModule.Small,
			variant = closeAffordanceVariantModule.Utility,
			testId = `{testId}--close`
		})
	}) else nil
	local container = var3.container
	local var10 = withCommonPropsModule(p1, {
		tag = if container then container.tag else nil,
		backgroundStyle = if container then container.backgroundStyle else nil,
		ref = p2
	})
	var10.onAbsoluteSizeChanged = var2.onNoticeAbsoluteSizeChanged
	local var11 = reactModule.createElement(viewModule, {
		tag = var3.content.tag,
		padding = var3.content.padding,
		LayoutOrder = if var3.border then 2 else 1
	}, if isStacked then {
		Icon = var6,
		Stack = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = var3.stack.tag,
			sizeConstraint = var1,
			onAbsoluteSizeChanged = var2.onStackedColumnAbsoluteSizeChanged,
			testId = `{testId}--stack`
		}, { Message = var7, Link = var8 }),
		Close = var9
	} else {
		Leading = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = var3.leading.tag,
			sizeConstraint = var1,
			testId = `{testId}--leading`
		}, { Icon = var6, Message = var7 }),
		Link = var8,
		Close = var9
	})
	
	return reactModule.createElement(viewModule, var10, if var3.border then {
		TopBorder = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			Size = var3.border.Size,
			backgroundStyle = var3.border.backgroundStyle,
			testId = `{testId}--top-border`
		}),
		Main = var11,
		BottomBorder = reactModule.createElement(viewModule, {
			LayoutOrder = 3,
			Size = var3.border.Size,
			backgroundStyle = var3.border.backgroundStyle,
			testId = `{testId}--bottom-border`
		})
	} else { Main = var11 })
end))