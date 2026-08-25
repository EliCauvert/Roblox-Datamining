local parent = script.Parent.Parent
local cryoModule = require(parent.Cryo)
local regexModule = require(script.Parent.Regex)
local regExpModule = require(parent.RegExp)
local stringUtilitiesModule = require(parent.StringUtilities)
local stringSplit = stringUtilitiesModule.StringSplit
local stringTrim = stringUtilitiesModule.StringTrim
local parseQuery = stringUtilitiesModule.ParseQuery
local _ = require(script.Parent.Types)

local function filterParams(p0, p1)
	-- upvalues: cryoModule (ref)
	return cryoModule.List.filter(p0, function(p2)
		-- upvalues: p1 (ref)
		return if p2.optional ~= p1 then not p1 and p2.optional == nil else true
	end)
end

local function _(p3)
	-- upvalues: filterParams (ref)
	return filterParams(p3, false)
end

local _ = function(p4)
	-- upvalues: filterParams (ref)
	return filterParams(p4, true)
end

local _ = function(p5)
	-- upvalues: regexModule (ref), regExpModule (ref)
	return function(p6)
		-- upvalues: regexModule (copy), p5 (ref), regExpModule (copy)
		local name = p5[p6.name]
		
		return if name == nil or not regExpModule(regexModule.matchWhole(regexModule.oneOrMore(p6.pattern))):exec(name) then nil else p6.name
	end
end

local function validateParams(p7, p8)
	-- upvalues: cryoModule (ref), regexModule (ref), regExpModule (ref)
	p7 = p7 or {}
	local var9 = false
	local var10 = cryoModule.List.filter(p8, function(p9)
		-- upvalues: var9 (ref)
		return if p9.optional ~= var9 then not var9 and p9.optional == nil else true
	end)
	
	local var11 = function(p10)
		-- upvalues: regexModule (copy), p7 (ref), regExpModule (copy)
		local name = p7[p10.name]
		
		return if name == nil or not regExpModule(regexModule.matchWhole(regexModule.oneOrMore(p10.pattern))):exec(name) then nil else p10.name
	end
	
	local var12 = cryoModule.List.filterMap(var10, var11)
	
	if #var12 == #var10 then
		local var13 = true
		var13 = cryoModule.List.toSet(cryoModule.List.join(var12, cryoModule.List.filterMap(cryoModule.List.filter(p8, function(p11)
			-- upvalues: var13 (ref)
			return if p11.optional ~= var13 then not var13 and p11.optional == nil else true
		end), var11)))
		
		return true, cryoModule.Dictionary.filter(p7, function(_, p12)
			-- upvalues: var13 (ref)
			return var13[p12] ~= nil
		end)
	end
	return false, {}
end

local function validatePathParams(p13, p14)
	-- upvalues: cryoModule (ref), validateParams (ref)
	local var14 = false
	
	if #p13 < #cryoModule.List.filter(p14, function(p15)
		-- upvalues: var14 (ref)
		return if p15.optional ~= var14 then not var14 and p15.optional == nil else true
	end) then
		return false, {}
	end
	return validateParams(cryoModule.Dictionary.map(p14, function(p16, p17)
		-- upvalues: p13 (ref)
		return p13[p17], p16.name
	end), p14)
end

local function validateUrlParams(p18, p19)
	-- upvalues: stringTrim (ref), stringSplit (ref), parseQuery (ref), cryoModule (ref), validatePathParams (ref), validateParams (ref)
	local var15 = if p18.path then stringTrim(p18.path, "/") else ""
	local var16 = cryoModule.Dictionary.map(parseQuery(p18.query), function(p20)
		return if #p20 == 1 then p20[1] else p20
	end)
	local var17, var18 = validatePathParams(if var15 ~= "" then {} else stringSplit(var15, "/"), p19.pathParams or {})
	
	if not var17 then
		return false, {}
	end
	local var19, var20 = validateParams(var16, p19.queryParams or {})
	
	if var19 then
		return true, cryoModule.Dictionary.union(var18, var20)
	end
	return false, {}
end

return {
	validateUrlMatch = function(p21, p22)
		-- upvalues: regExpModule (ref), validateUrlParams (ref)
		for i, v in p22 do
			if regExpModule(i, "i"):test(p21.matchedPath) then
				local var21, var22 = validateUrlParams(p21.url, v)
				
				if var21 then
					return var21, v.paramCallback(var22)
				end
			end
		end
		return false, nil
	end,
	validateUrlParams = validateUrlParams
}