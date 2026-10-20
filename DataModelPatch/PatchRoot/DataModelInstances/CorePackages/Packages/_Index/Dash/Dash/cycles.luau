local Parent = script.Parent
local _ = require(Parent.Types)
local IncludesModule = require(Parent.includes)
local KeysModule = require(Parent.keys)
local SortFunction = table.sort

local function getDefaultCycles()
	return { nextRef = 1, visited = {}, refs = {}, omit = {} }
end

local function cycles(p1, p2: number, p3)
	-- upvalues: getDefaultCycles (copy), KeysModule (copy), SortFunction (copy), IncludesModule (copy), cycles (copy)
	if p2 == -1 then
		return p3
	end
	if typeof(p1) ~= "table" then
		return nil
	end
	local P2 = p3 or getDefaultCycles()
	
	if P2.visited[p1] then
		if not P2.refs[p1] then
			P2.refs[p1] = P2.nextRef
			P2.nextRef += 1
		end
		return nil
	else
		P2.visited[p1] = true
		local KeysModuleResult = KeysModule(p1)
		SortFunction(KeysModuleResult, function(p4, p5): boolean
			return if typeof(p4) == "number" and typeof(p5) == "number" then p4 < p5 else tostring(p4) < tostring(p5)
		end)
		
		for _, value in ipairs(KeysModuleResult) do
			local v1 = p1[value]
			
			if not IncludesModule(P2.omit, value) then
				if p2 then
					cycles(value, p2 - 1, P2)
					cycles(v1, p2 - 1, P2)
				else
					cycles(value, nil, P2)
					cycles(v1, nil, P2)
				end
			end
		end
		return P2
	end
end

return cycles