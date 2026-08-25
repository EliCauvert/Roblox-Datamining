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

local var4 = if reactGlobalsModule.__DEV__ then false else nil

local _ = function(p0, p1)
	return p0[p1] ~= nil
end

local _ = function()
	-- upvalues: reactCurrentOwner (ref), getComponentName (ref)
	if reactCurrentOwner.current then
		local var12 = getComponentName(reactCurrentOwner.current.type)
		
		return if var12 then "\n\nCheck the render method of `" .. var12 .. "`." else ""
	end
end

local _ = function(p2)
	return if p2 == nil then "" else "\n\nCheck your code at " .. string.gsub(p2.fileName, "^.*[\\/]", "") .. ":" .. p2.lineNumber .. "."
end

local _ = function(p3)
	if p3 == nil then
		return ""
	end
	local source = p3.__source
	
	return if source == nil then "" else "\n\nCheck your code at " .. string.gsub(source.fileName, "^.*[\\/]", "") .. ":" .. source.lineNumber .. "."
end

local t_1 = {}

local function getCurrentComponentErrorInfo(p4)
	-- upvalues: reactCurrentOwner (ref), getComponentName (ref), boolean (ref)
	local var14
	if reactCurrentOwner.current then
		local var13 = getComponentName(reactCurrentOwner.current.type)
		var14 = if var13 then "\n\nCheck the render method of `" .. var13 .. "`." else ""
	end
	if not boolean.toJSBoolean(var14) then
		local var15 = if typeof(p4) == "string" then p4 elseif typeof(p4) == "table" then p4.displayName or p4.name else nil
		
		if not var15 and typeof(p4) == "function" then
			local debugInfo = debug.info(p4, "n")
			var15 = if debugInfo ~= "" then nil else debugInfo
		end
		if var15 then
			var14 = string.format("\n\nCheck the top-level render call using <%s>.", var15)
		end
	end
	return var14
end

local function validateExplicitKey(p5, p6, p7)
	-- upvalues: getCurrentComponentErrorInfo (ref), t_1 (ref), reactCurrentOwner (ref), getComponentName (ref), reactGlobalsModule (ref), describeUnknownElementTypeFrameInDEV (ref), setExtraStackFrame (ref), console (ref)
	if p5._store == nil or p5._store.validated then return end
	p5._store.validated = true
	
	if p5.key ~= nil ~= (p7 ~= nil) then return end
	local var17 = getCurrentComponentErrorInfo(p6)
	
	if t_1[var17] then return end
	t_1[var17] = true
	local var18 = if p5 and p5._owner and p5._owner ~= reactCurrentOwner.current then string.format(" It was passed a child from %s.", tostring(getComponentName(p5._owner.type))) else ""
	
	if reactGlobalsModule.__DEV__ then
		if reactGlobalsModule.__DEV__ then
			if p5 then
				local owner = p5._owner
				setExtraStackFrame(describeUnknownElementTypeFrameInDEV(p5.type, p5._source, if owner then owner.type else nil))
			else
				setExtraStackFrame(nil)
			end
		end
		if p5.key == nil or p7 == nil then
			console.error("Each child in a list should have a unique \"key\" prop.%s%s See https://reactjs.org/link/warning-keys for more information.", var17, var18)
		else
			console.error("Child element received a \"key\" prop (\"%s\") in addition to a key in the \"children\" table of its parent (\"%s\"). Please provide only one key definition. When both are present, the \"key\" prop will take precedence.%s%s See https://reactjs.org/link/warning-keys for more information.", tostring(p5.key), tostring(p7), var17, var18)
		end
		if reactGlobalsModule.__DEV__ then
			setExtraStackFrame(nil)
		end
	end
end

local function validateChildKeys(p8, p9)
	-- upvalues: array (ref), isValidElement (ref), validateExplicitKey (ref), getIteratorFn (ref)
	if typeof(p8) ~= "table" then return end
	if array.isArray(p8) then
		for i = 1, #p8 do
			local var19 = p8[i]
			
			if isValidElement(var19) then
				validateExplicitKey(var19, p9)
			end
		end
		return
	elseif isValidElement(p8) then
		if p8._store then
			p8._store.validated = true
			
			return
		end
	elseif p8 then
		local var20 = getIteratorFn(p8)
		
		if typeof(var20) == "function" and var20 ~= p8.entries then
			local var21 = var20(p8)
			local var22 = var21.next()
			while not var22.done do
				if isValidElement(var22.value) then
					validateExplicitKey(var22.value, p9, var22.key)
				end
				var22 = var21.next()
			end
		end
	end
