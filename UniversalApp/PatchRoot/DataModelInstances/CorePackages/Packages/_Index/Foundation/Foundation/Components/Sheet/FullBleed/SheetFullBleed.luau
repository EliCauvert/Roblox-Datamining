local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local imageModule = require(foundation.Components.Image)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local sheetContextModule = require(script:FindFirstAncestor("Sheet").SheetContext)
local t = { sticky = false, height = UDim.new(1, 0) }

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), sheetContextModule (ref), imageModule (ref), viewModule (ref), constantsModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = reactModule.useContext(sheetContextModule)
	local setFullBleedHeight = var2.setFullBleedHeight
	local fullBleedHeight = var2.fullBleedHeight
	local innerScrollY = var2.innerScrollY
	local hasHeader = var2.hasHeader
	local hasRadius = var2.hasRadius
	local testId = var2.testId
	assert(setFullBleedHeight and (hasHeader and testId), "SheetFullBleed must be used within a Sheet")
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), hasHeader (ref)
		assert(not (var1.sticky and hasHeader:getValue()), "Sheet.FullBleed with sticky=true is unsupported when used with Sheet.Header")
	end, { var1.sticky, hasHeader })
	local var3 = reactModule.useCallback(function(p1)
		-- upvalues: setFullBleedHeight (ref)
		setFullBleedHeight(p1.AbsoluteSize.Y)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: setFullBleedHeight (ref)
		return function()
			-- upvalues: setFullBleedHeight (copy)
			setFullBleedHeight(0)
		end
	end, {})
	local uDim2 = UDim2.new(1, 0, var1.height.Scale, var1.height.Offset)
	local var4 = nil
	
	if var1.sticky then
		var4 = uDim2
	elseif innerScrollY and fullBleedHeight then
		var4 = reactModule.joinBindings({ scrollY = innerScrollY, height = fullBleedHeight }):map(function(p1)
			return if p1.height == 0 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, math.max(0, p1.height - p1.scrollY))
		end)
	end
	local t_1 = {
		Image = reactModule.createElement(imageModule, {
			ZIndex = 0,
			Image = var1.media,
			imageStyle = var1.mediaStyle,
			backgroundStyle = var1.backgroundStyle,
			aspectRatio = var1.aspectRatio,
			tag = if hasRadius then "radius-top-large" else nil,
			onAbsoluteSizeChanged = if not var1.sticky then var3 else nil,
			Size = uDim2
		}),
		Content = if var1.children then reactModule.createElement(viewModule, { ZIndex = 2, aspectRatio = var1.aspectRatio, Size = uDim2 }, var1.children) else nil
	}
	local createElement = reactModule.createElement
	createElement = createElement(viewModule, {
		ClipsDescendants = true,
		ZIndex = 2,
		Size = var4,
		aspectRatio = if var1.sticky then var1.aspectRatio else nil,
		LayoutOrder = if var1.sticky then constantsModule.MIN_LAYOUT_ORDER else nil,
		testId = `{testId}--full-bleed`,
		ref = p2
	}, if var1.sticky or not var1.aspectRatio then t_1 else reactModule.createElement(viewModule, {
		Size = UDim2.new(1, 0, 0, 9999),
		aspectRatio = var1.aspectRatio
	}, t_1))
	
	return if var1.sticky then createElement else reactModule.createElement("Folder", nil, createElement)
end))