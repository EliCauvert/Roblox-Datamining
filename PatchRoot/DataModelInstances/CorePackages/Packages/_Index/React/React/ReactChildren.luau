-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:43:02 2026 Pacific Standard Time.

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

local function _(p0) --[[ line: 45 | named "escape" ]]
	return "$" .. string.gsub(string.gsub(p0, "=", "=0"), ":", "=2")
end

local _ = function(p1) --[[ line: 60 | named "escapeUserProvidedKey" ]]
	return p1
end

local _ = function(p2, p3) --[[ line: 73 | named "getElementKey" ]]
	return if typeof(p2) == "table" and p2 ~= nil and p2.key ~= nil then "$" .. string.gsub(string.gsub(tostring(p2.key), "=", "=0"), ":", "=2") else tostring(p3)
end

local function mapIntoArray(p4, p5, p6, p7, p8) --[[ line: 86 ]]
	-- upvalues: REACT_ELEMENT_TYPE (ref), REACT_PORTAL_TYPE (ref), array (ref), mapIntoArray (ref), isValidElement (ref), cloneAndReplaceKey (ref), getIteratorFn (ref)
	local var3 = typeof(p4)
	
	if var3 == "nil" or var3 == "boolean" or var3 == "userdata" then
		p4 = nil
	end
	local var5
	local var4 = false
	
	if p4 == nil then
		var4 = true
	elseif var3 == "string" or var3 == "number" then
		var4 = true
	elseif var3 == "table" then
		local key
		var5 = p4["$$typeof"]
		
		if var5 == REACT_ELEMENT_TYPE or var5 == REACT_PORTAL_TYPE then
			var4 = true
		end
	end
	if var4 then
		var5 = p4
		local var6 = p8(var5)
		local var7 = if p7 == "" then "." .. (if typeof(var5) == "table" and var5 ~= nil and var5.key ~= nil then "$" .. string.gsub(string.gsub(tostring(var5.key), "=", "=0"), ":", "=2") else tostring(1)) else p7
		
		if array.isArray(var6) then
			mapIntoArray(var6, p5, if var7 ~= nil then var7 .. "/" else "", "", function(p9) --[[ line: 135 ]]
				return p9
			end)
		elseif var6 ~= nil then
			if isValidElement(var6) then
				key = var6.key
				var6 = cloneAndReplaceKey(var6, p6 .. (if key and (not var5 or var5.key ~= key) then tostring(key) .. "/" else "") .. var7)
			end
			table.insert(p5, var6)
		end
		return 1
	else
		var5 = nil
		local _ = nil
		local var8 = 0
		key = if p7 == "" then "." else p7 .. ":"
		
		if array.isArray(p4) then
			for i = 1, #p4 do
				var5 = p4[i]
				var8 += mapIntoArray(var5, p5, p6, key .. (if typeof(var5) == "table" and var5 ~= nil and var5.key ~= nil then "$" .. string.gsub(string.gsub(tostring(var5.key), "=", "=0"), ":", "=2") else tostring(i)), p8)
			end
			return var8
		else
			local var9 = getIteratorFn(p4)
			
			if typeof(var9) == "function" then
				local var10 = var9(p4)
				local _ = nil
				local var11 = 1
				local var12 = var10.next()
				while not var12.done do
					var5 = var12.value
					local var13 = if typeof(var5) == "table" and var5 ~= nil and var5.key ~= nil then "$" .. string.gsub(string.gsub(tostring(var5.key), "=", "=0"), ":", "=2") else tostring(var11)
					var11 += 1
					var8 += mapIntoArray(var5, p5, p6, key .. var13, p8)
					var12 = var10.next()
				end
			end
			return var8
		end
	end
end

local function mapChildren(p10, p11, _) --[[ line: 253 ]]
	-- upvalues: mapIntoArray (ref)
	if p10 == nil then
		return nil
	end
	local t = {}
	local var15 = 1
	mapIntoArray(p10, t, "", "", function(p12) --[[ line: 263 ]]
		-- upvalues: p11 (ref), var15 (write)
		local var16 = p11(p12, var15)
		var15 += 1
		
		return var16
	end)
	
	return t
end

return {
	forEach = function(p13, p14, p15) --[[ line: 305 ]]
		-- upvalues: mapChildren (ref)
		mapChildren(p13, function(...) --[[ line: 310 ]]
			-- upvalues: p14 (ref)
			p14(...)
		end, p15)
	end,
	map = mapChildren,
	count = function(p16) --[[ line: 281 ]]
		-- upvalues: mapChildren (ref)
		local var17 = 0
		mapChildren(p16, function() --[[ line: 283 ]]
			-- upvalues: var17 (write)
			var17 += 1
		end)
		
		return var17
	end,
	only = function(p17) --[[ line: 345 ]]
		-- upvalues: invariant (ref), isValidElement (ref)
		invariant(isValidElement(p17), "React.Children.only expected to receive a single React element child.")
		
		return p17
	end,
	toArray = function(p18) --[[ line: 324 ]]
		-- upvalues: mapChildren (ref)
		return mapChildren(p18, function(p19) --[[ line: 325 ]]
			return p19
		end) or {}
	end
}