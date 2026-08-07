local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local luauPolyfillModule = require(parent_2.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local string = luauPolyfillModule.String
local regExpModule = require(parent_2.RegExp)
local invariantModule = require(parent_1.utils.invariant)
local navigationActionsModule = require(parent_1.NavigationActions)
local pathToRegexpModule = require(parent.pathToRegexp)
local compile = pathToRegexpModule.compile
local pathToRegexp = pathToRegexpModule.pathToRegexp
local queryStringModule = require(parent.queryString)
local unknownModule = require(parent:FindFirstChild("ChildIsScreenRouterSymbol.roblox"))
local unknownModule_1 = require(parent:FindFirstChild("NullPathSymbol.roblox"))
local decodeURIComponentModule = require(parent.decodeURIComponent)
local t = {
	getParamsFromPath = function(p0, p1, p2) --[[ line: 27 ]]
		-- upvalues: array (ref), decodeURIComponentModule (ref)
		return array.reduce(array.slice(p1, 2), function(p3, p4, p5) --[[ line: 31 ]]
			-- upvalues: p2 (ref), decodeURIComponentModule (copy)
			local var11 = p2[p5]
			
			if not var11 or var11.pattern == ".*" then
				return p3
			end
			local name = var11.name
			local var12 = nil
			
			if p4 then
				local ok, status = pcall(decodeURIComponentModule, p4)
				
				if ok then
					var12 = status
				end
			end
			p3[name] = var12 or p4
			
			return p3
		end, table.clone(p0))
	end
}

local function _(p6, p7) --[[ line: 59 | named "getRestOfPath" ]]
	-- upvalues: array (ref)
	return p6[array.findIndex(p7, function(p8) --[[ line: 62 ]]
		return p8.pattern == ".*"
	end) + 1]
end

local function determineDelimiter(a, b) --[[ line: 69 ]]
	-- upvalues: array (ref), string (ref)
	if not array.isArray(b) then
		return b
	elseif #b == 1 then
		return b[1]
	end
	for i, v in b do
		if string.startsWith(a, v) then
			return v
		end
	end
	return nil
end

function t.urlToPathAndParams(p9, p10) --[[ line: 85 ]]
	-- upvalues: regExpModule (ref), queryStringModule (ref), determineDelimiter (ref)
	local var13 = regExpModule("^(.*)\\?(.*)$"):exec(p9)
	local var14 = if var13 then var13[2] else p9
	local var15 = queryStringModule.parse(if var13 then var13[3] else {})
	local var16 = determineDelimiter(var14, p10)
	
	if var16 == nil or var16 == "" then
		var16 = "://"
	end
	local var17 = string.split(var14, var16)[2]
	
	if var17 == nil then
		var17 = var14
	end
	if var17 == "/" then
		var17 = ""
	end
	if string.sub(var17, -1, -1) == "/" then
		var17 = string.sub(var17, 1, -2)
	end
	return { path = var17, params = var15 }
end

function t.createPathParser(p11, p12, p13) --[[ line: 112 ]]
	-- upvalues: unknownModule_1 (ref), invariantModule (ref), pathToRegexp (ref), compile (ref), object (ref), array (ref), navigationActionsModule (ref), t (ref), unknownModule (ref)
	local paths = p13.paths or {}
	local disableRouteNamePaths = p13.disableRouteNamePaths
	local t_1 = {}
	local _ = {}
	
	for i in p11 do
		local var21 = nil
		
		if paths[i] ~= nil then
			var21 = paths[i]
		elseif type(p12[i]) == "table" then
			var21 = p12[i].path
		end
		if var21 == nil then
			var21 = if disableRouteNamePaths then unknownModule_1 else i
		end
		invariantModule(if var21 ~= unknownModule_1 then type(var21) == "string" else true, "Route path for %s must be specified as a string, or RoactNavigation.NoPath.", i)
		local var22 = var21 ~= unknownModule_1
		local t_2 = {}
		local var24 = if var22 then pathToRegexp(var21, t_2) else nil
		local t_3 = {}
		local var26 = if var21 ~= "" then not var22 else true
		t_1[i] = {
			exactRe = var24,
			exactReKeys = t_2,
			extendedPathRe = pathToRegexp(if var26 then "(.*)" else ("%s/(.*)"):format(var21), t_3),
			extendedPathReKeys = t_3,
			isWildcard = var26,
			toPath = if var21 == unknownModule_1 then function() --[[ line: 172 ]]
				return ""
			end else compile(var21)
		}
	end
	local var20 = object.entries(t_1)
	
	return {
		getActionForPathAndParams = function(p14, p15) --[[ line: 180 ]]
			-- upvalues: var20 (write), p11 (ref), array (copy), navigationActionsModule (copy), t (copy)
			if p14 == nil then
				p14 = ""
			end
			if p15 == nil then
				p15 = {}
			end
			local var31
			for i, v in var20 do
				local var32 = v[1]
				local var33 = v[2]
				local exactRe = var33.exactRe
				local exactReKeys = var33.exactReKeys
				local extendedPathRe = var33.extendedPathRe
				local extendedPathReKeys = var33.extendedPathReKeys
				local var34 = p11[var32]
				var31 = exactRe and exactRe:exec(p14)
				
				if var31 and var31.n ~= 0 then
					local var35 = extendedPathRe and extendedPathRe:exec(p14)
					
					return navigationActionsModule.navigate({
						routeName = var32,
						params = t.getParamsFromPath(p15, var31, exactReKeys),
						action = if var35 and var34 then var34.getActionForPathAndParams(var35[array.findIndex(extendedPathReKeys, function(p16) --[[ line: 62 ]]
							return p16.pattern == ".*"
						end) + 1], p15) else nil
					})
				end
			end
			for i, v_1 in var20 do
				local var27 = v_1[1]
				local var28 = v_1[2]
				local extendedPathRe = var28.extendedPathRe
				local extendedPathReKeys = var28.extendedPathReKeys
				local var29 = p11[var27]
				local var30 = extendedPathRe and extendedPathRe:exec(p14)
				
				if var30 and var30.n ~= 0 then
					var31 = if var29 then var29.getActionForPathAndParams(var30[array.findIndex(extendedPathReKeys, function(p17) --[[ line: 62 ]]
						return p17.pattern == ".*"
					end) + 1], p15) else nil
					
					if var31 then
						return navigationActionsModule.navigate({
							routeName = var27,
							params = t.getParamsFromPath(p15, var30, extendedPathReKeys),
							action = var31
						})
					end
				end
			end
			return nil
		end,
		getPathAndParamsForRoute = function(p18) --[[ line: 247 ]]
			-- upvalues: p11 (ref), t_1 (ref), array (copy), object (copy), unknownModule (copy)
			local routeName = p18.routeName
			local params = p18.params
			local var36 = p11[routeName]
			local var37 = t_1[routeName]
			local exactReKeys = var37.exactReKeys
			local var38 = var37.toPath(params)
			local t = {}
			
			if params then
				for i, v in array.filter(object.keys(params), function(p19) --[[ line: 257 ]]
					-- upvalues: array (copy), exactReKeys (ref)
					return not array.find(exactReKeys, function(p20) --[[ line: 258 ]]
						-- upvalues: p19 (ref)
						return p20.name == p19
					end)
				end) do
					t[v] = params[v]
				end
			end
			if not var36 or var36 == unknownModule then
				return { path = var38, params = t }
			end
			local pathAndParamsForState = var36.getPathAndParamsForState(p18)
			
			return {
				path = if var38 and var38 ~= "" then ("%s/%s"):format(var38, pathAndParamsForState.path) else pathAndParamsForState.path,
				params = if pathAndParamsForState.params then object.assign(t, pathAndParamsForState.params) else t
			}
		end
	}
end

return t