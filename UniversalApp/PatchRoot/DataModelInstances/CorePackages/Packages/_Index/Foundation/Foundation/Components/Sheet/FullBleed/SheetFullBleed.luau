local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local gradientModule = require(foundation.Components.Gradient)
local imageModule = require(foundation.Components.Image)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local sheetContextModule = require(script:FindFirstAncestor("Sheet").SheetContext)
local t = { sticky = false, height = UDim.new(1, 0) }

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 36 | named "SheetFullBleed" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), sheetContextModule (ref), imageModule (ref), gradientModule (ref), viewModule (ref), constantsModule (ref)
	local var9 = withDefaultsModule(p0, t)
	local var10 = reactModule.useContext(sheetContextModule)
	local setFullBleedHeight = var10.setFullBleedHeight
	local fullBleedHeight = var10.fullBleedHeight
	local innerScrollY = var10.innerScrollY
	local hasHeader = var10.hasHeader
	local hasRadius = var10.hasRadius
	local testId = var10.testId
	assert(setFullBleedHeight and (hasHeader and testId), "SheetFullBleed must be used within a Sheet")
	reactModule.useEffect(function() --[[ line: 48 ]]
		-- upvalues: var9 (ref), hasHeader (ref)
		assert(not (var9.sticky and hasHeader:getValue()), "Sheet.FullBleed with sticky=true is unsupported when used with Sheet.Header")
	end, { var9.sticky, hasHeader })
	local var11 = reactModule.useCallback(function(p2) --[[ line: 55 ]]
		-- upvalues: setFullBleedHeight (ref)
		setFullBleedHeight(p2.AbsoluteSize.Y)
	end, {})
	reactModule.useEffect(function() --[[ line: 59 ]]
		-- upvalues: setFullBleedHeight (ref)
		return function() --[[ line: 60 ]]
			-- upvalues: setFullBleedHeight (copy)
			setFullBleedHeight(0)
		end
	end, {})
	local uDim2 = UDim2.new(1, 0, var9.height.Scale, var9.height.Offset)
	local var13 = nil
	
	if var9.sticky then
		var13 = uDim2
	elseif innerScrollY and fullBleedHeight then
		var13 = reactModule.joinBindings({ scrollY = innerScrollY, height = fullBleedHeight }):map(function(p3) --[[ line: 76 ]]
			return if p3.height == 0 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, math.max(0, p3.height - p3.scrollY))
		end)
	end
	local t_1 = {
		RoundedCorners = if hasRadius then reactModule.createElement(imageModule, {
			tag = "radius-large",
			ZIndex = 1,
			Image = var9.media,
			imageStyle = var9.mediaStyle,
			backgroundStyle = var9.backgroundStyle,
			aspectRatio = var9.aspectRatio,
			Size = uDim2,
			testId = `{testId}--full-bleed--rounded-corners`
		}) else nil,
		Image = reactModule.createElement(imageModule, {
			ZIndex = 0,
			Image = var9.media,
			imageStyle = var9.mediaStyle,
			backgroundStyle = var9.backgroundStyle,
			aspectRatio = var9.aspectRatio,
			onAbsoluteSizeChanged = if not var9.sticky then var11 else nil,
			Size = uDim2
		}, if hasRadius then {
			TransparencyGradient = reactModule.createElement(gradientModule, { top = false, fillDirection = Enum.FillDirection.Vertical })
		} else nil),
		Content = if var9.children then reactModule.createElement(viewModule, { ZIndex = 2, aspectRatio = var9.aspectRatio, Size = uDim2 }, var9.children) else nil
	}
	local createElement = reactModule.createElement
	createElement = createElement(viewModule, {
		ClipsDescendants = true,
		ZIndex = 2,
		Size = var13,
		aspectRatio = if var9.sticky then var9.aspectRatio else nil,
		LayoutOrder = if var9.sticky then constantsModule.MIN_LAYOUT_ORDER else nil,
		testId = `{testId}--full-bleed`,
		ref = p1
	}, if var9.sticky or not var9.aspectRatio then t_1 else reactModule.createElement(viewModule, {
		Size = UDim2.new(1, 0, 0, 9999),
		aspectRatio = var9.aspectRatio
	}, t_1))
	
	return if var9.sticky then createElement else reactModule.createElement("Folder", nil, createElement)
end))