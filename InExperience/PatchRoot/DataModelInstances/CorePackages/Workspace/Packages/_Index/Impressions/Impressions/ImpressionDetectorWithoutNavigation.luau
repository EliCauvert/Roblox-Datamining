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

function impressionsDetectorWithoutNavigation.init(p1)
	p1.isMounted = false
	p1.lastImpressionTick = nil
	p1.nextImpressionTick = nil
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
	local var1 = absolutePosition + p2.AbsoluteSize
	
	return (viewPortBounds.min.X < var1.X and absolutePosition.X < viewPortBounds.max.X) and (viewPortBounds.min.Y < var1.Y and absolutePosition.Y < viewPortBounds.max.Y)
end

function impressionsDetectorWithoutNavigation._isInstanceVisible(p1, p2)
	-- upvalues: argCheckModule (ref), fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (ref)
	if not p1:_boundingBoxIntersectsView(p2) then
		return false
	end
	local viewPortBounds = p1.props.viewPortBounds
	argCheckModule.assert(viewPortBounds ~= nil)
	local _ = nil
	local var1 = if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then p1.props.viewPortFillBounds or viewPortBounds else viewPortBounds
	local var2 = var1.max - var1.min
	
	if var2.X <= 0 or var2.Y <= 0 then
		return false
	end
	local var3 = var2 * p1.props.viewFillPercent
	argCheckModule.assert(var3.X > 0 and var3.Y > 0)
	
	if var3.X <= 0 or var3.Y <= 0 then
		return false
	end
	local absolutePosition = p2.AbsolutePosition
	var2 = p2.AbsoluteSize
	
	if p1.props.skipZeroSizes and (var2.X == 0 or var2.Y == 0) then
		return false
	end
	local var4 = absolutePosition + var2 / 2
	local var5 = absolutePosition + var2
	local var6 = viewPortBounds.min.X < var4.X and var4.X < viewPortBounds.max.X
	local var7 = viewPortBounds.min.Y < var4.Y and var4.Y < viewPortBounds.max.Y
	
	if var6 and var7 then
		return true
	end
	local var8 = var5:Min(viewPortBounds.max) - absolutePosition:Max(viewPortBounds.min)
	local var9 = var3.X <= var8.X
	
	if var7 and var9 then
		return true
	end
	local var10 = var3.Y <= var8.Y
	
	return if var6 and var10 then true else var9 and var10
end

function impressionsDetectorWithoutNavigation._calculateImpressions(p1)
	-- upvalues: collectionService (ref), constantsModule (ref), argCheckModule (ref)
	if not p1.isMounted then return end
	if p1.props.isFocused == false then return end
	p1.lastImpressionTick = tick()
	
	if p1.props.parentRef ~= nil then
		local current = p1.props.parentRef.current
		
		if current == nil or not p1:_boundingBoxIntersectsView(current) then return end
	end
	local t = {}
	
	for i, v in ipairs(collectionService:GetTagged(p1.props.impressionsTag)) do
		local itemIndexAttribute = v:GetAttribute(constantsModule.ItemIndex)
		
		if itemIndexAttribute and v:IsA("GuiObject") and p1:_isInstanceVisible(v) and (p1.props.filterImpressionFunc == nil or p1.props.filterImpressionFunc(itemIndexAttribute)) then
			table.insert(t, itemIndexAttribute)
		end
	end
	if #t > 0 then
		argCheckModule.assert(p1.props.onImpressionsDetected ~= nil)
		p1.props.onImpressionsDetected(t)
	end
end

function impressionsDetectorWithoutNavigation._requestImpressions(p2)
	-- upvalues: argCheckModule (ref)
	if not p2.isMounted then return end
	if p2.props.isFocused == false then return end
	if p2.nextImpressionTick ~= nil then return end
	if not p2.props.impressionsTag then return end
	local var1 = 0
	
	if p2.lastImpressionTick ~= nil then
		p2.nextImpressionTick = p2.lastImpressionTick + p2.props.scanDebounceSeconds
		var1 = p2.nextImpressionTick - tick()
	end
	if var1 > 0 then
		task.delay(var1, function()
			-- upvalues: argCheckModule (copy), p2 (ref)
			argCheckModule.assert(p2.nextImpressionTick ~= nil and p2.nextImpressionTick < tick())
			p2.nextImpressionTick = nil
			p2:_calculateImpressions()
		end)
		
		return
	end
	p2.nextImpressionTick = nil
	p2:_calculateImpressions()
end

function impressionsDetectorWithoutNavigation.render(_)
	return nil
end

function impressionsDetectorWithoutNavigation.didMount(p2)
	p2.isMounted = true
	p2:_requestImpressions()
	
	if p2.props.onRequestImpressionsSignal then
		p2.onRequestImpressionsConnection = p2.props.onRequestImpressionsSignal:connect(function()
			-- upvalues: p2 (ref)
			p2:_requestImpressions()
		end)
	end
end

function impressionsDetectorWithoutNavigation.willUnmount(p2)
	p2.isMounted = false
	
	if p2.onRequestImpressionsConnection ~= nil then
		p2.onRequestImpressionsConnection:disconnect()
		p2.onRequestImpressionsConnection = nil
	end
end

function impressionsDetectorWithoutNavigation.didUpdate(p2, _, _)
	p2:_requestImpressions()
end

return impressionsDetectorWithoutNavigation