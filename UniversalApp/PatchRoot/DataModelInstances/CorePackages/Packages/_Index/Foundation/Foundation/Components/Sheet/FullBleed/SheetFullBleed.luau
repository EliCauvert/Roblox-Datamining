local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local imageModule = require(foundation.Components.Image)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local sheetContextModule = require(script:FindFirstAncestor("Sheet").SheetContext)
local t = { sticky = false, height = UDim.new(1, 0) }

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), sheetContextModule (ref), imageModule (ref), viewModule (ref), constantsModule (ref)
	local var8 = withDefaultsModule(p0, t)
	local var9 = reactModule.useContext(sheetContextModule)
	local setFullBleedHeight = var9.setFullBleedHeight
	local fullBleedHeight = var9.fullBleedHeight
	local innerScrollY = var9.innerScrollY
	local hasHeader = var9.hasHeader
	local hasRadius = var9.hasRadius
	local testId = var9.testId
	assert(setFullBleedHeight and (hasHeader and testId), "SheetFullBleed must be used within a Sheet")
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), hasHeader (ref)
		assert(not (var8.sticky and hasHeader:getValue()), "Sheet.FullBleed with sticky=true is unsupported when used with Sheet.Header")
	end, { var8.sticky, hasHeader })
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: setFullBleedHeight (ref)
		setFullBleedHeight(p2.AbsoluteSize.Y)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: setFullBleedHeight (ref)
		return function()
			-- upvalues: setFullBleedHeight (copy)
			setFullBleedHeight(0)
		end
	end, {})
	local uDim2 = UDim2.new(1, 0, var8.height.Scale, var8.height.Offset)
	local var12 = nil
	
	if var8.sticky then
		var12 = uDim2
	elseif innerScrollY and fullBleedHeight then
		var12 = reactModule.joinBindings({ scrollY = innerScrollY, height = fullBleedHeight }):map(function(p3)
			return if p3.height == 0 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, math.max(0, p3.height - p3.scrollY))
		end)
	end
	local t_1 = {
		Image = reactModule.createElement(imageModule, {
			ZIndex = 0,
			Image = var8.media,
			imageStyle = var8.mediaStyle,
			backgroundStyle = var8.backgroundStyle,
			aspectRatio = var8.aspectRatio,
			tag = if hasRadius then "radius-top-large" else nil,
			onAbsoluteSizeChanged = if not var8.sticky then var10 else nil,
			Size = uDim2
		}),
		Content = if var8.children then reactModule.createElement(viewModule, { ZIndex = 2, aspectRatio = var8.aspectRatio, Size = uDim2 }, var8.children) else nil
	}
	local createElement = reactModule.createElement
	createElement = createElement(viewModule, {
		ClipsDescendants = true,
		ZIndex = 2,
		Size = var12,
		aspectRatio = if var8.sticky then var8.aspectRatio else nil,
		LayoutOrder = if var8.sticky then constantsModule.MIN_LAYOUT_ORDER else nil,
		testId = `{testId}--full-bleed`,
		ref = p1
	}, if var8.sticky or not var8.aspectRatio then t_1 else reactModule.createElement(viewModule, {
		Size = UDim2.new(1, 0, 0, 9999),
		aspectRatio = var8.aspectRatio
	}, t_1))
	
	return if var8.sticky then createElement else reactModule.createElement("Folder", nil, createElement)
end))