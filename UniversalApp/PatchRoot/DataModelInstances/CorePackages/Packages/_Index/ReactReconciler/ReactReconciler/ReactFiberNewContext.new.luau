local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local number = luauPolyfillModule.Number
local error = luauPolyfillModule.Error
local console = require(parent.Shared).console
local _ = require(parent.Shared)
local _ = require(script.Parent.ReactInternalTypes)
local unknownModule = require(script.Parent["ReactFiberStack.new"])
local reactFiberLaneModule = require(script.Parent.ReactFiberLane)
local unknownModule_1 = require(script.Parent["ReactUpdateQueue.new"])
local isPrimaryRenderer = require(script.Parent.ReactFiberHostConfig).isPrimaryRenderer
local createCursor = unknownModule.createCursor
local push = unknownModule.push
local pop = unknownModule.pop
local MAX_SIGNED_31_BIT_INT = require(script.Parent.MaxInts).MAX_SIGNED_31_BIT_INT
local reactWorkTagsModule = require(script.Parent.ReactWorkTags)
local contextProvider = reactWorkTagsModule.ContextProvider
local classComponent = reactWorkTagsModule.ClassComponent
local noLanes = reactFiberLaneModule.NoLanes
local noTimestamp = reactFiberLaneModule.NoTimestamp
local isSubsetOfLanes = reactFiberLaneModule.isSubsetOfLanes
local includesSomeLane = reactFiberLaneModule.includesSomeLane
local mergeLanes = reactFiberLaneModule.mergeLanes
local pickArbitraryLane = reactFiberLaneModule.pickArbitraryLane
local objectIs = require(parent.Shared).objectIs
local createUpdate = unknownModule_1.createUpdate
local forceUpdate = unknownModule_1.ForceUpdate
local t = {}
local var7 = createCursor(nil)
local var8 = if reactGlobalsModule.__DEV__ then {} else nil
local var9 = nil
local var10 = nil
local var11 = nil
local var12 = false

function t.resetContextDependencies() --[[ line: 74 ]]
	-- upvalues: var9 (write), var10 (write), var11 (write), reactGlobalsModule (ref), var12 (write)
	var9 = nil
	var10 = nil
	var11 = nil
	
	if reactGlobalsModule.__DEV__ then
		var12 = false
	end
end

function t.enterDisallowedContextReadInDEV() --[[ line: 85 ]]
	-- upvalues: reactGlobalsModule (ref), var12 (write)
	if reactGlobalsModule.__DEV__ then
		var12 = true
	end
end

function t.exitDisallowedContextReadInDEV() --[[ line: 91 ]]
	-- upvalues: reactGlobalsModule (ref), var12 (write)
	if reactGlobalsModule.__DEV__ then
		var12 = false
	end
end

function t.pushProvider(p0, p1) --[[ line: 97 ]]
	-- upvalues: isPrimaryRenderer (ref), push (ref), var7 (ref), reactGlobalsModule (ref), var8 (write), console (ref)
	local context = p0.type._context
	
	if isPrimaryRenderer then
		push(var7, context._currentValue, p0)
		context._currentValue = p1
		
		if not reactGlobalsModule.__DEV__ then return end
		if context._currentRenderer ~= nil and context._currentRenderer ~= var8 then
			console.error("Detected multiple renderers concurrently rendering the same context provider. This is currently unsupported.")
		end
		context._currentRenderer = var8
		
		return
	else
		push(var7, context._currentValue2, p0)
		context._currentValue2 = p1
		
		if reactGlobalsModule.__DEV__ then
			if context._currentRenderer2 ~= nil and context._currentRenderer2 ~= var8 then
				console.error("Detected multiple renderers concurrently rendering the same context provider. This is currently unsupported.")
			end
			context._currentRenderer2 = var8
		end
	end
end

function t.popProvider(p2) --[[ line: 135 ]]
	-- upvalues: var7 (ref), pop (ref), isPrimaryRenderer (ref)
	local current = var7.current
	pop(var7, p2)
	local context = p2.type._context
	
	if isPrimaryRenderer then
		context._currentValue = current
		
		return
	end
	context._currentValue2 = current
end

function t.calculateChangedBits(p3, p4, p5) --[[ line: 148 ]]
	-- upvalues: objectIs (ref), MAX_SIGNED_31_BIT_INT (ref)
	return if objectIs(p5, p4) then 0 else math.floor(if typeof(p3._calculateChangedBits) == "function" then p3._calculateChangedBits(p5, p4) else MAX_SIGNED_31_BIT_INT)
end

