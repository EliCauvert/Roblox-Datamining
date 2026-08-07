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
	jsx = function(_, _, _) --[[ line: 278 ]]
		error("JSX is currently unsupported")
	end,
	jsxDEV = function(_, _, _, _, _) --[[ line: 333 ]]
		error("JSX is currently unsupported")
		
		return nil
	end
}

local function _(p0) --[[ line: 60 | named "hasValidRef" ]]
	-- upvalues: dEV (ref)
	return if dEV and p0.ref ~= nil and (type(p0.ref) == "table" and p0.ref.isReactWarning) then false else p0.ref ~= nil
end

local _ = function(p1) --[[ line: 74 | named "hasValidKey" ]]
	-- upvalues: dEV (ref)
	return if dEV and p1.key ~= nil and (type(p1.key) == "table" and p1.key.isReactWarning) then false else p1.key ~= nil
end

local t_2 = { isReactWarning = true }

local function defineKeyPropWarningGetter(p2, p3) --[[ line: 93 ]]
	-- upvalues: dEV (ref), var1 (write), console (ref), t_2 (ref)
	local _ = function() --[[ line: 94 ]]
		-- upvalues: dEV (copy), var1 (copy), console (copy), p3 (ref)
		if dEV and not var1 then
			var1 = true
			console.error("%s: `key` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", p3)
		end
	end
	
	p2.key = nil
	setmetatable(p2, {
		__index = function(_, p4) --[[ line: 113 ]]
			-- upvalues: dEV (copy), var1 (copy), console (copy), p3 (ref), t_2 (copy)
			if p4 ~= "key" then
				return nil
			elseif dEV and not var1 then
				var1 = true
				console.error("%s: `key` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", p3)
			end
			return t_2
		end
	})
end

local function defineRefPropWarningGetter(p5, p6) --[[ line: 125 ]]
	-- upvalues: dEV (ref), var2 (write), console (ref), t_2 (ref)
	local _ = function() --[[ line: 128 ]]
		-- upvalues: dEV (copy), var2 (copy), console (copy), p6 (ref)
		if dEV and not var2 then
			var2 = true
			console.error("%s: `ref` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", p6)
		end
	end
	
	p5.ref = nil
	setmetatable(p5, {
		__index = function(_, p7) --[[ line: 147 ]]
			-- upvalues: dEV (copy), var2 (copy), console (copy), p6 (ref), t_2 (copy)
			if p7 ~= "ref" then
				return nil
			elseif dEV and not var2 then
				var2 = true
				console.error("%s: `ref` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", p6)
			end
			return t_2
		end
	})
end