end

local function validatePropTypes(p10)
	-- upvalues: reactGlobalsModule (ref), getComponentName (ref), checkPropTypes (ref), var4 (write), console (ref)
	if reactGlobalsModule.__DEV__ or reactGlobalsModule.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
		local type = p10.type
		
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
			checkPropTypes(propTypes, validateProps, p10.props, "prop", getComponentName(type), p10)
		elseif type.PropTypes ~= nil and not var4 then
			var4 = true
			console.error("Component %s declared `PropTypes` instead of `propTypes`. Did you misspell the property assignment?", getComponentName(type) or "Unknown")
		end
		if type.getDefaultProps ~= nil then
			console.error("getDefaultProps is only used on classic React.createClass definitions. Use a static property named `defaultProps` instead.")
		end
	end
end

local function validateFragmentProps(p11)
	-- upvalues: reactGlobalsModule (ref), object (ref), describeUnknownElementTypeFrameInDEV (ref), setExtraStackFrame (ref), console (ref)
	if reactGlobalsModule.__DEV__ then
		local var24
		local var23 = object.keys(p11.props)
		
		for i = 1, #var23 do
			var24 = var23[i]
			
			if var24 == "children" or var24 == "key" then
				continue
			end
			if reactGlobalsModule.__DEV__ then
				if p11 then
					local owner = p11._owner
					setExtraStackFrame(describeUnknownElementTypeFrameInDEV(p11.type, p11._source, if owner then owner.type else nil))
				else
					setExtraStackFrame(nil)
				end
			end
			console.error("Invalid prop `%s` supplied to `React.Fragment`. React.Fragment can only have `key` and `children` props.", var24)
			
			if not reactGlobalsModule.__DEV__ then break end
			setExtraStackFrame(nil)
			break
		end
		if p11.ref ~= nil then
			if reactGlobalsModule.__DEV__ then
				if p11 then
					local owner = p11._owner
					setExtraStackFrame(describeUnknownElementTypeFrameInDEV(p11.type, p11._source, if owner then owner.type else nil))
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

local function jsxWithValidation(p12, p13, p14, p15, p16, p17)
	-- upvalues: isValidElementType (ref), object (ref), reactCurrentOwner (ref), getComponentName (ref), array (ref), REACT_ELEMENT_TYPE (ref), inspect (ref), reactGlobalsModule (ref), console (ref), jsxDEV (ref), validateChildKeys (ref), warnAboutSpreadingKeyToJSX (ref), REACT_FRAGMENT_TYPE (ref), validateFragmentProps (ref), validatePropTypes (ref)
	local var25 = isValidElementType(p12)
	
	if not var25 then
		local var26 = ""
		
		if p12 == nil or typeof(p12) == "table" and #object.keys(p12) == 0 then
			var26 ..= " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
		end
		local var27 = if p16 ~= nil then "" else "\n\nCheck your code at " .. string.gsub(p16.fileName, "^.*[\\/]", "") .. ":" .. p16.lineNumber .. "."
		
		if var27 then
			var26 ..= var27
		else
			local var30
			local var28 = var26
			
			if reactCurrentOwner.current then
				local var29 = getComponentName(reactCurrentOwner.current.type)
				var30 = if var29 then "\n\nCheck the render method of `" .. var29 .. "`." else ""
			end
			var26 = var28 .. var30
		end
		local var31
		local _ = nil
		
		if p12 == nil then
			var31 = "nil"
		elseif array.isArray(p12) then
			var31 = "array"
		elseif typeof(p12) == "table" and p12["$$typeof"] == REACT_ELEMENT_TYPE then
			var31 = string.format("<%s />", getComponentName(p12.type) or "Unknown")
			var26 ..= " Did you accidentally export a JSX literal or Element instead of a component?"
		else
			var31 = typeof(p12)
			var26 ..= "\n" .. inspect(p12)
		end
		if reactGlobalsModule.__DEV__ then
			console.error("React.jsx: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", var31, var26)
		end
	end
	local var32 = jsxDEV(p12, p13, p14, p16, p17)
	
	if var32 == nil then
		return var32
	elseif var25 then
		local children = p13.children
		
		if children ~= nil then
			if not p15 then
				validateChildKeys(children, p12)
			elseif array.isArray(children) then
				for i = 1, #children do
					validateChildKeys(children[i], p12)
				end
				object.freeze(children)
			elseif reactGlobalsModule.__DEV__ then
				console.error("React.jsx: Static children should always be an array. You are likely explicitly calling React.jsxs or React.jsxDEV. Use the Babel transform instead.")
			end
		end
	end
	if reactGlobalsModule.__DEV__ and warnAboutSpreadingKeyToJSX and p13.key ~= nil then
		console.error("React.jsx: Spreading a key to JSX is a deprecated pattern. Explicitly pass a key after spreading props in your JSX call. E.g. <%s {...props} key={key} />", getComponentName(p12) or "ComponentName")
	end
	if p12 == REACT_FRAGMENT_TYPE then
		validateFragmentProps(var32)
		
		return var32
	end
	validatePropTypes(var32)
	
	return var32
