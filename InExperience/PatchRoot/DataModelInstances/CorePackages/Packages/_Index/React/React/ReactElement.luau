local parent = script.Parent.Parent
local error = require(parent.LuauPolyfill).Error
local dEV = require(parent.ReactGlobals).__DEV__
local console = require(parent.Shared).console
local _ = require(parent.Shared)
local _ = require(script.Parent.ReactLazy)
local getComponentName = require(parent.Shared).getComponentName
local REACT_ELEMENT_TYPE = require(parent.Shared).ReactSymbols.REACT_ELEMENT_TYPE
local reactCurrentOwner = require(parent.Shared).ReactSharedInternals.ReactCurrentOwner
local t = { key = true, ref = true, __self = true, __source = true }
local var1 = nil
local var2 = nil
local var3 = if dEV then {} else nil
local t_1 = {
	jsx = function(_, _, _)
		error("JSX is currently unsupported")
	end,
	jsxDEV = function(_, _, _, _, _)
		error("JSX is currently unsupported")
		
		return nil
	end
}

local function _(p1)
	-- upvalues: dEV (ref)
	return if dEV and p1.ref ~= nil and (type(p1.ref) == "table" and p1.ref.isReactWarning) then false else p1.ref ~= nil
end

local _ = function(p1)
	-- upvalues: dEV (ref)
	return if dEV and p1.key ~= nil and (type(p1.key) == "table" and p1.key.isReactWarning) then false else p1.key ~= nil
end

local t_2 = { isReactWarning = true }

local function defineKeyPropWarningGetter(p1, p2)
	-- upvalues: dEV (ref), var1 (write), console (ref), t_2 (ref)
	local _ = function()
		-- upvalues: dEV (copy), var1 (copy), console (copy), p2 (ref)
		if dEV and not var1 then
			var1 = true
			console.error("%s: `key` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", p2)
		end
	end
	
	p1.key = nil
	setmetatable(p1, {
		__index = function(_, p3)
			-- upvalues: dEV (copy), var1 (copy), console (copy), p2 (ref), t_2 (copy)
			if p3 ~= "key" then
				return nil
			elseif dEV and not var1 then
				var1 = true
				console.error("%s: `key` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", p2)
			end
			return t_2
		end
	})
end

local function defineRefPropWarningGetter(p1, p2)
	-- upvalues: dEV (ref), var2 (write), console (ref), t_2 (ref)
	local _ = function()
		-- upvalues: dEV (copy), var2 (copy), console (copy), p2 (ref)
		if dEV and not var2 then
			var2 = true
			console.error("%s: `ref` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", p2)
		end
	end
	
	p1.ref = nil
	setmetatable(p1, {
		__index = function(_, p3)
			-- upvalues: dEV (copy), var2 (copy), console (copy), p2 (ref), t_2 (copy)
			if p3 ~= "ref" then
				return nil
			elseif dEV and not var2 then
				var2 = true
				console.error("%s: `ref` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", p2)
			end
			return t_2
		end
	})
end

