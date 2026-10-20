local Parent = script.Parent.Parent
local Error1 = require(Parent.LuauPolyfill).Error
local DEV = require(Parent.ReactGlobals).__DEV__
local Console = require(Parent.Shared).console
local _ = require(Parent.Shared)
local _ = require(script.Parent.ReactLazy)
local GetComponentNameFunction = require(Parent.Shared).getComponentName
local REACTELEMENTTYPE = require(Parent.Shared).ReactSymbols.REACT_ELEMENT_TYPE
local ReactCurrentOwner = require(Parent.Shared).ReactSharedInternals.ReactCurrentOwner
local config = { key = true, ref = true, __self = true, __source = true }
local Flag = nil
local Flag1 = nil
local T = if DEV then {} else nil

local function _(p1): boolean
	-- upvalues: DEV (copy)
	return (not DEV or p1.ref == nil or type(p1.ref) ~= "table" or not p1.ref.isReactWarning) and p1.ref ~= nil
end

local _ = function(p1): boolean
	-- upvalues: DEV (copy)
	return (not DEV or p1.key == nil or type(p1.key) ~= "table" or not p1.key.isReactWarning) and p1.key ~= nil
end

local config1 = { isReactWarning = true }

local function defineKeyPropWarningGetter(Props, DebugInfo)
	-- upvalues: DEV (copy), Flag (ref), Console (copy), config1 (copy)
	local function _()
		-- upvalues: DEV (upval), Flag (upval), Console (upval), DebugInfo (copy)
		if DEV and not Flag then
			Flag = true
			Console.error("%s: `key` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", DebugInfo)
		end
	end
	
	Props.key = nil
	setmetatable(Props, {
		__index = function(_, p1)
			-- upvalues: DEV (upval), Flag (upval), Console (upval), DebugInfo (copy), config1 (upval)
			if p1 ~= "key" then
				return nil
			end
			if DEV and not Flag then
				Flag = true
				Console.error("%s: `key` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", DebugInfo)
			end
			return config1
		end
	})
end

local function defineRefPropWarningGetter(Props, DebugInfo)
	-- upvalues: DEV (copy), Flag1 (ref), Console (copy), config1 (copy)
	local function _()
		-- upvalues: DEV (upval), Flag1 (upval), Console (upval), DebugInfo (copy)
		if DEV and not Flag1 then
			Flag1 = true
			Console.error("%s: `ref` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", DebugInfo)
		end
	end
	
	Props.ref = nil
	setmetatable(Props, {
		__index = function(_, p1)
			-- upvalues: DEV (upval), Flag1 (upval), Console (upval), DebugInfo (copy), config1 (upval)
			if p1 ~= "ref" then
				return nil
			end
			if DEV and not Flag1 then
				Flag1 = true
				Console.error("%s: `ref` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", DebugInfo)
			end
			return config1
		end
	})
end

