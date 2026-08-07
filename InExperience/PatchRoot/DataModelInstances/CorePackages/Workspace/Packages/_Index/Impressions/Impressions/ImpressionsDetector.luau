local collectionService = game:GetService("CollectionService")
local parent = script:FindFirstAncestor("Impressions").Parent
local roactModule = require(parent.Roact)
local argCheckModule = require(parent.ArgCheck)
local tModule = require(parent.t)
local withNavigationFocus = require(parent.RoactNavigation).withNavigationFocus
local fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = require(parent.SharedFlags).FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions
local constantsModule = require(script.Parent.Constants)
local impressionDetectorWithoutNavigationModule = require(script.Parent.ImpressionDetectorWithoutNavigation)
local impressionsDetector = roactModule.PureComponent:extend("ImpressionsDetector")
impressionsDetector.validateProps = tModule.strictInterface({
	scanDebounceSeconds = tModule.optional(tModule.number),
	viewFillPercent = tModule.optional(tModule.number),
	parentRef = tModule.optional(tModule.table),
	impressionsTag = tModule.string,
	onRequestImpressionsSignal = tModule.table,
	viewPortBounds = tModule.strictInterface({ min = tModule.Vector2, max = tModule.Vector2 }),
	viewPortFillBounds = if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then tModule.optional(tModule.strictInterface({ min = tModule.Vector2, max = tModule.Vector2 })) else nil,
	filterImpressionFunc = tModule.optional(tModule.callback),
	onImpressionsDetected = tModule.union(tModule.callback, tModule.table),
	skipZeroSizes = tModule.optional(tModule.boolean),
	isFocused = tModule.boolean,
	navigation = tModule.table
})
impressionsDetector.defaultProps = { scanDebounceSeconds = 1, viewFillPercent = 0.25 }

function impressionsDetector.init(p0) --[[ line: 55 ]]
	p0.isMounted = false
	p0.lastImpressionTick = nil
	p0.nextImpressionTick = nil
end

function impressionsDetector._boundingBoxIntersectsView(p1, p2) --[[ line: 61 ]]
	-- upvalues: argCheckModule (ref)
	if not p2 then
		return false
	end
	local viewPortBounds = p1.props.viewPortBounds
	argCheckModule.assert(viewPortBounds ~= nil)
	
	if not viewPortBounds then
		return false
	end
	local absolutePosition = p2.AbsolutePosition
	local var7 = absolutePosition + p2.AbsoluteSize
	
	return (viewPortBounds.min.X < var7.X and absolutePosition.X < viewPortBounds.max.X) and (viewPortBounds.min.Y < var7.Y and absolutePosition.Y < viewPortBounds.max.Y)
end

function impressionsDetector._isInstanceVisible(p3, p4) --[[ line: 86 ]]
	-- upvalues: argCheckModule (ref), fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (ref)
	if not p3:_boundingBoxIntersectsView(p4) then
		return false
	end
	local viewPortBounds = p3.props.viewPortBounds
	argCheckModule.assert(viewPortBounds ~= nil)
	local _ = nil
	local var8 = if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then p3.props.viewPortFillBounds or viewPortBounds else viewPortBounds
	local var9 = var8.max - var8.min
	
	if var9.X <= 0 or var9.Y <= 0 then
		return false
	end
	local var10 = var9 * p3.props.viewFillPercent
	argCheckModule.assert(var10.X > 0 and var10.Y > 0)
	
	if var10.X <= 0 or var10.Y <= 0 then
		return false
	end
	local absolutePosition = p4.AbsolutePosition
	var9 = p4.AbsoluteSize
	
	if p3.props.skipZeroSizes and (var9.X == 0 or var9.Y == 0) then
		return false
	end
	local var11 = absolutePosition + var9 / 2
	local var12 = absolutePosition + var9
	local var13 = viewPortBounds.min.X < var11.X and var11.X < viewPortBounds.max.X
	local var14 = viewPortBounds.min.Y < var11.Y and var11.Y < viewPortBounds.max.Y
	
	if var13 and var14 then
		return true
	end
	local var15 = var12:Min(viewPortBounds.max) - absolutePosition:Max(viewPortBounds.min)
	local var16 = var10.X <= var15.X
	
	if var14 and var16 then
		return true
	end
	local var17 = var10.Y <= var15.Y
	
	return if var13 and var17 then true else var16 and var17
end

function impressionsDetector._calculateImpressions(p5) --[[ line: 159 ]]
	-- upvalues: collectionService (ref), constantsModule (ref), argCheckModule (ref)
	if not p5.isMounted then return end
	if not p5.props.isFocused then return end
	p5.lastImpressionTick = tick()
	
	if p5.props.parentRef ~= nil then
		local current = p5.props.parentRef.current
		
		if current == nil or not p5:_boundingBoxIntersectsView(current) then return end
	end
	local t = {}
	
	for i, v in ipairs(collectionService:GetTagged(p5.props.impressionsTag)) do
		local itemIndexAttribute = v:GetAttribute(constantsModule.ItemIndex)
		
		if itemIndexAttribute and v:IsA("GuiObject") and p5:_isInstanceVisible(v) and (p5.props.filterImpressionFunc == nil or p5.props.filterImpressionFunc(itemIndexAttribute)) then
			table.insert(t, itemIndexAttribute)
		end
	end
	if #t > 0 then
		argCheckModule.assert(p5.props.onImpressionsDetected ~= nil)
		p5.props.onImpressionsDetected(t)
	end
end

function impressionsDetector._requestImpressions(p6) --[[ line: 198 ]]
	-- upvalues: argCheckModule (ref)
	if not p6.isMounted then return end
	if not p6.props.isFocused then return end
	if p6.nextImpressionTick ~= nil then return end
	if not p6.props.impressionsTag then return end
	local var20 = 0
	
	if p6.lastImpressionTick ~= nil then
		p6.nextImpressionTick = p6.lastImpressionTick + p6.props.scanDebounceSeconds
		var20 = p6.nextImpressionTick - tick()
	end
	if var20 > 0 then
		task.delay(var20, function() --[[ line: 221 ]]
			-- upvalues: argCheckModule (copy), p6 (ref)
			argCheckModule.assert(p6.nextImpressionTick ~= nil and p6.nextImpressionTick < tick())
			p6.nextImpressionTick = nil
			p6:_calculateImpressions()
		end)
		
		return
	end
	p6.nextImpressionTick = nil
	p6:_calculateImpressions()
end

function impressionsDetector.render(_) --[[ line: 233 ]]
	return nil
end

function impressionsDetector.didMount(p7) --[[ line: 237 ]]
	p7.isMounted = true
	p7:_requestImpressions()
	
	if p7.props.onRequestImpressionsSignal then
		p7.onRequestImpressionsConnection = p7.props.onRequestImpressionsSignal:connect(function() --[[ line: 241 ]]
			-- upvalues: p7 (ref)
			p7:_requestImpressions()
		end)
	end
end

function impressionsDetector.willUnmount(p8) --[[ line: 247 ]]
	p8.isMounted = false
	
	if p8.onRequestImpressionsConnection ~= nil then
		p8.onRequestImpressionsConnection:disconnect()
		p8.onRequestImpressionsConnection = nil
	end
end

function impressionsDetector.didUpdate(p9, _, _) --[[ line: 255 ]]
	p9:_requestImpressions()
end

return withNavigationFocus(impressionDetectorWithoutNavigationModule)