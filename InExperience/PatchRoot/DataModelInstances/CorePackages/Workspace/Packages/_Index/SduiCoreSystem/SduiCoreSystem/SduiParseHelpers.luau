local tutilsModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.tutils)

local function hasCycle(p1, p2)
	-- upvalues: hasCycle (ref)
	if p2 == nil then
		p2 = {}
	end
	assert(p2, "seenNodes must exist")
	
	for i, v in p1 do
		if typeof(v) == "table" then
			if not p2[v] then
				p2[v] = true
				
				if hasCycle(v, p2) then
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
	stringifyValue = function(p3)
		-- upvalues: hasCycle (ref), tutilsModule (ref)
		return if typeof(p3) == "table" then if hasCycle(p3) then "table-with-cycle" else tutilsModule.toString(p3) else tutilsModule.toString(p3)
	end
}