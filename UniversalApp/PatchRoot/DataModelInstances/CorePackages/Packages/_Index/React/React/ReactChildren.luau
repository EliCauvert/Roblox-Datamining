local Parent = script.Parent.Parent
local _ = require(Parent.Shared)
local InvariantFunction = require(Parent.Shared).invariant
local ReactSymbols = require(Parent.Shared).ReactSymbols
local GetIteratorFnFunction = ReactSymbols.getIteratorFn
local REACTELEMENTTYPE = ReactSymbols.REACT_ELEMENT_TYPE
local REACTPORTALTYPE = ReactSymbols.REACT_PORTAL_TYPE
local Array = require(Parent.LuauPolyfill).Array
local ReactElementModule = require(script.Parent.ReactElement)
local IsValidElementFunction = ReactElementModule.isValidElement
local CloneAndReplaceKeyFunction = ReactElementModule.cloneAndReplaceKey

local function _(Text: string): string --[[ Line: 45 | Named "escape" ]]
	return "$" .. string.gsub(string.gsub(Text, "=", "=0"), ":", "=2")
end

local _ = function(p1) --[[ Line: 60 | Named "escapeUserProvidedKey" ]]
	return p1
end

local _ = function(p1, p2): string --[[ Line: 73 | Named "getElementKey" ]]
	return if typeof(p1) == "table" and p1 ~= nil and p1.key ~= nil then "$" .. string.gsub(string.gsub(tostring(p1.key), "=", "=0"), ":", "=2") else tostring(p2)
end

local function mapIntoArray(p1, List, Text, Text1, Callback): number --[[ Line: 86 ]]
	-- upvalues: REACTELEMENTTYPE (copy), REACTPORTALTYPE (copy), Array (copy), mapIntoArray (copy), IsValidElementFunction (copy), CloneAndReplaceKeyFunction (copy), GetIteratorFnFunction (copy)
	local ValueType = typeof(p1)
	
	if ValueType == "nil" or ValueType == "boolean" or ValueType == "userdata" then
		p1 = nil
	end
	local Flag = false
	
	if p1 == nil then
		Flag = true
	elseif ValueType == "string" or ValueType == "number" then
		Flag = true
	elseif ValueType == "table" then
		local Typeof1 = p1["$$typeof"]
		
		if Typeof1 == REACTELEMENTTYPE or Typeof1 == REACTPORTALTYPE then
			Flag = true
		end
	end
	if Flag then
		local v1 = p1
		local CallbackResult = Callback(v1)
		local Text2 = if Text1 == "" then "." .. (if typeof(v1) == "table" and v1 ~= nil and v1.key ~= nil then "$" .. string.gsub(string.gsub(tostring(v1.key), "=", "=0"), ":", "=2") else tostring(1)) else Text1
		
		if Array.isArray(CallbackResult) then
			mapIntoArray(CallbackResult, List, if Text2 == nil then "" else Text2 .. "/", "", function(p2) --[[ Line: 135 ]]
				return p2
			end)
		elseif CallbackResult ~= nil then
			if IsValidElementFunction(CallbackResult) then
				local Key = CallbackResult.key
				CallbackResult = CloneAndReplaceKeyFunction(CallbackResult, Text .. (if Key and (not v1 or v1.key ~= Key) then tostring(Key) .. "/" else "") .. Text2)
			end
			table.insert(List, CallbackResult)
		end
		return 1
	else
		local Total = 0
		local Text3: string = if Text1 == "" then "." else Text1 .. ":"
		
		if Array.isArray(p1) then
			for i = 1, #p1 do
				local v2 = p1[i]
				Total += mapIntoArray(v2, List, Text, Text3 .. (if typeof(v2) == "table" and v2 ~= nil and v2.key ~= nil then "$" .. string.gsub(string.gsub(tostring(v2.key), "=", "=0"), ":", "=2") else tostring(i)), Callback)
			end
			return Total
		else
			local IteratorFn = GetIteratorFnFunction(p1)
			
			if typeof(IteratorFn) == "function" then
				local IteratorFnResult = IteratorFn(p1)
				local Count = 1
				local v3 = IteratorFnResult.next()
				while not v3.done do
					local Value = v3.value
					local Count1: number = Count
					Count += 1
					Total += mapIntoArray(Value, List, Text, Text3 .. (if typeof(Value) == "table" and Value ~= nil and Value.key ~= nil then "$" .. string.gsub(string.gsub(tostring(Value.key), "=", "=0"), ":", "=2") else tostring(Count1)), Callback)
					v3 = IteratorFnResult.next()
				end
			end
			return Total
		end
	end
end

local function mapChildren(p2, Callback, _) --[[ Line: 253 ]]
	-- upvalues: mapIntoArray (copy)
	if p2 == nil then
		return nil
	else
		local t = {}
		local Count = 1
		mapIntoArray(p2, t, "", "", function(p3) --[[ Line: 263 ]]
			-- upvalues: Callback (copy), Count (ref)
			local CallbackResult = Callback(p3, Count)
			Count += 1
			
			return CallbackResult
		end)
		
		return t
	end
end

return {
	forEach = function(p2, Callback, p3) --[[ Line: 305 ]]
		-- upvalues: mapChildren (copy)
		mapChildren(p2, function(...) --[[ Line: 310 ]]
			-- upvalues: Callback (copy)
			Callback(...)
		end, p3)
	end,
	map = mapChildren,
	count = function(p2): number --[[ Line: 281 ]]
		-- upvalues: mapChildren (copy)
		local Count = 0
		mapChildren(p2, function() --[[ Line: 283 ]]
			-- upvalues: Count (ref)
			Count += 1
		end)
		
		return Count
	end,
	only = function(p2) --[[ Line: 345 ]]
		-- upvalues: InvariantFunction (copy), IsValidElementFunction (copy)
		InvariantFunction(IsValidElementFunction(p2), "React.Children.only expected to receive a single React element child.")
		
		return p2
	end,
	toArray = function(p2) --[[ Line: 324 ]]
		-- upvalues: mapChildren (copy)
		return mapChildren(p2, function(p3) --[[ Line: 325 ]]
			return p3
		end) or {}
	end
}