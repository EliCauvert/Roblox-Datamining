local parent = script.Parent.Parent
local _ = require(parent.Shared)
local invariant = require(parent.Shared).invariant
local reactSymbols = require(parent.Shared).ReactSymbols
local getIteratorFn = reactSymbols.getIteratorFn
local REACT_ELEMENT_TYPE = reactSymbols.REACT_ELEMENT_TYPE
local REACT_PORTAL_TYPE = reactSymbols.REACT_PORTAL_TYPE
local array = require(parent.LuauPolyfill).Array
local reactElementModule = require(script.Parent.ReactElement)
local isValidElement = reactElementModule.isValidElement
local cloneAndReplaceKey = reactElementModule.cloneAndReplaceKey

local function _(p1)
	return "$" .. string.gsub(string.gsub(p1, "=", "=0"), ":", "=2")
end

local _ = function(p1)
	return p1
end

local _ = function(p1, p2)
	return if typeof(p1) == "table" and p1 ~= nil and p1.key ~= nil then "$" .. string.gsub(string.gsub(tostring(p1.key), "=", "=0"), ":", "=2") else tostring(p2)
end

local function mapIntoArray(p1, p2, p3, p4, p5)
	-- upvalues: REACT_ELEMENT_TYPE (ref), REACT_PORTAL_TYPE (ref), array (ref), mapIntoArray (ref), isValidElement (ref), cloneAndReplaceKey (ref), getIteratorFn (ref)
	local var1 = typeof(p1)
	
	if var1 == "nil" or var1 == "boolean" or var1 == "userdata" then
		p1 = nil
	end
	local var2
	local var3 = false
	
	if p1 == nil then
		var3 = true
	elseif var1 == "string" or var1 == "number" then
		var3 = true
	elseif var1 == "table" then
		local key
		var2 = p1["$$typeof"]
		
		if var2 == REACT_ELEMENT_TYPE or var2 == REACT_PORTAL_TYPE then
			var3 = true
		end
	end
	if var3 then
		var2 = p1
		local var4 = p5(var2)
		local var5 = if p4 == "" then "." .. (if typeof(var2) == "table" and var2 ~= nil and var2.key ~= nil then "$" .. string.gsub(string.gsub(tostring(var2.key), "=", "=0"), ":", "=2") else tostring(1)) else p4
		
		if array.isArray(var4) then
			mapIntoArray(var4, p2, if var5 ~= nil then var5 .. "/" else "", "", function(p6)
				return p6
			end)
		elseif var4 ~= nil then
			if isValidElement(var4) then
				key = var4.key
				var4 = cloneAndReplaceKey(var4, p3 .. (if key and (not var2 or var2.key ~= key) then tostring(key) .. "/" else "") .. var7)
			end
			table.insert(p2, var4)
		end
		return 1
	else
		var2 = nil
		local _ = nil
		local var6 = 0
		key = if p4 == "" then "." else p4 .. ":"
		
		if array.isArray(p1) then
			for i = 1, #p1 do
				var2 = p1[i]
				var6 += mapIntoArray(var2, p2, p3, key .. (if typeof(var2) == "table" and var2 ~= nil and var2.key ~= nil then "$" .. string.gsub(string.gsub(tostring(var2.key), "=", "=0"), ":", "=2") else tostring(i)), p5)
			end
			return var6
		else
			local var7 = getIteratorFn(p1)
			
			if typeof(var7) == "function" then
				local var8 = var7(p1)
				local _ = nil
				local var9 = 1
				local var10 = var8.next()
				while not var10.done do
					var2 = var10.value
					local var11 = if typeof(var2) == "table" and var2 ~= nil and var2.key ~= nil then "$" .. string.gsub(string.gsub(tostring(var2.key), "=", "=0"), ":", "=2") else tostring(var9)
					var9 += 1
					var6 += mapIntoArray(var2, p2, p3, key .. var13, p5)
					var10 = var8.next()
				end
			end
			return var6
		end
	end
end

local function mapChildren(p6, p7, _)
	-- upvalues: mapIntoArray (ref)
	if p6 == nil then
		return nil
	end
	local t = {}
	local var12 = 1
	mapIntoArray(p6, t, "", "", function(p8)
		-- upvalues: p7 (ref), var12 (write)
		local var13 = p7(p8, var12)
		var12 += 1
		
		return var13
	end)
	
	return t
end

return {
	forEach = function(p6, p7, p8)
		-- upvalues: mapChildren (ref)
		mapChildren(p6, function(...)
			-- upvalues: p7 (ref)
			p7(...)
		end, p8)
	end,
	map = mapChildren,
	count = function(p6)
		-- upvalues: mapChildren (ref)
		local var12 = 0
		mapChildren(p6, function()
			-- upvalues: var12 (write)
			var12 += 1
		end)
		
		return var12
	end,
	only = function(p6)
		-- upvalues: invariant (ref), isValidElement (ref)
		invariant(isValidElement(p6), "React.Children.only expected to receive a single React element child.")
		
		return p6
	end,
	toArray = function(p6)
		-- upvalues: mapChildren (ref)
		return mapChildren(p6, function(p7)
			return p7
		end) or {}
	end
}