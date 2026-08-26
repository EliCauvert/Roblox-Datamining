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
	getParamsFromPath = function(p1, p2, p3)
		-- upvalues: array (ref), decodeURIComponentModule (ref)
		return array.reduce(array.slice(p2, 2), function(p4, p5, p6)
			-- upvalues: p3 (ref), decodeURIComponentModule (copy)
			local var1 = p3[p6]
			
			if not var1 or var1.pattern == ".*" then
				return p4
			end
			local name = var1.name
			local var2 = nil
			
			if p5 then
				local ok, status = pcall(decodeURIComponentModule, p5)
				
				if ok then
					var2 = status
				end
			end
			p4[name] = var2 or p5
			
			return p4
		end, table.clone(p1))
	end
}

local function _(p1, p2)
	-- upvalues: array (ref)
	return p1[array.findIndex(p2, function(p3)
		return p3.pattern == ".*"
	end) + 1]
end

local function determineDelimiter(a, b)
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

function t.urlToPathAndParams(p1, p2)
	-- upvalues: regExpModule (ref), queryStringModule (ref), determineDelimiter (ref)
	local var1 = regExpModule("^(.*)\\?(.*)$"):exec(p1)
	local var2 = if var1 then var1[2] else p1
	local var3 = queryStringModule.parse(if var1 then var1[3] else {})
	local var4 = determineDelimiter(var2, p2)
	
	if var4 == nil or var4 == "" then
		var4 = "://"
	end
	local var5 = string.split(var2, var4)[2]
	
	if var5 == nil then
		var5 = var2
	end
	if var5 == "/" then
		var5 = ""
	end
	if string.sub(var5, -1, -1) == "/" then
		var5 = string.sub(var5, 1, -2)
	end
	return { path = var5, params = var3 }
end

function t.createPathParser(p1, p2, p3)
	-- upvalues: unknownModule_1 (ref), invariantModule (ref), pathToRegexp (ref), compile (ref), object (ref), array (ref), navigationActionsModule (ref), t (ref), unknownModule (ref)
	local paths = p3.paths or {}
	local disableRouteNamePaths = p3.disableRouteNamePaths
	local t_1 = {}
	local _ = {}
	
	for i in p1 do
		local var1 = nil
		
		if paths[i] ~= nil then
			var1 = paths[i]
		elseif type(p2[i]) == "table" then
			var1 = p2[i].path
		end
		if var1 == nil then
			var1 = if disableRouteNamePaths then unknownModule_1 else i
		end
		invariantModule(if var1 ~= unknownModule_1 then type(var1) == "string" else true, "Route path for %s must be specified as a string, or RoactNavigation.NoPath.", i)
		local var2 = var1 ~= unknownModule_1
		local t_2 = {}
		local var3 = if var2 then pathToRegexp(var1, t_2) else nil
		local t_3 = {}
		local var4 = if var1 ~= "" then not var2 else true
		t_1[i] = {
			exactRe = var3,
			exactReKeys = t_2,
			extendedPathRe = pathToRegexp(if var4 then "(.*)" else ("%s/(.*)"):format(var1), t_3),
			extendedPathReKeys = t_3,
			isWildcard = var4,
			toPath = if var1 == unknownModule_1 then function()
				return ""
			end else compile(var1)
		}
	end
	local var5 = object.entries(t_1)
	
	return {
		getActionForPathAndParams = function(p4, p5)
			-- upvalues: var5 (write), p1 (ref), array (copy), navigationActionsModule (copy), t (copy)
			if p4 == nil then
				p4 = ""
			end
			if p5 == nil then
				p5 = {}
			end
			local var6
			for i, v in var5 do
				local var7 = v[1]
				local var8 = v[2]
				local exactRe = var8.exactRe
				local exactReKeys = var8.exactReKeys
				local extendedPathRe = var8.extendedPathRe
				local extendedPathReKeys = var8.extendedPathReKeys
				local var9 = p1[var7]
				var6 = exactRe and exactRe:exec(p4)
				
				if var6 and var6.n ~= 0 then
					local var10 = extendedPathRe and extendedPathRe:exec(p4)
					
					return navigationActionsModule.navigate({
						routeName = var7,
						params = t.getParamsFromPath(p5, var6, exactReKeys),
						action = if var10 and var9 then var9.getActionForPathAndParams(var10[array.findIndex(extendedPathReKeys, function(p6)
							return p6.pattern == ".*"
						end) + 1], p5) else nil
					})
				end
			end
			for i, v_1 in var5 do
				local var11 = v_1[1]
				local var12 = v_1[2]
				local extendedPathRe = var12.extendedPathRe
				local extendedPathReKeys = var12.extendedPathReKeys
				local var13 = p1[var11]
				local var14 = extendedPathRe and extendedPathRe:exec(p4)
				
				if var14 and var14.n ~= 0 then
					var6 = if var13 then var13.getActionForPathAndParams(var14[array.findIndex(extendedPathReKeys, function(p6)
						return p6.pattern == ".*"
					end) + 1], p5) else nil
					
					if var6 then
						return navigationActionsModule.navigate({
							routeName = var11,
							params = t.getParamsFromPath(p5, var14, extendedPathReKeys),
							action = var6
						})
					end
				end
			end
			return nil
		end,
		getPathAndParamsForRoute = function(p6)
			-- upvalues: p1 (ref), t_1 (ref), array (copy), object (copy), unknownModule (copy)
			local routeName = p6.routeName
			local params = p6.params
			local var15 = p1[routeName]
			local var16 = t_1[routeName]
			local exactReKeys = var16.exactReKeys
			local var17 = var16.toPath(params)
			local t = {}
			
			if params then
				for i, v in array.filter(object.keys(params), function(p7)
					-- upvalues: array (copy), exactReKeys (ref)
					return not array.find(exactReKeys, function(p8)
						-- upvalues: p7 (ref)
						return p8.name == p7
					end)
				end) do
					t[v] = params[v]
				end
			end
			if not var15 or var15 == unknownModule then
				return { path = var17, params = t }
			end
			local pathAndParamsForState = var15.getPathAndParamsForState(p6)
			
			return {
				path = if var17 and var17 ~= "" then ("%s/%s"):format(var17, pathAndParamsForState.path) else pathAndParamsForState.path,
				params = if pathAndParamsForState.params then object.assign(t, pathAndParamsForState.params) else t
			}
		end
	}
end

return t