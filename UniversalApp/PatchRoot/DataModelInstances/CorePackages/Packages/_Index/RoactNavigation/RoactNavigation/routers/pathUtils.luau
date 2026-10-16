local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local LuauPolyfillModule = require(Parent2.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local String1 = LuauPolyfillModule.String
local RegExpModule = require(Parent2.RegExp)
local InvariantModule = require(Parent1.utils.invariant)
local NavigationActionsModule = require(Parent1.NavigationActions)
local PathToRegexpModule = require(Parent.pathToRegexp)
local CompileFunction = PathToRegexpModule.compile
local PathToRegexpFunction = PathToRegexpModule.pathToRegexp
local QueryStringModule = require(Parent.queryString)
local ChildIsScreenRouterSymbolRobloxModule = require(Parent:FindFirstChild("ChildIsScreenRouterSymbol.roblox"))
local NullPathSymbolRobloxModule = require(Parent:FindFirstChild("NullPathSymbol.roblox"))
local DecodeURIComponentModule = require(Parent.decodeURIComponent)

local function _(p1, p2) --[[ Line: 59 | Named "getRestOfPath" ]]
	-- upvalues: Array (copy)
	return p1[Array.findIndex(p2, function(p3): boolean --[[ Line: 62 ]]
		return p3.pattern == ".*"
	end) + 1]
end

local function determineDelimiter(p1, Entry) --[[ Line: 69 ]]
	-- upvalues: Array (copy), String1 (copy)
	if not Array.isArray(Entry) then
		return Entry
	end
	if #Entry == 1 then
		return Entry[1]
	end
	for _, value in Entry do
		if String1.startsWith(p1, value) then
			return value
		end
	end
	return nil
end

local PathUtils = {
	getParamsFromPath = function(Tbl, ExecResult, ExactReKeys) --[[ Line: 27 ]]
		-- upvalues: Array (copy), DecodeURIComponentModule (copy)
		return (Array.reduce(Array.slice(ExecResult, 2), function(p2, p3, p4) --[[ Line: 31 ]]
			-- upvalues: ExactReKeys (copy), DecodeURIComponentModule (upval)
			local ExactReKey = ExactReKeys[p4]
			
			if not ExactReKey or ExactReKey.pattern == ".*" then
				return p2
			end
			local Name = ExactReKey.name
			local v1 = nil
			
			if p3 then
				local Success, Result = pcall(DecodeURIComponentModule, p3)
				
				if Success then
					v1 = Result
				end
			end
			p2[Name] = v1 or p3
			
			return p2
		end, table.clone(Tbl)))
	end,
	urlToPathAndParams = function(p2, p3) --[[ Line: 85 ]]
		-- upvalues: RegExpModule (copy), QueryStringModule (copy), determineDelimiter (copy)
		local ExecResult = RegExpModule("^(.*)\\?(.*)$"):exec(p2)
		local Text = if ExecResult then ExecResult[2] else p2
		local ParseResult = QueryStringModule.parse(if ExecResult then ExecResult[3] else {})
		local DetermineDelimiterResult = determineDelimiter(Text, p3)
		
		if DetermineDelimiterResult == nil or DetermineDelimiterResult == "" then
			DetermineDelimiterResult = "://"
		end
		local Part = string.split(Text, DetermineDelimiterResult)[2]
		
		if Part == nil then
			Part = Text
		end
		if Part == "/" then
			Part = ""
		end
		if string.sub(Part, -1, -1) == "/" then
			Part = string.sub(Part, 1, -2)
		end
		return { path = Part, params = ParseResult }
	end
}

function PathUtils.createPathParser(List, p2, p3) --[[ Line: 112 ]]
	-- upvalues: NullPathSymbolRobloxModule (copy), InvariantModule (copy), PathToRegexpFunction (copy), CompileFunction (copy), Object (copy), Array (copy), NavigationActionsModule (copy), PathUtils (copy), ChildIsScreenRouterSymbolRobloxModule (copy)
	local Paths = p3.paths or {}
	local DisableRouteNamePaths = p3.disableRouteNamePaths
	local t = {}
	local EntriesResult = {}
	
	for i in List do
		local NullPathSymbolRobloxModule1 = nil
		
		if Paths[i] == nil then
			if type(p2[i]) == "table" then
				NullPathSymbolRobloxModule1 = p2[i].path
			end
		else
			NullPathSymbolRobloxModule1 = Paths[i]
		end
		if NullPathSymbolRobloxModule1 == nil then
			NullPathSymbolRobloxModule1 = if DisableRouteNamePaths then NullPathSymbolRobloxModule else i
		end
		InvariantModule(NullPathSymbolRobloxModule1 == NullPathSymbolRobloxModule or type(NullPathSymbolRobloxModule1) == "string", "Route path for %s must be specified as a string, or RoactNavigation.NoPath.", i)
		local IsNotNullPathSymbolRobloxModuleMatch = NullPathSymbolRobloxModule1 ~= NullPathSymbolRobloxModule
		local ExactReKeys = {}
		local ExtendedPathReKeys = {}
		local IsNullPathSymbolRobloxModuleMatch: boolean = NullPathSymbolRobloxModule1 == "" or not IsNotNullPathSymbolRobloxModuleMatch
		t[i] = {
			exactRe = if IsNotNullPathSymbolRobloxModuleMatch then PathToRegexpFunction(NullPathSymbolRobloxModule1, ExactReKeys) else nil,
			exactReKeys = ExactReKeys,
			extendedPathRe = PathToRegexpFunction(if IsNullPathSymbolRobloxModuleMatch then "(.*)" else ("%s/(.*)"):format(NullPathSymbolRobloxModule1), ExtendedPathReKeys),
			extendedPathReKeys = ExtendedPathReKeys,
			isWildcard = IsNullPathSymbolRobloxModuleMatch,
			toPath = NullPathSymbolRobloxModule1 == NullPathSymbolRobloxModule and function(): string --[[ Line: 172 ]]
				return ""
			end or CompileFunction(NullPathSymbolRobloxModule1)
		}
	end
	EntriesResult = Object.entries(t)
	
	return {
		getActionForPathAndParams = function(p4: string, p5) --[[ Line: 180 ]]
			-- upvalues: EntriesResult (ref), List (copy), Array (upval), NavigationActionsModule (upval), PathUtils (upval)
			if p4 == nil then
				p4 = ""
			end
			if p5 == nil then
				p5 = {}
			end
			local RouteName = nil
			local ExactReKeys = nil
			local ExecResult = nil
			local ExtendedPathRe = nil
			local ExtendedPathReKeys = nil
			local Entry = nil
			for _, value in EntriesResult do
				RouteName = value[1]
				local v1 = value[2]
				local ExactRe = v1.exactRe
				ExactReKeys = v1.exactReKeys
				ExtendedPathRe = v1.extendedPathRe
				ExtendedPathReKeys = v1.extendedPathReKeys
				Entry = List[RouteName]
				ExecResult = ExactRe and ExactRe:exec(p4)
				
				if ExecResult and ExecResult.n ~= 0 then
					local ExecResult1 = ExtendedPathRe and ExtendedPathRe:exec(p4)
					
					return NavigationActionsModule.navigate({
						routeName = RouteName,
						params = PathUtils.getParamsFromPath(p5, ExecResult, ExactReKeys),
						action = if ExecResult1 and Entry then Entry.getActionForPathAndParams(ExecResult1[Array.findIndex(ExtendedPathReKeys, function(p6): boolean --[[ Line: 62 ]]
							return p6.pattern == ".*"
						end) + 1], p5) else nil
					})
				end
			end
			local RouteName1 = nil
			local ExtendedPathReKeys1 = nil
			local ExecResult2 = nil
			local ActionForPathAndParams = nil
			for _, value1 in EntriesResult do
				RouteName1 = value1[1]
				local v2 = value1[2]
				local ExtendedPathRe1 = v2.extendedPathRe
				ExtendedPathReKeys1 = v2.extendedPathReKeys
				local Entry1 = List[RouteName1]
				ExecResult2 = ExtendedPathRe1 and ExtendedPathRe1:exec(p4)
				
				if ExecResult2 and ExecResult2.n ~= 0 then
					local ExecResultEntry = ExecResult2[Array.findIndex(ExtendedPathReKeys1, function(p6): boolean --[[ Line: 62 ]]
						return p6.pattern == ".*"
					end) + 1]
					ActionForPathAndParams = if Entry1 then Entry1.getActionForPathAndParams(ExecResultEntry, p5) else nil
					
					if ActionForPathAndParams then
						return NavigationActionsModule.navigate({
							routeName = RouteName1,
							params = PathUtils.getParamsFromPath(p5, ExecResult2, ExtendedPathReKeys1),
							action = ActionForPathAndParams
						})
					end
				end
			end
			return nil
		end,
		getPathAndParamsForRoute = function(p6) --[[ Line: 247 ]]
			-- upvalues: List (copy), t (copy), Array (upval), Object (upval), ChildIsScreenRouterSymbolRobloxModule (upval)
			local RouteName = p6.routeName
			local Params = p6.params
			local Entry = List[RouteName]
			local Entry1 = t[RouteName]
			local ExactReKeys = Entry1.exactReKeys
			local Path = Entry1.toPath(Params)
			local Params1 = {}
			
			if Params then
				for _, value in Array.filter(Object.keys(Params), function(Name): boolean --[[ Line: 257 ]]
					-- upvalues: Array (upval), ExactReKeys (copy)
					return not Array.find(ExactReKeys, function(p7): boolean --[[ Line: 258 ]]
						-- upvalues: Name (copy)
						return p7.name == Name
					end)
				end) do
					Params1[value] = Params[value]
				end
			end
			if Entry and Entry ~= ChildIsScreenRouterSymbolRobloxModule then
				local PathAndParamsForState = Entry.getPathAndParamsForState(p6)
				
				return {
					path = if Path and Path ~= "" then ("%s/%s"):format(Path, PathAndParamsForState.path) else PathAndParamsForState.path,
					params = if PathAndParamsForState.params then Object.assign(Params1, PathAndParamsForState.params) else Params1
				}
			else
				return { path = Path, params = Params1 }
			end
		end
	}
end

return PathUtils