function t.scheduleWorkOnParentPath(p6, p7) --[[ line: 179 ]]
	-- upvalues: isSubsetOfLanes (ref), mergeLanes (ref)
	local alternate
	local var13 = p6
	while var13 ~= nil do
		alternate = var13.alternate
		
		if not isSubsetOfLanes(var13.childLanes, p7) then
			var13.childLanes = mergeLanes(var13.childLanes, p7)
			
			if alternate ~= nil then
				alternate.childLanes = mergeLanes(alternate.childLanes, p7)
			end
			var13 = var13.return_
		elseif alternate == nil or isSubsetOfLanes(alternate.childLanes, p7) then
			break
		end
		alternate.childLanes = mergeLanes(alternate.childLanes, p7)
	end
end

function t.propagateContextChange(p8, p9, p10, p11) --[[ line: 202 ]]
	-- upvalues: classComponent (ref), createUpdate (ref), noTimestamp (ref), pickArbitraryLane (ref), forceUpdate (ref), t (ref), contextProvider (ref)
	local dependencies, child_1, firstContext
	local child = p8.child
	
	if child ~= nil then
		child.return_ = p8
	end
	while child ~= nil do
		local _ = nil
		dependencies = child.dependencies
		
		if dependencies == nil then
			child_1 = if child.tag == contextProvider then if child.type == p8.type then nil else child.child else child.child
		else
			child_1 = child.child
			firstContext = dependencies.firstContext
			while firstContext ~= nil do
				if firstContext.context ~= p9 or bit32.band(firstContext.observedBits, p10) == 0 then
					firstContext = firstContext.next
					continue
				end
				if child.tag == classComponent then
					local var14 = createUpdate(noTimestamp, pickArbitraryLane(p11))
					var14.tag = forceUpdate
					local updateQueue = child.updateQueue
					
					if updateQueue ~= nil then
						local shared = updateQueue.shared
						local pending = shared.pending
						
						if pending == nil then
							var14.next = var14
						else
							var14.next = pending.next
							pending.next = var14
						end
						shared.pending = var14
					end
				end
				child.lanes = bit32.bor(child.lanes, p11)
				local alternate = child.alternate
				
				if alternate ~= nil then
					alternate.lanes = bit32.bor(alternate.lanes, p11)
				end
				t.scheduleWorkOnParentPath(child.return_, p11)
				dependencies.lanes = bit32.bor(dependencies.lanes, p11)
				break
			end
		end
		if child_1 == nil then
			child_1 = child
			while child_1 ~= nil do
				if child_1 == p8 then
					child_1 = nil
					break
				end
				firstContext = child_1.sibling
				
				if firstContext == nil then
					child_1 = child_1.return_
					continue
				end
				firstContext.return_ = child_1.return_
				child_1 = firstContext
				break
			end
		else
			child_1.return_ = child
		end
		child = child_1
	end
end

function t.prepareToReadContext(p12, p13, p14) --[[ line: 341 ]]
	-- upvalues: var9 (write), var10 (write), var11 (write), includesSomeLane (ref)
	var9 = p12
	var10 = nil
	var11 = nil
	local dependencies = p12.dependencies
	
	if dependencies ~= nil and dependencies.firstContext ~= nil then
		if includesSomeLane(dependencies.lanes, p13) then
			p14()
		end
		dependencies.firstContext = nil
	end
end

function t.readContext(p15, p16) --[[ line: 364 ]]
	-- upvalues: reactGlobalsModule (ref), var12 (write), console (ref), var11 (write), number (ref), var10 (write), var9 (write), error (ref), noLanes (ref), isPrimaryRenderer (ref)
	if reactGlobalsModule.__DEV__ and var12 then
		console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
	end
	if var11 ~= p15 and p16 ~= false and p16 ~= 0 then
		local MAX_SAFE_INTEGER
		local _ = nil
		
		if typeof(p16) == "number" and p16 ~= number.MAX_SAFE_INTEGER then
			MAX_SAFE_INTEGER = p16
		else
			var11 = p15
			MAX_SAFE_INTEGER = number.MAX_SAFE_INTEGER
		end
		local t = {
			next = nil,
			context = p15,
			observedBits = MAX_SAFE_INTEGER
		}
		
		if var10 == nil then
			if var9 == nil then
				error(error.new("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo()."))
			end
			var10 = t
			var9.dependencies = { responders = nil, lanes = noLanes, firstContext = t }
		else
			var10.next = t
			var10 = t
		end
	end
	return if isPrimaryRenderer then p15._currentValue else p15._currentValue2
end

return t