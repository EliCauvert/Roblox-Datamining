local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Error1 = LuauPolyfillModule.Error
local Console = require(Parent.Shared).console
local DescribeError = require(Parent.Shared).describeError
local DEV = require(Parent.ReactGlobals).__DEV__
local v1 = require(Parent.SafeFlags).createGetFFlag("ReactPreventAssigningKeyToChildren")()
local _ = require(Parent.Shared)
local _ = require(Parent.React)
local _ = require(script.Parent.ReactInternalTypes)
local _ = require(script.Parent.ReactFiberLane)
local GetComponentNameFunction = require(Parent.Shared).getComponentName
local ReactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local Placement = ReactFiberFlagsModule.Placement
local Deletion = ReactFiberFlagsModule.Deletion
local ReactSymbols = require(Parent.Shared).ReactSymbols
local GetIteratorFnFunction = ReactSymbols.getIteratorFn
local REACTELEMENTTYPE = ReactSymbols.REACT_ELEMENT_TYPE
local REACTFRAGMENTTYPE = ReactSymbols.REACT_FRAGMENT_TYPE
local REACTPORTALTYPE = ReactSymbols.REACT_PORTAL_TYPE
local REACTLAZYTYPE = ReactSymbols.REACT_LAZY_TYPE
local REACTBLOCKTYPE = ReactSymbols.REACT_BLOCK_TYPE
local ReactWorkTagsModule = require(script.Parent.ReactWorkTags)
local _ = ReactWorkTagsModule.FunctionComponent
local _ = ReactWorkTagsModule.ClassComponent
local HostText = ReactWorkTagsModule.HostText
local HostPortal = ReactWorkTagsModule.HostPortal
local _ = ReactWorkTagsModule.ForwardRef
local Fragment = ReactWorkTagsModule.Fragment
local _ = ReactWorkTagsModule.SimpleMemoComponent
local Block = ReactWorkTagsModule.Block
local InvariantFunction = require(Parent.Shared).invariant
local ReactFeatureFlags = require(Parent.Shared).ReactFeatureFlags
local EnableLazyElements = ReactFeatureFlags.enableLazyElements
local EnableBlocksAPI = ReactFeatureFlags.enableBlocksAPI
local ReactFiberNewModule = require(script.Parent["ReactFiber.new"])
local CreateWorkInProgressFunction = ReactFiberNewModule.createWorkInProgress
local ResetWorkInProgressFunction = ReactFiberNewModule.resetWorkInProgress
local CreateFiberFromElementFunction = ReactFiberNewModule.createFiberFromElement
local CreateFiberFromFragmentFunction = ReactFiberNewModule.createFiberFromFragment
local CreateFiberFromTextFunction = ReactFiberNewModule.createFiberFromText
local CreateFiberFromPortalFunction = ReactFiberNewModule.createFiberFromPortal
local IsCompatibleFamilyForHotReloadingFunction = require(script.Parent["ReactFiberHotReloading.new"]).isCompatibleFamilyForHotReloading
local ReactChildFiberModule = {}
local Flag: boolean? = nil
local t = nil
local v2 = nil

local function v37(_, _) end

if DEV then
	Flag = false
	t = {}
	v2 = {}
	
	v37 = function(p1, p2)
		-- upvalues: InvariantFunction (copy), GetComponentNameFunction (copy), t (ref), Console (copy)
		if p1 == nil or type(p1) ~= "table" then return end
		if not p1._store or p1._store.validated or p1.key ~= nil then return end
		InvariantFunction(p1._store ~= nil and type(p1._store) == "table", "React Component in warnForMissingKey should have a _store. This error is likely caused by a bug in React. Please file an issue.")
		p1._store.validated = true
		local ComponentName = GetComponentNameFunction(p2.type) or "Component"
		
		if not t[ComponentName] then
			t[ComponentName] = true
			Console.error("Each child in a list should have a unique \"key\" prop. See https://reactjs.org/link/warning-keys for more information.")
			
			return
		end
	end
end
local IsArrayFunction = Array.isArray

