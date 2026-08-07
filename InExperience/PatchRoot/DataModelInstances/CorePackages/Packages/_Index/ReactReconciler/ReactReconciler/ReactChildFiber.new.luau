local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local console = require(parent.Shared).console
local describeError = require(parent.Shared).describeError
local dEV = reactGlobalsModule.__DEV__
local var2 = require(parent.SafeFlags).createGetFFlag("ReactPreventAssigningKeyToChildren")()
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
local var7 = nil
local _ = nil
local t_1 = nil

local var9 = function(_, _) --[[ line: 97 ]] end

if dEV then
	var7 = false
	local t_2 = {}
	t_1 = {}
	
	var9 = function(p0, p1) --[[ line: 119 ]]
		-- upvalues: invariant (ref), getComponentName (ref), t_2 (write), console (ref)
		if p0 == nil or type(p0) ~= "table" then return end
		if not p0._store or p0._store.validated or p0.key ~= nil then return end
		invariant(p0._store ~= nil and type(p0._store) == "table", "React Component in warnForMissingKey should have a _store. This error is likely caused by a bug in React. Please file an issue.")
		p0._store.validated = true
		local type = getComponentName(p1.type) or "Component"
		
		if t_2[type] then
			return
		end
		t_2[type] = true
		console.error("Each child in a list should have a unique \"key\" prop. See https://reactjs.org/link/warning-keys for more information.")
	end
end
local isArray = array.isArray

