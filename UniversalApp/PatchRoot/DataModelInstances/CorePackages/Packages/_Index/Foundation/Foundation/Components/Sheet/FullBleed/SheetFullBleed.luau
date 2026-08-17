local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local gradientModule = require(foundation.Components.Gradient)
local imageModule = require(foundation.Components.Image)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local flagsModule = require(foundation.Utility.Flags)
local sheetContextModule = require(script:FindFirstAncestor("Sheet").SheetContext)
local t = { sticky = false, height = UDim.new(1, 0) }

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 38 | named "SheetFullBleed" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), sheetContextModule (ref), flagsModule (ref), imageModule (ref), gradientModule (ref), viewModule (ref), constantsModule (ref)
	local var10 = withDefaultsModule(p0, t)
	local var11 = reactModule.useContext(sheetContextModule)
	local setFullBleedHeight = var11.setFullBleedHeight
	local fullBleedHeight = var11.fullBleedHeight
	local innerScrollY = var11.innerScrollY
	local hasHeader = var11.hasHeader
	local hasRadius = var11.hasRadius
	local testId = var11.testId
	assert(setFullBleedHeight and (hasHeader and testId), "SheetFullBleed must be used within a Sheet")
	reactModule.useEffect(function() --[[ line: 50 ]]
		-- upvalues: var10 (ref), hasHeader (ref)
		assert(not (var10.sticky and hasHeader:getValue()), "Sheet.FullBleed with sticky=true is unsupported when used with Sheet.Header")
	end, { var10.sticky, hasHeader })
	local var12 = reactModule.useCallback(function(p2) --[[ line: 57 ]]
		-- upvalues: setFullBleedHeight (ref)
		setFullBleedHeight(p2.AbsoluteSize.Y)
	end, {})
	reactModule.useEffect(function() --[[ line: 61 ]]
		-- upvalues: setFullBleedHeight (ref)
		return function() --[[ line: 62 ]]
			-- upvalues: setFullBleedHeight (copy)
			setFullBleedHeight(0)
		end
	end, {})
	local uDim2 = UDim2.new(1, 0, var10.height.Scale, var10.height.Offset)
	local var14 = nil
	
	if var10.sticky then
		var14 = uDim2
	elseif innerScrollY and fullBleedHeight then
		var14 = reactModule.joinBindings({ scrollY = innerScrollY, height = fullBleedHeight }):map(function(p3) --[[ line: 78 ]]
			return if p3.height == 0 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, math.max(0, p3.height - p3.scrollY))
		end)
	end
	local t_1 = {
		RoundedCorners = if not flagsModule.FoundationMediaRoundedCornerTags then if hasRadius then reactModule.createElement(imageModule, {
			tag = "radius-large",
			ZIndex = 1,
			Image = var10.media,
			imageStyle = var10.mediaStyle,
			backgroundStyle = var10.backgroundStyle,
			aspectRatio = var10.aspectRatio,
			Size = uDim2,
			testId = `{testId}--full-bleed--rounded-corners`
		}) else nil else nil,
		Image = reactModule.createElement(imageModule, {
			ZIndex = 0,
			Image = var10.media,
			imageStyle = var10.mediaStyle,
			backgroundStyle = var10.backgroundStyle,
			aspectRatio = var10.aspectRatio,
			tag = if flagsModule.FoundationMediaRoundedCornerTags then if hasRadius then "radius-top-large" else nil else nil,
			onAbsoluteSizeChanged = if not var10.sticky then var12 else nil,
			Size = uDim2
		}, if not flagsModule.FoundationMediaRoundedCornerTags then if hasRadius then {
			TransparencyGradient = reactModule.createElement(gradientModule, { top = false, fillDirection = Enum.FillDirection.Vertical })
		} else nil else nil),
		Content = if var10.children then reactModule.createElement(viewModule, {
			ZIndex = 2,
			aspectRatio = var10.aspectRatio,
			Size = uDim2
		}, var10.children) else nil
	}
	local createElement = reactModule.createElement
	createElement = createElement(viewModule, {
		ClipsDescendants = true,
		ZIndex = 2,
		Size = var14,
		aspectRatio = if var10.sticky then var10.aspectRatio else nil,
		LayoutOrder = if var10.sticky then constantsModule.MIN_LAYOUT_ORDER else nil,
		testId = `{testId}--full-bleed`,
		ref = p1
	}, if var10.sticky or not var10.aspectRatio then t_1 else reactModule.createElement(viewModule, {
		Size = UDim2.new(1, 0, 0, 9999),
		aspectRatio = var10.aspectRatio
	}, t_1))
	
	return if var10.sticky then createElement else reactModule.createElement("Folder", nil, createElement)
end))