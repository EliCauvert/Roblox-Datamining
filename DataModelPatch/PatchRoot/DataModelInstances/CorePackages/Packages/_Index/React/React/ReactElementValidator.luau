local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local Console = require(Parent.Shared).console
local InspectFunction = LuauPolyfillModule.util.inspect
local _ = require(Parent.Shared)
local IsValidElementTypeFunction = require(Parent.Shared).isValidElementType
local GetComponentNameFunction = require(Parent.Shared).getComponentName
local ReactSymbols = require(Parent.Shared).ReactSymbols
local GetIteratorFnFunction = ReactSymbols.getIteratorFn
local _ = ReactSymbols.REACT_FORWARD_REF_TYPE
local _ = ReactSymbols.REACT_MEMO_TYPE
local REACTFRAGMENTTYPE = ReactSymbols.REACT_FRAGMENT_TYPE
local REACTELEMENTTYPE = ReactSymbols.REACT_ELEMENT_TYPE
local WarnAboutSpreadingKeyToJSX = require(Parent.Shared).ReactFeatureFlags.warnAboutSpreadingKeyToJSX
local CheckPropTypesFunction = require(Parent.Shared).checkPropTypes
local ReactCurrentOwner = require(Parent.Shared).ReactSharedInternals.ReactCurrentOwner
local ReactElementModule = require(script.Parent.ReactElement)
local IsValidElementFunction = ReactElementModule.isValidElement
local CreateElementFunction = ReactElementModule.createElement
local CloneElementFunction = ReactElementModule.cloneElement
local JsxDEVFunction = ReactElementModule.jsxDEV
local SetExtraStackFrameFunction = require(Parent.Shared).ReactSharedInternals.ReactDebugCurrentFrame.setExtraStackFrame
local DescribeUnknownElementTypeFrameInDEVFunction = require(Parent.Shared).ReactComponentStackFrame.describeUnknownElementTypeFrameInDEV

local function _(p1)
	-- upvalues: ReactGlobalsModule (copy), DescribeUnknownElementTypeFrameInDEVFunction (copy), SetExtraStackFrameFunction (copy)
	if ReactGlobalsModule.__DEV__ then
		if p1 then
			local Owner = p1._owner
			SetExtraStackFrameFunction((DescribeUnknownElementTypeFrameInDEVFunction(p1.type, p1._source, if Owner then Owner.type else nil)))
			
			return
		else
			SetExtraStackFrameFunction(nil)
		end
	end
end

local Flag = not ReactGlobalsModule.__DEV__ and nil

local _ = function(p1, p2): boolean
	return p1[p2] ~= nil
end

local _ = function(): string
	-- upvalues: ReactCurrentOwner (copy), GetComponentNameFunction (copy)
	if ReactCurrentOwner.current then
		local ComponentName = GetComponentNameFunction(ReactCurrentOwner.current.type)
		
		if ComponentName then
			return "\n\nCheck the render method of `" .. ComponentName .. "`."
		end
	end
	return ""
end

local _ = function(p1): string
	return if p1 == nil then "" else "\n\nCheck your code at " .. string.gsub(p1.fileName, "^.*[\\/]", "") .. ":" .. p1.lineNumber .. "."
end

local _ = function(p1): string
	if p1 == nil then
		return ""
	else
		local Source = p1.__source
		
		return if Source == nil then "" else "\n\nCheck your code at " .. string.gsub(Source.fileName, "^.*[\\/]", "") .. ":" .. Source.lineNumber .. "."
	end
end

local t = {}

local function getCurrentComponentErrorInfo(p1): string
	-- upvalues: ReactCurrentOwner (copy), GetComponentNameFunction (copy), Boolean (copy)
	local Formatted = nil
	repeat
		if ReactCurrentOwner.current then
			local ComponentName = GetComponentNameFunction(ReactCurrentOwner.current.type)
			
			if ComponentName then
				Formatted = "\n\nCheck the render method of `" .. ComponentName .. "`."
				break
			end
		end
		Formatted = ""
	until true
	if not Boolean.toJSBoolean(Formatted) then
		local DisplayName = if typeof(p1) == "string" then p1 elseif typeof(p1) == "table" then p1.displayName or p1.name else nil
		
		if not DisplayName and typeof(p1) == "function" then
			local DebugInfo = debug.info(p1, "n")
			DisplayName = if DebugInfo == "" then nil else DebugInfo
		end
		if DisplayName then
			Formatted = string.format("\n\nCheck the top-level render call using <%s>.", DisplayName)
		end
	end
	return Formatted
end