end

t.jsxWithValidation = jsxWithValidation

function t.jsxWithValidationStatic(p18, p19, p20)
	-- upvalues: jsxWithValidation (ref)
	return jsxWithValidation(p18, p19, p20, true)
end

function t.jsxWithValidationDynamic(p21, p22, p23)
	-- upvalues: jsxWithValidation (ref)
	return jsxWithValidation(p21, p22, p23, false)
end

function t.createElementWithValidation(p24, p25, ...)
	-- upvalues: isValidElementType (ref), object (ref), reactCurrentOwner (ref), getComponentName (ref), array (ref), REACT_ELEMENT_TYPE (ref), inspect (ref), reactGlobalsModule (ref), console (ref), createElement (ref), validateChildKeys (ref), REACT_FRAGMENT_TYPE (ref), validateFragmentProps (ref), validatePropTypes (ref)
	local var33 = isValidElementType(p24)
	
	if not var33 then
		local var35
		local var34 = ""
		
		if p24 == nil or typeof(p24) == "table" and #object.keys(p24) == 0 then
			var34 ..= " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
		end
		if p25 == nil then
			var35 = ""
		else
			local source = p25.__source
			var35 = if source ~= nil then "" else "\n\nCheck your code at " .. string.gsub(source.fileName, "^.*[\\/]", "") .. ":" .. source.lineNumber .. "."
		end
		if var35 then
			var34 ..= var35
		else
			local var38
			local var36 = var34
			
			if reactCurrentOwner.current then
				local var37 = getComponentName(reactCurrentOwner.current.type)
				var38 = if var37 then "\n\nCheck the render method of `" .. var37 .. "`." else ""
			end
			var34 = var36 .. var38
		end
		local var39
		local _ = nil
		
		if p24 == nil then
			var39 = "nil"
		elseif array.isArray(p24) then
			var39 = "array"
		elseif p24 == nil or typeof(p24) ~= "table" or p24["$$typeof"] ~= REACT_ELEMENT_TYPE then
			var39 = typeof(p24)
			
			if p24 ~= nil then
				var34 ..= "\n" .. inspect(p24)
			end
		else
			var39 = string.format("<%s />", getComponentName(p24.type) or "Unknown")
			var34 ..= " Did you accidentally export a JSX literal or Element instead of a component?"
		end
		if reactGlobalsModule.__DEV__ then
			console.error("React.createElement: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", var39, var34)
		end
	end
	local var40 = createElement(p24, p25, ...)
	
	if var40 == nil then
		return var40
	elseif var33 then
		for i = 1, select("#", ...) do
			validateChildKeys(select(i, ...), p24)
		end
	end
	if p24 == REACT_FRAGMENT_TYPE then
		validateFragmentProps(var40)
		
		return var40
	end
	validatePropTypes(var40)
	
	return var40
end

function t.cloneElementWithValidation(p26, p27, ...)
	-- upvalues: cloneElement (ref), validateChildKeys (ref), validatePropTypes (ref)
	local list = { p26, p27, ... }
	local var42 = cloneElement(p26, p27, ...)
	
	for i = 3, #list do
		validateChildKeys(list[i], var42.type)
	end
	validatePropTypes(var42)
	
	return var42
end

return t