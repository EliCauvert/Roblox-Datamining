local parent = script.Parent.Parent
local cryoModule = require(parent.Cryo)
local regexModule = require(script.Parent.Regex)
local regExpModule = require(parent.RegExp)
local stringUtilitiesModule = require(parent.StringUtilities)
local stringSplit = stringUtilitiesModule.StringSplit
local stringTrim = stringUtilitiesModule.StringTrim
local parseQuery = stringUtilitiesModule.ParseQuery
local _ = require(script.Parent.Types)

local function filterParams(p1, p2)
	-- upvalues: cryoModule (ref)
	return cryoModule.List.filter(p1, function(p3)
		-- upvalues: p2 (ref)
		return if p3.optional ~= p2 then not p2 and p3.optional == nil else true
	end)
end

local function _(p1)
	-- upvalues: filterParams (ref)
	return filterParams(p1, false)
end

local _ = function(p1)
	-- upvalues: filterParams (ref)
	return filterParams(p1, true)
end

local _ = function(p1)
	-- upvalues: regexModule (ref), regExpModule (ref)
	return function(p2)
		-- upvalues: regexModule (copy), p1 (ref), regExpModule (copy)
		local name = p1[p2.name]
		
		return if name == nil or not regExpModule(regexModule.matchWhole(regexModule.oneOrMore(p2.pattern))):exec(name) then nil else p2.name
	end
end

local function validateParams(p1, p2)
	-- upvalues: cryoModule (ref), regexModule (ref), regExpModule (ref)
	p1 = p1 or {}
	local var1 = false
	local var2 = cryoModule.List.filter(p2, function(p3)
		-- upvalues: var1 (ref)
		return if p3.optional ~= var1 then not var1 and p3.optional == nil else true
	end)
	
	local var3 = function(p3)
		-- upvalues: regexModule (copy), p1 (ref), regExpModule (copy)
		local name = p1[p3.name]
		
		return if name == nil or not regExpModule(regexModule.matchWhole(regexModule.oneOrMore(p3.pattern))):exec(name) then nil else p3.name
	end
	
	local var4 = cryoModule.List.filterMap(var2, var3)
	
	if #var4 == #var2 then
		local var5 = true
		var5 = cryoModule.List.toSet(cryoModule.List.join(var4, cryoModule.List.filterMap(cryoModule.List.filter(p2, function(p3)
			-- upvalues: var5 (ref)
			return if p3.optional ~= var5 then not var5 and p3.optional == nil else true
		end), var3)))
		
		return true, cryoModule.Dictionary.filter(p1, function(_, p3)
			-- upvalues: var5 (ref)
			return var5[p3] ~= nil
		end)
	end
	return false, {}
end

local function validatePathParams(p1, p2)
	-- upvalues: cryoModule (ref), validateParams (ref)
	local var1 = false
	
	if #p1 < #cryoModule.List.filter(p2, function(p3)
		-- upvalues: var1 (ref)
		return if p3.optional ~= var1 then not var1 and p3.optional == nil else true
	end) then
		return false, {}
	end
	return validateParams(cryoModule.Dictionary.map(p2, function(p3, p4)
		-- upvalues: p1 (ref)
		return p1[p4], p3.name
	end), p2)
end

local function validateUrlParams(p1, p2)
	-- upvalues: stringTrim (ref), stringSplit (ref), parseQuery (ref), cryoModule (ref), validatePathParams (ref), validateParams (ref)
	local var1 = if p1.path then stringTrim(p1.path, "/") else ""
	local var2 = cryoModule.Dictionary.map(parseQuery(p1.query), function(p3)
		return if #p3 == 1 then p3[1] else p3
	end)
	local var3, var4 = validatePathParams(if var1 ~= "" then {} else stringSplit(var1, "/"), p2.pathParams or {})
	
	if not var3 then
		return false, {}
	end
	local var5, var6 = validateParams(var2, p2.queryParams or {})
	
	if var5 then
		return true, cryoModule.Dictionary.union(var4, var6)
	end
	return false, {}
end

return {
	validateUrlMatch = function(p1, p2)
		-- upvalues: regExpModule (ref), validateUrlParams (ref)
		for i, v in p2 do
			if regExpModule(i, "i"):test(p1.matchedPath) then
				local var1, var2 = validateUrlParams(p1.url, v)
				
				if var1 then
					return var1, v.paramCallback(var2)
				end
			end
		end
		return false, nil
	end,
	validateUrlParams = validateUrlParams
}