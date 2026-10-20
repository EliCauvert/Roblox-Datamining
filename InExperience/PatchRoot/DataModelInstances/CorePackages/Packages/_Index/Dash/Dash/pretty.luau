local Parent = script.Parent
local _ = require(Parent.Types)
local AppendModule = require(Parent.append)
local AssignModule = require(Parent.assign)
local CyclesModule = require(Parent.cycles)
local IncludesModule = require(Parent.includes)
local JoinModule = require(Parent.join)
local MapModule = require(Parent.map)
local KeysModule = require(Parent.keys)
local SliceModule = require(Parent.slice)
local ConcatFunction = table.concat
local InsertFunction = table.insert
local SortFunction = table.sort

local function indentLines(p1, Indent)
	-- upvalues: MapModule (copy)
	return MapModule(p1, function(Text): string
		-- upvalues: Indent (copy)
		return Indent .. Text
	end)
end

local function _(p1)
	-- upvalues: KeysModule (copy), SortFunction (copy)
	local KeysModuleResult = KeysModule(p1)
	SortFunction(KeysModuleResult, function(p2, p3): boolean
		return if type(p2) == "number" and type(p3) == "number" then p2 < p3 else tostring(p2) < tostring(p3)
	end)
	
	return KeysModuleResult
end

local function constructValueOptions(p1, p2)
	-- upvalues: AssignModule (copy), CyclesModule (copy)
	return (AssignModule({ indent = "\t", depth = 2, visited = {} }, p1, {
		depth = p1.depth and p1.depth - 1 or nil,
		cycles = p1.cycles or CyclesModule(p2, p1.depth, {
			nextRef = 0,
			visited = {},
			refs = {},
			depth = p1.depth,
			omit = p1.omit or {}
		})
	}))
end

local _ = function(p1, p2, p3)
	-- upvalues: InsertFunction (copy)
	if not p2 then
		p1[#p1] = ("%s}"):format(p1[#p1])
		
		return
	end
	if p3 then
		p1[#p1] ..= "}"
		
		return
	else
		InsertFunction(p1, "}")
	end
end

local Callback = nil

local function prettyLines(p1, p2)
	-- upvalues: constructValueOptions (copy), JoinModule (copy), KeysModule (copy), SortFunction (copy), IncludesModule (copy), AppendModule (copy), indentLines (copy), prettyLines (copy), MapModule (copy), SliceModule (copy), Callback (ref), InsertFunction (copy)
	local P12 = p2 or {}
	
	if type(p1) ~= "table" then
		return if type(p1) == "string" and P12 and not P12.noQuotes then { ("\"%s\""):format(p1) } else { (tostring(p1)) }
	end
	local ConstructValueOptionsResult = constructValueOptions(P12, p1)
	
	if ConstructValueOptionsResult.depth == -1 then
		return { "..." }
	end
	if ConstructValueOptionsResult.visited[p1] then
		return { "&" .. ConstructValueOptionsResult.cycles.refs[p1] }
	end
	ConstructValueOptionsResult.visited[p1] = true
	local Multiline = ConstructValueOptionsResult.multiline
	local v1: string = if Multiline then "," else ", "
	local Ref = ConstructValueOptionsResult.cycles.refs[p1]
	local list = { (Ref and ("<%s>"):format(Ref) or "") .. "{" }
	local JoinModuleResult = JoinModule(ConstructValueOptionsResult, { noQuotes = true, multiline = false })
	local v2 = 0
	local Flag = true
	local KeysModuleResult = KeysModule(p1)
	SortFunction(KeysModuleResult, function(p3, p4): boolean
		return if type(p3) == "number" and type(p4) == "number" then p3 < p4 else tostring(p3) < tostring(p4)
	end)
	
	if #p1 > 0 and ConstructValueOptionsResult.arrayLength then
		list[1] = ("#%d %s"):format(#p1, list[1])
	end
	for _, value in ipairs(KeysModuleResult) do
		if type(value) == "number" and value == v2 + 1 then
			v2 = value
		end
		if not ConstructValueOptionsResult.omit or not IncludesModule(ConstructValueOptionsResult.omit, value) then
			local v3 = p1[value]
			local IsValueBelow: boolean = type(value) == "number" and (value >= 1 and v2 >= value)
			
			if Flag then
				Flag = false
			else
				list[#list] ..= v1
			end
			if Multiline then
				if IsValueBelow then
					AppendModule(list, indentLines(prettyLines(v3, ConstructValueOptionsResult), ConstructValueOptionsResult.indent))
				else
					local Indent = ConstructValueOptionsResult.indent
					local MapModuleResult = MapModule(prettyLines(value, JoinModuleResult), function(Text): string
						-- upvalues: Indent (copy)
						return Indent .. Text
					end)
					local PrettyLinesResult = prettyLines(v3, ConstructValueOptionsResult)
					local Indent1 = ConstructValueOptionsResult.indent
					local MapModuleResult1 = MapModule(SliceModule(PrettyLinesResult, 2), function(Text): string
						-- upvalues: Indent1 (copy)
						return Indent1 .. Text
					end)
					MapModuleResult[#MapModuleResult] = ("%s = %s"):format(MapModuleResult[#MapModuleResult], PrettyLinesResult[1])
					AppendModule(list, MapModuleResult)
					AppendModule(list, MapModuleResult1)
				end
			elseif IsValueBelow then
				list[#list] ..= Callback(v3, ConstructValueOptionsResult)
			else
				list[#list] ..= Callback(value, JoinModuleResult) .. " = " .. Callback(v3, ConstructValueOptionsResult)
			end
		end
	end
	local Flag1: boolean = Flag
	
	if not Multiline then
		list[#list] = ("%s}"):format(list[#list])
		
		return list
	elseif Flag1 then
		list[#list] ..= "}"
		
		return list
	else
		InsertFunction(list, "}")
		
		return list
	end
end

Callback = function(p3, p4)
	-- upvalues: ConcatFunction (copy), prettyLines (copy)
	return ConcatFunction(prettyLines(p3, p4), "\n")
end

return Callback