local function validateExplicitKey(p1, p2, Key)
	-- upvalues: getCurrentComponentErrorInfo (copy), t (copy), ReactCurrentOwner (copy), GetComponentNameFunction (copy), ReactGlobalsModule (copy), DescribeUnknownElementTypeFrameInDEVFunction (copy), SetExtraStackFrameFunction (copy), Console (copy)
	if p1._store == nil or p1._store.validated then return end
	p1._store.validated = true
	
	if p1.key ~= nil ~= (Key ~= nil) then return end
	local CurrentComponentErrorInfo = getCurrentComponentErrorInfo(p2)
	
	if t[CurrentComponentErrorInfo] then return end
	t[CurrentComponentErrorInfo] = true
	local Formatted: string = if p1 and p1._owner and p1._owner ~= ReactCurrentOwner.current then string.format(" It was passed a child from %s.", (tostring(GetComponentNameFunction(p1._owner.type)))) else ""
	
	if ReactGlobalsModule.__DEV__ then
		if ReactGlobalsModule.__DEV__ then
			if p1 then
				local Owner = p1._owner
				SetExtraStackFrameFunction((DescribeUnknownElementTypeFrameInDEVFunction(p1.type, p1._source, if Owner then Owner.type else nil)))
			else
				SetExtraStackFrameFunction(nil)
			end
		end
		if p1.key == nil or Key == nil then
			Console.error("Each child in a list should have a unique \"key\" prop.%s%s See https://reactjs.org/link/warning-keys for more information.", CurrentComponentErrorInfo, Formatted)
		else
			Console.error("Child element received a \"key\" prop (\"%s\") in addition to a key in the \"children\" table of its parent (\"%s\"). Please provide only one key definition. When both are present, the \"key\" prop will take precedence.%s%s See https://reactjs.org/link/warning-keys for more information.", tostring(p1.key), tostring(Key), CurrentComponentErrorInfo, Formatted)
		end
		if ReactGlobalsModule.__DEV__ then
			SetExtraStackFrameFunction(nil)
		end
	end
end

local function validateChildKeys(Children, REACTFRAGMENTTYPE)
	-- upvalues: Array (copy), IsValidElementFunction (copy), validateExplicitKey (copy), GetIteratorFnFunction (copy)
	if typeof(Children) ~= "table" then return end
	if Array.isArray(Children) then
		for i = 1, #Children do
			local Child = Children[i]
			
			if IsValidElementFunction(Child) then
				validateExplicitKey(Child, REACTFRAGMENTTYPE)
			end
		end
		return
	else
		if not IsValidElementFunction(Children) then
			if Children then
				local IteratorFn = GetIteratorFnFunction(Children)
				
				if typeof(IteratorFn) == "function" and IteratorFn ~= Children.entries then
					local IteratorFnResult = IteratorFn(Children)
					local v1 = IteratorFnResult.next()
					while not v1.done do
						if IsValidElementFunction(v1.value) then
							validateExplicitKey(v1.value, REACTFRAGMENTTYPE, v1.key)
						end
						v1 = IteratorFnResult.next()
					end
				end
			end
		elseif Children._store then
			Children._store.validated = true
			
			return
		end
	end
end

local function validatePropTypes(p1)
	-- upvalues: ReactGlobalsModule (copy), GetComponentNameFunction (copy), CheckPropTypesFunction (copy), Flag (ref), Console (copy)
	if ReactGlobalsModule.__DEV__ or ReactGlobalsModule.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
		local Type = p1.type
		
		if Type == nil or typeof(Type) == "string" then return end
		local PropTypes = nil
		local ValidateProps = nil
		
		if typeof(Type) == "function" then return end
		if typeof(Type) ~= "table" then return end
		PropTypes = Type.propTypes
		ValidateProps = Type.validateProps
		if PropTypes or ValidateProps then
			CheckPropTypesFunction(PropTypes, ValidateProps, p1.props, "prop", GetComponentNameFunction(Type), p1)
		elseif Type.PropTypes ~= nil and not Flag then
			Flag = true
			Console.error("Component %s declared `PropTypes` instead of `propTypes`. Did you misspell the property assignment?", GetComponentNameFunction(Type) or "Unknown")
		end
		if Type.getDefaultProps ~= nil then
			Console.error("getDefaultProps is only used on classic React.createClass definitions. Use a static property named `defaultProps` instead.")
		end
	end
end