local function warnIfStringRefCannotBeAutoConverted(p8) --[[ line: 159 ]]
	-- upvalues: dEV (ref), reactCurrentOwner (ref), getComponentName (ref), var3 (write)
	if dEV and type(p8.ref) == "string" and reactCurrentOwner.current then
		local var10 = getComponentName(reactCurrentOwner.current.type)
		
		if not var3[var10] then
			error(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref", var10 or "Unknown", p8.ref))
		end
	end
end

local function ReactElement(p9, p10, p11, p12, p13, p14, p15) --[[ line: 210 ]]
	-- upvalues: REACT_ELEMENT_TYPE (ref), dEV (ref)
	local t = {
		type = p9,
		key = p10,
		ref = p11,
		props = p15,
		_owner = p14,
		["$$typeof"] = REACT_ELEMENT_TYPE
	}
	
	if dEV then
		local t_1 = { validated = false }
		t._store = setmetatable({}, {
			__index = t_1,
			__newindex = function(p16, p17, p18) --[[ line: 247 ]]
				-- upvalues: t_1 (ref)
				if p17 == "validated" then
					t_1.validated = p18
					
					return
				end
				rawset(p16, p17, p18)
			end
		})
		setmetatable(t, { __index = { _self = p12, _source = p13 } })
	end
	return t
end

function t_1.createElement(p19, p20, ...) --[[ line: 409 ]]
	-- upvalues: dEV (ref), warnIfStringRefCannotBeAutoConverted (ref), defineKeyPropWarningGetter (ref), defineRefPropWarningGetter (ref), ReactElement (ref), reactCurrentOwner (ref)
	local var13 = if p20 ~= nil then {} else table.clone(p20)
	local var14 = nil
	local ref = nil
	local t = nil
	
	if p20 ~= nil then
		if if dEV and p20.ref ~= nil and (type(p20.ref) == "table" and p20.ref.isReactWarning) then false else p20.ref ~= nil then
			ref = p20.ref
			
			if dEV then
				warnIfStringRefCannotBeAutoConverted(p20)
			end
		end
		local var16 = if dEV and p20.key ~= nil and (type(p20.key) == "table" and p20.key.isReactWarning) then false else p20.key ~= nil
		
		if var16 then
			var16 = p20.key
			var14 = if type(var16) == "number" then var16 else tostring(var16)
		end
		t = if p20.__source == nil then nil else p20.__source
		
		if var13.key ~= nil then
			var13.key = nil
		end
		if var13.ref ~= nil then
			var13.ref = nil
		end
		if var13.__self ~= nil then
			var13.__self = nil
		end
		if var13.__source ~= nil then
			var13.__source = nil
		end
	end
	local var17 = select("#", ...)
	
	if var17 == 1 then
		var13.children = select(1, ...)
	elseif var17 > 1 then
		local list = table.create(var17)
		
		for i = 1, var17 do
			table.insert(list, select(i, ...))
		end
		if dEV then
			table.freeze(list)
		end
		var13.children = list
	end
	if type(p19) == "table" and p19.defaultProps then
		local defaultProps = p19.defaultProps
		
		for i_1, v in defaultProps do
			if var13[i_1] == nil then
				var13[i_1] = defaultProps[i_1]
			end
		end
	end
	if dEV then
		if var14 or ref then
			local _ = nil
			local var19 = if type(p19) == "function" then debug.info(p19, "n") or "<function>" elseif type(p19) == "table" then p19.displayName or (p19.name or "Unknown") else p19
			
			if var14 then
				defineKeyPropWarningGetter(var13, var19)
			end
			if ref then
				defineRefPropWarningGetter(var13, var19)
			end
		end
		if t == nil then
			t = {
				fileName = debug.info(3, "s"),
				lineNumber = debug.info(3, "l")
			}
		end
	end
	return ReactElement(p19, var14, ref, nil, t, reactCurrentOwner.current, var13)
end

function t_1.cloneAndReplaceKey(p21, p22) --[[ line: 587 ]]
	-- upvalues: ReactElement (ref)
	return ReactElement(p21.type, p22, p21.ref, p21._self, p21._source, p21._owner, p21.props)
end

function t_1.cloneElement(p23, p24, ...) --[[ line: 608 ]]
	-- upvalues: error (ref), reactCurrentOwner (ref), dEV (ref), t (ref), ReactElement (ref)
	if p23 == nil then
		error(error.new("React.cloneElement(...): The argument must be a React element, but you passed " .. tostring(p23)))
	end
	local props = p23.props
	local var20 = if props ~= nil then {} else table.clone(props)
	local key = p23.key
	local ref = p23.ref
	local source = p23._source
	local owner = p23._owner
	
	if p24 ~= nil then
		local ref_1 = p24.ref
		
		if ref_1 ~= nil then
			ref = ref_1
			owner = reactCurrentOwner.current
		elseif not dEV or p24.ref == nil or (type(p24.ref) ~= "table" or not p24.ref.isReactWarning) then
			local _ = p24.ref ~= nil
		end
		local key_1 = p24.key
		
		if key_1 ~= nil then
			key = if type(key_1) == "number" then key_1 else key_1 or "nil"
		elseif not dEV or p24.key == nil or (type(p24.key) ~= "table" or not p24.key.isReactWarning) then
			local _ = p24.key ~= nil
		end
	end
	local type = p23.type
	local var21 = if type(type) == "table" then type.defaultProps else nil
	
	if p24 ~= nil then
		for i, v in p24 do
			if p24[i] ~= nil and not t[i] then
				if p24[i] == nil and var21 ~= nil then
					var20[i] = var21[i]
				else
					var20[i] = p24[i]
				end
			end
		end
	end
	local var22 = select("#", ...)
	
	if var22 == 1 then
		var20.children = select(1, ...)
	elseif var22 > 1 then
		var20.children = { ... }
	end
	return ReactElement(p23.type, key, ref, nil, source, owner, var20)
end

function t_1.isValidElement(p25) --[[ line: 724 ]]
	-- upvalues: REACT_ELEMENT_TYPE (ref)
	return type(p25) == "table" and p25["$$typeof"] == REACT_ELEMENT_TYPE
end

return t_1