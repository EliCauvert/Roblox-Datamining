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
local var1 = createCursor(nil)
local var2 = if reactGlobalsModule.__DEV__ then {} else nil
local var3 = nil
local var4 = nil
local var5 = nil
local var6 = false

function t.resetContextDependencies()
	-- upvalues: var3 (write), var4 (write), var5 (write), reactGlobalsModule (ref), var6 (write)
	var3 = nil
	var4 = nil
	var5 = nil
	
	if reactGlobalsModule.__DEV__ then
		var6 = false
	end
end

function t.enterDisallowedContextReadInDEV()
	-- upvalues: reactGlobalsModule (ref), var6 (write)
	if reactGlobalsModule.__DEV__ then
		var6 = true
	end
end

function t.exitDisallowedContextReadInDEV()
	-- upvalues: reactGlobalsModule (ref), var6 (write)
	if reactGlobalsModule.__DEV__ then
		var6 = false
	end
end

function t.pushProvider(p1, p2)
	-- upvalues: isPrimaryRenderer (ref), push (ref), var1 (ref), reactGlobalsModule (ref), var2 (write), console (ref)
	local context = p1.type._context
	
	if isPrimaryRenderer then
		push(var1, context._currentValue, p1)
		context._currentValue = p2
		
		if not reactGlobalsModule.__DEV__ then return end
		if context._currentRenderer ~= nil and context._currentRenderer ~= var2 then
			console.error("Detected multiple renderers concurrently rendering the same context provider. This is currently unsupported.")
		end
		context._currentRenderer = var2
		
		return
	else
		push(var1, context._currentValue2, p1)
		context._currentValue2 = p2
		
		if reactGlobalsModule.__DEV__ then
			if context._currentRenderer2 ~= nil and context._currentRenderer2 ~= var2 then
				console.error("Detected multiple renderers concurrently rendering the same context provider. This is currently unsupported.")
			end
			context._currentRenderer2 = var2
		end
	end
end

function t.popProvider(p1)
	-- upvalues: var1 (ref), pop (ref), isPrimaryRenderer (ref)
	local current = var1.current
	pop(var1, p1)
	local context = p1.type._context
	
	if isPrimaryRenderer then
		context._currentValue = current
		
		return
	end
	context._currentValue2 = current
end

function t.calculateChangedBits(p1, p2, p3)
	-- upvalues: objectIs (ref), MAX_SIGNED_31_BIT_INT (ref)
	return if objectIs(p3, p2) then 0 else math.floor(if typeof(p1._calculateChangedBits) == "function" then p1._calculateChangedBits(p3, p2) else MAX_SIGNED_31_BIT_INT)
end

function t.scheduleWorkOnParentPath(p1, p2)
	-- upvalues: isSubsetOfLanes (ref), mergeLanes (ref)
	local alternate
	local var7 = p1
	while var7 ~= nil do
		alternate = var7.alternate
		
		if not isSubsetOfLanes(var7.childLanes, p2) then
			var7.childLanes = mergeLanes(var7.childLanes, p2)
			
			if alternate ~= nil then
				alternate.childLanes = mergeLanes(alternate.childLanes, p2)
			end
			var7 = var7.return_
		elseif alternate == nil or isSubsetOfLanes(alternate.childLanes, p2) then
			break
		end
		alternate.childLanes = mergeLanes(alternate.childLanes, p2)
	end
end

function t.propagateContextChange(p3, p4, p5, p6)
	-- upvalues: classComponent (ref), createUpdate (ref), noTimestamp (ref), pickArbitraryLane (ref), forceUpdate (ref), t (ref), contextProvider (ref)
	local dependencies, child_1, firstContext
	local child = p3.child
	
	if child ~= nil then
		child.return_ = p3
	end
	while child ~= nil do
		local _ = nil
		dependencies = child.dependencies
		
		if dependencies == nil then
			child_1 = if child.tag == contextProvider then if child.type == p3.type then nil else child.child else child.child
		else
			child_1 = child.child
			firstContext = dependencies.firstContext
			while firstContext ~= nil do
				if firstContext.context ~= p4 or bit32.band(firstContext.observedBits, p5) == 0 then
					firstContext = firstContext.next
					continue
				end
				if child.tag == classComponent then
					local var8 = createUpdate(noTimestamp, pickArbitraryLane(p6))
					var8.tag = forceUpdate
					local updateQueue = child.updateQueue
					
					if updateQueue ~= nil then
						local shared = updateQueue.shared
						local pending = shared.pending
						
						if pending == nil then
							var8.next = var8
						else
							var8.next = pending.next
							pending.next = var8
						end
						shared.pending = var8
					end
				end
				child.lanes = bit32.bor(child.lanes, p6)
				local alternate = child.alternate
				
				if alternate ~= nil then
					alternate.lanes = bit32.bor(alternate.lanes, p6)
				end
				t.scheduleWorkOnParentPath(child.return_, p6)
				dependencies.lanes = bit32.bor(dependencies.lanes, p6)
				break
			end
		end
		if child_1 == nil then
			child_1 = child
			while child_1 ~= nil do
				if child_1 == p3 then
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

function t.prepareToReadContext(p7, p8, p9)
	-- upvalues: var3 (write), var4 (write), var5 (write), includesSomeLane (ref)
	var3 = p7
	var4 = nil
	var5 = nil
	local dependencies = p7.dependencies
	
	if dependencies ~= nil and dependencies.firstContext ~= nil then
		if includesSomeLane(dependencies.lanes, p8) then
			p9()
		end
		dependencies.firstContext = nil
	end
end

function t.readContext(p7, p8)
	-- upvalues: reactGlobalsModule (ref), var6 (write), console (ref), var5 (write), number (ref), var4 (write), var3 (write), error (ref), noLanes (ref), isPrimaryRenderer (ref)
	if reactGlobalsModule.__DEV__ and var6 then
		console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
	end
	if var5 ~= p7 and p8 ~= false and p8 ~= 0 then
		local MAX_SAFE_INTEGER
		local _ = nil
		
		if typeof(p8) == "number" and p8 ~= number.MAX_SAFE_INTEGER then
			MAX_SAFE_INTEGER = p8
		else
			var5 = p7
			MAX_SAFE_INTEGER = number.MAX_SAFE_INTEGER
		end
		local t = {
			next = nil,
			context = p7,
			observedBits = MAX_SAFE_INTEGER
		}
		
		if var4 == nil then
			if var3 == nil then
				error(error.new("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo()."))
			end
			var4 = t
			var3.dependencies = { responders = nil, lanes = noLanes, firstContext = t }
		else
			var4.next = t
			var4 = t
		end
	end
	return if isPrimaryRenderer then p7._currentValue else p7._currentValue2
end

return t