local function validateFragmentProps(p1)
	-- upvalues: ReactGlobalsModule (copy), Object (copy), DescribeUnknownElementTypeFrameInDEVFunction (copy), SetExtraStackFrameFunction (copy), Console (copy)
	if ReactGlobalsModule.__DEV__ then
		local KeysResult = Object.keys(p1.props)
		local KeysResultEntry = nil
		
		for i = 1, #KeysResult do
			KeysResultEntry = KeysResult[i]
			
			if KeysResultEntry == "children" or KeysResultEntry == "key" then
				continue
			elseif ReactGlobalsModule.__DEV__ then
				if p1 then
					local Owner = p1._owner
					SetExtraStackFrameFunction((DescribeUnknownElementTypeFrameInDEVFunction(p1.type, p1._source, if Owner then Owner.type else nil)))
				else
					SetExtraStackFrameFunction(nil)
				end
			end
			Console.error("Invalid prop `%s` supplied to `React.Fragment`. React.Fragment can only have `key` and `children` props.", KeysResultEntry)
			
			if not ReactGlobalsModule.__DEV__ then break end
			SetExtraStackFrameFunction(nil)
			break
		end
		if p1.ref ~= nil then
			if ReactGlobalsModule.__DEV__ then
				if p1 then
					local Owner = p1._owner
					SetExtraStackFrameFunction((DescribeUnknownElementTypeFrameInDEVFunction(p1.type, p1._source, if Owner then Owner.type else nil)))
				else
					SetExtraStackFrameFunction(nil)
				end
			end
			Console.error("Invalid attribute `ref` supplied to `React.Fragment`.")
			
			if ReactGlobalsModule.__DEV__ then
				SetExtraStackFrameFunction(nil)
			end
		end
	end
end

local function jsxWithValidation(REACTFRAGMENTTYPE1, p2, p3, p4, p5, p6)
	-- upvalues: IsValidElementTypeFunction (copy), Object (copy), ReactCurrentOwner (copy), GetComponentNameFunction (copy), Array (copy), REACTELEMENTTYPE (copy), InspectFunction (copy), ReactGlobalsModule (copy), Console (copy), JsxDEVFunction (copy), validateChildKeys (copy), WarnAboutSpreadingKeyToJSX (copy), REACTFRAGMENTTYPE (copy), validateFragmentProps (copy), validatePropTypes (copy)
	local IsValidElementType = IsValidElementTypeFunction(REACTFRAGMENTTYPE1)
	
	if not IsValidElementType then
		local Text = ""
		
		if REACTFRAGMENTTYPE1 == nil or typeof(REACTFRAGMENTTYPE1) == "table" and #Object.keys(REACTFRAGMENTTYPE1) == 0 then
			Text ..= " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
		end
		local Text1: string = if p5 == nil then "" else "\n\nCheck your code at " .. string.gsub(p5.fileName, "^.*[\\/]", "") .. ":" .. p5.lineNumber .. "."
		local Text2 = nil
		repeat
			if Text1 then
				Text2 = Text .. Text1
				break
			end
			local Text3: string = Text
			local v2 = nil
			repeat
				if ReactCurrentOwner.current then
					local ComponentName = GetComponentNameFunction(ReactCurrentOwner.current.type)
					
					if ComponentName then
						v2 = "\n\nCheck the render method of `" .. ComponentName .. "`."
						break
					end
				end
				v2 = ""
			until true
			Text2 = Text3 .. v2
		until true
		local Formatted = nil
		if REACTFRAGMENTTYPE1 == nil then
			Formatted = "nil"
		elseif Array.isArray(REACTFRAGMENTTYPE1) then
			Formatted = "array"
		elseif typeof(REACTFRAGMENTTYPE1) == "table" and REACTFRAGMENTTYPE1["$$typeof"] == REACTELEMENTTYPE then
			Formatted = string.format("<%s />", GetComponentNameFunction(REACTFRAGMENTTYPE1.type) or "Unknown")
			Text2 ..= " Did you accidentally export a JSX literal or Element instead of a component?"
		else
			Formatted = typeof(REACTFRAGMENTTYPE1)
			Text2 ..= "\n" .. InspectFunction(REACTFRAGMENTTYPE1)
		end
		if ReactGlobalsModule.__DEV__ then
			Console.error("React.jsx: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", Formatted, Text2)
		end
	end
	local JsxDEVResult = JsxDEVFunction(REACTFRAGMENTTYPE1, p2, p3, p5, p6)
	
	if JsxDEVResult == nil then
		return JsxDEVResult
	end
	if IsValidElementType then
		local Children = p2.children
		
		if Children ~= nil then
			if p4 then
				if Array.isArray(Children) then
					for i = 1, #Children do
						validateChildKeys(Children[i], REACTFRAGMENTTYPE1)
					end
					Object.freeze(Children)
				elseif ReactGlobalsModule.__DEV__ then
					Console.error("React.jsx: Static children should always be an array. You are likely explicitly calling React.jsxs or React.jsxDEV. Use the Babel transform instead.")
				end
			else
				validateChildKeys(Children, REACTFRAGMENTTYPE1)
			end
		end
	end
	if ReactGlobalsModule.__DEV__ and WarnAboutSpreadingKeyToJSX and p2.key ~= nil then
		Console.error("React.jsx: Spreading a key to JSX is a deprecated pattern. Explicitly pass a key after spreading props in your JSX call. E.g. <%s {...props} key={key} />", GetComponentNameFunction(REACTFRAGMENTTYPE1) or "ComponentName")
	end
	if REACTFRAGMENTTYPE1 == REACTFRAGMENTTYPE then
		validateFragmentProps(JsxDEVResult)
		
		return JsxDEVResult
	else
		validatePropTypes(JsxDEVResult)
		
		return JsxDEVResult
	end