local function warnIfStringRefCannotBeAutoConverted(p1)
	-- upvalues: dEV (ref), reactCurrentOwner (ref), getComponentName (ref), var3 (write)
	if dEV and type(p1.ref) == "string" and reactCurrentOwner.current then
		local var4 = getComponentName(reactCurrentOwner.current.type)
		
		if not var3[var4] then
			error(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref", var4 or "Unknown", p1.ref))
		end
	end
end

local function ReactElement(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: REACT_ELEMENT_TYPE (ref), dEV (ref)
	local t = {
		type = p1,
		key = p2,
		ref = p3,
		props = p7,
		_owner = p6,
		["$$typeof"] = REACT_ELEMENT_TYPE
	}
	
	if dEV then
		local t_1 = { validated = false }
		t._store = setmetatable({}, {
			__index = t_1,
			__newindex = function(p8, p9, p10)
				-- upvalues: t_1 (ref)
				if p9 == "validated" then
					t_1.validated = p10
					
					return
				end
				rawset(p8, p9, p10)
			end
		})
		setmetatable(t, { __index = { _self = p4, _source = p5 } })
	end
	return t
end

function t_1.createElement(p1, p2, ...)
	-- upvalues: dEV (ref), warnIfStringRefCannotBeAutoConverted (ref), defineKeyPropWarningGetter (ref), defineRefPropWarningGetter (ref), ReactElement (ref), reactCurrentOwner (ref)
	local var4 = if p2 ~= nil then {} else table.clone(p2)
	local var5 = nil
	local ref = nil
	local t = nil
	
	if p2 ~= nil then
		if if dEV and p2.ref ~= nil and (type(p2.ref) == "table" and p2.ref.isReactWarning) then false else p2.ref ~= nil then
			ref = p2.ref
			
			if dEV then
				warnIfStringRefCannotBeAutoConverted(p2)
			end
		end
		local var6 = if dEV and p2.key ~= nil and (type(p2.key) == "table" and p2.key.isReactWarning) then false else p2.key ~= nil
		
		if var6 then
			var6 = p2.key
			var5 = if type(var6) == "number" then var6 else tostring(var6)
		end
		t = if p2.__source == nil then nil else p2.__source
		
		if var4.key ~= nil then
			var4.key = nil
		end
		if var4.ref ~= nil then
			var4.ref = nil
		end
		if var4.__self ~= nil then
			var4.__self = nil
		end
		if var4.__source ~= nil then
			var4.__source = nil
		end
	end
	local var7 = select("#", ...)
	
	if var7 == 1 then
		var4.children = select(1, ...)
	elseif var7 > 1 then
		local list = table.create(var7)
		
		for i = 1, var7 do
			table.insert(list, select(i, ...))
		end
		if dEV then
			table.freeze(list)
		end
		var4.children = list
	end
	if type(p1) == "table" and p1.defaultProps then
		local defaultProps = p1.defaultProps
		
		for i_1, v in defaultProps do
			if var4[i_1] == nil then
				var4[i_1] = defaultProps[i_1]
			end
		end
	end
	if dEV then
		if var5 or ref then
			local _ = nil
			local var8 = if type(p1) == "function" then debug.info(p1, "n") or "<function>" elseif type(p1) == "table" then p1.displayName or (p1.name or "Unknown") else p1
			
			if var5 then
				defineKeyPropWarningGetter(var4, var8)
			end
			if ref then
				defineRefPropWarningGetter(var4, var8)
			end
		end
		if t == nil then
			t = {
				fileName = debug.info(3, "s"),
				lineNumber = debug.info(3, "l")
			}
		end
	end
	return ReactElement(p1, var5, ref, nil, t, reactCurrentOwner.current, var4)
end

function t_1.cloneAndReplaceKey(p3, p4)
	-- upvalues: ReactElement (ref)
	return ReactElement(p3.type, p4, p3.ref, p3._self, p3._source, p3._owner, p3.props)
end

function t_1.cloneElement(p3, p4, ...)
	-- upvalues: error (ref), reactCurrentOwner (ref), dEV (ref), t (ref), ReactElement (ref)
	if p3 == nil then
		error(error.new("React.cloneElement(...): The argument must be a React element, but you passed " .. tostring(p3)))
	end
	local props = p3.props
	local var9 = if props ~= nil then {} else table.clone(props)
	local key = p3.key
	local ref = p3.ref
	local source = p3._source
	local owner = p3._owner
	
	if p4 ~= nil then
		local ref_1 = p4.ref
		
		if ref_1 ~= nil then
			ref = ref_1
			owner = reactCurrentOwner.current
		elseif not dEV or p4.ref == nil or (type(p4.ref) ~= "table" or not p4.ref.isReactWarning) then
			local _ = p4.ref ~= nil
		end
		local key_1 = p4.key
		
		if key_1 ~= nil then
			key = if type(key_1) == "number" then key_1 else key_1 or "nil"
		elseif not dEV or p4.key == nil or (type(p4.key) ~= "table" or not p4.key.isReactWarning) then
			local _ = p4.key ~= nil
		end
	end
	local type = p3.type
	local var10 = if type(type) == "table" then type.defaultProps else nil
	
	if p4 ~= nil then
		for i, v in p4 do
			if p4[i] ~= nil and not t[i] then
				if p4[i] == nil and var10 ~= nil then
					var9[i] = var10[i]
				else
					var9[i] = p4[i]
				end
			end
		end
	end
	local var11 = select("#", ...)
	
	if var11 == 1 then
		var9.children = select(1, ...)
	elseif var11 > 1 then
		var9.children = { ... }
	end
	return ReactElement(p3.type, key, ref, nil, source, owner, var9)
end

function t_1.isValidElement(p5)
	-- upvalues: REACT_ELEMENT_TYPE (ref)
	return type(p5) == "table" and p5["$$typeof"] == REACT_ELEMENT_TYPE
end

return t_1