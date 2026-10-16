local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Number = LuauPolyfillModule.Number
local Error1 = LuauPolyfillModule.Error
local Console = require(Parent.Shared).console
local EnableAllocationTrims = require(Parent.Shared).ReactFeatureFlags.enableAllocationTrims
local _ = require(Parent.Shared)
local _ = require(script.Parent.ReactInternalTypes)
local ReactFiberStackNewModule = require(script.Parent["ReactFiberStack.new"])
local ReactFiberLaneModule = require(script.Parent.ReactFiberLane)
local ReactUpdateQueueNewModule = require(script.Parent["ReactUpdateQueue.new"])
local IsPrimaryRenderer = require(script.Parent.ReactFiberHostConfig).isPrimaryRenderer
local PushFunction = ReactFiberStackNewModule.push
local PopFunction = ReactFiberStackNewModule.pop
local MAXSIGNED31BITINT = require(script.Parent.MaxInts).MAX_SIGNED_31_BIT_INT
local ReactWorkTagsModule = require(script.Parent.ReactWorkTags)
local ContextProvider = ReactWorkTagsModule.ContextProvider
local ClassComponent = ReactWorkTagsModule.ClassComponent
local NoLanes = ReactFiberLaneModule.NoLanes
local NoTimestamp = ReactFiberLaneModule.NoTimestamp
local IsSubsetOfLanesFunction = ReactFiberLaneModule.isSubsetOfLanes
local IncludesSomeLaneFunction = ReactFiberLaneModule.includesSomeLane
local MergeLanesFunction = ReactFiberLaneModule.mergeLanes
local PickArbitraryLaneFunction = ReactFiberLaneModule.pickArbitraryLane
local ObjectIsFunction = require(Parent.Shared).objectIs
local CreateUpdateFunction = ReactUpdateQueueNewModule.createUpdate
local ForceUpdate = ReactUpdateQueueNewModule.ForceUpdate
local Cursor = ReactFiberStackNewModule.createCursor(nil)
local T = if ReactGlobalsModule.__DEV__ then {} else nil
local v1 = nil
local v2 = nil
local Context = nil
local Flag = false
local ReactFiberNewContextModule = {
	resetContextDependencies = function() --[[ Line: 76 ]]
		-- upvalues: v1 (ref), v2 (ref), Context (ref), ReactGlobalsModule (copy), Flag (ref)
		v1 = nil
		v2 = nil
		Context = nil
		
		if ReactGlobalsModule.__DEV__ then
			Flag = false
		end
	end,
	enterDisallowedContextReadInDEV = function() --[[ Line: 87 ]]
		-- upvalues: ReactGlobalsModule (copy), Flag (ref)
		if ReactGlobalsModule.__DEV__ then
			Flag = true
		end
	end,
	exitDisallowedContextReadInDEV = function() --[[ Line: 93 ]]
		-- upvalues: ReactGlobalsModule (copy), Flag (ref)
		if ReactGlobalsModule.__DEV__ then
			Flag = false
		end
	end,
	pushProvider = function(p1, _currentValue) --[[ Line: 99 ]]
		-- upvalues: IsPrimaryRenderer (copy), PushFunction (copy), Cursor (copy), ReactGlobalsModule (copy), T (ref), Console (copy)
		local Context = p1.type._context
		
		if IsPrimaryRenderer then
			PushFunction(Cursor, Context._currentValue, p1)
			Context._currentValue = _currentValue
			
			if ReactGlobalsModule.__DEV__ then
				if Context._currentRenderer ~= nil and Context._currentRenderer ~= T then
					Console.error("Detected multiple renderers concurrently rendering the same context provider. This is currently unsupported.")
				end
				Context._currentRenderer = T
				
				return
			end
		else
			PushFunction(Cursor, Context._currentValue2, p1)
			Context._currentValue2 = _currentValue
			
			if ReactGlobalsModule.__DEV__ then
				if Context._currentRenderer2 ~= nil and Context._currentRenderer2 ~= T then
					Console.error("Detected multiple renderers concurrently rendering the same context provider. This is currently unsupported.")
				end
				Context._currentRenderer2 = T
			end
		end
	end,
	popProvider = function(p1) --[[ Line: 137 ]]
		-- upvalues: Cursor (copy), PopFunction (copy), IsPrimaryRenderer (copy)
		local Current = Cursor.current
		PopFunction(Cursor, p1)
		local Context = p1.type._context
		
		if IsPrimaryRenderer then
			Context._currentValue = Current
			
			return
		else
			Context._currentValue2 = Current
		end
	end,
	calculateChangedBits = function(p1, p2, p3): number --[[ Line: 150 ]]
		-- upvalues: ObjectIsFunction (copy), MAXSIGNED31BITINT (copy)
		return if ObjectIsFunction(p3, p2) then 0 else math.floor(if typeof(p1._calculateChangedBits) == "function" then p1._calculateChangedBits(p3, p2) else MAXSIGNED31BITINT)
	end,
	scheduleWorkOnParentPath = function(Return, Mask) --[[ Line: 181 ]]
		-- upvalues: IsSubsetOfLanesFunction (copy), MergeLanesFunction (copy)
		local Return1 = Return
		while Return1 ~= nil do
			local Alternate = Return1.alternate
			
			if IsSubsetOfLanesFunction(Return1.childLanes, Mask) then
				if Alternate == nil or IsSubsetOfLanesFunction(Alternate.childLanes, Mask) then break end
				Alternate.childLanes = MergeLanesFunction(Alternate.childLanes, Mask)
			else
				Return1.childLanes = MergeLanesFunction(Return1.childLanes, Mask)
				
				if Alternate ~= nil then
					Alternate.childLanes = MergeLanesFunction(Alternate.childLanes, Mask)
				end
			end
			Return1 = Return1.return_
		end
	end
}

