local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local console = require(parent.Shared).console
local inspect = luauPolyfillModule.util.inspect
local _ = require(parent.Shared)
local isValidElementType = require(parent.Shared).isValidElementType
local getComponentName = require(parent.Shared).getComponentName
local reactSymbols = require(parent.Shared).ReactSymbols
local getIteratorFn = reactSymbols.getIteratorFn
local _ = reactSymbols.REACT_FORWARD_REF_TYPE
local _ = reactSymbols.REACT_MEMO_TYPE
local REACT_FRAGMENT_TYPE = reactSymbols.REACT_FRAGMENT_TYPE
local REACT_ELEMENT_TYPE = reactSymbols.REACT_ELEMENT_TYPE
local warnAboutSpreadingKeyToJSX = require(parent.Shared).ReactFeatureFlags.warnAboutSpreadingKeyToJSX
local checkPropTypes = require(parent.Shared).checkPropTypes
local reactCurrentOwner = require(parent.Shared).ReactSharedInternals.ReactCurrentOwner
local reactElementModule = require(script.Parent.ReactElement)
local isValidElement = reactElementModule.isValidElement
local createElement = reactElementModule.createElement
local cloneElement = reactElementModule.cloneElement
local jsxDEV = reactElementModule.jsxDEV
local setExtraStackFrame = require(parent.Shared).ReactSharedInternals.ReactDebugCurrentFrame.setExtraStackFrame
local describeUnknownElementTypeFrameInDEV = require(parent.Shared).ReactComponentStackFrame.describeUnknownElementTypeFrameInDEV
local t = {}

local function _(value)
	-- upvalues: reactGlobalsModule (ref), describeUnknownElementTypeFrameInDEV (ref), setExtraStackFrame (ref)
	if reactGlobalsModule.__DEV__ then
		if value then
			local owner = value._owner
			setExtraStackFrame(describeUnknownElementTypeFrameInDEV(value.type, value._source, if owner then owner.type else nil))
			
			return
		end
		setExtraStackFrame(nil)
	end
end

local var1 = if reactGlobalsModule.__DEV__ then false else nil

local _ = function(p1, p2)
	return p1[p2] ~= nil
end

local _ = function()
	-- upvalues: reactCurrentOwner (ref), getComponentName (ref)
	if reactCurrentOwner.current then
		local var2 = getComponentName(reactCurrentOwner.current.type)
		
		return if var2 then "\n\nCheck the render method of `" .. var12 .. "`." else ""
	end
end

local _ = function(p1)
	return if p1 == nil then "" else "\n\nCheck your code at " .. string.gsub(p1.fileName, "^.*[\\/]", "") .. ":" .. p2.lineNumber .. "."
end

local _ = function(p1)
	if p1 == nil then
		return ""
	end
	local source = p1.__source
	
	return if source == nil then "" else "\n\nCheck your code at " .. string.gsub(source.fileName, "^.*[\\/]", "") .. ":" .. source.lineNumber .. "."
end

local t_1 = {}

local function getCurrentComponentErrorInfo(p1)
	-- upvalues: reactCurrentOwner (ref), getComponentName (ref), boolean (ref)
	local var2
	if reactCurrentOwner.current then
		local var3 = getComponentName(reactCurrentOwner.current.type)
		var2 = if var3 then "\n\nCheck the render method of `" .. var13 .. "`." else ""
	end
	if not boolean.toJSBoolean(var2) then
		local var4 = if typeof(p1) == "string" then p1 elseif typeof(p1) == "table" then p1.displayName or p1.name else nil
		
		if not var4 and typeof(p1) == "function" then
			local debugInfo = debug.info(p1, "n")
			var4 = if debugInfo ~= "" then nil else debugInfo
		end
		if var4 then
			var2 = string.format("\n\nCheck the top-level render call using <%s>.", var4)
		end
	end
	return var2
end

local function validateExplicitKey(p1, p2, p3)
	-- upvalues: getCurrentComponentErrorInfo (ref), t_1 (ref), reactCurrentOwner (ref), getComponentName (ref), reactGlobalsModule (ref), describeUnknownElementTypeFrameInDEV (ref), setExtraStackFrame (ref), console (ref)
	if p1._store == nil or p1._store.validated then return end
	p1._store.validated = true
	
	if p1.key ~= nil ~= (p3 ~= nil) then return end
	local var2 = getCurrentComponentErrorInfo(p2)
	
	if t_1[var2] then return end
	t_1[var2] = true
	local var3 = if p1 and p1._owner and p1._owner ~= reactCurrentOwner.current then string.format(" It was passed a child from %s.", tostring(getComponentName(p1._owner.type))) else ""
	
	if reactGlobalsModule.__DEV__ then
		if reactGlobalsModule.__DEV__ then
			if p1 then
				local owner = p1._owner
				setExtraStackFrame(describeUnknownElementTypeFrameInDEV(p1.type, p1._source, if owner then owner.type else nil))
			else
				setExtraStackFrame(nil)
			end
		end
		if p1.key == nil or p3 == nil then
			console.error("Each child in a list should have a unique \"key\" prop.%s%s See https://reactjs.org/link/warning-keys for more information.", var2, var3)
		else
			console.error("Child element received a \"key\" prop (\"%s\") in addition to a key in the \"children\" table of its parent (\"%s\"). Please provide only one key definition. When both are present, the \"key\" prop will take precedence.%s%s See https://reactjs.org/link/warning-keys for more information.", tostring(p1.key), tostring(p3), var2, var3)
		end
		if reactGlobalsModule.__DEV__ then
			setExtraStackFrame(nil)
		end
	end
