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

local function indentLines(p1, p2)
	-- upvalues: mapModule (ref)
	return mapModule(p1, function(p3)
		-- upvalues: p2 (ref)
		return p2 .. p2
	end)
end

local function _(p1)
	-- upvalues: keysModule (ref), sort (ref)
	local var1 = keysModule(p1)
	sort(var1, function(p2, p3)
		return if type(p2) == "number" and type(p3) == "number" then p2 < p3 else tostring(p2) < tostring(p3)
	end)
	
	return var1
end

local function constructValueOptions(p1, p2)
	-- upvalues: assignModule (ref), cyclesModule (ref)
	return assignModule({ indent = "\t", depth = 2, visited = {} }, p1, {
		depth = if p1.depth then p1.depth - 1 else nil,
		cycles = p1.cycles or cyclesModule(p2, p1.depth, {
			nextRef = 0,
			visited = {},
			refs = {},
			depth = p1.depth,
			omit = p1.omit or {}
		})
	})
end

local _ = function(p1, p2, p3)
	-- upvalues: insert (ref)
	if not p2 then
		p1[#p1] = ("%s}"):format(p1[#p1])
		
		return
	elseif p3 then
		p1[#p1] ..= "}"
		
		return
	end
	insert(p1, "}")
end

local var1 = nil

local function prettyLines(p1, p2)
	-- upvalues: constructValueOptions (ref), joinModule (ref), keysModule (ref), sort (ref), includesModule (ref), appendModule (ref), indentLines (ref), prettyLines (ref), mapModule (ref), sliceModule (ref), var1 (write), insert (ref)
	p2 = p2 or {}
	
	if type(p1) == "table" then
		local var2 = constructValueOptions(p2, p1)
		
		if var2.depth == -1 then
			return { "..." }
		elseif var2.visited[p1] then
			return { "&" .. var14.cycles.refs[p1] }
		end
		var2.visited[p1] = true
		local multiline = var2.multiline
		local var3 = if multiline then "," else ", "
		local var4 = var2.cycles.refs[p1]
		local list = { (var4 and ("<%s>"):format(var4) or "") .. "{" }
		local var5 = joinModule(var2, { noQuotes = true, multiline = false })
		local var6 = 0
		local var7 = true
		local var8 = keysModule(p1)
		sort(var8, function(p3, p4)
			return if type(p3) == "number" and type(p4) == "number" then p3 < p4 else tostring(p3) < tostring(p4)
		end)
		local var9 = var8
		
		if #p1 > 0 and var2.arrayLength then
			list[1] = ("#%d %s"):format(#p1, list[1])
		end
		for i, v in ipairs(var9) do
			if type(v) == "number" and v == var6 + 1 then
				var6 = v
			end
			if not var2.omit or not includesModule(var2.omit, v) then
				local var10 = p1[v]
				local var11 = type(v) == "number" and (v >= 1 and v <= var6)
				
				if var7 then
					var7 = false
				else
					list[#list] ..= var3
				end
				if multiline then
					if var11 then
						appendModule(list, indentLines(prettyLines(var10, var2), var2.indent))
					else
						local indent = var2.indent
						local var12 = mapModule(prettyLines(v, var5), function(p3)
							-- upvalues: indent (ref)
							return indent .. p15
						end)
						local var13 = prettyLines(var10, var2)
						local indent_1 = var2.indent
						local var14 = mapModule(sliceModule(var13, 2), function(p3)
							-- upvalues: indent_1 (ref)
							return indent_1 .. p16
						end)
						var12[#var12] = ("%s = %s"):format(var12[#var12], var13[1])
						appendModule(list, var12)
						appendModule(list, var14)
					end
				elseif var11 then
					list[#list] ..= var1(var10, var2)
				else
					list[#list] ..= var1(v, var5) .. " = " .. var10(var10, var2)
				end
			end
		end
		local var15 = var7
		
		if not multiline then
			list[#list] = ("%s}"):format(list[#list])
			
			return list
		elseif var15 then
			list[#list] ..= "}"
			
			return list
		end
		insert(list, "}")
		
		return list
	else
		return if type(p1) == "string" and p2 and not p2.noQuotes then { ("\"%s\""):format(p1) } else { tostring(p1) }
	end
end

return function(p3, p4)
	-- upvalues: concat (ref), prettyLines (ref)
	return concat(prettyLines(p3, p4), "\n")
end