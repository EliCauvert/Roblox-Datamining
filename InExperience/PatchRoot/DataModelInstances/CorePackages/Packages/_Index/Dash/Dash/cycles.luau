local parent = script.Parent
local _ = require(parent.Types)
local includesModule = require(parent.includes)
local keysModule = require(parent.keys)
local sort = table.sort

local function getDefaultCycles()
	return { nextRef = 1, visited = {}, refs = {}, omit = {} }
end

local function cycles(p0, p1, p2)
	-- upvalues: getDefaultCycles (ref), keysModule (ref), sort (ref), includesModule (ref), cycles (ref)
	if p1 == -1 then
		return p2
	elseif typeof(p0) ~= "table" then
		return nil
	end
	p2 = p2 or getDefaultCycles()
	
	if p2.visited[p0] then
		if not p2.refs[p0] then
			p2.refs[p0] = p2.nextRef
			p2.nextRef += 1
		end
		return nil
	else
		p2.visited[p0] = true
		local var5 = keysModule(p0)
		sort(var5, function(p3, p4)
			return if typeof(p3) == "number" and typeof(p4) == "number" then p3 < p4 else tostring(p3) < tostring(p4)
		end)
		
		for i, v in ipairs(var5) do
			local var6 = p0[v]
			
			if not includesModule(p2.omit, v) then
				if p1 then
					cycles(v, p1 - 1, p2)
					cycles(var6, p1 - 1, p2)
				else
					cycles(v, nil, p2)
					cycles(var6, nil, p2)
				end
			end
		end
		return p2
	end
end

return cycles