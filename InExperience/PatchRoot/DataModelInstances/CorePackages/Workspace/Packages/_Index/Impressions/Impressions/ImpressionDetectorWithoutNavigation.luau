local CollectionService = game:GetService("CollectionService")
local Parent = script:FindFirstAncestor("Impressions").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local TModule = require(Parent.t)
local FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = require(Parent.SharedFlags).FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions
local ConstantsModule = require(script.Parent.Constants)
local ImpressionsDetectorWithoutNavigation = require(Parent.Roact).PureComponent:extend("ImpressionsDetectorWithoutNavigation")
ImpressionsDetectorWithoutNavigation.validateProps = TModule.strictInterface({
	scanDebounceSeconds = TModule.optional(TModule.number),
	viewFillPercent = TModule.optional(TModule.number),
	parentRef = TModule.optional(TModule.table),
	impressionsTag = TModule.string,
	onRequestImpressionsSignal = TModule.table,
	viewPortBounds = TModule.strictInterface({ min = TModule.Vector2, max = TModule.Vector2 }),
	viewPortFillBounds = if FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then TModule.optional(TModule.strictInterface({ min = TModule.Vector2, max = TModule.Vector2 })) else nil,
	filterImpressionFunc = TModule.optional(TModule.callback),
	onImpressionsDetected = TModule.union(TModule.callback, TModule.table),
	skipZeroSizes = TModule.optional(TModule.boolean),
	isFocused = TModule.optional(TModule.boolean),
	navigation = TModule.optional(TModule.table)
})
ImpressionsDetectorWithoutNavigation.defaultProps = { scanDebounceSeconds = 1, viewFillPercent = 0.25 }

function ImpressionsDetectorWithoutNavigation.init(p1) --[[ Line: 53 ]]
	p1.isMounted = false
	p1.lastImpressionTick = nil
	p1.nextImpressionTick = nil
end

function ImpressionsDetectorWithoutNavigation._boundingBoxIntersectsView(p1, Frame: Frame): boolean --[[ Line: 59 ]]
	-- upvalues: ArgCheckModule (copy)
	if not Frame then
		return false
	end
	local ViewPortBounds = p1.props.viewPortBounds
	ArgCheckModule.assert(ViewPortBounds ~= nil)
	
	if ViewPortBounds then
		local AbsolutePosition = Frame.AbsolutePosition
		local NewAbsolutePosition = AbsolutePosition + Frame.AbsoluteSize
		local IsXBelow: boolean = ViewPortBounds.min.X < NewAbsolutePosition.X and AbsolutePosition.X < ViewPortBounds.max.X
		local IsYBelow: boolean = ViewPortBounds.min.Y < NewAbsolutePosition.Y and AbsolutePosition.Y < ViewPortBounds.max.Y
		
		return if IsXBelow and IsYBelow then true else false
	else
		return false
	end
end

function ImpressionsDetectorWithoutNavigation._isInstanceVisible(p1, Frame: Frame): boolean --[[ Line: 84 ]]
	-- upvalues: ArgCheckModule (copy), FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (copy)
	if not p1:_boundingBoxIntersectsView(Frame) then
		return false
	end
	local ViewPortBounds = p1.props.viewPortBounds
	ArgCheckModule.assert(ViewPortBounds ~= nil)
	local ViewPortFillBounds = FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions and p1.props.viewPortFillBounds or ViewPortBounds
	local MaxDelta = ViewPortFillBounds.max - ViewPortFillBounds.min
	
	if MaxDelta.X <= 0 or MaxDelta.Y <= 0 then
		return false
	end
	local ScaledMaxDelta = MaxDelta * p1.props.viewFillPercent
	ArgCheckModule.assert(ScaledMaxDelta.X > 0 and ScaledMaxDelta.Y > 0)
	
	if ScaledMaxDelta.X <= 0 or ScaledMaxDelta.Y <= 0 then
		return false
	end
	local AbsolutePosition: number = Frame.AbsolutePosition
	local AbsoluteSize: number = Frame.AbsoluteSize
	
	if p1.props.skipZeroSizes and (AbsoluteSize.X == 0 or AbsoluteSize.Y == 0) then
		return false
	end
	local NewAbsolutePosition = AbsolutePosition + AbsoluteSize / 2
	local NewAbsolutePosition1 = AbsolutePosition + AbsoluteSize
	local IsXBelow: boolean = ViewPortBounds.min.X < NewAbsolutePosition.X and NewAbsolutePosition.X < ViewPortBounds.max.X
	local IsYBelow: boolean = ViewPortBounds.min.Y < NewAbsolutePosition.Y and NewAbsolutePosition.Y < ViewPortBounds.max.Y
	
	if IsXBelow and IsYBelow then
		return true
	end
	local MinResultDelta = NewAbsolutePosition1:Min(ViewPortBounds.max) - AbsolutePosition:Max(ViewPortBounds.min)
	local IsXAbove = MinResultDelta.X >= ScaledMaxDelta.X
	
	if IsYBelow and IsXAbove then
		return true
	else
		local IsYAbove = MinResultDelta.Y >= ScaledMaxDelta.Y
		
		return if IsXBelow and IsYAbove then true elseif IsXAbove and IsYAbove then true else false
	end