end

local function validateChildKeys(p1, p2)
	-- upvalues: array (ref), isValidElement (ref), validateExplicitKey (ref), getIteratorFn (ref)
	if typeof(p1) ~= "table" then return end
	if array.isArray(p1) then
		for i = 1, #p1 do
			local var2 = p1[i]
			
			if isValidElement(var2) then
				validateExplicitKey(var2, p2)
			end
		end
		return
	elseif isValidElement(p1) then
		if p1._store then
			p1._store.validated = true
			
			return
		end
	elseif p1 then
		local var3 = getIteratorFn(p1)
		
		if typeof(var3) == "function" and var3 ~= p1.entries then
			local var4 = var3(p1)
			local var5 = var4.next()
			while not var5.done do
				if isValidElement(var5.value) then
					validateExplicitKey(var5.value, p2, var5.key)
				end
				var5 = var4.next()
			end
		end
	end
end

local function validatePropTypes(p3)
	-- upvalues: reactGlobalsModule (ref), getComponentName (ref), checkPropTypes (ref), var1 (write), console (ref)
	if reactGlobalsModule.__DEV__ or reactGlobalsModule.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
		local type = p3.type
		
		if type == nil or typeof(type) == "string" then return end
		local propTypes = nil
		local validateProps = nil
		
		if typeof(type) == "function" then return end
		if typeof(type) == "table" then
			propTypes = type.propTypes
			validateProps = type.validateProps
		else
			return
		end
		if propTypes or validateProps then
			checkPropTypes(propTypes, validateProps, p3.props, "prop", getComponentName(type), p3)
		elseif type.PropTypes ~= nil and not var1 then
			var1 = true
			console.error("Component %s declared `PropTypes` instead of `propTypes`. Did you misspell the property assignment?", getComponentName(type) or "Unknown")
		end
		if type.getDefaultProps ~= nil then
			console.error("getDefaultProps is only used on classic React.createClass definitions. Use a static property named `defaultProps` instead.")
		end
	end
end

local function validateFragmentProps(p3)
	-- upvalues: reactGlobalsModule (ref), object (ref), describeUnknownElementTypeFrameInDEV (ref), setExtraStackFrame (ref), console (ref)
	if reactGlobalsModule.__DEV__ then
		local var6
		local var7 = object.keys(p3.props)
		
		for i = 1, #var7 do
			var6 = var7[i]
			
			if var6 == "children" or var6 == "key" then
				continue
			end
			if reactGlobalsModule.__DEV__ then
				if p3 then
					local owner = p3._owner
					setExtraStackFrame(describeUnknownElementTypeFrameInDEV(p3.type, p3._source, if owner then owner.type else nil))
				else
					setExtraStackFrame(nil)
				end
			end
			console.error("Invalid prop `%s` supplied to `React.Fragment`. React.Fragment can only have `key` and `children` props.", var6)
			
			if not reactGlobalsModule.__DEV__ then break end
			setExtraStackFrame(nil)
			break
		end
		if p3.ref ~= nil then
			if reactGlobalsModule.__DEV__ then
				if p3 then
					local owner = p3._owner
					setExtraStackFrame(describeUnknownElementTypeFrameInDEV(p3.type, p3._source, if owner then owner.type else nil))
				else
					setExtraStackFrame(nil)
				end
			end
			console.error("Invalid attribute `ref` supplied to `React.Fragment`.")
			
			if reactGlobalsModule.__DEV__ then
				setExtraStackFrame(nil)
			end
		end
	end
end

