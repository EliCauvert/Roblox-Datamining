-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local parent = script.Parent
local _ = require(parent.Types)
local appendModule = require(parent.append)
local assignModule = require(parent.assign)
local cyclesModule = require(parent.cycles)
local includesModule = require(parent.includes)
local joinModule = require(parent.join)
local mapModule = require(parent.map)
local keysModule = require(parent.keys)
local sliceModule = require(parent.slice)
local concat = table.concat
local insert = table.insert
local sort = table.sort

local function indentLines(p0, p1) --[[ line: 38 ]]
	-- upvalues: mapModule (ref)
	return mapModule(p0, function(p2) --[[ line: 39 ]]
		-- upvalues: p1 (ref)
		return p1 .. p2
	end)
end

local function _(p3) --[[ line: 44 | named "sortObjectKeys" ]]
	-- upvalues: keysModule (ref), sort (ref)
	local var12 = keysModule(p3)
	sort(var12, function(p4, p5) --[[ line: 46 ]]
		return if type(p4) == "number" and type(p5) == "number" then p4 < p5 else tostring(p4) < tostring(p5)
	end)
	
	return var12
end

local function constructValueOptions(p6, p7) --[[ line: 56 ]]
	-- upvalues: assignModule (ref), cyclesModule (ref)
	return assignModule({ indent = "\t", depth = 2, visited = {} }, p6, {
		depth = if p6.depth then p6.depth - 1 else nil,
		cycles = p6.cycles or cyclesModule(p7, p6.depth, {
			nextRef = 0,
			visited = {},
			refs = {},
			depth = p6.depth,
			omit = p6.omit or {}
		})
	})
end

local _ = function(p8, p9, p10) --[[ line: 78 | named "insertClosedBracket" ]]
	-- upvalues: insert (ref)
	if not p9 then
		p8[#p8] = ("%s}"):format(p8[#p8])
		
		return
	elseif p10 then
		p8[#p8] ..= "}"
		
		return
	end
	insert(p8, "}")
end

local var10 = nil

local function prettyLines(p11, p12) --[[ line: 93 ]]
	-- upvalues: constructValueOptions (ref), joinModule (ref), keysModule (ref), sort (ref), includesModule (ref), appendModule (ref), indentLines (ref), prettyLines (ref), mapModule (ref), sliceModule (ref), var10 (write), insert (ref)
	p12 = p12 or {}
	
	if type(p11) == "table" then
		local var14 = constructValueOptions(p12, p11)
		
		if var14.depth == -1 then
			return { "..." }
		elseif var14.visited[p11] then
			return { "&" .. var14.cycles.refs[p11] }
		end
		var14.visited[p11] = true
		local multiline = var14.multiline
		local var15 = if multiline then "," else ", "
		local var16 = var14.cycles.refs[p11]
		local list = { (var16 and ("<%s>"):format(var16) or "") .. "{" }
		local var18 = joinModule(var14, { noQuotes = true, multiline = false })
		local var19 = 0
		local var20 = true
		local var21 = keysModule(p11)
		sort(var21, function(p13, p14) --[[ line: 46 ]]
			return if type(p13) == "number" and type(p14) == "number" then p13 < p14 else tostring(p13) < tostring(p14)
		end)
		local var22 = var21
		
		if #p11 > 0 and var14.arrayLength then
			list[1] = ("#%d %s"):format(#p11, list[1])
		end
		for i, v in ipairs(var22) do
			if type(v) == "number" and v == var19 + 1 then
				var19 = v
			end
			if not var14.omit or not includesModule(var14.omit, v) then
				local var24 = p11[v]
				local var25 = type(v) == "number" and (v >= 1 and v <= var19)
				
				if var20 then
					var20 = false
				else
					list[#list] ..= var15
				end
				if multiline then
					if var25 then
						appendModule(list, indentLines(prettyLines(var24, var14), var14.indent))
					else
						local indent = var14.indent
						local var26 = mapModule(prettyLines(v, var18), function(p15) --[[ line: 39 ]]
							-- upvalues: indent (ref)
							return indent .. p15
						end)
						local var27 = prettyLines(var24, var14)
						local indent_1 = var14.indent
						local var28 = mapModule(sliceModule(var27, 2), function(p16) --[[ line: 39 ]]
							-- upvalues: indent_1 (ref)
							return indent_1 .. p16
						end)
						var26[#var26] = ("%s = %s"):format(var26[#var26], var27[1])
						appendModule(list, var26)
						appendModule(list, var28)
					end
				elseif var25 then
					list[#list] ..= var10(var24, var14)
				else
					list[#list] ..= var10(v, var18) .. " = " .. var10(var24, var14)
				end
			end
		end
		local var23 = var20
		
		if not multiline then
			list[#list] = ("%s}"):format(list[#list])
			
			return list
		elseif var23 then
			list[#list] ..= "}"
			
			return list
		end
		insert(list, "}")
		
		return list
	else
		return if type(p11) == "string" and p12 and not p12.noQuotes then { ("\"%s\""):format(p11) } else { tostring(p11) }
	end
end

return function(p17, p18) --[[ line: 199 ]]
	-- upvalues: concat (ref), prettyLines (ref)
	return concat(prettyLines(p17, p18), "\n")
end