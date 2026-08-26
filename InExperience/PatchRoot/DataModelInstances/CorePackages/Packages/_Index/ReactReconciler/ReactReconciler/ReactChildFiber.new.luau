local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local console = require(parent.Shared).console
local describeError = require(parent.Shared).describeError
local dEV = reactGlobalsModule.__DEV__
local var1 = require(parent.SafeFlags).createGetFFlag("ReactPreventAssigningKeyToChildren")()
local _ = require(parent.Shared)
local _ = require(parent.React)
local _ = require(script.Parent.ReactInternalTypes)
local _ = require(script.Parent.ReactFiberLane)
local getComponentName = require(parent.Shared).getComponentName
local reactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local placement = reactFiberFlagsModule.Placement
local deletion = reactFiberFlagsModule.Deletion
local reactSymbols = require(parent.Shared).ReactSymbols
local getIteratorFn = reactSymbols.getIteratorFn
local REACT_ELEMENT_TYPE = reactSymbols.REACT_ELEMENT_TYPE
local REACT_FRAGMENT_TYPE = reactSymbols.REACT_FRAGMENT_TYPE
local REACT_PORTAL_TYPE = reactSymbols.REACT_PORTAL_TYPE
local REACT_LAZY_TYPE = reactSymbols.REACT_LAZY_TYPE
local REACT_BLOCK_TYPE = reactSymbols.REACT_BLOCK_TYPE
local reactWorkTagsModule = require(script.Parent.ReactWorkTags)
local _ = reactWorkTagsModule.FunctionComponent
local _ = reactWorkTagsModule.ClassComponent
local hostText = reactWorkTagsModule.HostText
local hostPortal = reactWorkTagsModule.HostPortal
local _ = reactWorkTagsModule.ForwardRef
local fragment = reactWorkTagsModule.Fragment
local _ = reactWorkTagsModule.SimpleMemoComponent
local block = reactWorkTagsModule.Block
local invariant = require(parent.Shared).invariant
local reactFeatureFlags = require(parent.Shared).ReactFeatureFlags
local enableLazyElements = reactFeatureFlags.enableLazyElements
local enableBlocksAPI = reactFeatureFlags.enableBlocksAPI
local unknownModule = require(script.Parent["ReactFiber.new"])
local createWorkInProgress = unknownModule.createWorkInProgress
local resetWorkInProgress = unknownModule.resetWorkInProgress
local createFiberFromElement = unknownModule.createFiberFromElement
local createFiberFromFragment = unknownModule.createFiberFromFragment
local createFiberFromText = unknownModule.createFiberFromText
local createFiberFromPortal = unknownModule.createFiberFromPortal
local isCompatibleFamilyForHotReloading = require(script.Parent["ReactFiberHotReloading.new"]).isCompatibleFamilyForHotReloading
local t = {}
local var2 = nil
local _ = nil
local t_1 = nil

local var3 = function(_, _) end

if dEV then
	var2 = false
	local t_2 = {}
	t_1 = {}
	
	var3 = function(p1, p2)
		-- upvalues: invariant (ref), getComponentName (ref), t_2 (write), console (ref)
		if p1 == nil or type(p1) ~= "table" then return end
		if not p1._store or p1._store.validated or p1.key ~= nil then return end
		invariant(p1._store ~= nil and type(p1._store) == "table", "React Component in warnForMissingKey should have a _store. This error is likely caused by a bug in React. Please file an issue.")
		p1._store.validated = true
		local type = getComponentName(p2.type) or "Component"
		
		if t_2[type] then
			return
		end
		t_2[type] = true
		console.error("Each child in a list should have a unique \"key\" prop. See https://reactjs.org/link/warning-keys for more information.")
	end
end
local isArray = array.isArray