function coerceRef(p1, _, p2)
	-- upvalues: DEV (copy), GetComponentNameFunction (copy), Error1 (copy)
	local Ref = p2.ref
	
	if Ref ~= nil and type(Ref) == "string" then
		if not p2._owner or not p2._self or p2._owner.stateNode == p2._self then
			error(Error1.new(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref", if DEV then GetComponentNameFunction(p1.type) or "Component" else "<enable __DEV__ mode for component names>", (tostring(Ref)))))
		end
		if not p2._owner then
			error("Expected ref to be a function or an object returned by React.createRef(), or nil.")
		end
	end
	return Ref
end

local function _(p1)
	-- upvalues: DEV (copy), GetComponentNameFunction (copy), v2 (ref), Console (copy)
	if DEV then
		local ComponentName = GetComponentNameFunction(p1.type) or "Component"
		
		if v2[ComponentName] then return end
		v2[ComponentName] = true
		Console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
	end
end

function resolveLazyType(p1)
	-- upvalues: DescribeError (copy)
	local Success, Result = xpcall(p1._init, DescribeError, p1._payload)
	
	return if Success then Result else p1
end

local function ChildReconciler(p1)
	-- upvalues: Deletion (copy), CreateWorkInProgressFunction (copy), ReactFeatureFlags (copy), Placement (copy), HostText (copy), CreateFiberFromTextFunction (copy), DEV (copy), IsCompatibleFamilyForHotReloadingFunction (copy), EnableBlocksAPI (copy), Block (copy), REACTLAZYTYPE (copy), REACTBLOCKTYPE (copy), CreateFiberFromElementFunction (copy), HostPortal (copy), CreateFiberFromPortalFunction (copy), Fragment (copy), CreateFiberFromFragmentFunction (copy), REACTELEMENTTYPE (copy), REACTPORTALTYPE (copy), EnableLazyElements (copy), GetComponentNameFunction (copy), v2 (ref), Console (copy), REACTFRAGMENTTYPE (copy), v37 (ref), v1 (copy), Flag (ref), IsArrayFunction (copy), GetIteratorFnFunction (copy)
	local function _(p2, p3)
		-- upvalues: p1 (copy), Deletion (upval)
		if not p1 then return end
		local Deletions = p2.deletions
		
		if Deletions == nil then
			p2.deletions = { p3 }
			p2.flags = bit32.bor(p2.flags, Deletion)
			
			return
		else
			table.insert(Deletions, p3)
		end
	end
	
	local _ = function(p2, Sibling)
		-- upvalues: p1 (copy), Deletion (upval)
		if not p1 then
			return nil
		end
		local Sibling1 = Sibling
		while Sibling1 ~= nil do
			local Sibling2 = Sibling1
			
			if p1 then
				local Deletions = p2.deletions
				
				if Deletions == nil then
					p2.deletions = { Sibling2 }
					p2.flags = bit32.bor(p2.flags, Deletion)
				else
					table.insert(Deletions, Sibling2)
				end
			end
			Sibling1 = Sibling1.sibling
		end
		return nil
	end
	
	local function mapRemainingChildren(_, Sibling)
		local Siblings = {}
		local Sibling1 = Sibling
		while Sibling1 ~= nil do
			if Sibling1.key == nil then
				Siblings[Sibling1.index] = Sibling1
			else
				Siblings[Sibling1.key] = Sibling1
			end
			Sibling1 = Sibling1.sibling
		end
		return Siblings
	end
	
	local _ = function(p3, p4)
		-- upvalues: CreateWorkInProgressFunction (upval), ReactFeatureFlags (upval)
		local WorkInProgress = CreateWorkInProgressFunction(p3, p4)
		WorkInProgress.index = 1
		
		if not ReactFeatureFlags.enableWorkLoopTrims then
			WorkInProgress.sibling = nil
		elseif WorkInProgress.sibling ~= nil then
			WorkInProgress.sibling = nil
			
			return WorkInProgress
		end
		return WorkInProgress
	end
	
	local _ = function(p3, p4, Index)
		-- upvalues: p1 (copy), Placement (upval)
		p3.index = Index
		
		if not p1 then
			return p4
		end
		local Alternate = p3.alternate
		
		if Alternate == nil then
			p3.flags = bit32.bor(p3.flags, Placement)
			
			return p4
		end
		local Index1 = Alternate.index
		
		if Index1 < p4 then
			p3.flags = bit32.bor(p3.flags, Placement)
			
			return p4
		else
			return Index1
		end
	end
	
	local _ = function(p3)
		-- upvalues: p1 (copy), Placement (upval)
		if p1 and p3.alternate == nil then
			p3.flags = bit32.bor(p3.flags, Placement)
		end
		return p3
	end
	
	local _ = function(Return_, p3, p4, p5)
		-- upvalues: HostText (upval), CreateFiberFromTextFunction (upval), CreateWorkInProgressFunction (upval), ReactFeatureFlags (upval)
		if p3 == nil or p3.tag ~= HostText then
			local FiberFromText = CreateFiberFromTextFunction(p4, Return_.mode, p5)
			FiberFromText.return_ = Return_
			
			return FiberFromText
		end
		local WorkInProgress = CreateWorkInProgressFunction(p3, p4)
		WorkInProgress.index = 1
		
		if ReactFeatureFlags.enableWorkLoopTrims then
			if WorkInProgress.sibling ~= nil then
				WorkInProgress.sibling = nil
			end
		else
			WorkInProgress.sibling = nil
		end
		WorkInProgress.return_ = Return_
		
		return WorkInProgress
	end
	
	local function updateElement(Return_, p3, p4, p5)
		-- upvalues: DEV (upval), IsCompatibleFamilyForHotReloadingFunction (upval), CreateWorkInProgressFunction (upval), ReactFeatureFlags (upval), EnableBlocksAPI (upval), Block (upval), REACTLAZYTYPE (upval), REACTBLOCKTYPE (upval), CreateFiberFromElementFunction (upval)
		if p3 ~= nil then
			if p3.elementType == p4.type or DEV and IsCompatibleFamilyForHotReloadingFunction(p3, p4) then
				local WorkInProgress = CreateWorkInProgressFunction(p3, p4.props)
				WorkInProgress.index = 1
				
				if ReactFeatureFlags.enableWorkLoopTrims then
					if WorkInProgress.sibling ~= nil then
						WorkInProgress.sibling = nil
					end
				else
					WorkInProgress.sibling = nil
				end
				if ReactFeatureFlags.enableWorkLoopTrims then
					local CoerceRefResult = coerceRef(Return_, p3, p4)
					
					if CoerceRefResult ~= nil or WorkInProgress.ref ~= nil then
						WorkInProgress.ref = CoerceRefResult
					end
				else
					WorkInProgress.ref = coerceRef(Return_, p3, p4)
				end
				WorkInProgress.return_ = Return_
				
				if DEV then
					WorkInProgress._debugSource = p4._source
					WorkInProgress._debugOwner = p4._owner
				end
				return WorkInProgress
			elseif EnableBlocksAPI and p3.tag == Block then
				local Type1 = p4.type
				
				if type(Type1) == "table" and Type1["$$typeof"] == REACTLAZYTYPE then
					Type1 = resolveLazyType(Type1)
				end
				if Type1["$$typeof"] == REACTBLOCKTYPE and Type1._render == p3.type._render then
					local WorkInProgress = CreateWorkInProgressFunction(p3, p4.props)
					WorkInProgress.index = 1
					
					if ReactFeatureFlags.enableWorkLoopTrims then
						if WorkInProgress.sibling ~= nil then
							WorkInProgress.sibling = nil
						end
					else
						WorkInProgress.sibling = nil
					end
					WorkInProgress.return_ = Return_
					WorkInProgress.type = Type1
					
					if DEV then
						WorkInProgress._debugSource = p4._source
						WorkInProgress._debugOwner = p4._owner
					end
					return WorkInProgress
				end
			end
		end
		local FiberFromElement = CreateFiberFromElementFunction(p4, Return_.mode, p5)
		FiberFromElement.ref = coerceRef(Return_, p3, p4)
		FiberFromElement.return_ = Return_
		
		return FiberFromElement
	end
	
	local function updatePortal(Return_, p3, p4, p5)
		-- upvalues: HostPortal (upval), CreateFiberFromPortalFunction (upval), CreateWorkInProgressFunction (upval), ReactFeatureFlags (upval)
		if p3 == nil or p3.tag ~= HostPortal or p3.stateNode.containerInfo ~= p4.containerInfo or p3.stateNode.implementation ~= p4.implementation then
			local FiberFromPortal = CreateFiberFromPortalFunction(p4, Return_.mode, p5)
			FiberFromPortal.return_ = Return_
			
			return FiberFromPortal
		end
		local WorkInProgress = CreateWorkInProgressFunction(p3, p4.children or {})
		WorkInProgress.index = 1
		
		if ReactFeatureFlags.enableWorkLoopTrims then
			if WorkInProgress.sibling ~= nil then
				WorkInProgress.sibling = nil
			end
		else
			WorkInProgress.sibling = nil
		end
		WorkInProgress.return_ = Return_
		
		return WorkInProgress
	end
	
	local _ = function(Return_, p3, p4, p5, p6)
		-- upvalues: Fragment (upval), CreateFiberFromFragmentFunction (upval), CreateWorkInProgressFunction (upval), ReactFeatureFlags (upval)
		if p3 == nil or p3.tag ~= Fragment then
			local FiberFromFragment = CreateFiberFromFragmentFunction(p4, Return_.mode, p5, p6)
			FiberFromFragment.return_ = Return_
			
			return FiberFromFragment
		end
		local WorkInProgress = CreateWorkInProgressFunction(p3, p4)
		WorkInProgress.index = 1
		
		if ReactFeatureFlags.enableWorkLoopTrims then
			if WorkInProgress.sibling ~= nil then
				WorkInProgress.sibling = nil
			end
		else
			WorkInProgress.sibling = nil
		end
		WorkInProgress.return_ = Return_
		
		return WorkInProgress
	end
	
	local _ = function(Key, p3)
		if p3.key == nil then
			local ValueType = type(Key)
			
			if ValueType == "string" or ValueType == "number" then
				p3.key = Key
				
				return
			end
			if ValueType == "table" then
				p3.key = tostring(Key)
			end
		end
	end
	
	local function createChild(Return_, InitResult, p3, Key)
		-- upvalues: REACTELEMENTTYPE (upval), CreateFiberFromElementFunction (upval), REACTPORTALTYPE (upval), CreateFiberFromPortalFunction (upval), REACTLAZYTYPE (upval), EnableLazyElements (upval), createChild (copy), CreateFiberFromFragmentFunction (upval), CreateFiberFromTextFunction (upval), DEV (upval), GetComponentNameFunction (upval), v2 (upval), Console (upval)
		if InitResult == nil then
			return nil
		end
		local ValueType = type(InitResult)
		
		if ValueType == "table" then
			if InitResult.key == nil then
				local ValueType1 = type(Key)
				
				if ValueType1 == "string" or ValueType1 == "number" then
					InitResult.key = Key
				elseif ValueType1 == "table" then
					InitResult.key = tostring(Key)
				end
			end
			local Typeof = InitResult["$$typeof"]
			
			if Typeof == REACTELEMENTTYPE then
				local FiberFromElement = CreateFiberFromElementFunction(InitResult, Return_.mode, p3)
				FiberFromElement.ref = coerceRef(Return_, nil, InitResult)
				FiberFromElement.return_ = Return_
				
				return FiberFromElement
			elseif Typeof == REACTPORTALTYPE then
				local FiberFromPortal = CreateFiberFromPortalFunction(InitResult, Return_.mode, p3)
				FiberFromPortal.return_ = Return_
				
				return FiberFromPortal
			elseif Typeof == REACTLAZYTYPE and EnableLazyElements then
				return createChild(Return_, InitResult._init(InitResult._payload), p3)
			else
				local FiberFromFragment = CreateFiberFromFragmentFunction(InitResult, Return_.mode, p3, nil)
				FiberFromFragment.return_ = Return_
				
				return FiberFromFragment
			end
		else
			if ValueType == "string" or ValueType == "number" then
				local FiberFromText = CreateFiberFromTextFunction(tostring(InitResult), Return_.mode, p3)
				FiberFromText.return_ = Return_
				
				return FiberFromText
			end
			if DEV and ValueType == "function" and DEV then
				local ComponentName = GetComponentNameFunction(Return_.type) or "Component"
				
				if not v2[ComponentName] then
					v2[ComponentName] = true
					Console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
				end
			end
			return nil
		end
	end
	
	local function updateSlot(Return_, p3, InitResult, p4, Key)
		-- upvalues: REACTELEMENTTYPE (upval), REACTFRAGMENTTYPE (upval), Fragment (upval), CreateFiberFromFragmentFunction (upval), CreateWorkInProgressFunction (upval), ReactFeatureFlags (upval), updateElement (copy), REACTPORTALTYPE (upval), updatePortal (copy), REACTLAZYTYPE (upval), EnableLazyElements (upval), updateSlot (copy), HostText (upval), CreateFiberFromTextFunction (upval), DEV (upval), GetComponentNameFunction (upval), v2 (upval), Console (upval)
		if InitResult == nil then
			return nil
		end
		local Key1 = if p3 == nil then nil else p3.key
		local ValueType = type(InitResult)
		
		if ValueType == "table" then
			if InitResult.key == nil then
				local ValueType1 = type(Key)
				
				if ValueType1 == "string" or ValueType1 == "number" then
					InitResult.key = Key
				elseif ValueType1 == "table" then
					InitResult.key = tostring(Key)
				end
			end
			local Typeof = InitResult["$$typeof"]
			
			if Typeof == REACTELEMENTTYPE then
				if InitResult.key ~= Key1 then
					return nil
				end
				if InitResult.type ~= REACTFRAGMENTTYPE then
					return (updateElement(Return_, p3, InitResult, p4))
				end
				local Children = InitResult.props.children
				
				if p3 == nil or p3.tag ~= Fragment then
					local FiberFromFragment = CreateFiberFromFragmentFunction(Children, Return_.mode, p4, Key1)
					FiberFromFragment.return_ = Return_
					
					return FiberFromFragment
				end
				local WorkInProgress = CreateWorkInProgressFunction(p3, Children)
				WorkInProgress.index = 1
				
				if ReactFeatureFlags.enableWorkLoopTrims then
					if WorkInProgress.sibling ~= nil then
						WorkInProgress.sibling = nil
					end
				else
					WorkInProgress.sibling = nil
				end
				WorkInProgress.return_ = Return_
				
				return WorkInProgress
			else
				if Typeof == REACTPORTALTYPE then
					return if InitResult.key == Key1 then updatePortal(Return_, p3, InitResult, p4) else nil
				end
				if Typeof == REACTLAZYTYPE and EnableLazyElements then
					return updateSlot(Return_, p3, InitResult._init(InitResult._payload), p4)
				end
				if Key1 ~= nil then
					return nil
				end
				if p3 == nil or p3.tag ~= Fragment then
					local FiberFromFragment = CreateFiberFromFragmentFunction(InitResult, Return_.mode, p4, nil)
					FiberFromFragment.return_ = Return_
					
					return FiberFromFragment
				end
				local WorkInProgress = CreateWorkInProgressFunction(p3, InitResult)
				WorkInProgress.index = 1
				
				if ReactFeatureFlags.enableWorkLoopTrims then
					if WorkInProgress.sibling ~= nil then
						WorkInProgress.sibling = nil
					end
				else
					WorkInProgress.sibling = nil
				end
				WorkInProgress.return_ = Return_
				
				return WorkInProgress
			end
		elseif ValueType == "string" or ValueType == "number" then
			if Key1 ~= nil then
				return nil
			end
			local Text = tostring(InitResult)
			
			if p3 == nil or p3.tag ~= HostText then
				local FiberFromText = CreateFiberFromTextFunction(Text, Return_.mode, p4)
				FiberFromText.return_ = Return_
				
				return FiberFromText
			end
			local WorkInProgress = CreateWorkInProgressFunction(p3, Text)
			WorkInProgress.index = 1
			
			if ReactFeatureFlags.enableWorkLoopTrims then
				if WorkInProgress.sibling ~= nil then
					WorkInProgress.sibling = nil
				end
			else
				WorkInProgress.sibling = nil
			end
			WorkInProgress.return_ = Return_
			
			return WorkInProgress
		else
			if DEV and ValueType == "function" and DEV then
				local ComponentName = GetComponentNameFunction(Return_.type) or "Component"
				
				if not v2[ComponentName] then
					v2[ComponentName] = true
					Console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
				end
			end
			return nil
		end
	end
	
	local function updateFromMap(p3, Return_, Count, InitResult, p4, Key)
		-- upvalues: REACTELEMENTTYPE (upval), REACTFRAGMENTTYPE (upval), Fragment (upval), CreateFiberFromFragmentFunction (upval), CreateWorkInProgressFunction (upval), ReactFeatureFlags (upval), updateElement (copy), REACTPORTALTYPE (upval), updatePortal (copy), REACTLAZYTYPE (upval), EnableLazyElements (upval), updateFromMap (copy), HostText (upval), CreateFiberFromTextFunction (upval), DEV (upval), GetComponentNameFunction (upval), v2 (upval), Console (upval)
		if InitResult == nil then
			return nil
		end
		local ValueType = type(InitResult)
		
		if ValueType == "table" then
			if InitResult.key == nil then
				local ValueType1 = type(Key)
				
				if ValueType1 == "string" or ValueType1 == "number" then
					InitResult.key = Key
				elseif ValueType1 == "table" then
					InitResult.key = tostring(Key)
				end
			end
			local Typeof = InitResult["$$typeof"]
			
			if Typeof == REACTELEMENTTYPE then
				local v3 = p3[if InitResult.key == nil then Count else InitResult.key]
				
				if InitResult.type ~= REACTFRAGMENTTYPE then
					return (updateElement(Return_, v3, InitResult, p4))
				end
				local Children = InitResult.props.children
				local Key1 = InitResult.key
				
				if v3 == nil or v3.tag ~= Fragment then
					local FiberFromFragment = CreateFiberFromFragmentFunction(Children, Return_.mode, p4, Key1)
					FiberFromFragment.return_ = Return_
					
					return FiberFromFragment
				end
				local WorkInProgress = CreateWorkInProgressFunction(v3, Children)
				WorkInProgress.index = 1
				
				if ReactFeatureFlags.enableWorkLoopTrims then
					if WorkInProgress.sibling ~= nil then
						WorkInProgress.sibling = nil
					end
				else
					WorkInProgress.sibling = nil
				end
				WorkInProgress.return_ = Return_
				
				return WorkInProgress
			else
				if Typeof == REACTPORTALTYPE then
					return (updatePortal(Return_, p3[if InitResult.key == nil then Count else InitResult.key], InitResult, p4))
				end
				if Typeof == REACTLAZYTYPE and EnableLazyElements then
					return updateFromMap(p3, Return_, Count, InitResult._init(InitResult._payload), p4)
				end
				local v4 = p3[Count]
				
				if v4 == nil or v4.tag ~= Fragment then
					local FiberFromFragment = CreateFiberFromFragmentFunction(InitResult, Return_.mode, p4, nil)
					FiberFromFragment.return_ = Return_
					
					return FiberFromFragment
				end
				local WorkInProgress = CreateWorkInProgressFunction(v4, InitResult)
				WorkInProgress.index = 1
				
				if ReactFeatureFlags.enableWorkLoopTrims then
					if WorkInProgress.sibling ~= nil then
						WorkInProgress.sibling = nil
					end
				else
					WorkInProgress.sibling = nil
				end
				WorkInProgress.return_ = Return_
				
				return WorkInProgress
			end
		elseif ValueType == "string" or ValueType == "number" then
			local v5 = p3[Count] or nil
			local Text = tostring(InitResult)
			
			if v5 == nil or v5.tag ~= HostText then
				local FiberFromText = CreateFiberFromTextFunction(Text, Return_.mode, p4)
				FiberFromText.return_ = Return_
				
				return FiberFromText
			end
			local WorkInProgress = CreateWorkInProgressFunction(v5, Text)
			WorkInProgress.index = 1
			
			if ReactFeatureFlags.enableWorkLoopTrims then
				if WorkInProgress.sibling ~= nil then
					WorkInProgress.sibling = nil
				end
			else
				WorkInProgress.sibling = nil
			end
			WorkInProgress.return_ = Return_
			
			return WorkInProgress
		else
			if DEV and ValueType == "function" and DEV then
				local ComponentName = GetComponentNameFunction(Return_.type) or "Component"
				
				if not v2[ComponentName] then
					v2[ComponentName] = true
					Console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
				end
			end
			return nil
		end
	end
	
	local function warnOnInvalidKey(InitResult, p5, p6)
		-- upvalues: DEV (upval), REACTELEMENTTYPE (upval), REACTPORTALTYPE (upval), v37 (upval), Console (upval), REACTLAZYTYPE (upval), EnableLazyElements (upval), warnOnInvalidKey (copy)
		if DEV then
			if InitResult == nil or type(InitResult) ~= "table" then
				return p5
			end
			local Typeof = InitResult["$$typeof"]
			
			if Typeof == REACTELEMENTTYPE or Typeof == REACTPORTALTYPE then
				v37(InitResult, p6)
				local Key = InitResult.key
				
				if type(Key) ~= "string" then
					return p5
				elseif p5 == nil then
					p5 = { [Key] = true }
					
					return p5
				elseif p5[Key] then
					Console.error("Encountered two children with the same key, `%s`. Keys should be unique so that components maintain their identity across updates. Non-unique keys may cause children to be duplicated and/or omitted — the behavior is unsupported and could change in a future version.", Key)
					
					return p5
				else
					p5[Key] = true
					
					return p5
				end
			elseif Typeof == REACTLAZYTYPE and EnableLazyElements then
				warnOnInvalidKey(InitResult._init(InitResult._payload), p5, p6)
			end
		end
		return p5
	end
	
	local function reconcileChildrenArray(Return, Sibling, Children, p5)
		-- upvalues: DEV (upval), warnOnInvalidKey (copy), updateSlot (copy), p1 (copy), Deletion (upval), Placement (upval), createChild (copy), mapRemainingChildren (copy), v1 (upval), updateFromMap (copy)
		if DEV then
			local v6 = nil
			
			for _, child in Children do
				v6 = warnOnInvalidKey(child, v6, Return)
			end
		end
		local v7 = nil
		local v8 = nil
		local Sibling1 = Sibling
		local v9 = 1
		local Count = 1
		local CountChildren = #Children
		local Sibling2 = nil
		while Sibling1 ~= nil and Count <= CountChildren do
			if Count < Sibling1.index then
				Sibling2 = Sibling1
				Sibling1 = nil
			else
				Sibling2 = Sibling1.sibling
			end
			local Child = Children[Count]
			local UpdateSlotResult = if Child == nil or type(Child) ~= "table" or Child["$$typeof"] == nil then updateSlot(Return, Sibling1, Child, p5) else updateSlot(Return, Sibling1, Child, p5, Count)
			
			if UpdateSlotResult == nil then
				if Sibling1 ~= nil then break end
				Sibling1 = Sibling2
				break
			end
			if p1 and Sibling1 and UpdateSlotResult.alternate == nil then
				local Sibling3 = Sibling1
				
				if p1 then
					local Deletions = Return.deletions
					
					if Deletions == nil then
						Return.deletions = { Sibling3 }
						Return.flags = bit32.bor(Return.flags, Deletion)
					else
						table.insert(Deletions, Sibling3)
					end
				end
			end
			local v10: number = v9
			UpdateSlotResult.index = Count
			
			if p1 then
				local Alternate = UpdateSlotResult.alternate
				
				if Alternate == nil then
					UpdateSlotResult.flags = bit32.bor(UpdateSlotResult.flags, Placement)
					v9 = v10
				else
					local Index = Alternate.index
					
					if Index < v10 then
						UpdateSlotResult.flags = bit32.bor(UpdateSlotResult.flags, Placement)
						v9 = v10
					else
						v9 = Index
					end
				end
			else
				v9 = v10
			end
			if v8 == nil then
				v7 = UpdateSlotResult
			else
				v8.sibling = UpdateSlotResult
			end
			v8 = UpdateSlotResult
			Sibling1 = Sibling2
			Count += 1
		end
		if CountChildren < Count then
			local Sibling4 = Sibling1
			
			if not p1 then
				return v7
			end
			local Sibling5 = Sibling4
			while Sibling5 ~= nil do
				local Sibling6 = Sibling5
				
				if p1 then
					local Deletions = Return.deletions
					
					if Deletions == nil then
						Return.deletions = { Sibling6 }
						Return.flags = bit32.bor(Return.flags, Deletion)
					else
						table.insert(Deletions, Sibling6)
					end
				end
				Sibling5 = Sibling5.sibling
			end
			return v7
		elseif Sibling1 == nil then
			while Count <= CountChildren do
				local Child = Children[Count]
				local Child1 = if Child == nil or type(Child) ~= "table" or Child["$$typeof"] == nil then createChild(Return, Child, p5) else createChild(Return, Child, p5, Count)
				
				if Child1 == nil then
					Count += 1
					continue
				else
					local v11: number = v9
					Child1.index = Count
					
					if p1 then
						local Alternate1 = Child1.alternate
						
						if Alternate1 == nil then
							Child1.flags = bit32.bor(Child1.flags, Placement)
							v9 = v11
						else
							local Index = Alternate1.index
							
							if Index < v11 then
								Child1.flags = bit32.bor(Child1.flags, Placement)
								v9 = v11
							else
								v9 = Index
							end
						end
					else
						v9 = v11
					end
					if v8 == nil then
						v7 = Child1
					else
						v8.sibling = Child1
					end
					v8 = Child1
					Count += 1
				end
			end
			return v7
		else
			local MapRemainingChildrenResult = mapRemainingChildren(Return, Sibling1)
			while Count <= CountChildren do
				local Child = Children[Count]
				local UpdateFromMapResult = if v1 and (Child == nil or type(Child) ~= "table" or Child["$$typeof"] == nil) then updateFromMap(MapRemainingChildrenResult, Return, Count, Child, p5) else updateFromMap(MapRemainingChildrenResult, Return, Count, Child, p5, Count)
				
				if UpdateFromMapResult ~= nil then
					if p1 and UpdateFromMapResult.alternate ~= nil then
						MapRemainingChildrenResult[if UpdateFromMapResult.key == nil then Count else UpdateFromMapResult.key] = nil
					end
					local v12: number = v9
					UpdateFromMapResult.index = Count
					
					if p1 then
						local Alternate = UpdateFromMapResult.alternate
						
						if Alternate == nil then
							UpdateFromMapResult.flags = bit32.bor(UpdateFromMapResult.flags, Placement)
							v9 = v12
						else
							local Index = Alternate.index
							
							if Index < v12 then
								UpdateFromMapResult.flags = bit32.bor(UpdateFromMapResult.flags, Placement)
								v9 = v12
							else
								v9 = Index
							end
						end
					else
						v9 = v12
					end
					if v8 == nil then
						v7 = UpdateFromMapResult
					else
						v8.sibling = UpdateFromMapResult
					end
					v8 = UpdateFromMapResult
				end
				Count += 1
			end
			if p1 then
				for _, value in MapRemainingChildrenResult do
					if p1 then
						local Deletions = Return.deletions
						
						if Deletions == nil then
							Return.deletions = { value }
							Return.flags = bit32.bor(Return.flags, Deletion)
						else
							table.insert(Deletions, value)
						end
					end
				end
			end
			return v7
		end
	end
	
	local function reconcileChildrenIterator(Return, Sibling, Children, p6, Callback)
		-- upvalues: DEV (upval), Flag (upval), Console (upval), warnOnInvalidKey (copy), updateSlot (copy), p1 (copy), Deletion (upval), Placement (upval), createChild (copy), mapRemainingChildren (copy), updateFromMap (copy)
		if DEV then
			if Children.entries == Callback then
				if not Flag then
					Console.error("Using Maps as children is not supported. Use an array of keyed ReactElements instead.")
				end
				Flag = true
			end
			local CallbackResult1 = Callback(Children)
			
			if CallbackResult1 then
				local v13 = nil
				local v14 = CallbackResult1.next()
				while not v14.done do
					v14 = CallbackResult1.next()
					v13 = warnOnInvalidKey(v14.value, v13, Return)
				end
			end
		end
		local CallbackResult = Callback(Children)
		local v15 = nil
		local v16 = nil
		local Sibling1 = Sibling
		local v17 = 1
		local Count = 1
		local v18 = CallbackResult.next()
		local Sibling2 = nil
		while Sibling1 ~= nil and not v18.done do
			if Count < Sibling1.index then
				Sibling2 = Sibling1
				Sibling1 = nil
			else
				Sibling2 = Sibling1.sibling
			end
			local UpdateSlotResult = updateSlot(Return, Sibling1, v18.value, p6, v18.key)
			
			if UpdateSlotResult == nil then
				if Sibling1 ~= nil then break end
				Sibling1 = Sibling2
				break
			end
			if p1 and Sibling1 and UpdateSlotResult.alternate == nil then
				local Sibling3 = Sibling1
				
				if p1 then
					local Deletions1 = Return.deletions
					
					if Deletions1 == nil then
						Return.deletions = { Sibling3 }
						Return.flags = bit32.bor(Return.flags, Deletion)
					else
						table.insert(Deletions1, Sibling3)
					end
				end
			end
			local v19: number = v17
			UpdateSlotResult.index = Count
			
			if p1 then
				local Alternate = UpdateSlotResult.alternate
				
				if Alternate == nil then
					UpdateSlotResult.flags = bit32.bor(UpdateSlotResult.flags, Placement)
					v17 = v19
				else
					local Index = Alternate.index
					
					if Index < v19 then
						UpdateSlotResult.flags = bit32.bor(UpdateSlotResult.flags, Placement)
						v17 = v19
					else
						v17 = Index
					end
				end
			else
				v17 = v19
			end
			if v16 == nil then
				v15 = UpdateSlotResult
			else
				v16.sibling = UpdateSlotResult
			end
			v16 = UpdateSlotResult
			Sibling1 = Sibling2
			Count += 1
			v18 = CallbackResult.next()
		end
		if v18.done then
			local Sibling4 = Sibling1
			
			if not p1 then
				return v15
			end
			local Sibling5 = Sibling4
			while Sibling5 ~= nil do
				local Sibling6 = Sibling5
				
				if p1 then
					local Deletions2 = Return.deletions
					
					if Deletions2 == nil then
						Return.deletions = { Sibling6 }
						Return.flags = bit32.bor(Return.flags, Deletion)
					else
						table.insert(Deletions2, Sibling6)
					end
				end
				Sibling5 = Sibling5.sibling
			end
			return v15
		elseif Sibling1 == nil then
			while not v18.done do
				local Child = createChild(Return, v18.value, p6, v18.key)
				
				if Child == nil then
					Count += 1
					v18 = CallbackResult.next()
					continue
				else
					local v20: number = v17
					Child.index = Count
					
					if p1 then
						local Alternate1 = Child.alternate
						
						if Alternate1 == nil then
							Child.flags = bit32.bor(Child.flags, Placement)
							v17 = v20
						else
							local Index = Alternate1.index
							
							if Index < v20 then
								Child.flags = bit32.bor(Child.flags, Placement)
								v17 = v20
							else
								v17 = Index
							end
						end
					else
						v17 = v20
					end
					if v16 == nil then
						v15 = Child
					else
						v16.sibling = Child
					end
					v16 = Child
					Count += 1
					v18 = CallbackResult.next()
				end
			end
			return v15
		else
			local MapRemainingChildrenResult = nil
			while not v18.done do
				if not MapRemainingChildrenResult then
					MapRemainingChildrenResult = mapRemainingChildren(Return, Sibling1)
				end
				local UpdateFromMapResult = updateFromMap(MapRemainingChildrenResult, Return, Count, v18.value, p6, v18.key)
				
				if UpdateFromMapResult ~= nil then
					if p1 and UpdateFromMapResult.alternate ~= nil then
						if UpdateFromMapResult.key == nil then
							MapRemainingChildrenResult[Count] = nil
						else
							MapRemainingChildrenResult[UpdateFromMapResult.key] = nil
						end
					end
					local v21: number = v17
					UpdateFromMapResult.index = Count
					
					if p1 then
						local Alternate = UpdateFromMapResult.alternate
						
						if Alternate == nil then
							UpdateFromMapResult.flags = bit32.bor(UpdateFromMapResult.flags, Placement)
							v17 = v21
						else
							local Index = Alternate.index
							
							if Index < v21 then
								UpdateFromMapResult.flags = bit32.bor(UpdateFromMapResult.flags, Placement)
								v17 = v21
							else
								v17 = Index
							end
						end
					else
						v17 = v21
					end
					if v16 == nil then
						v15 = UpdateFromMapResult
					else
						v16.sibling = UpdateFromMapResult
					end
					v16 = UpdateFromMapResult
				end
				Count += 1
				v18 = CallbackResult.next()
			end
			if p1 then
				for _, value in MapRemainingChildrenResult do
					if p1 then
						local Deletions = Return.deletions
						
						if Deletions == nil then
							Return.deletions = { value }
							Return.flags = bit32.bor(Return.flags, Deletion)
						else
							table.insert(Deletions, value)
						end
					end
				end
			end
			return v15
		end
	end
	
	local function reconcileSingleTextNode(Return_, Sibling, p7, p8)
		-- upvalues: HostText (upval), p1 (copy), Deletion (upval), CreateWorkInProgressFunction (upval), ReactFeatureFlags (upval), CreateFiberFromTextFunction (upval)
		if Sibling == nil or Sibling.tag ~= HostText then
			if p1 then
				local Sibling4 = Sibling
				while Sibling4 ~= nil do
					local Sibling5 = Sibling4
					
					if p1 then
						local Deletions = Return_.deletions
						
						if Deletions == nil then
							Return_.deletions = { Sibling5 }
							Return_.flags = bit32.bor(Return_.flags, Deletion)
						else
							table.insert(Deletions, Sibling5)
						end
					end
					Sibling4 = Sibling4.sibling
				end
			end
			local FiberFromText = CreateFiberFromTextFunction(p7, Return_.mode, p8)
			FiberFromText.return_ = Return_
			
			return FiberFromText
		else
			local Sibling1 = Sibling.sibling
			
			if p1 then
				local Sibling2 = Sibling1
				while Sibling2 ~= nil do
					local Sibling3 = Sibling2
					
					if p1 then
						local Deletions = Return_.deletions
						
						if Deletions == nil then
							Return_.deletions = { Sibling3 }
							Return_.flags = bit32.bor(Return_.flags, Deletion)
						else
							table.insert(Deletions, Sibling3)
						end
					end
					Sibling2 = Sibling2.sibling
				end
			end
			local WorkInProgress = CreateWorkInProgressFunction(Sibling, p7)
			WorkInProgress.index = 1
			
			if ReactFeatureFlags.enableWorkLoopTrims then
				if WorkInProgress.sibling ~= nil then
					WorkInProgress.sibling = nil
				end
			else
				WorkInProgress.sibling = nil
			end
			WorkInProgress.return_ = Return_
			
			return WorkInProgress
		end
	end
	
	local function reconcileSingleElement(Return_, Sibling, Children, p9)
		-- upvalues: Fragment (upval), REACTFRAGMENTTYPE (upval), p1 (copy), Deletion (upval), CreateWorkInProgressFunction (upval), ReactFeatureFlags (upval), DEV (upval), IsCompatibleFamilyForHotReloadingFunction (upval), CreateFiberFromFragmentFunction (upval), CreateFiberFromElementFunction (upval)
		local Key = Children.key
		local Sibling1 = Sibling
		while Sibling1 ~= nil do
			if Sibling1.key == Key then
				if Sibling1.tag == Fragment then
					if Children.type == REACTFRAGMENTTYPE then
						local Sibling3 = Sibling1.sibling
						
						if p1 then
							local Sibling5 = Sibling3
							while Sibling5 ~= nil do
								local Sibling6 = Sibling5
								
								if p1 then
									local Deletions = Return_.deletions
									
									if Deletions == nil then
										Return_.deletions = { Sibling6 }
										Return_.flags = bit32.bor(Return_.flags, Deletion)
									else
										table.insert(Deletions, Sibling6)
									end
								end
								Sibling5 = Sibling5.sibling
							end
						end
						local WorkInProgress = CreateWorkInProgressFunction(Sibling1, Children.props.children)
						WorkInProgress.index = 1
						
						if ReactFeatureFlags.enableWorkLoopTrims then
							if WorkInProgress.sibling ~= nil then
								WorkInProgress.sibling = nil
							end
						else
							WorkInProgress.sibling = nil
						end
						WorkInProgress.return_ = Return_
						
						if DEV then
							WorkInProgress._debugSource = Children._source
							WorkInProgress._debugOwner = Children._owner
						end
						return WorkInProgress
					end
				elseif Sibling1.elementType == Children.type or DEV and IsCompatibleFamilyForHotReloadingFunction(Sibling1, Children) then
					local Sibling7 = Sibling1.sibling
					
					if p1 then
						local Sibling8 = Sibling7
						while Sibling8 ~= nil do
							local Sibling9 = Sibling8
							
							if p1 then
								local Deletions = Return_.deletions
								
								if Deletions == nil then
									Return_.deletions = { Sibling9 }
									Return_.flags = bit32.bor(Return_.flags, Deletion)
								else
									table.insert(Deletions, Sibling9)
								end
							end
							Sibling8 = Sibling8.sibling
						end
					end
					local WorkInProgress = CreateWorkInProgressFunction(Sibling1, Children.props)
					WorkInProgress.index = 1
					
					if ReactFeatureFlags.enableWorkLoopTrims then
						if WorkInProgress.sibling ~= nil then
							WorkInProgress.sibling = nil
						end
					else
						WorkInProgress.sibling = nil
					end
					if ReactFeatureFlags.enableWorkLoopTrims then
						local CoerceRefResult = coerceRef(Return_, Sibling1, Children)
						
						if CoerceRefResult ~= nil or WorkInProgress.ref ~= nil then
							WorkInProgress.ref = CoerceRefResult
						end
					else
						WorkInProgress.ref = coerceRef(Return_, Sibling1, Children)
					end
					WorkInProgress.return_ = Return_
					
					if DEV then
						WorkInProgress._debugSource = Children._source
						WorkInProgress._debugOwner = Children._owner
					end
					return WorkInProgress
				end
				local Sibling4 = Sibling1
				
				if not p1 then break end
				local Sibling10 = Sibling4
				while Sibling10 ~= nil do
					local Sibling11 = Sibling10
					
					if p1 then
						local Deletions = Return_.deletions
						
						if Deletions == nil then
							Return_.deletions = { Sibling11 }
							Return_.flags = bit32.bor(Return_.flags, Deletion)
						else
							table.insert(Deletions, Sibling11)
						end
					end
					Sibling10 = Sibling10.sibling
				end
				break
			end
			local Sibling2 = Sibling1
			
			if p1 then
				local Deletions = Return_.deletions
				
				if Deletions == nil then
					Return_.deletions = { Sibling2 }
					Return_.flags = bit32.bor(Return_.flags, Deletion)
				else
					table.insert(Deletions, Sibling2)
				end
			end
			Sibling1 = Sibling1.sibling
		end
		if Children.type == REACTFRAGMENTTYPE then
			local FiberFromFragment = CreateFiberFromFragmentFunction(Children.props.children, Return_.mode, p9, Children.key)
			FiberFromFragment.return_ = Return_
			
			return FiberFromFragment
		else
			local FiberFromElement = CreateFiberFromElementFunction(Children, Return_.mode, p9)
			FiberFromElement.ref = coerceRef(Return_, Sibling, Children)
			FiberFromElement.return_ = Return_
			
			return FiberFromElement
		end
	end
	
	local function reconcileSinglePortal(Return_, Sibling, Children, p10)
		-- upvalues: HostPortal (upval), p1 (copy), Deletion (upval), CreateWorkInProgressFunction (upval), ReactFeatureFlags (upval), CreateFiberFromPortalFunction (upval)
		local Key = Children.key
		local Sibling1 = Sibling
		while Sibling1 ~= nil do
			if Sibling1.key == Key then
				if Sibling1.tag == HostPortal and Sibling1.stateNode.containerInfo == Children.containerInfo and Sibling1.stateNode.implementation == Children.implementation then
					local Sibling4 = Sibling1.sibling
					
					if p1 then
						local Sibling5 = Sibling4
						while Sibling5 ~= nil do
							local Sibling6 = Sibling5
							
							if p1 then
								local Deletions = Return_.deletions
								
								if Deletions == nil then
									Return_.deletions = { Sibling6 }
									Return_.flags = bit32.bor(Return_.flags, Deletion)
								else
									table.insert(Deletions, Sibling6)
								end
							end
							Sibling5 = Sibling5.sibling
						end
					end
					local WorkInProgress = CreateWorkInProgressFunction(Sibling1, Children.children or {})
					WorkInProgress.index = 1
					
					if ReactFeatureFlags.enableWorkLoopTrims then
						if WorkInProgress.sibling ~= nil then
							WorkInProgress.sibling = nil
						end
					else
						WorkInProgress.sibling = nil
					end
					WorkInProgress.return_ = Return_
					
					return WorkInProgress
				else
					local Sibling3 = Sibling1
					
					if not p1 then break end
					local Sibling7 = Sibling3
					while Sibling7 ~= nil do
						local Sibling8 = Sibling7
						
						if p1 then
							local Deletions = Return_.deletions
							
							if Deletions == nil then
								Return_.deletions = { Sibling8 }
								Return_.flags = bit32.bor(Return_.flags, Deletion)
							else
								table.insert(Deletions, Sibling8)
							end
						end
						Sibling7 = Sibling7.sibling
					end
					break
				end
			end
			local Sibling2 = Sibling1
			
			if p1 then
				local Deletions = Return_.deletions
				
				if Deletions == nil then
					Return_.deletions = { Sibling2 }
					Return_.flags = bit32.bor(Return_.flags, Deletion)
				else
					table.insert(Deletions, Sibling2)
				end
			end
			Sibling1 = Sibling1.sibling
		end
		local FiberFromPortal = CreateFiberFromPortalFunction(Children, Return_.mode, p10)
		FiberFromPortal.return_ = Return_
		
		return FiberFromPortal
	end
	
	local function reconcileChildFibers(Return, Sibling, InitResult, p11)
		-- upvalues: REACTFRAGMENTTYPE (upval), IsArrayFunction (upval), REACTELEMENTTYPE (upval), reconcileSingleElement (copy), p1 (copy), Placement (upval), REACTPORTALTYPE (upval), reconcileSinglePortal (copy), REACTLAZYTYPE (upval), EnableLazyElements (upval), reconcileChildFibers (copy), reconcileChildrenArray (copy), reconcileSingleTextNode (copy), GetIteratorFnFunction (upval), reconcileChildrenIterator (copy), DEV (upval), GetComponentNameFunction (upval), v2 (upval), Console (upval), Deletion (upval)
		local ValueType = type(InitResult)
		
		if InitResult ~= nil and (ValueType == "table" and (InitResult.type == REACTFRAGMENTTYPE and InitResult.key == nil)) then
			InitResult = InitResult.props.children
			ValueType = type(InitResult)
		end
		local IsArray = IsArrayFunction(InitResult)
		
		if InitResult ~= nil and (ValueType == "table" and not IsArray) then
			local Typeof = InitResult["$$typeof"]
			
			if Typeof == REACTELEMENTTYPE then
				local ReconcileSingleElementResult = reconcileSingleElement(Return, Sibling, InitResult, p11)
				
				if p1 and ReconcileSingleElementResult.alternate == nil then
					ReconcileSingleElementResult.flags = bit32.bor(ReconcileSingleElementResult.flags, Placement)
				end
				return ReconcileSingleElementResult
			elseif Typeof == REACTPORTALTYPE then
				local ReconcileSinglePortalResult = reconcileSinglePortal(Return, Sibling, InitResult, p11)
				
				if p1 and ReconcileSinglePortalResult.alternate == nil then
					ReconcileSinglePortalResult.flags = bit32.bor(ReconcileSinglePortalResult.flags, Placement)
				end
				return ReconcileSinglePortalResult
			elseif Typeof == REACTLAZYTYPE and EnableLazyElements then
				return reconcileChildFibers(Return, Sibling, InitResult._init(InitResult._payload), p11)
			end
		else
			if IsArray then
				return (reconcileChildrenArray(Return, Sibling, InitResult, p11))
			end
			if ValueType == "string" or ValueType == "number" then
				local ReconcileSingleTextNodeResult = reconcileSingleTextNode(Return, Sibling, tostring(InitResult), p11)
				
				if p1 and ReconcileSingleTextNodeResult.alternate == nil then
					ReconcileSingleTextNodeResult.flags = bit32.bor(ReconcileSingleTextNodeResult.flags, Placement)
				end
				return ReconcileSingleTextNodeResult
			end
		end
		local IteratorFn = GetIteratorFnFunction(InitResult)
		
		if IteratorFn then
			return (reconcileChildrenIterator(Return, Sibling, InitResult, p11, IteratorFn))
		end
		if DEV and ValueType == "function" and DEV then
			local ComponentName = GetComponentNameFunction(Return.type) or "Component"
			
			if not v2[ComponentName] then
				v2[ComponentName] = true
				Console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
			end
		end
		if not p1 then
			return nil
		end
		local Sibling1 = Sibling
		while Sibling1 ~= nil do
			local Sibling2 = Sibling1
			
			if p1 then
				local Deletions = Return.deletions
				
				if Deletions == nil then
					Return.deletions = { Sibling2 }
					Return.flags = bit32.bor(Return.flags, Deletion)
				else
					table.insert(Deletions, Sibling2)
				end
			end
			Sibling1 = Sibling1.sibling
		end
		return nil
	end
	
	return reconcileChildFibers
end

ReactChildFiberModule.reconcileChildFibers = ChildReconciler(true)
ReactChildFiberModule.mountChildFibers = ChildReconciler(false)

function ReactChildFiberModule:cloneChildFibers(Return_)
	-- upvalues: CreateWorkInProgressFunction (copy)
	if Return_.child == nil then return end
	local Child = Return_.child
	local WorkInProgress = CreateWorkInProgressFunction(Child, Child.pendingProps)
	Return_.child = WorkInProgress
	WorkInProgress.return_ = Return_
	while Child.sibling ~= nil do
		Child = Child.sibling
		WorkInProgress.sibling = CreateWorkInProgressFunction(Child, Child.pendingProps)
		WorkInProgress = WorkInProgress.sibling
		WorkInProgress.return_ = Return_
	end
	WorkInProgress.sibling = nil
end

function ReactChildFiberModule.resetChildFibers(p11, p12)
	-- upvalues: ResetWorkInProgressFunction (copy)
	local Child = p11.child
	while Child ~= nil do
		ResetWorkInProgressFunction(Child, p12)
		Child = Child.sibling
	end
end

return ReactChildFiberModule