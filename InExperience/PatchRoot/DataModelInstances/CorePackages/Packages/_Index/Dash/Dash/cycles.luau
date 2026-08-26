local parent = script.Parent
local _ = require(parent.Types)
local includesModule = require(parent.includes)
local keysModule = require(parent.keys)
local sort = table.sort

local function getDefaultCycles()
	return { nextRef = 1, visited = {}, refs = {}, omit = {} }
end

local function cycles(p1, p2, p3)
	-- upvalues: getDefaultCycles (ref), keysModule (ref), sort (ref), includesModule (ref), cycles (ref)
	if p2 == -1 then
		return p3
	elseif typeof(p1) ~= "table" then
		return nil
	end
	p3 = p3 or getDefaultCycles()
	
	if p3.visited[p1] then
		if not p3.refs[p1] then
			p3.refs[p1] = p3.nextRef
			p3.nextRef += 1
		end
		return nil
	else
		p3.visited[p1] = true
		local var1 = keysModule(p1)
		sort(var1, function(p4, p5)
			return if typeof(p4) == "number" and typeof(p5) == "number" then p4 < p5 else tostring(p4) < tostring(p5)
		end)
		
		for i, v in ipairs(var1) do
			local var2 = p1[v]
			
			if not includesModule(p3.omit, v) then
				if p2 then
					cycles(v, p2 - 1, p3)
					cycles(var2, p2 - 1, p3)
				else
					cycles(v, nil, p3)
					cycles(var2, nil, p3)
				end
			end
		end
		return p3
	end
end

return cycles