function coerceRef(p1, _, p2)
	-- upvalues: dEV (ref), getComponentName (ref), error (ref)
	local ref = p2.ref
	
	if ref ~= nil and type(ref) == "string" then
		if not p2._owner or not p2._self or p2._owner.stateNode == p2._self then
			error(error.new(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref", if dEV then getComponentName(p1.type) or "Component" else "<enable __DEV__ mode for component names>", tostring(ref))))
		end
		if not p2._owner then
			error("Expected ref to be a function or an object returned by React.createRef(), or nil.")
		end
	end
	return ref
end

local function _(p1)
	-- upvalues: dEV (ref), getComponentName (ref), t_1 (write), console (ref)
	if dEV then
		local type = getComponentName(p1.type) or "Component"
		
		if t_1[type] then return end
		t_1[type] = true
		console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
	end
end

function resolveLazyType(p1)
	-- upvalues: describeError (ref)
	local ok, status = xpcall(p1._init, describeError, p1._payload)
	
	return if ok then status else p1
end

local function ChildReconciler(p1)
	-- upvalues: deletion (ref), createWorkInProgress (ref), placement (ref), hostText (ref), createFiberFromText (ref), dEV (ref), isCompatibleFamilyForHotReloading (ref), enableBlocksAPI (ref), block (ref), REACT_LAZY_TYPE (ref), REACT_BLOCK_TYPE (ref), createFiberFromElement (ref), hostPortal (ref), createFiberFromPortal (ref), fragment (ref), createFiberFromFragment (ref), REACT_ELEMENT_TYPE (ref), REACT_PORTAL_TYPE (ref), enableLazyElements (ref), getComponentName (ref), t_1 (write), console (ref), REACT_FRAGMENT_TYPE (ref), var3 (write), var1 (ref), var2 (write), isArray (ref), getIteratorFn (ref)
	local function _(p2, p3)
		-- upvalues: p1 (ref), deletion (copy)
		if not p1 then return end
		local deletions = p2.deletions
		
		if deletions == nil then
			p2.deletions = { p3 }
			p2.flags = bit32.bor(p2.flags, deletion)
			
			return
		end
		table.insert(deletions, p3)
	end
	
	local _ = function(p2, p3)
		-- upvalues: p1 (ref), deletion (copy)
		if not p1 then
			return nil
		end
		local var4 = p3
		while var4 ~= nil do
			local var5 = var4
			
			if p1 then
				local deletions = p2.deletions
				
				if deletions == nil then
					p2.deletions = { var5 }
					p2.flags = bit32.bor(p2.flags, deletion)
				else
					table.insert(deletions, var5)
				end
			end
			var4 = var4.sibling
		end
		return nil
	end
	
	local function mapRemainingChildren(_, p4)
		local t = {}
		local var6 = p4
		while var6 ~= nil do
			if var6.key == nil then
				t[var6.index] = var6
			else
				t[var6.key] = var6
			end
			var6 = var6.sibling
		end
		return t
	end
	
	local _ = function(p5, p6)
		-- upvalues: createWorkInProgress (copy)
		local var7 = createWorkInProgress(p5, p6)
		var7.index = 1
		var7.sibling = nil
		
		return var7
	end
	
	local _ = function(p5, p6, p7)
		-- upvalues: p1 (ref), placement (copy)
		p5.index = p7
		
		if not p1 then
			return p6
		end
		local alternate = p5.alternate
		
		if alternate == nil then
			p5.flags = bit32.bor(p5.flags, placement)
			
			return p6
		end
		local index = alternate.index
		
		if index < p6 then
			p5.flags = bit32.bor(p5.flags, placement)
			
			return p6
		end
		return index
	end
	
	local _ = function(p5)
		-- upvalues: p1 (ref), placement (copy)
		if p1 and p5.alternate == nil then
			p5.flags = bit32.bor(p5.flags, placement)
		end
		return p5
	end
	
	local _ = function(p5, p6, p7, p8)
		-- upvalues: hostText (copy), createFiberFromText (copy), createWorkInProgress (copy)
		if p6 == nil or p6.tag ~= hostText then
			local var7 = createFiberFromText(p7, p5.mode, p8)
			var7.return_ = p5
			
			return var7
		end
		local var8 = createWorkInProgress(p6, p7)
		var8.index = 1
		var8.sibling = nil
		var8.return_ = p5
		
		return var8
	end
	
	local function updateElement(p5, p6, p7, p8)
		-- upvalues: dEV (copy), isCompatibleFamilyForHotReloading (copy), createWorkInProgress (copy), enableBlocksAPI (copy), block (copy), REACT_LAZY_TYPE (copy), REACT_BLOCK_TYPE (copy), createFiberFromElement (copy)
		if p6 ~= nil then
			if p6.elementType == p7.type or dEV and isCompatibleFamilyForHotReloading(p6, p7) then
				local var7 = createWorkInProgress(p6, p7.props)
				var7.index = 1
				var7.sibling = nil
				local var8 = var7
				var8.ref = coerceRef(p5, p6, p7)
				var8.return_ = p5
				
				if dEV then
					var8._debugSource = p7._source
					var8._debugOwner = p7._owner
				end
				return var8
			elseif enableBlocksAPI and p6.tag == block then
				local type = p7.type
				
				if type(type) == "table" and type["$$typeof"] == REACT_LAZY_TYPE then
					type = resolveLazyType(type)
				end
				if type["$$typeof"] ~= REACT_BLOCK_TYPE or type._render ~= p6.type._render then
					local var9 = createFiberFromElement(p7, p5.mode, p8)
					var9.ref = coerceRef(p5, p6, p7)
					var9.return_ = p5
					
					return var9
				end
				local var10 = createWorkInProgress(p6, p7.props)
				var10.index = 1
				var10.sibling = nil
				local var11 = var10
				var11.return_ = p5
				var11.type = type
				
				if dEV then
					var11._debugSource = p7._source
					var11._debugOwner = p7._owner
				end
				return var11
			end
		end
	end
	
	local function updatePortal(p5, p6, p7, p8)
		-- upvalues: hostPortal (copy), createFiberFromPortal (copy), createWorkInProgress (copy)
		if p6 == nil or p6.tag ~= hostPortal or (p6.stateNode.containerInfo ~= p7.containerInfo or p6.stateNode.implementation ~= p7.implementation) then
			local var7 = createFiberFromPortal(p7, p5.mode, p8)
			var7.return_ = p5
			
			return var7
		end
		local var8 = createWorkInProgress(p6, p7.children or {})
		var8.index = 1
		var8.sibling = nil
		var8.return_ = p5
		
		return var8
	end
	
	local _ = function(p5, p6, p7, p8, p9)
		-- upvalues: fragment (copy), createFiberFromFragment (copy), createWorkInProgress (copy)
		if p6 == nil or p6.tag ~= fragment then
			local var7 = createFiberFromFragment(p7, p5.mode, p8, p9)
			var7.return_ = p5
			
			return var7
		end
		local var8 = createWorkInProgress(p6, p7)
		var8.index = 1
		var8.sibling = nil
		var8.return_ = p5
		
		return var8
	end
	
	local _ = function(value, p5)
		if p5.key == nil then
			local var7 = type(value)
			
			if var7 == "string" or var7 == "number" then
				p5.key = value
				
				return
			elseif var7 == "table" then
				p5.key = tostring(value)
			end
		end
	end
	
	local function createChild(p5, p6, p7, p8)
		-- upvalues: REACT_ELEMENT_TYPE (copy), createFiberFromElement (copy), REACT_PORTAL_TYPE (copy), createFiberFromPortal (copy), REACT_LAZY_TYPE (copy), enableLazyElements (copy), createChild (ref), createFiberFromFragment (copy), createFiberFromText (copy), dEV (copy), getComponentName (copy), t_1 (copy), console (copy)
		if p6 == nil then
			return nil
		end
		local var7
		local var8 = type(p6)
		
		if var8 == "table" then
			if p6.key == nil then
				var7 = type(p8)
				
				if var7 == "string" or var7 == "number" then
					p6.key = p8
				elseif var7 == "table" then
					p6.key = tostring(p8)
				end
			end
			var7 = p6["$$typeof"]
			
			if var7 == REACT_ELEMENT_TYPE then
				local var9 = createFiberFromElement(p6, p5.mode, p7)
				var9.ref = coerceRef(p5, nil, p6)
				var9.return_ = p5
				
				return var9
			elseif var7 == REACT_PORTAL_TYPE then
				local var10 = createFiberFromPortal(p6, p5.mode, p7)
				var10.return_ = p5
				
				return var10
			elseif var7 == REACT_LAZY_TYPE and enableLazyElements then
				return createChild(p5, p6._init(p6._payload), p7)
			end
			local var11 = createFiberFromFragment(p6, p5.mode, p7, nil)
			var11.return_ = p5
			
			return var11
		elseif var8 == "string" or var8 == "number" then
			var7 = createFiberFromText(tostring(p6), p5.mode, p7)
			var7.return_ = p5
			
			return var7
		elseif dEV and var8 == "function" and dEV then
			var7 = getComponentName(p5.type) or "Component"
			
			if not t_1[var7] then
				t_1[var7] = true
				console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
			end
		end
		return nil
	end
	
	local function updateSlot(p5, p6, p7, p8, p9)
		-- upvalues: REACT_ELEMENT_TYPE (copy), REACT_FRAGMENT_TYPE (copy), fragment (copy), createFiberFromFragment (copy), createWorkInProgress (copy), updateElement (ref), REACT_PORTAL_TYPE (copy), updatePortal (ref), REACT_LAZY_TYPE (copy), enableLazyElements (copy), updateSlot (ref), hostText (copy), createFiberFromText (copy), dEV (copy), getComponentName (copy), t_1 (copy), console (copy)
		if p7 == nil then
			return nil
		end
		local var7
		local var8 = if p6 ~= nil then nil else p6.key
		local var9 = type(p7)
		
		if var9 == "table" then
			if p7.key == nil then
				var7 = type(p9)
				
				if var7 == "string" or var7 == "number" then
					p7.key = p9
				elseif var7 == "table" then
					p7.key = tostring(p9)
				end
			end
			var7 = p7["$$typeof"]
			
			if var7 == REACT_ELEMENT_TYPE then
				if p7.key == var8 then
					if p7.type == REACT_FRAGMENT_TYPE then
						local children = p7.props.children
						
						if p6 == nil or p6.tag ~= fragment then
							local var10 = createFiberFromFragment(children, p5.mode, p8, var8)
							var10.return_ = p5
							
							return var10
						end
						local var11 = createWorkInProgress(p6, children)
						var11.index = 1
						var11.sibling = nil
						local var12 = var11
						var12.return_ = p5
						
						return var12
					else
						return updateElement(p5, p6, p7, p8)
					end
				else
					return nil
				end
			elseif var7 == REACT_PORTAL_TYPE then
				return if p7.key == var8 then updatePortal(p5, p6, p7, p8) else nil
			elseif var7 == REACT_LAZY_TYPE and enableLazyElements then
				return updateSlot(p5, p6, p7._init(p7._payload), p8)
			elseif var8 ~= nil then
				return nil
			elseif p6 == nil or p6.tag ~= fragment then
				local var13 = createFiberFromFragment(p7, p5.mode, p8, nil)
				var13.return_ = p5
				
				return var13
			end
			local var14 = createWorkInProgress(p6, p7)
			var14.index = 1
			var14.sibling = nil
			local var15 = var14
			var15.return_ = p5
			
			return var15
		elseif var9 == "string" or var9 == "number" then
			if var8 ~= nil then
				return nil
			end
			local var16 = tostring(p7)
			
			if p6 == nil or p6.tag ~= hostText then
				local var17 = createFiberFromText(var16, p5.mode, p8)
				var17.return_ = p5
				
				return var17
			end
			local var18 = createWorkInProgress(p6, var16)
			var18.index = 1
			var18.sibling = nil
			local var19 = var18
			var19.return_ = p5
			
			return var19
		elseif dEV and var9 == "function" and dEV then
			var7 = getComponentName(p5.type) or "Component"
			
			if not t_1[var7] then
				t_1[var7] = true
				console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
			end
		end
		return nil
	end
	
	local function updateFromMap(p5, p6, p7, p8, p9, p10)
		-- upvalues: REACT_ELEMENT_TYPE (copy), REACT_FRAGMENT_TYPE (copy), fragment (copy), createFiberFromFragment (copy), createWorkInProgress (copy), updateElement (ref), REACT_PORTAL_TYPE (copy), updatePortal (ref), REACT_LAZY_TYPE (copy), enableLazyElements (copy), updateFromMap (ref), hostText (copy), createFiberFromText (copy), dEV (copy), getComponentName (copy), t_1 (copy), console (copy)
		if p8 == nil then
			return nil
		end
		local var7, var8
		local var9 = type(p8)
		
		if var9 == "table" then
			if p8.key == nil then
				var7 = type(p10)
				
				if var7 == "string" or var7 == "number" then
					p8.key = p10
				elseif var7 == "table" then
					p8.key = tostring(p10)
				end
			end
			var7 = nil
			local var10 = p8["$$typeof"]
			
			if var10 == REACT_ELEMENT_TYPE then
				var8 = p5[if p8.key == nil then p7 else p8.key]
				
				if p8.type == REACT_FRAGMENT_TYPE then
					local children = p8.props.children
					local key = p8.key
					
					if var8 == nil or var8.tag ~= fragment then
						local var11 = createFiberFromFragment(children, p6.mode, p9, key)
						var11.return_ = p6
						
						return var11
					end
					local var12 = createWorkInProgress(var8, children)
					var12.index = 1
					var12.sibling = nil
					local var13 = var12
					var13.return_ = p6
					
					return var13
				else
					return updateElement(p6, var8, p8, p9)
				end
			elseif var10 == REACT_PORTAL_TYPE then
				return updatePortal(p6, p5[if p8.key == nil then p7 else p8.key], p8, p9)
			elseif var10 == REACT_LAZY_TYPE and enableLazyElements then
				return updateFromMap(p5, p6, p7, p8._init(p8._payload), p9)
			end
			var8 = p5[p7]
			
			if var8 == nil or var8.tag ~= fragment then
				local var14 = createFiberFromFragment(p8, p6.mode, p9, nil)
				var14.return_ = p6
				
				return var14
			end
			local var15 = createWorkInProgress(var8, p8)
			var15.index = 1
			var15.sibling = nil
			local var16 = var15
			var16.return_ = p6
			
			return var16
		elseif var9 == "string" or var9 == "number" then
			var7 = p5[p7] or nil
			var8 = tostring(p8)
			
			if var7 == nil or var7.tag ~= hostText then
				local var17 = createFiberFromText(var8, p6.mode, p9)
				var17.return_ = p6
				
				return var17
			end
			local var18 = createWorkInProgress(var7, var8)
			var18.index = 1
			var18.sibling = nil
			local var19 = var18
			var19.return_ = p6
			
			return var19
		elseif dEV and var9 == "function" and dEV then
			var7 = getComponentName(p6.type) or "Component"
			
			if not t_1[var7] then
				t_1[var7] = true
				console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
			end
		end
		return nil
	end
	
	local function warnOnInvalidKey(p11, p12, p13)
		-- upvalues: dEV (copy), REACT_ELEMENT_TYPE (copy), REACT_PORTAL_TYPE (copy), var3 (copy), console (copy), REACT_LAZY_TYPE (copy), enableLazyElements (copy), warnOnInvalidKey (ref)
		if dEV then
			if p11 == nil or type(p11) ~= "table" then
				return p12
			end
			local var20 = p11["$$typeof"]
			
			if var20 == REACT_ELEMENT_TYPE or var20 == REACT_PORTAL_TYPE then
				var3(p11, p13)
				local key = p11.key
				
				if type(key) ~= "string" then
					return p12
				elseif p12 == nil then
					p12 = { [key] = true }
					
					return p12
				elseif p12[key] then
					console.error("Encountered two children with the same key, `%s`. Keys should be unique so that components maintain their identity across updates. Non-unique keys may cause children to be duplicated and/or omitted \226\128\148 the behavior is unsupported and could change in a future version.", key)
					
					return p12
				end
				p12[key] = true
				
				return p12
			elseif var20 == REACT_LAZY_TYPE and enableLazyElements then
				warnOnInvalidKey(p11._init(p11._payload), p12, p13)
			end
		end
		return p12
	end
	
	local function reconcileChildrenArray(p11, p12, p13, p14)
		-- upvalues: dEV (copy), warnOnInvalidKey (ref), updateSlot (ref), p1 (ref), deletion (copy), placement (copy), createChild (ref), mapRemainingChildren (ref), var1 (copy), updateFromMap (ref)
		if dEV then
			local var20 = nil
			
			for i, v in p13 do
				var20 = warnOnInvalidKey(v, var20, p11)
			end
		end
		local var21, var22
		local var23 = nil
		local var24 = nil
		local var25 = p12
		local var26 = 1
		local var27 = 1
		local _ = nil
		local p56Count = #p13
		while var25 ~= nil and var27 <= p56Count do
			if var27 < var25.index then
				var21 = var25
				var25 = nil
			else
				var21 = var25.sibling
			end
			local var28 = nil
			var22 = p13[var27]
			var28 = if var22 == nil or type(var22) ~= "table" or var22["$$typeof"] == nil then updateSlot(p11, var25, var22, p14) else updateSlot(p11, var25, var22, p14, var27)
			
			if var28 ~= nil then
				if p1 and var25 and var28.alternate == nil then
					local var29 = var25
					
					if p1 then
						local deletions = p11.deletions
						
						if deletions == nil then
							p11.deletions = { var29 }
							p11.flags = bit32.bor(p11.flags, deletion)
						else
							table.insert(deletions, var29)
						end
					end
				end
				local var30 = var28
				local var31 = var26
				var30.index = var27
				
				if p1 then
					local alternate = var30.alternate
					
					if alternate == nil then
						var30.flags = bit32.bor(var30.flags, placement)
						var26 = var31
					else
						local index = alternate.index
						
						if index < var31 then
							var30.flags = bit32.bor(var30.flags, placement)
							var26 = var31
						else
							var26 = index
						end
					end
				else
					var26 = var31
				end
				if var24 == nil then
					var23 = var28
				else
					var24.sibling = var28
				end
				var24 = var28
				var25 = var21
				var27 += 1
			elseif var25 ~= nil then
				break
			end
			var25 = var21
			break
		end
		local var32
		if p56Count < var27 then
			local var33 = var25
			
			if not p1 then
				return var23
			end
			var22 = var33
			while var22 ~= nil do
				local var34 = var22
				
				if p1 then
					local deletions = p11.deletions
					
					if deletions == nil then
						p11.deletions = { var34 }
						p11.flags = bit32.bor(p11.flags, deletion)
					else
						table.insert(deletions, var34)
					end
				end
				var22 = var22.sibling
			end
			return var23
		elseif var25 == nil then
			while var27 <= p56Count do
				var32 = nil
				var22 = p13[var27]
				var32 = if var22 == nil or type(var22) ~= "table" or var22["$$typeof"] == nil then createChild(p11, var22, p14) else createChild(p11, var22, p14, var27)
				
				if var32 == nil then
					var27 += 1
					continue
				end
				local var35 = var32
				local var36 = var26
				var35.index = var27
				
				if p1 then
					local alternate = var35.alternate
					
					if alternate == nil then
						var35.flags = bit32.bor(var35.flags, placement)
						var26 = var36
					else
						local index = alternate.index
						
						if index < var36 then
							var35.flags = bit32.bor(var35.flags, placement)
							var26 = var36
						else
							var26 = index
						end
					end
				else
					var26 = var36
				end
				if var24 == nil then
					var23 = var32
				else
					var24.sibling = var32
				end
				var24 = var32
				var27 += 1
			end
			return var23
		else
			var32 = mapRemainingChildren(p11, var25)
			while var27 <= p56Count do
				var22 = nil
				local var37 = p13[var27]
				var22 = if var1 and (var37 == nil or type(var37) ~= "table" or var37["$$typeof"] == nil) then updateFromMap(var32, p11, var27, var37, p14) else updateFromMap(var32, p11, var27, var37, p14, var27)
				
				if var22 == nil then
					var27 += 1
					continue
				end
				if p1 and var22.alternate ~= nil then
					var32[if var22.key == nil then var27 else var22.key] = nil
				end
				local var38 = var22
				local var39 = var26
				var38.index = var27
				
				if p1 then
					local alternate = var38.alternate
					
					if alternate == nil then
						var38.flags = bit32.bor(var38.flags, placement)
						var26 = var39
					else
						local index = alternate.index
						
						if index < var39 then
							var38.flags = bit32.bor(var38.flags, placement)
							var26 = var39
						else
							var26 = index
						end
					end
				else
					var26 = var39
				end
				if var24 == nil then
					var23 = var22
				else
					var24.sibling = var22
				end
				var24 = var22
			end
			if p1 then
				for i, v in var32 do
					if p1 then
						local deletions = p11.deletions
						
						if deletions == nil then
							p11.deletions = { v }
							p11.flags = bit32.bor(p11.flags, deletion)
						else
							table.insert(deletions, v)
						end
					end
				end
			end
			return var23
		end
	end
	
	local function reconcileChildrenIterator(p15, p16, p17, p18, p19)
		-- upvalues: dEV (copy), var2 (copy), console (copy), warnOnInvalidKey (ref), updateSlot (ref), p1 (ref), deletion (copy), placement (copy), createChild (ref), mapRemainingChildren (ref), updateFromMap (ref)
		if dEV then
			if p17.entries == p19 then
				if not var2 then
					console.error("Using Maps as children is not supported. Use an array of keyed ReactElements instead.")
				end
				var2 = true
			end
			local var40 = p19(p17)
			
			if var40 then
				local var41 = nil
				local var42 = var40.next()
				while not var42.done do
					var42 = var40.next()
					var41 = warnOnInvalidKey(var42.value, var41, p15)
				end
			end
		end
		local var43
		local var44 = p19(p17)
		local var45 = nil
		local var46 = nil
		local var47 = p16
		local var48 = 1
		local var49 = 1
		local _ = nil
		local var50 = var44.next()
		while var47 ~= nil and not var50.done do
			if var49 < var47.index then
				var43 = var47
				var47 = nil
			else
				var43 = var47.sibling
			end
			local var51 = updateSlot(p15, var47, var50.value, p18, var50.key)
			
			if var51 ~= nil then
				if p1 and var47 and var51.alternate == nil then
					local var52 = var47
					
					if p1 then
						local deletions = p15.deletions
						
						if deletions == nil then
							p15.deletions = { var52 }
							p15.flags = bit32.bor(p15.flags, deletion)
						else
							table.insert(deletions, var52)
						end
					end
				end
				var51.index = var49
				
				if p1 then
					local alternate = var51.alternate
					
					if alternate == nil then
						var51.flags = bit32.bor(var51.flags, placement)
						var48 = var48
					else
						local index = alternate.index
						
						if index < var48 then
							var51.flags = bit32.bor(var51.flags, placement)
							var48 = var48
						else
							var48 = index
						end
					end
				else
					var48 = var48
				end
				if var46 == nil then
					var45 = var51
				else
					var46.sibling = var51
				end
				var46 = var51
				var47 = var43
				var49 += 1
				var50 = var44.next()
			elseif var47 ~= nil then
				break
			end
			var47 = var43
			break
		end
		local var53
		if var50.done then
			local var54 = var47
			
			if not p1 then
				return var45
			end
			local var55 = var54
			while var55 ~= nil do
				local var56 = var55
				
				if p1 then
					local deletions = p15.deletions
					
					if deletions == nil then
						p15.deletions = { var56 }
						p15.flags = bit32.bor(p15.flags, deletion)
					else
						table.insert(deletions, var56)
					end
				end
				var55 = var55.sibling
			end
			return var45
		elseif var47 == nil then
			while not var50.done do
				var53 = createChild(p15, var50.value, p18, var50.key)
				
				if var53 == nil then
					var49 += 1
					var50 = var44.next()
					continue
				end
				var53.index = var49
				
				if p1 then
					local alternate = var53.alternate
					
					if alternate == nil then
						var53.flags = bit32.bor(var53.flags, placement)
						var48 = var48
					else
						local index = alternate.index
						
						if index < var48 then
							var53.flags = bit32.bor(var53.flags, placement)
							var48 = var48
						else
							var48 = index
						end
					end
				else
					var48 = var48
				end
				if var46 == nil then
					var45 = var53
				else
					var46.sibling = var53
				end
				var46 = var53
				var49 += 1
				var50 = var44.next()
			end
			return var45
		else
			var53 = nil
			while not var50.done do
				if not var53 then
					var53 = mapRemainingChildren(p15, var47)
				end
				local var57 = updateFromMap(var53, p15, var49, var50.value, p18, var50.key)
				
				if var57 == nil then
					var49 += 1
					var50 = var44.next()
					continue
				end
				if p1 and var57.alternate ~= nil then
					if var57.key == nil then
						var53[var49] = nil
					else
						var53[var57.key] = nil
					end
				end
				local var58 = var48
				var57.index = var49
				
				if p1 then
					local alternate = var57.alternate
					
					if alternate == nil then
						var57.flags = bit32.bor(var57.flags, placement)
						var48 = var58
					else
						local index = alternate.index
						
						if index < var58 then
							var57.flags = bit32.bor(var57.flags, placement)
							var48 = var58
						else
							var48 = index
						end
					end
				else
					var48 = var58
				end
				if var46 == nil then
					var45 = var57
				else
					var46.sibling = var57
				end
				var46 = var57
			end
			if p1 then
				for i, v in var53 do
					if p1 then
						local deletions = p15.deletions
						
						if deletions == nil then
							p15.deletions = { v }
							p15.flags = bit32.bor(p15.flags, deletion)
						else
							table.insert(deletions, v)
						end
					end
				end
			end
			return var45
		end
	end
	
	local function reconcileSingleTextNode(p20, p21, p22, p23)
		-- upvalues: hostText (copy), p1 (ref), deletion (copy), createWorkInProgress (copy), createFiberFromText (copy)
		if p21 == nil or p21.tag ~= hostText then
			if p1 then
				local var59 = p21
				while var59 ~= nil do
					local var60 = var59
					
					if p1 then
						local deletions = p20.deletions
						
						if deletions == nil then
							p20.deletions = { var60 }
							p20.flags = bit32.bor(p20.flags, deletion)
						else
							table.insert(deletions, var60)
						end
					end
					var59 = var59.sibling
				end
			end
			local var61 = createFiberFromText(p22, p20.mode, p23)
			var61.return_ = p20
			
			return var61
		else
			local sibling = p21.sibling
			
			if p1 then
				local var62 = sibling
				while var62 ~= nil do
					local var63 = var62
					
					if p1 then
						local deletions = p20.deletions
						
						if deletions == nil then
							p20.deletions = { var63 }
							p20.flags = bit32.bor(p20.flags, deletion)
						else
							table.insert(deletions, var63)
						end
					end
					var62 = var62.sibling
				end
			end
			local var64 = createWorkInProgress(p21, p22)
			var64.index = 1
			var64.sibling = nil
			local var65 = var64
			var65.return_ = p20
			
			return var65
		end
	end
	
	local function reconcileSingleElement(p24, p25, p26, p27)
		-- upvalues: fragment (copy), REACT_FRAGMENT_TYPE (copy), p1 (ref), deletion (copy), createWorkInProgress (copy), dEV (copy), isCompatibleFamilyForHotReloading (copy), createFiberFromFragment (copy), createFiberFromElement (copy)
		local key = p26.key
		local var66 = p25
		while var66 ~= nil do
			if var66.key ~= key then
				local var67 = var66
				
				if p1 then
					local deletions = p24.deletions
					
					if deletions == nil then
						p24.deletions = { var67 }
						p24.flags = bit32.bor(p24.flags, deletion)
					else
						table.insert(deletions, var67)
					end
				end
				var66 = var66.sibling
			end
			if var66.tag == fragment then
				if p26.type == REACT_FRAGMENT_TYPE then
					local sibling = var66.sibling
					
					if p1 then
						local var68 = sibling
						while var68 ~= nil do
							local var69 = var68
							
							if p1 then
								local deletions = p24.deletions
								
								if deletions == nil then
									p24.deletions = { var69 }
									p24.flags = bit32.bor(p24.flags, deletion)
								else
									table.insert(deletions, var69)
								end
							end
							var68 = var68.sibling
						end
					end
					local var70 = createWorkInProgress(var66, p26.props.children)
					var70.index = 1
					var70.sibling = nil
					var70.return_ = p24
					
					if dEV then
						var70._debugSource = p26._source
						var70._debugOwner = p26._owner
					end
					return var70
				else
					local var71 = var66
					
					if not p1 then break end
					local var72 = var71
					while var72 ~= nil do
						local var73 = var72
						
						if p1 then
							local deletions = p24.deletions
							
							if deletions == nil then
								p24.deletions = { var73 }
								p24.flags = bit32.bor(p24.flags, deletion)
							else
								table.insert(deletions, var73)
							end
						end
						var72 = var72.sibling
					end
				end
			elseif var66.elementType == p26.type or dEV and isCompatibleFamilyForHotReloading(var66, p26) then
				local sibling = var66.sibling
				
				if p1 then
					local var74 = sibling
					while var74 ~= nil do
						local var75 = var74
						
						if p1 then
							local deletions = p24.deletions
							
							if deletions == nil then
								p24.deletions = { var75 }
								p24.flags = bit32.bor(p24.flags, deletion)
							else
								table.insert(deletions, var75)
							end
						end
						var74 = var74.sibling
					end
				end
				local var76 = createWorkInProgress(var66, p26.props)
				var76.index = 1
				var76.sibling = nil
				local var77 = var76
				var77.ref = coerceRef(p24, var66, p26)
				var77.return_ = p24
				
				if dEV then
					var77._debugSource = p26._source
					var77._debugOwner = p26._owner
				end
				return var77
			end
		end
		if p26.type == REACT_FRAGMENT_TYPE then
			local var78 = createFiberFromFragment(p26.props.children, p24.mode, p27, p26.key)
			var78.return_ = p24
			
			return var78
		end
		local var79 = createFiberFromElement(p26, p24.mode, p27)
		var79.ref = coerceRef(p24, p25, p26)
		var79.return_ = p24
		
		return var79
	end
	
	local function reconcileSinglePortal(p28, p29, p30, p31)
		-- upvalues: hostPortal (copy), p1 (ref), deletion (copy), createWorkInProgress (copy), createFiberFromPortal (copy)
		local key = p30.key
		local var80 = p29
		while var80 ~= nil do
			if var80.key == key then
				if var80.tag == hostPortal and var80.stateNode.containerInfo == p30.containerInfo and var80.stateNode.implementation == p30.implementation then
					local sibling = var80.sibling
					
					if p1 then
						local var81 = sibling
						while var81 ~= nil do
							local var82 = var81
							
							if p1 then
								local deletions = p28.deletions
								
								if deletions == nil then
									p28.deletions = { var82 }
									p28.flags = bit32.bor(p28.flags, deletion)
								else
									table.insert(deletions, var82)
								end
							end
							var81 = var81.sibling
						end
					end
					local var83 = createWorkInProgress(var80, p30.children or {})
					var83.index = 1
					var83.sibling = nil
					local var84 = var83
					var84.return_ = p28
					
					return var84
				else
					local var85 = var80
					
					if not p1 then break end
					local var86 = var85
					while var86 ~= nil do
						local var87 = var86
						
						if p1 then
							local deletions = p28.deletions
							
							if deletions == nil then
								p28.deletions = { var87 }
								p28.flags = bit32.bor(p28.flags, deletion)
							else
								table.insert(deletions, var87)
							end
						end
						var86 = var86.sibling
					end
				end
			else
				local var88 = var80
				
				if p1 then
					local deletions = p28.deletions
					
					if deletions == nil then
						p28.deletions = { var88 }
						p28.flags = bit32.bor(p28.flags, deletion)
					else
						table.insert(deletions, var88)
					end
				end
				var80 = var80.sibling
			end
		end
		local var89 = createFiberFromPortal(p30, p28.mode, p31)
		var89.return_ = p28
		
		return var89
	end
	
	local function reconcileChildFibers(p32, p33, p34, p35)
		-- upvalues: REACT_FRAGMENT_TYPE (copy), isArray (copy), REACT_ELEMENT_TYPE (copy), reconcileSingleElement (ref), p1 (ref), placement (copy), REACT_PORTAL_TYPE (copy), reconcileSinglePortal (ref), REACT_LAZY_TYPE (copy), enableLazyElements (copy), reconcileChildFibers (ref), reconcileChildrenArray (ref), reconcileSingleTextNode (ref), getIteratorFn (copy), reconcileChildrenIterator (ref), dEV (copy), getComponentName (copy), t_1 (copy), console (copy), deletion (copy)
		local var90 = type(p34)
		
		if p34 ~= nil and (var90 == "table" and (p34.type == REACT_FRAGMENT_TYPE and p34.key == nil)) then
			p34 = p34.props.children
			var90 = type(p34)
		end
		local var91 = isArray(p34)
		
		if p34 ~= nil and (var90 == "table" and not var91) then
			local var92 = p34["$$typeof"]
			
			if var92 == REACT_ELEMENT_TYPE then
				local var93 = reconcileSingleElement(p32, p33, p34, p35)
				
				if p1 and var93.alternate == nil then
					var93.flags = bit32.bor(var93.flags, placement)
				end
				return var93
			elseif var92 == REACT_PORTAL_TYPE then
				local var94 = reconcileSinglePortal(p32, p33, p34, p35)
				
				if p1 and var94.alternate == nil then
					var94.flags = bit32.bor(var94.flags, placement)
				end
				return var94
			elseif var92 == REACT_LAZY_TYPE and enableLazyElements then
				return reconcileChildFibers(p32, p33, p34._init(p34._payload), p35)
			end
		elseif var91 then
			return reconcileChildrenArray(p32, p33, p34, p35)
		elseif var90 == "string" or var90 == "number" then
			local var95 = reconcileSingleTextNode(p32, p33, tostring(p34), p35)
			
			if p1 and var95.alternate == nil then
				var95.flags = bit32.bor(var95.flags, placement)
			end
			return var95
		else
			local var96 = getIteratorFn(p34)
			
			if var96 then
				return reconcileChildrenIterator(p32, p33, p34, p35, var96)
			elseif dEV and var90 == "function" and dEV then
				local type = getComponentName(p32.type) or "Component"
				
				if not t_1[type] then
					t_1[type] = true
					console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
				end
			end
			if p34 == nil then
				if not p1 then
					return nil
				end
				local var97 = p33
				while var97 ~= nil do
					local var98 = var97
					
					if p1 then
						local deletions = p32.deletions
						
						if deletions == nil then
							p32.deletions = { var98 }
							p32.flags = bit32.bor(p32.flags, deletion)
						else
							table.insert(deletions, var98)
						end
					end
					var97 = var97.sibling
				end
				return nil
			end
		end
	end
	
	return reconcileChildFibers
end

t.reconcileChildFibers = ChildReconciler(true)
t.mountChildFibers = ChildReconciler(false)

function t.cloneChildFibers(_, p32)
	-- upvalues: createWorkInProgress (ref)
	if p32.child == nil then return end
	local child = p32.child
	local var90 = createWorkInProgress(child, child.pendingProps)
	p32.child = var90
	var90.return_ = p32
	while child.sibling ~= nil do
		child = child.sibling
		var90.sibling = createWorkInProgress(child, child.pendingProps)
		var90 = var90.sibling
		var90.return_ = p32
	end
	var90.sibling = nil
end

function t.resetChildFibers(p33, p34)
	-- upvalues: resetWorkInProgress (ref)
	local child = p33.child
	while child ~= nil do
		resetWorkInProgress(child, p34)
		child = child.sibling
	end
end

return t