end

return {
	jsxWithValidation = jsxWithValidation,
	jsxWithValidationStatic = function(p7, p8, p9)
		-- upvalues: jsxWithValidation (copy)
		return (jsxWithValidation(p7, p8, p9, true))
	end,
	jsxWithValidationDynamic = function(p7, p8, p9)
		-- upvalues: jsxWithValidation (copy)
		return (jsxWithValidation(p7, p8, p9, false))
	end,
	createElementWithValidation = function(REACTFRAGMENTTYPE1, p7, ...)
		-- upvalues: IsValidElementTypeFunction (copy), Object (copy), ReactCurrentOwner (copy), GetComponentNameFunction (copy), Array (copy), REACTELEMENTTYPE (copy), InspectFunction (copy), ReactGlobalsModule (copy), Console (copy), CreateElementFunction (copy), validateChildKeys (copy), REACTFRAGMENTTYPE (copy), validateFragmentProps (copy), validatePropTypes (copy)
		local IsValidElementType = IsValidElementTypeFunction(REACTFRAGMENTTYPE1)
		
		if not IsValidElementType then
			local Text = ""
			
			if REACTFRAGMENTTYPE1 == nil or typeof(REACTFRAGMENTTYPE1) == "table" and #Object.keys(REACTFRAGMENTTYPE1) == 0 then
				Text ..= " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
			end
			local Text2 = nil
			local Text1 = nil
			if p7 == nil then
				Text1 = ""
			else
				local Source = p7.__source
				Text1 = if Source == nil then "" else "\n\nCheck your code at " .. string.gsub(Source.fileName, "^.*[\\/]", "") .. ":" .. Source.lineNumber .. "."
			end
			repeat
				if Text1 then
					Text2 = Text .. Text1
					break
				end
				local Text3: string = Text
				local v3 = nil
				repeat
					if ReactCurrentOwner.current then
						local ComponentName = GetComponentNameFunction(ReactCurrentOwner.current.type)
						
						if ComponentName then
							v3 = "\n\nCheck the render method of `" .. ComponentName .. "`."
							break
						end
					end
					v3 = ""
				until true
				Text2 = Text3 .. v3
			until true
			local Formatted = nil
			if REACTFRAGMENTTYPE1 == nil then
				Formatted = "nil"
			elseif Array.isArray(REACTFRAGMENTTYPE1) then
				Formatted = "array"
			elseif REACTFRAGMENTTYPE1 == nil or typeof(REACTFRAGMENTTYPE1) ~= "table" or REACTFRAGMENTTYPE1["$$typeof"] ~= REACTELEMENTTYPE then
				Formatted = typeof(REACTFRAGMENTTYPE1)
				
				if REACTFRAGMENTTYPE1 ~= nil then
					Text2 ..= "\n" .. InspectFunction(REACTFRAGMENTTYPE1)
				end
			else
				Formatted = string.format("<%s />", GetComponentNameFunction(REACTFRAGMENTTYPE1.type) or "Unknown")
				Text2 ..= " Did you accidentally export a JSX literal or Element instead of a component?"
			end
			if ReactGlobalsModule.__DEV__ then
				Console.error("React.createElement: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", Formatted, Text2)
			end
		end
		local Element = CreateElementFunction(REACTFRAGMENTTYPE1, p7, ...)
		
		if Element == nil then
			return Element
		end
		if IsValidElementType then
			for i = 1, select("#", ...) do
				validateChildKeys(select(i, ...), REACTFRAGMENTTYPE1)
			end
		end
		if REACTFRAGMENTTYPE1 == REACTFRAGMENTTYPE then
			validateFragmentProps(Element)
			
			return Element
		else
			validatePropTypes(Element)
			
			return Element
		end
	end,
	cloneElementWithValidation = function(p8, p9, ...)
		-- upvalues: CloneElementFunction (copy), validateChildKeys (copy), validatePropTypes (copy)
		local list = { p8, p9, ... }
		local CloneElementResult = CloneElementFunction(p8, p9, ...)
		
		for i = 3, #list do
			validateChildKeys(list[i], CloneElementResult.type)
		end
		validatePropTypes(CloneElementResult)
		
		return CloneElementResult
	end
}