end

function ImpressionsDetectorWithoutNavigation._calculateImpressions(p1) --[[ Line: 157 ]]
	-- upvalues: CollectionService (copy), ConstantsModule (copy), ArgCheckModule (copy)
	if not p1.isMounted then return end
	if p1.props.isFocused == false then return end
	p1.lastImpressionTick = tick()
	
	if p1.props.parentRef ~= nil then
		local Current = p1.props.parentRef.current
		
		if Current == nil or not p1:_boundingBoxIntersectsView(Current) then return end
	end
	local List = {}
	
	for _, Gui in ipairs((CollectionService:GetTagged(p1.props.impressionsTag))) do
		local Attribute = Gui:GetAttribute(ConstantsModule.ItemIndex)
		
		if Attribute and Gui:IsA("GuiObject") and p1:_isInstanceVisible(Gui) and (p1.props.filterImpressionFunc == nil or p1.props.filterImpressionFunc(Attribute)) then
			table.insert(List, Attribute)
		end
	end
	if #List > 0 then
		ArgCheckModule.assert(p1.props.onImpressionsDetected ~= nil)
		p1.props.onImpressionsDetected(List)
	end
end

function ImpressionsDetectorWithoutNavigation._requestImpressions(p2) --[[ Line: 195 ]]
	-- upvalues: ArgCheckModule (copy)
	if not p2.isMounted then return end
	if p2.props.isFocused == false then return end
	if p2.nextImpressionTick ~= nil then return end
	if not p2.props.impressionsTag then return end
	local Delay = 0
	
	if p2.lastImpressionTick ~= nil then
		p2.nextImpressionTick = p2.lastImpressionTick + p2.props.scanDebounceSeconds
		Delay = p2.nextImpressionTick - tick()
	end
	if Delay > 0 then
		task.delay(Delay, function() --[[ Line: 217 ]]
			-- upvalues: ArgCheckModule (upval), p2 (copy)
			ArgCheckModule.assert(p2.nextImpressionTick ~= nil and p2.nextImpressionTick < tick())
			p2.nextImpressionTick = nil
			p2:_calculateImpressions()
		end)
		
		return
	else
		p2.nextImpressionTick = nil
		p2:_calculateImpressions()
	end
end

function ImpressionsDetectorWithoutNavigation:render() --[[ Line: 229 ]]
	return nil
end

function ImpressionsDetectorWithoutNavigation.didMount(p2) --[[ Line: 233 ]]
	p2.isMounted = true
	p2:_requestImpressions()
	
	if p2.props.onRequestImpressionsSignal then
		p2.onRequestImpressionsConnection = p2.props.onRequestImpressionsSignal:connect(function() --[[ Line: 237 ]]
			-- upvalues: p2 (copy)
			p2:_requestImpressions()
		end)
	end
end

function ImpressionsDetectorWithoutNavigation.willUnmount(p2) --[[ Line: 243 ]]
	p2.isMounted = false
	
	if p2.onRequestImpressionsConnection ~= nil then
		p2.onRequestImpressionsConnection:disconnect()
		p2.onRequestImpressionsConnection = nil
	end
end

function ImpressionsDetectorWithoutNavigation.didUpdate(p2, _, _) --[[ Line: 251 ]]
	p2:_requestImpressions()
end

return ImpressionsDetectorWithoutNavigation