function ReactFiberNewContextModule.propagateContextChange(Return_, Context, Mask: number, Mask1: number) --[[ Line: 204 ]]
	-- upvalues: ClassComponent (copy), CreateUpdateFunction (copy), NoTimestamp (copy), PickArbitraryLaneFunction (copy), ForceUpdate (copy), ReactFiberNewContextModule (copy), ContextProvider (copy)
	local Child = Return_.child
	local Dependencies = nil
	local Sibling = nil
	local Child1 = nil
	
	if Child ~= nil then
		Child.return_ = Return_
	end
	while Child ~= nil do
		Dependencies = Child.dependencies
		
		if Dependencies == nil then
			Child1 = if Child.tag == ContextProvider and Child.type == Return_.type then nil else Child.child
		else
			Child1 = Child.child
			local FirstContext = Dependencies.firstContext
			while FirstContext ~= nil do
				if FirstContext.context ~= Context or bit32.band(FirstContext.observedBits, Mask) == 0 then
					FirstContext = FirstContext.next
					continue
				elseif Child.tag == ClassComponent then
					local Update = CreateUpdateFunction(NoTimestamp, PickArbitraryLaneFunction(Mask1))
					Update.tag = ForceUpdate
					local UpdateQueue = Child.updateQueue
					
					if UpdateQueue ~= nil then
						local Shared = UpdateQueue.shared
						local Pending = Shared.pending
						
						if Pending == nil then
							Update.next = Update
						else
							Update.next = Pending.next
							Pending.next = Update
						end
						Shared.pending = Update
					end
				end
				Child.lanes = bit32.bor(Child.lanes, Mask1)
				local Alternate = Child.alternate
				
				if Alternate ~= nil then
					Alternate.lanes = bit32.bor(Alternate.lanes, Mask1)
				end
				ReactFiberNewContextModule.scheduleWorkOnParentPath(Child.return_, Mask1)
				Dependencies.lanes = bit32.bor(Dependencies.lanes, Mask1)
				break
			end
		end
		if Child1 == nil then
			Child1 = Child
			while Child1 ~= nil do
				if Child1 == Return_ then
					Child1 = nil
					break
				end
				Sibling = Child1.sibling
				
				if Sibling == nil then
					Child1 = Child1.return_
					continue
				end
				Sibling.return_ = Child1.return_
				Child1 = Sibling
				break
			end
		else
			Child1.return_ = Child
		end
		Child = Child1
	end
end

function ReactFiberNewContextModule.prepareToReadContext(p1, p2, Callback: () -> ()) --[[ Line: 343 ]]
	-- upvalues: v1 (ref), v2 (ref), Context (ref), IncludesSomeLaneFunction (copy)
	v1 = p1
	v2 = nil
	Context = nil
	local Dependencies = p1.dependencies
	
	if Dependencies ~= nil and Dependencies.firstContext ~= nil then
		if IncludesSomeLaneFunction(Dependencies.lanes, p2) then
			Callback()
		end
		Dependencies.firstContext = nil
	end
end

function ReactFiberNewContextModule.readContext(Context1, Enabled) --[[ Line: 366 ]]
	-- upvalues: ReactGlobalsModule (copy), Flag (ref), Console (copy), Context (ref), Number (copy), EnableAllocationTrims (copy), v2 (ref), v1 (ref), Error1 (copy), NoLanes (copy), IsPrimaryRenderer (copy)
	if ReactGlobalsModule.__DEV__ and Flag then
		Console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
	end
	if Context ~= Context1 and Enabled ~= false and Enabled ~= 0 then
		local MAXSAFEINTEGER = nil
		if typeof(Enabled) == "number" and Enabled ~= Number.MAX_SAFE_INTEGER then
			MAXSAFEINTEGER = Enabled
		else
			Context = Context1
			MAXSAFEINTEGER = Number.MAX_SAFE_INTEGER
		end
		local Config = if EnableAllocationTrims then { context = Context1, observedBits = MAXSAFEINTEGER } else {
			next = nil,
			context = Context1,
			observedBits = MAXSAFEINTEGER
		}
		
		if v2 == nil then
			if v1 == nil then
				error(Error1.new("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo()."))
			end
			v2 = Config
			
			if EnableAllocationTrims then
				local Dependencies = v1.dependencies
				
				if Dependencies == nil then
					v1.dependencies = { lanes = NoLanes, firstContext = Config }
				else
					Dependencies.lanes = NoLanes
					Dependencies.firstContext = Config
				end
			else
				v1.dependencies = { responders = nil, lanes = NoLanes, firstContext = Config }
			end
		else
			v2.next = Config
			v2 = Config
		end
	end
	return if IsPrimaryRenderer then Context1._currentValue else Context1._currentValue2
end

return ReactFiberNewContextModule