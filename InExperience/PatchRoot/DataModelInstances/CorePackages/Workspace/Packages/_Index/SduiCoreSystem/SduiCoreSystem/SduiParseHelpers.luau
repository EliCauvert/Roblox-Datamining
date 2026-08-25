local tutilsModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.tutils)

local function hasCycle(p0, p1)
	-- upvalues: hasCycle (ref)
	if p1 == nil then
		p1 = {}
	end
	assert(p1, "seenNodes must exist")
	
	for i, v in p0 do
		if typeof(v) == "table" then
			if not p1[v] then
				p1[v] = true
				
				if hasCycle(v, p1) then
					return true
				end
			end
			return true
		end
	end
	return false
end

return {
	hasCycle = hasCycle,
	stringifyValue = function(p2)
		-- upvalues: hasCycle (ref), tutilsModule (ref)
		return if typeof(p2) == "table" then if hasCycle(p2) then "table-with-cycle" else tutilsModule.toString(p2) else tutilsModule.toString(p2)
	end
}