local function jsxWithValidation(p4, p5, p6, p7, p8, p9)
	-- upvalues: isValidElementType (ref), object (ref), reactCurrentOwner (ref), getComponentName (ref), array (ref), REACT_ELEMENT_TYPE (ref), inspect (ref), reactGlobalsModule (ref), console (ref), jsxDEV (ref), validateChildKeys (ref), warnAboutSpreadingKeyToJSX (ref), REACT_FRAGMENT_TYPE (ref), validateFragmentProps (ref), validatePropTypes (ref)
	local var8 = isValidElementType(p4)
	
	if not var8 then
		local var9 = ""
		
		if p4 == nil or typeof(p4) == "table" and #object.keys(p4) == 0 then
			var9 ..= " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
		end
		local var10 = if p8 ~= nil then "" else "\n\nCheck your code at " .. string.gsub(p8.fileName, "^.*[\\/]", "") .. ":" .. p16.lineNumber .. "."
		
		if var10 then
			var9 ..= var10
		else
			local var11
			local var12 = var9
			
			if reactCurrentOwner.current then
				local var13 = getComponentName(reactCurrentOwner.current.type)
				var11 = if var13 then "\n\nCheck the render method of `" .. var29 .. "`." else ""
			end
			var9 = var12 .. var30
		end
		local var14
		local _ = nil
		
		if p4 == nil then
			var14 = "nil"
		elseif array.isArray(p4) then
			var14 = "array"
		elseif typeof(p4) == "table" and p4["$$typeof"] == REACT_ELEMENT_TYPE then
			var14 = string.format("<%s />", getComponentName(p4.type) or "Unknown")
			var9 ..= " Did you accidentally export a JSX literal or Element instead of a component?"
		else
			var14 = typeof(p4)
			var9 ..= "\n" .. inspect(p4)
		end
		if reactGlobalsModule.__DEV__ then
			console.error("React.jsx: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", var14, var9)
		end
	end
	local var15 = jsxDEV(p4, p5, p6, p8, p9)
	
	if var15 == nil then
		return var15
	elseif var8 then
		local children = p5.children
		
		if children ~= nil then
			if not p7 then
				validateChildKeys(children, p4)
			elseif array.isArray(children) then
				for i = 1, #children do
					validateChildKeys(children[i], p4)
				end
				object.freeze(children)
			elseif reactGlobalsModule.__DEV__ then
				console.error("React.jsx: Static children should always be an array. You are likely explicitly calling React.jsxs or React.jsxDEV. Use the Babel transform instead.")
			end
		end
	end
	if reactGlobalsModule.__DEV__ and warnAboutSpreadingKeyToJSX and p5.key ~= nil then
		console.error("React.jsx: Spreading a key to JSX is a deprecated pattern. Explicitly pass a key after spreading props in your JSX call. E.g. <%s {...props} key={key} />", getComponentName(p4) or "ComponentName")
	end
	if p4 == REACT_FRAGMENT_TYPE then
		validateFragmentProps(var15)
		
		return var15
	end
	validatePropTypes(var15)
	
	return var15
end

t.jsxWithValidation = jsxWithValidation

function t.jsxWithValidationStatic(p10, p11, p12)
	-- upvalues: jsxWithValidation (ref)
	return jsxWithValidation(p10, p11, p12, true)
end

function t.jsxWithValidationDynamic(p10, p11, p12)
	-- upvalues: jsxWithValidation (ref)
	return jsxWithValidation(p10, p11, p12, false)
end

function t.createElementWithValidation(p10, p11, ...)
	-- upvalues: isValidElementType (ref), object (ref), reactCurrentOwner (ref), getComponentName (ref), array (ref), REACT_ELEMENT_TYPE (ref), inspect (ref), reactGlobalsModule (ref), console (ref), createElement (ref), validateChildKeys (ref), REACT_FRAGMENT_TYPE (ref), validateFragmentProps (ref), validatePropTypes (ref)
	local var16 = isValidElementType(p10)
	
	if not var16 then
		local var17
		local var18 = ""
		
		if p10 == nil or typeof(p10) == "table" and #object.keys(p10) == 0 then
			var18 ..= " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
		end
		if p11 == nil then
			var17 = ""
		else
			local source = p11.__source
			var17 = if source ~= nil then "" else "\n\nCheck your code at " .. string.gsub(source.fileName, "^.*[\\/]", "") .. ":" .. source.lineNumber .. "."
		end
		if var17 then
			var18 ..= var17
		else
			local var19
			local var20 = var18
			
			if reactCurrentOwner.current then
				local var21 = getComponentName(reactCurrentOwner.current.type)
				var19 = if var21 then "\n\nCheck the render method of `" .. var37 .. "`." else ""
			end
			var18 = var20 .. var38
		end
		local var22
		local _ = nil
		
		if p10 == nil then
			var22 = "nil"
		elseif array.isArray(p10) then
			var22 = "array"
		elseif p10 == nil or typeof(p10) ~= "table" or p10["$$typeof"] ~= REACT_ELEMENT_TYPE then
			var22 = typeof(p10)
			
			if p10 ~= nil then
				var18 ..= "\n" .. inspect(p10)
			end
		else
			var22 = string.format("<%s />", getComponentName(p10.type) or "Unknown")
			var18 ..= " Did you accidentally export a JSX literal or Element instead of a component?"
		end
		if reactGlobalsModule.__DEV__ then
			console.error("React.createElement: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", var22, var18)
		end
	end
	local var23 = createElement(p10, p11, ...)
	
	if var23 == nil then
		return var23
	elseif var16 then
		for i = 1, select("#", ...) do
			validateChildKeys(select(i, ...), p10)
		end
	end
	if p10 == REACT_FRAGMENT_TYPE then
		validateFragmentProps(var23)
		
		return var23
	end
	validatePropTypes(var23)
	
	return var23
end

function t.cloneElementWithValidation(p12, p13, ...)
	-- upvalues: cloneElement (ref), validateChildKeys (ref), validatePropTypes (ref)
	local list = { p12, p13, ... }
	local var24 = cloneElement(p12, p13, ...)
	
	for i = 3, #list do
		validateChildKeys(list[i], var24.type)
	end
	validatePropTypes(var24)
	
	return var24
end

return t