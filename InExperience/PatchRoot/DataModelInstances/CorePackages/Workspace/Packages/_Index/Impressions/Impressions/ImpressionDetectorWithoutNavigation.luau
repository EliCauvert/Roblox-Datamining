local collectionService = game:GetService("CollectionService")
local parent = script:FindFirstAncestor("Impressions").Parent
local roactModule = require(parent.Roact)
local argCheckModule = require(parent.ArgCheck)
local tModule = require(parent.t)
local fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = require(parent.SharedFlags).FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions
local constantsModule = require(script.Parent.Constants)
local impressionsDetectorWithoutNavigation = roactModule.PureComponent:extend("ImpressionsDetectorWithoutNavigation")
impressionsDetectorWithoutNavigation.validateProps = tModule.strictInterface({
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
	isFocused = tModule.optional(tModule.boolean),
	navigation = tModule.optional(tModule.table)
})
impressionsDetectorWithoutNavigation.defaultProps = { scanDebounceSeconds = 1, viewFillPercent = 0.25 }

function impressionsDetectorWithoutNavigation.init(p0)
	p0.isMounted = false
	p0.lastImpressionTick = nil
	p0.nextImpressionTick = nil
end

function impressionsDetectorWithoutNavigation._boundingBoxIntersectsView(p1, p2)
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
	local var6 = absolutePosition + p2.AbsoluteSize
	
	return (viewPortBounds.min.X < var6.X and absolutePosition.X < viewPortBounds.max.X) and (viewPortBounds.min.Y < var6.Y and absolutePosition.Y < viewPortBounds.max.Y)
end

function impressionsDetectorWithoutNavigation._isInstanceVisible(p3, p4)
	-- upvalues: argCheckModule (ref), fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (ref)
	if not p3:_boundingBoxIntersectsView(p4) then
		return false
	end
	local viewPortBounds = p3.props.viewPortBounds
	argCheckModule.assert(viewPortBounds ~= nil)
	local _ = nil
	local var7 = if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then p3.props.viewPortFillBounds or viewPortBounds else viewPortBounds
	local var8 = var7.max - var7.min
	
	if var8.X <= 0 or var8.Y <= 0 then
		return false
	end
	local var9 = var8 * p3.props.viewFillPercent
	argCheckModule.assert(var9.X > 0 and var9.Y > 0)
	
	if var9.X <= 0 or var9.Y <= 0 then
		return false
	end
	local absolutePosition = p4.AbsolutePosition
	var8 = p4.AbsoluteSize
	
	if p3.props.skipZeroSizes and (var8.X == 0 or var8.Y == 0) then
		return false
	end
	local var10 = absolutePosition + var8 / 2
	local var11 = absolutePosition + var8
	local var12 = viewPortBounds.min.X < var10.X and var10.X < viewPortBounds.max.X
	local var13 = viewPortBounds.min.Y < var10.Y and var10.Y < viewPortBounds.max.Y
	
	if var12 and var13 then
		return true
	end
	local var14 = var11:Min(viewPortBounds.max) - absolutePosition:Max(viewPortBounds.min)
	local var15 = var9.X <= var14.X
	
	if var13 and var15 then
		return true
	end
	local var16 = var9.Y <= var14.Y
	
	return if var12 and var16 then true else var15 and var16
end

function impressionsDetectorWithoutNavigation._calculateImpressions(p5)
	-- upvalues: collectionService (ref), constantsModule (ref), argCheckModule (ref)
	if not p5.isMounted then return end
	if p5.props.isFocused == false then return end
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

function impressionsDetectorWithoutNavigation._requestImpressions(p6)
	-- upvalues: argCheckModule (ref)
	if not p6.isMounted then return end
	if p6.props.isFocused == false then return end
	if p6.nextImpressionTick ~= nil then return end
	if not p6.props.impressionsTag then return end
	local var19 = 0
	
	if p6.lastImpressionTick ~= nil then
		p6.nextImpressionTick = p6.lastImpressionTick + p6.props.scanDebounceSeconds
		var19 = p6.nextImpressionTick - tick()
	end
	if var19 > 0 then
		task.delay(var19, function()
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

function impressionsDetectorWithoutNavigation.render(_)
	return nil
end

function impressionsDetectorWithoutNavigation.didMount(p7)
	p7.isMounted = true
	p7:_requestImpressions()
	
	if p7.props.onRequestImpressionsSignal then
		p7.onRequestImpressionsConnection = p7.props.onRequestImpressionsSignal:connect(function()
			-- upvalues: p7 (ref)
			p7:_requestImpressions()
		end)
	end
end

function impressionsDetectorWithoutNavigation.willUnmount(p8)
	p8.isMounted = false
	
	if p8.onRequestImpressionsConnection ~= nil then
		p8.onRequestImpressionsConnection:disconnect()
		p8.onRequestImpressionsConnection = nil
	end
end

function impressionsDetectorWithoutNavigation.didUpdate(p9, _, _)
	p9:_requestImpressions()
end

return impressionsDetectorWithoutNavigation