local function warnIfStringRefCannotBeAutoConverted(p1)
	-- upvalues: DEV (copy), ReactCurrentOwner (copy), GetComponentNameFunction (copy), T (ref)
	if DEV and type(p1.ref) == "string" and ReactCurrentOwner.current then
		local ComponentName = GetComponentNameFunction(ReactCurrentOwner.current.type)
		
		if not T[ComponentName] then
			error(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref", ComponentName or "Unknown", p1.ref))
		end
	end
end

local function ReactElement(Type1, Key, Ref, _self, Source, Owner, Props)
	-- upvalues: REACTELEMENTTYPE (copy), DEV (copy)
	local config = {
		type = Type1,
		key = Key,
		ref = Ref,
		props = Props,
		_owner = Owner,
		["$$typeof"] = REACTELEMENTTYPE
	}
	
	if DEV then
		local config1 = { validated = false }
		config._store = setmetatable({}, {
			__index = config1,
			__newindex = function(p1, p2, Validated)
				-- upvalues: config1 (copy)
				if p2 == "validated" then
					config1.validated = Validated
					
					return
				else
					rawset(p1, p2, Validated)
				end
			end
		})
		setmetatable(config, { __index = { _self = _self, _source = Source } })
	end
	return config
end

return {
	jsx = function(_, _, _)
		error("JSX is currently unsupported")
	end,
	jsxDEV = function(_, _, _, _, _)
		error("JSX is currently unsupported")
		
		return nil
	end,
	createElement = function(Callback, Tbl, ...)
		-- upvalues: DEV (copy), warnIfStringRefCannotBeAutoConverted (copy), defineKeyPropWarningGetter (copy), defineRefPropWarningGetter (copy), ReactElement (copy), ReactCurrentOwner (copy)
		local T = if Tbl == nil then {} else table.clone(Tbl)
		local Key = nil
		local Ref = nil
		local Source = nil
		
		if Tbl ~= nil then
			if (not DEV or Tbl.ref == nil or type(Tbl.ref) ~= "table" or not Tbl.ref.isReactWarning) and Tbl.ref ~= nil then
				Ref = Tbl.ref
				
				if DEV then
					warnIfStringRefCannotBeAutoConverted(Tbl)
				end
			end
			if (not DEV or Tbl.key == nil or type(Tbl.key) ~= "table" or not Tbl.key.isReactWarning) and Tbl.key ~= nil then
				local Key1 = Tbl.key
				Key = if type(Key1) == "number" then Key1 else tostring(Key1)
			end
			Source = if Tbl.__source == nil then nil else Tbl.__source
			
			if T.key ~= nil then
				T.key = nil
			end
			if T.ref ~= nil then
				T.ref = nil
			end
			if T.__self ~= nil then
				T.__self = nil
			end
			if T.__source ~= nil then
				T.__source = nil
			end
		end
		local Selected: number = select("#", ...)
		
		if Selected == 1 then
			T.children = select(1, ...)
		elseif Selected > 1 then
			local Buffer = table.create(Selected)
			
			for i = 1, Selected do
				table.insert(Buffer, (select(i, ...)))
			end
			if DEV then
				table.freeze(Buffer)
			end
			T.children = Buffer
		end
		if type(Callback) == "table" and Callback.defaultProps then
			local DefaultProps = Callback.defaultProps
			
			for i1, _ in DefaultProps do
				if T[i1] == nil then
					T[i1] = DefaultProps[i1]
				end
			end
		end
		if DEV then
			if Key or Ref then
				local DebugInfo = if type(Callback) == "function" then debug.info(Callback, "n") or "<function>" elseif type(Callback) == "table" then Callback.displayName or (Callback.name or "Unknown") else Callback
				
				if Key then
					defineKeyPropWarningGetter(T, DebugInfo)
				end
				if Ref then
					defineRefPropWarningGetter(T, DebugInfo)
				end
			end
			if Source == nil then
				Source = {
					fileName = debug.info(3, "s"),
					lineNumber = debug.info(3, "l")
				}
			end
		end
		return (ReactElement(Callback, Key, Ref, nil, Source, ReactCurrentOwner.current, T))
	end,
	cloneAndReplaceKey = function(p1, Key)
		-- upvalues: ReactElement (copy)
		return (ReactElement(p1.type, Key, p1.ref, p1._self, p1._source, p1._owner, p1.props))
	end,
	cloneElement = function(p1, List, ...)
		-- upvalues: Error1 (copy), ReactCurrentOwner (copy), DEV (copy), config (copy), ReactElement (copy)
		if p1 == nil then
			error(Error1.new("React.cloneElement(...): The argument must be a React element, but you passed " .. tostring(p1)))
		end
		local Props = p1.props
		local T = if Props == nil then {} else table.clone(Props)
		local Key = p1.key
		local Ref = p1.ref
		local Source = p1._source
		local Owner = p1._owner
		
		if List ~= nil then
			local Ref1 = List.ref
			
			if Ref1 ~= nil or (not DEV or List.ref == nil or type(List.ref) ~= "table" or not List.ref.isReactWarning) and List.ref ~= nil and false then
				Ref = Ref1
				Owner = ReactCurrentOwner.current
			end
			local Key1 = List.key
			
			if Key1 ~= nil or (not DEV or List.key == nil or type(List.key) ~= "table" or not List.key.isReactWarning) and List.key ~= nil and false then
				Key = if type(Key1) == "number" then Key1 else Key1 or "nil"
			end
		end
		local Type1 = p1.type
		local DefaultProps = if type(Type1) == "table" then Type1.defaultProps else nil
		
		if List ~= nil then
			for i, _ in List do
				if List[i] ~= nil and not config[i] then
					if List[i] == nil and DefaultProps ~= nil then
						T[i] = DefaultProps[i]
					else
						T[i] = List[i]
					end
				end
			end
		end
		local Selected: number = select("#", ...)
		
		if Selected == 1 then
			T.children = select(1, ...)
		elseif Selected > 1 then
			T.children = { ... }
		end
		return (ReactElement(p1.type, Key, Ref, nil, Source, Owner, T))
	end,
	isValidElement = function(p2): boolean
		-- upvalues: REACTELEMENTTYPE (copy)
		return type(p2) == "table" and p2["$$typeof"] == REACTELEMENTTYPE
	end
}