function coerceRef(p2, _, p3) --[[ line: 150 ]]
	-- upvalues: dEV (ref), getComponentName (ref), error (ref)
	local ref = p3.ref
	
	if ref ~= nil and type(ref) == "string" then
		if not p3._owner or not p3._self or p3._owner.stateNode == p3._self then
			error(error.new(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref", if dEV then getComponentName(p2.type) or "Component" else "<enable __DEV__ mode for component names>", tostring(ref))))
		end
		if not p3._owner then
			error("Expected ref to be a function or an object returned by React.createRef(), or nil.")
		end
	end
	return ref
end

local function _(p4) --[[ line: 323 | named "warnOnFunctionType" ]]
	-- upvalues: dEV (ref), getComponentName (ref), t_1 (write), console (ref)
	if dEV then
		local type = getComponentName(p4.type) or "Component"
		
		if t_1[type] then return end
		t_1[type] = true
		console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
	end
end

function resolveLazyType(p5) --[[ line: 342 ]]
	-- upvalues: describeError (ref)
	local ok, status = xpcall(p5._init, describeError, p5._payload)
	
	return if ok then status else p5
end

local function ChildReconciler(p6) --[[ line: 360 ]]
	-- upvalues: deletion (ref), createWorkInProgress (ref), placement (ref), hostText (ref), createFiberFromText (ref), dEV (ref), isCompatibleFamilyForHotReloading (ref), enableBlocksAPI (ref), block (ref), REACT_LAZY_TYPE (ref), REACT_BLOCK_TYPE (ref), createFiberFromElement (ref), hostPortal (ref), createFiberFromPortal (ref), fragment (ref), createFiberFromFragment (ref), REACT_ELEMENT_TYPE (ref), REACT_PORTAL_TYPE (ref), enableLazyElements (ref), getComponentName (ref), t_1 (write), console (ref), REACT_FRAGMENT_TYPE (ref), var9 (write), var2 (ref), var7 (write), isArray (ref), getIteratorFn (ref)
	local function _(p7, p8) --[[ line: 361 | named "deleteChild" ]]
		-- upvalues: p6 (ref), deletion (copy)
		if not p6 then return end
		local deletions = p7.deletions
		
		if deletions == nil then
			p7.deletions = { p8 }
			p7.flags = bit32.bor(p7.flags, deletion)
			
			return
		end
		table.insert(deletions, p8)
	end
	
	local _ = function(p9, p10) --[[ line: 375 | named "deleteRemainingChildren" ]]
		-- upvalues: p6 (ref), deletion (copy)
		if not p6 then
			return nil
		end
		local var27 = p10
		while var27 ~= nil do
			local var28 = var27
			
			if p6 then
				local deletions = p9.deletions
				
				if deletions == nil then
					p9.deletions = { var28 }
					p9.flags = bit32.bor(p9.flags, deletion)
				else
					table.insert(deletions, var28)
				end
			end
			var27 = var27.sibling
		end
		return nil
	end
	
	local function mapRemainingChildren(_, p11) --[[ line: 394 ]]
		local t = {}
		local var30 = p11
		while var30 ~= nil do
			if var30.key == nil then
				t[var30.index] = var30
			else
				t[var30.key] = var30
			end
			var30 = var30.sibling
		end
		return t
	end
	
	local _ = function(p12, p13) --[[ line: 416 | named "useFiber" ]]
		-- upvalues: createWorkInProgress (copy)
		local var31 = createWorkInProgress(p12, p13)
		var31.index = 1
		var31.sibling = nil
		
		return var31
	end
	
	local _ = function(p14, p15, p16) --[[ line: 426 | named "placeChild" ]]
		-- upvalues: p6 (ref), placement (copy)
		p14.index = p16
		
		if not p6 then
			return p15
		end
		local alternate = p14.alternate
		
		if alternate == nil then
			p14.flags = bit32.bor(p14.flags, placement)
			
			return p15
		end
		local index = alternate.index
		
		if index < p15 then
			p14.flags = bit32.bor(p14.flags, placement)
			
			return p15
		end
		return index
	end
	
	local _ = function(p17) --[[ line: 454 | named "placeSingleChild" ]]
		-- upvalues: p6 (ref), placement (copy)
		if p6 and p17.alternate == nil then
			p17.flags = bit32.bor(p17.flags, placement)
		end
		return p17
	end
	
	local _ = function(p18, p19, p20, p21) --[[ line: 463 | named "updateTextNode" ]]
		-- upvalues: hostText (copy), createFiberFromText (copy), createWorkInProgress (copy)
		if p19 == nil or p19.tag ~= hostText then
			local var32 = createFiberFromText(p20, p18.mode, p21)
			var32.return_ = p18
			
			return var32
		end
		local var33 = createWorkInProgress(p19, p20)
		var33.index = 1
		var33.sibling = nil
		var33.return_ = p18
		
		return var33
	end
	
	local function updateElement(p22, p23, p24, p25) --[[ line: 483 ]]
		-- upvalues: dEV (copy), isCompatibleFamilyForHotReloading (copy), createWorkInProgress (copy), enableBlocksAPI (copy), block (copy), REACT_LAZY_TYPE (copy), REACT_BLOCK_TYPE (copy), createFiberFromElement (copy)
		if p23 ~= nil then
			if p23.elementType == p24.type or dEV and isCompatibleFamilyForHotReloading(p23, p24) then
				local var34 = createWorkInProgress(p23, p24.props)
				var34.index = 1
				var34.sibling = nil
				local var35 = var34
				var35.ref = coerceRef(p22, p23, p24)
				var35.return_ = p22
				
				if dEV then
					var35._debugSource = p24._source
					var35._debugOwner = p24._owner
				end
				return var35
			elseif enableBlocksAPI and p23.tag == block then
				local type = p24.type
				
				if type(type) == "table" and type["$$typeof"] == REACT_LAZY_TYPE then
					type = resolveLazyType(type)
				end
				if type["$$typeof"] ~= REACT_BLOCK_TYPE or type._render ~= p23.type._render then
					local var38 = createFiberFromElement(p24, p22.mode, p25)
					var38.ref = coerceRef(p22, p23, p24)
					var38.return_ = p22
					
					return var38
				end
				local var36 = createWorkInProgress(p23, p24.props)
				var36.index = 1
				var36.sibling = nil
				local var37 = var36
				var37.return_ = p22
				var37.type = type
				
				if dEV then
					var37._debugSource = p24._source
					var37._debugOwner = p24._owner
				end
				return var37
			end
		end
	end
	
	local function updatePortal(p26, p27, p28, p29) --[[ line: 534 ]]
		-- upvalues: hostPortal (copy), createFiberFromPortal (copy), createWorkInProgress (copy)
		if p27 == nil or p27.tag ~= hostPortal or (p27.stateNode.containerInfo ~= p28.containerInfo or p27.stateNode.implementation ~= p28.implementation) then
			local var39 = createFiberFromPortal(p28, p26.mode, p29)
			var39.return_ = p26
			
			return var39
		end
		local var40 = createWorkInProgress(p27, p28.children or {})
		var40.index = 1
		var40.sibling = nil
		var40.return_ = p26
		
		return var40
	end
	
	local _ = function(p30, p31, p32, p33, p34) --[[ line: 559 | named "updateFragment" ]]
		-- upvalues: fragment (copy), createFiberFromFragment (copy), createWorkInProgress (copy)
		if p31 == nil or p31.tag ~= fragment then
			local var41 = createFiberFromFragment(p32, p30.mode, p33, p34)
			var41.return_ = p30
			
			return var41
		end
		local var42 = createWorkInProgress(p31, p32)
		var42.index = 1
		var42.sibling = nil
		var42.return_ = p30
		
		return var42
	end
	
	local _ = function(value, p35) --[[ line: 586 | named "assignStableKey" ]]
		if p35.key == nil then
			local var43 = type(value)
			
			if var43 == "string" or var43 == "number" then
				p35.key = value
				
				return
			elseif var43 == "table" then
				p35.key = tostring(value)
			end
		end
	end
	
	local function createChild(p36, p37, p38, p39) --[[ line: 605 ]]
		-- upvalues: REACT_ELEMENT_TYPE (copy), createFiberFromElement (copy), REACT_PORTAL_TYPE (copy), createFiberFromPortal (copy), REACT_LAZY_TYPE (copy), enableLazyElements (copy), createChild (ref), createFiberFromFragment (copy), createFiberFromText (copy), dEV (copy), getComponentName (copy), t_1 (copy), console (copy)
		if p37 == nil then
			return nil
		end
		local var45
		local var44 = type(p37)
		
		if var44 == "table" then
			if p37.key == nil then
				var45 = type(p39)
				
				if var45 == "string" or var45 == "number" then
					p37.key = p39
				elseif var45 == "table" then
					p37.key = tostring(p39)
				end
			end
			var45 = p37["$$typeof"]
			
			if var45 == REACT_ELEMENT_TYPE then
				local var46 = createFiberFromElement(p37, p36.mode, p38)
				var46.ref = coerceRef(p36, nil, p37)
				var46.return_ = p36
				
				return var46
			elseif var45 == REACT_PORTAL_TYPE then
				local var47 = createFiberFromPortal(p37, p36.mode, p38)
				var47.return_ = p36
				
				return var47
			elseif var45 == REACT_LAZY_TYPE and enableLazyElements then
				return createChild(p36, p37._init(p37._payload), p38)
			end
			local var48 = createFiberFromFragment(p37, p36.mode, p38, nil)
			var48.return_ = p36
			
			return var48
		elseif var44 == "string" or var44 == "number" then
			var45 = createFiberFromText(tostring(p37), p36.mode, p38)
			var45.return_ = p36
			
			return var45
		elseif dEV and var44 == "function" and dEV then
			var45 = getComponentName(p36.type) or "Component"
			
			if not t_1[var45] then
				t_1[var45] = true
				console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
			end
		end
		return nil
	end
	
	local function updateSlot(p40, p41, p42, p43, p44) --[[ line: 676 ]]
		-- upvalues: REACT_ELEMENT_TYPE (copy), REACT_FRAGMENT_TYPE (copy), fragment (copy), createFiberFromFragment (copy), createWorkInProgress (copy), updateElement (ref), REACT_PORTAL_TYPE (copy), updatePortal (ref), REACT_LAZY_TYPE (copy), enableLazyElements (copy), updateSlot (ref), hostText (copy), createFiberFromText (copy), dEV (copy), getComponentName (copy), t_1 (copy), console (copy)
		if p42 == nil then
			return nil
		end
		local var51
		local var49 = if p41 ~= nil then nil else p41.key
		local var50 = type(p42)
		
		if var50 == "table" then
			if p42.key == nil then
				var51 = type(p44)
				
				if var51 == "string" or var51 == "number" then
					p42.key = p44
				elseif var51 == "table" then
					p42.key = tostring(p44)
				end
			end
			var51 = p42["$$typeof"]
			
			if var51 == REACT_ELEMENT_TYPE then
				if p42.key == var49 then
					if p42.type == REACT_FRAGMENT_TYPE then
						local children = p42.props.children
						
						if p41 == nil or p41.tag ~= fragment then
							local var52 = createFiberFromFragment(children, p40.mode, p43, var49)
							var52.return_ = p40
							
							return var52
						end
						local var53 = createWorkInProgress(p41, children)
						var53.index = 1
						var53.sibling = nil
						local var54 = var53
						var54.return_ = p40
						
						return var54
					else
						return updateElement(p40, p41, p42, p43)
					end
				else
					return nil
				end
			elseif var51 == REACT_PORTAL_TYPE then
				return if p42.key == var49 then updatePortal(p40, p41, p42, p43) else nil
			elseif var51 == REACT_LAZY_TYPE and enableLazyElements then
				return updateSlot(p40, p41, p42._init(p42._payload), p43)
			elseif var49 ~= nil then
				return nil
			elseif p41 == nil or p41.tag ~= fragment then
				local var55 = createFiberFromFragment(p42, p40.mode, p43, nil)
				var55.return_ = p40
				
				return var55
			end
			local var56 = createWorkInProgress(p41, p42)
			var56.index = 1
			var56.sibling = nil
			local var57 = var56
			var57.return_ = p40
			
			return var57
		elseif var50 == "string" or var50 == "number" then
			if var49 ~= nil then
				return nil
			end
			local var58 = tostring(p42)
			
			if p41 == nil or p41.tag ~= hostText then
				local var59 = createFiberFromText(var58, p40.mode, p43)
				var59.return_ = p40
				
				return var59
			end
			local var60 = createWorkInProgress(p41, var58)
			var60.index = 1
			var60.sibling = nil
			local var61 = var60
			var61.return_ = p40
			
			return var61
		elseif dEV and var50 == "function" and dEV then
			var51 = getComponentName(p40.type) or "Component"
			
			if not t_1[var51] then
				t_1[var51] = true
				console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
			end
		end
		return nil
	end
	
	local function updateFromMap(p45, p46, p47, p48, p49, p50) --[[ line: 764 ]]
		-- upvalues: REACT_ELEMENT_TYPE (copy), REACT_FRAGMENT_TYPE (copy), fragment (copy), createFiberFromFragment (copy), createWorkInProgress (copy), updateElement (ref), REACT_PORTAL_TYPE (copy), updatePortal (ref), REACT_LAZY_TYPE (copy), enableLazyElements (copy), updateFromMap (ref), hostText (copy), createFiberFromText (copy), dEV (copy), getComponentName (copy), t_1 (copy), console (copy)
		if p48 == nil then
			return nil
		end
		local var63, var65
		local var62 = type(p48)
		
		if var62 == "table" then
			if p48.key == nil then
				var63 = type(p50)
				
				if var63 == "string" or var63 == "number" then
					p48.key = p50
				elseif var63 == "table" then
					p48.key = tostring(p50)
				end
			end
			var63 = nil
			local var64 = p48["$$typeof"]
			
			if var64 == REACT_ELEMENT_TYPE then
				var65 = p45[if p48.key == nil then p47 else p48.key]
				
				if p48.type == REACT_FRAGMENT_TYPE then
					local children = p48.props.children
					local key = p48.key
					
					if var65 == nil or var65.tag ~= fragment then
						local var66 = createFiberFromFragment(children, p46.mode, p49, key)
						var66.return_ = p46
						
						return var66
					end
					local var67 = createWorkInProgress(var65, children)
					var67.index = 1
					var67.sibling = nil
					local var68 = var67
					var68.return_ = p46
					
					return var68
				else
					return updateElement(p46, var65, p48, p49)
				end
			elseif var64 == REACT_PORTAL_TYPE then
				return updatePortal(p46, p45[if p48.key == nil then p47 else p48.key], p48, p49)
			elseif var64 == REACT_LAZY_TYPE and enableLazyElements then
				return updateFromMap(p45, p46, p47, p48._init(p48._payload), p49)
			end
			var65 = p45[p47]
			
			if var65 == nil or var65.tag ~= fragment then
				local var69 = createFiberFromFragment(p48, p46.mode, p49, nil)
				var69.return_ = p46
				
				return var69
			end
			local var70 = createWorkInProgress(var65, p48)
			var70.index = 1
			var70.sibling = nil
			local var71 = var70
			var71.return_ = p46
			
			return var71
		elseif var62 == "string" or var62 == "number" then
			var63 = p45[p47] or nil
			var65 = tostring(p48)
			
			if var63 == nil or var63.tag ~= hostText then
				local var72 = createFiberFromText(var65, p46.mode, p49)
				var72.return_ = p46
				
				return var72
			end
			local var73 = createWorkInProgress(var63, var65)
			var73.index = 1
			var73.sibling = nil
			local var74 = var73
			var74.return_ = p46
			
			return var74
		elseif dEV and var62 == "function" and dEV then
			var63 = getComponentName(p46.type) or "Component"
			
			if not t_1[var63] then
				t_1[var63] = true
				console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
			end
		end
		return nil
	end
	
	local function warnOnInvalidKey(p51, p52, p53) --[[ line: 858 ]]
		-- upvalues: dEV (copy), REACT_ELEMENT_TYPE (copy), REACT_PORTAL_TYPE (copy), var9 (copy), console (copy), REACT_LAZY_TYPE (copy), enableLazyElements (copy), warnOnInvalidKey (ref)
		if dEV then
			if p51 == nil or type(p51) ~= "table" then
				return p52
			end
			local var75 = p51["$$typeof"]
			
			if var75 == REACT_ELEMENT_TYPE or var75 == REACT_PORTAL_TYPE then
				var9(p51, p53)
				local key = p51.key
				
				if type(key) ~= "string" then
					return p52
				elseif p52 == nil then
					p52 = { [key] = true }
					
					return p52
				elseif p52[key] then
					console.error("Encountered two children with the same key, `%s`. Keys should be unique so that components maintain their identity across updates. Non-unique keys may cause children to be duplicated and/or omitted \226\128\148 the behavior is unsupported and could change in a future version.", key)
					
					return p52
				end
				p52[key] = true
				
				return p52
			elseif var75 == REACT_LAZY_TYPE and enableLazyElements then
				warnOnInvalidKey(p51._init(p51._payload), p52, p53)
			end
		end
		return p52
	end
	
	local function reconcileChildrenArray(p54, p55, p56, p57) --[[ line: 900 ]]
		-- upvalues: dEV (copy), warnOnInvalidKey (ref), updateSlot (ref), p6 (ref), deletion (copy), placement (copy), createChild (ref), mapRemainingChildren (ref), var2 (copy), updateFromMap (ref)
		if dEV then
			local var76 = nil
			
			for i, v in p56 do
				var76 = warnOnInvalidKey(v, var76, p54)
			end
		end
		local var83, var85
		local var77 = nil
		local var78 = nil
		local var79 = p55
		local var80 = 1
		local var81 = 1
		local _ = nil
		local p56Count = #p56
		while var79 ~= nil and var81 <= p56Count do
			if var81 < var79.index then
				var83 = var79
				var79 = nil
			else
				var83 = var79.sibling
			end
			local var84 = nil
			var85 = p56[var81]
			var84 = if var85 == nil or type(var85) ~= "table" or var85["$$typeof"] == nil then updateSlot(p54, var79, var85, p57) else updateSlot(p54, var79, var85, p57, var81)
			
			if var84 ~= nil then
				if p6 and var79 and var84.alternate == nil then
					local var86 = var79
					
					if p6 then
						local deletions = p54.deletions
						
						if deletions == nil then
							p54.deletions = { var86 }
							p54.flags = bit32.bor(p54.flags, deletion)
						else
							table.insert(deletions, var86)
						end
					end
				end
				local var87 = var84
				local var88 = var80
				var87.index = var81
				
				if p6 then
					local alternate = var87.alternate
					
					if alternate == nil then
						var87.flags = bit32.bor(var87.flags, placement)
						var80 = var88
					else
						local index = alternate.index
						
						if index < var88 then
							var87.flags = bit32.bor(var87.flags, placement)
							var80 = var88
						else
							var80 = index
						end
					end
				else
					var80 = var88
				end
				if var78 == nil then
					var77 = var84
				else
					var78.sibling = var84
				end
				var78 = var84
				var79 = var83
				var81 += 1
			elseif var79 ~= nil then
				break
			end
			var79 = var83
			break
		end
		local var91
		if p56Count < var81 then
			local var89 = var79
			
			if not p6 then
				return var77
			end
			var85 = var89
			while var85 ~= nil do
				local var90 = var85
				
				if p6 then
					local deletions = p54.deletions
					
					if deletions == nil then
						p54.deletions = { var90 }
						p54.flags = bit32.bor(p54.flags, deletion)
					else
						table.insert(deletions, var90)
					end
				end
				var85 = var85.sibling
			end
			return var77
		elseif var79 == nil then
			while var81 <= p56Count do
				var91 = nil
				var85 = p56[var81]
				var91 = if var85 == nil or type(var85) ~= "table" or var85["$$typeof"] == nil then createChild(p54, var85, p57) else createChild(p54, var85, p57, var81)
				
				if var91 == nil then
					var81 += 1
					continue
				end
				local var92 = var91
				local var93 = var80
				var92.index = var81
				
				if p6 then
					local alternate = var92.alternate
					
					if alternate == nil then
						var92.flags = bit32.bor(var92.flags, placement)
						var80 = var93
					else
						local index = alternate.index
						
						if index < var93 then
							var92.flags = bit32.bor(var92.flags, placement)
							var80 = var93
						else
							var80 = index
						end
					end
				else
					var80 = var93
				end
				if var78 == nil then
					var77 = var91
				else
					var78.sibling = var91
				end
				var78 = var91
				var81 += 1
			end
			return var77
		else
			var91 = mapRemainingChildren(p54, var79)
			while var81 <= p56Count do
				var85 = nil
				local var94 = p56[var81]
				var85 = if var2 and (var94 == nil or type(var94) ~= "table" or var94["$$typeof"] == nil) then updateFromMap(var91, p54, var81, var94, p57) else updateFromMap(var91, p54, var81, var94, p57, var81)
				
				if var85 == nil then
					var81 += 1
					continue
				end
				if p6 and var85.alternate ~= nil then
					var91[if var85.key == nil then var81 else var85.key] = nil
				end
				local var95 = var85
				local var96 = var80
				var95.index = var81
				
				if p6 then
					local alternate = var95.alternate
					
					if alternate == nil then
						var95.flags = bit32.bor(var95.flags, placement)
						var80 = var96
					else
						local index = alternate.index
						
						if index < var96 then
							var95.flags = bit32.bor(var95.flags, placement)
							var80 = var96
						else
							var80 = index
						end
					end
				else
					var80 = var96
				end
				if var78 == nil then
					var77 = var85
				else
					var78.sibling = var85
				end
				var78 = var85
			end
			if p6 then
				for i, v in var91 do
					if p6 then
						local deletions = p54.deletions
						
						if deletions == nil then
							p54.deletions = { v }
							p54.flags = bit32.bor(p54.flags, deletion)
						else
							table.insert(deletions, v)
						end
					end
				end
			end
			return var77
		end
	end
	
	local function reconcileChildrenIterator(p58, p59, p60, p61, p62) --[[ line: 1127 ]]
		-- upvalues: dEV (copy), var7 (copy), console (copy), warnOnInvalidKey (ref), updateSlot (ref), p6 (ref), deletion (copy), placement (copy), createChild (ref), mapRemainingChildren (ref), updateFromMap (ref)
		if dEV then
			if p60.entries == p62 then
				if not var7 then
					console.error("Using Maps as children is not supported. Use an array of keyed ReactElements instead.")
				end
				var7 = true
			end
			local var97 = p62(p60)
			
			if var97 then
				local var98 = nil
				local var99 = var97.next()
				while not var99.done do
					var99 = var97.next()
					var98 = warnOnInvalidKey(var99.value, var98, p58)
				end
			end
		end
		local var107
		local var100 = p62(p60)
		local var101 = nil
		local var102 = nil
		local var103 = p59
		local var104 = 1
		local var105 = 1
		local _ = nil
		local var106 = var100.next()
		while var103 ~= nil and not var106.done do
			if var105 < var103.index then
				var107 = var103
				var103 = nil
			else
				var107 = var103.sibling
			end
			local var108 = updateSlot(p58, var103, var106.value, p61, var106.key)
			
			if var108 ~= nil then
				if p6 and var103 and var108.alternate == nil then
					local var109 = var103
					
					if p6 then
						local deletions = p58.deletions
						
						if deletions == nil then
							p58.deletions = { var109 }
							p58.flags = bit32.bor(p58.flags, deletion)
						else
							table.insert(deletions, var109)
						end
					end
				end
				var108.index = var105
				
				if p6 then
					local alternate = var108.alternate
					
					if alternate == nil then
						var108.flags = bit32.bor(var108.flags, placement)
						var104 = var104
					else
						local index = alternate.index
						
						if index < var104 then
							var108.flags = bit32.bor(var108.flags, placement)
							var104 = var104
						else
							var104 = index
						end
					end
				else
					var104 = var104
				end
				if var102 == nil then
					var101 = var108
				else
					var102.sibling = var108
				end
				var102 = var108
				var103 = var107
				var105 += 1
				var106 = var100.next()
			elseif var103 ~= nil then
				break
			end
			var103 = var107
			break
		end
		local var113
		if var106.done then
			local var110 = var103
			
			if not p6 then
				return var101
			end
			local var111 = var110
			while var111 ~= nil do
				local var112 = var111
				
				if p6 then
					local deletions = p58.deletions
					
					if deletions == nil then
						p58.deletions = { var112 }
						p58.flags = bit32.bor(p58.flags, deletion)
					else
						table.insert(deletions, var112)
					end
				end
				var111 = var111.sibling
			end
			return var101
		elseif var103 == nil then
			while not var106.done do
				var113 = createChild(p58, var106.value, p61, var106.key)
				
				if var113 == nil then
					var105 += 1
					var106 = var100.next()
					continue
				end
				var113.index = var105
				
				if p6 then
					local alternate = var113.alternate
					
					if alternate == nil then
						var113.flags = bit32.bor(var113.flags, placement)
						var104 = var104
					else
						local index = alternate.index
						
						if index < var104 then
							var113.flags = bit32.bor(var113.flags, placement)
							var104 = var104
						else
							var104 = index
						end
					end
				else
					var104 = var104
				end
				if var102 == nil then
					var101 = var113
				else
					var102.sibling = var113
				end
				var102 = var113
				var105 += 1
				var106 = var100.next()
			end
			return var101
		else
			var113 = nil
			while not var106.done do
				if not var113 then
					var113 = mapRemainingChildren(p58, var103)
				end
				local var114 = updateFromMap(var113, p58, var105, var106.value, p61, var106.key)
				
				if var114 == nil then
					var105 += 1
					var106 = var100.next()
					continue
				end
				if p6 and var114.alternate ~= nil then
					if var114.key == nil then
						var113[var105] = nil
					else
						var113[var114.key] = nil
					end
				end
				local var115 = var104
				var114.index = var105
				
				if p6 then
					local alternate = var114.alternate
					
					if alternate == nil then
						var114.flags = bit32.bor(var114.flags, placement)
						var104 = var115
					else
						local index = alternate.index
						
						if index < var115 then
							var114.flags = bit32.bor(var114.flags, placement)
							var104 = var115
						else
							var104 = index
						end
					end
				else
					var104 = var115
				end
				if var102 == nil then
					var101 = var114
				else
					var102.sibling = var114
				end
				var102 = var114
			end
			if p6 then
				for i, v in var113 do
					if p6 then
						local deletions = p58.deletions
						
						if deletions == nil then
							p58.deletions = { v }
							p58.flags = bit32.bor(p58.flags, deletion)
						else
							table.insert(deletions, v)
						end
					end
				end
			end
			return var101
		end
	end
	
	local function reconcileSingleTextNode(p63, p64, p65, p66) --[[ line: 1340 ]]
		-- upvalues: hostText (copy), p6 (ref), deletion (copy), createWorkInProgress (copy), createFiberFromText (copy)
		if p64 == nil or p64.tag ~= hostText then
			if p6 then
				local var120 = p64
				while var120 ~= nil do
					local var121 = var120
					
					if p6 then
						local deletions = p63.deletions
						
						if deletions == nil then
							p63.deletions = { var121 }
							p63.flags = bit32.bor(p63.flags, deletion)
						else
							table.insert(deletions, var121)
						end
					end
					var120 = var120.sibling
				end
			end
			local var122 = createFiberFromText(p65, p63.mode, p66)
			var122.return_ = p63
			
			return var122
		else
			local sibling = p64.sibling
			
			if p6 then
				local var116 = sibling
				while var116 ~= nil do
					local var117 = var116
					
					if p6 then
						local deletions = p63.deletions
						
						if deletions == nil then
							p63.deletions = { var117 }
							p63.flags = bit32.bor(p63.flags, deletion)
						else
							table.insert(deletions, var117)
						end
					end
					var116 = var116.sibling
				end
			end
			local var118 = createWorkInProgress(p64, p65)
			var118.index = 1
			var118.sibling = nil
			local var119 = var118
			var119.return_ = p63
			
			return var119
		end
	end
	
	local function reconcileSingleElement(p67, p68, p69, p70) --[[ line: 1365 ]]
		-- upvalues: fragment (copy), REACT_FRAGMENT_TYPE (copy), p6 (ref), deletion (copy), createWorkInProgress (copy), dEV (copy), isCompatibleFamilyForHotReloading (copy), createFiberFromFragment (copy), createFiberFromElement (copy)
		local key = p69.key
		local var123 = p68
		while var123 ~= nil do
			if var123.key ~= key then
				local var134 = var123
				
				if p6 then
					local deletions = p67.deletions
					
					if deletions == nil then
						p67.deletions = { var134 }
						p67.flags = bit32.bor(p67.flags, deletion)
					else
						table.insert(deletions, var134)
					end
				end
				var123 = var123.sibling
			end
			if var123.tag == fragment then
				if p69.type == REACT_FRAGMENT_TYPE then
					local sibling = var123.sibling
					
					if p6 then
						local var124 = sibling
						while var124 ~= nil do
							local var125 = var124
							
							if p6 then
								local deletions = p67.deletions
								
								if deletions == nil then
									p67.deletions = { var125 }
									p67.flags = bit32.bor(p67.flags, deletion)
								else
									table.insert(deletions, var125)
								end
							end
							var124 = var124.sibling
						end
					end
					local var126 = createWorkInProgress(var123, p69.props.children)
					var126.index = 1
					var126.sibling = nil
					var126.return_ = p67
					
					if dEV then
						var126._debugSource = p69._source
						var126._debugOwner = p69._owner
					end
					return var126
				else
					local var131 = var123
					
					if not p6 then break end
					local var132 = var131
					while var132 ~= nil do
						local var133 = var132
						
						if p6 then
							local deletions = p67.deletions
							
							if deletions == nil then
								p67.deletions = { var133 }
								p67.flags = bit32.bor(p67.flags, deletion)
							else
								table.insert(deletions, var133)
							end
						end
						var132 = var132.sibling
					end
				end
			elseif var123.elementType == p69.type or dEV and isCompatibleFamilyForHotReloading(var123, p69) then
				local sibling = var123.sibling
				
				if p6 then
					local var127 = sibling
					while var127 ~= nil do
						local var128 = var127
						
						if p6 then
							local deletions = p67.deletions
							
							if deletions == nil then
								p67.deletions = { var128 }
								p67.flags = bit32.bor(p67.flags, deletion)
							else
								table.insert(deletions, var128)
							end
						end
						var127 = var127.sibling
					end
				end
				local var129 = createWorkInProgress(var123, p69.props)
				var129.index = 1
				var129.sibling = nil
				local var130 = var129
				var130.ref = coerceRef(p67, var123, p69)
				var130.return_ = p67
				
				if dEV then
					var130._debugSource = p69._source
					var130._debugOwner = p69._owner
				end
				return var130
			end
		end
		if p69.type == REACT_FRAGMENT_TYPE then
			local var135 = createFiberFromFragment(p69.props.children, p67.mode, p70, p69.key)
			var135.return_ = p67
			
			return var135
		end
		local var136 = createFiberFromElement(p69, p67.mode, p70)
		var136.ref = coerceRef(p67, p68, p69)
		var136.return_ = p67
		
		return var136
	end
	
	local function reconcileSinglePortal(p71, p72, p73, p74) --[[ line: 1460 ]]
		-- upvalues: hostPortal (copy), p6 (ref), deletion (copy), createWorkInProgress (copy), createFiberFromPortal (copy)
		local key = p73.key
		local var137 = p72
		while var137 ~= nil do
			if var137.key == key then
				if var137.tag == hostPortal and var137.stateNode.containerInfo == p73.containerInfo and var137.stateNode.implementation == p73.implementation then
					local sibling = var137.sibling
					
					if p6 then
						local var138 = sibling
						while var138 ~= nil do
							local var139 = var138
							
							if p6 then
								local deletions = p71.deletions
								
								if deletions == nil then
									p71.deletions = { var139 }
									p71.flags = bit32.bor(p71.flags, deletion)
								else
									table.insert(deletions, var139)
								end
							end
							var138 = var138.sibling
						end
					end
					local var140 = createWorkInProgress(var137, p73.children or {})
					var140.index = 1
					var140.sibling = nil
					local var141 = var140
					var141.return_ = p71
					
					return var141
				else
					local var142 = var137
					
					if not p6 then break end
					local var143 = var142
					while var143 ~= nil do
						local var144 = var143
						
						if p6 then
							local deletions = p71.deletions
							
							if deletions == nil then
								p71.deletions = { var144 }
								p71.flags = bit32.bor(p71.flags, deletion)
							else
								table.insert(deletions, var144)
							end
						end
						var143 = var143.sibling
					end
				end
			else
				local var145 = var137
				
				if p6 then
					local deletions = p71.deletions
					
					if deletions == nil then
						p71.deletions = { var145 }
						p71.flags = bit32.bor(p71.flags, deletion)
					else
						table.insert(deletions, var145)
					end
				end
				var137 = var137.sibling
			end
		end
		local var146 = createFiberFromPortal(p73, p71.mode, p74)
		var146.return_ = p71
		
		return var146
	end
	
	local function reconcileChildFibers(p75, p76, p77, p78) --[[ line: 1499 ]]
		-- upvalues: REACT_FRAGMENT_TYPE (copy), isArray (copy), REACT_ELEMENT_TYPE (copy), reconcileSingleElement (ref), p6 (ref), placement (copy), REACT_PORTAL_TYPE (copy), reconcileSinglePortal (ref), REACT_LAZY_TYPE (copy), enableLazyElements (copy), reconcileChildFibers (ref), reconcileChildrenArray (ref), reconcileSingleTextNode (ref), getIteratorFn (copy), reconcileChildrenIterator (ref), dEV (copy), getComponentName (copy), t_1 (copy), console (copy), deletion (copy)
		local var147 = type(p77)
		
		if p77 ~= nil and (var147 == "table" and (p77.type == REACT_FRAGMENT_TYPE and p77.key == nil)) then
			p77 = p77.props.children
			var147 = type(p77)
		end
		local var148 = isArray(p77)
		
		if p77 ~= nil and (var147 == "table" and not var148) then
			local var150 = p77["$$typeof"]
			
			if var150 == REACT_ELEMENT_TYPE then
				local var151 = reconcileSingleElement(p75, p76, p77, p78)
				
				if p6 and var151.alternate == nil then
					var151.flags = bit32.bor(var151.flags, placement)
				end
				return var151
			elseif var150 == REACT_PORTAL_TYPE then
				local var152 = reconcileSinglePortal(p75, p76, p77, p78)
				
				if p6 and var152.alternate == nil then
					var152.flags = bit32.bor(var152.flags, placement)
				end
				return var152
			elseif var150 == REACT_LAZY_TYPE and enableLazyElements then
				return reconcileChildFibers(p75, p76, p77._init(p77._payload), p78)
			end
		elseif var148 then
			return reconcileChildrenArray(p75, p76, p77, p78)
		elseif var147 == "string" or var147 == "number" then
			local var149 = reconcileSingleTextNode(p75, p76, tostring(p77), p78)
			
			if p6 and var149.alternate == nil then
				var149.flags = bit32.bor(var149.flags, placement)
			end
			return var149
		else
			local var153 = getIteratorFn(p77)
			
			if var153 then
				return reconcileChildrenIterator(p75, p76, p77, p78, var153)
			elseif dEV and var147 == "function" and dEV then
				local type = getComponentName(p75.type) or "Component"
				
				if not t_1[type] then
					t_1[type] = true
					console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
				end
			end
			if p77 == nil then
				if not p6 then
					return nil
				end
				local var155 = p76
				while var155 ~= nil do
					local var156 = var155
					
					if p6 then
						local deletions = p75.deletions
						
						if deletions == nil then
							p75.deletions = { var156 }
							p75.flags = bit32.bor(p75.flags, deletion)
						else
							table.insert(deletions, var156)
						end
					end
					var155 = var155.sibling
				end
				return nil
			end
		end
	end
	
	return reconcileChildFibers
end

t.reconcileChildFibers = ChildReconciler(true)
t.mountChildFibers = ChildReconciler(false)

function t.cloneChildFibers(_, p79) --[[ line: 1647 ]]
	-- upvalues: createWorkInProgress (ref)
	if p79.child == nil then return end
	local child = p79.child
	local var157 = createWorkInProgress(child, child.pendingProps)
	p79.child = var157
	var157.return_ = p79
	while child.sibling ~= nil do
		child = child.sibling
		var157.sibling = createWorkInProgress(child, child.pendingProps)
		var157 = var157.sibling
		var157.return_ = p79
	end
	var157.sibling = nil
end

function t.resetChildFibers(p80, p81) --[[ line: 1674 ]]
	-- upvalues: resetWorkInProgress (ref)
	local child = p80.child
	while child ~= nil do
		resetWorkInProgress(child, p81)
		child = child.sibling
	end
end

return t