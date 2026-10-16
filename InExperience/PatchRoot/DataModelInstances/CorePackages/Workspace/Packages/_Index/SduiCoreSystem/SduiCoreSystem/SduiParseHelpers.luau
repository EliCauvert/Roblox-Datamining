local TutilsModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.tutils)

local function hasCycle(List, p1): boolean --[[ Line: 5 ]]
	-- upvalues: hasCycle (copy)
	if p1 == nil then
		p1 = {}
	end
	assert(p1, "seenNodes must exist")
	
	for _, value in List do
		if typeof(value) == "table" then
			if p1[value] then
				return true
			end
			p1[value] = true
			
			if hasCycle(value, p1) then
				return true
			end
		end
	end
	return false
end

return {
	hasCycle = hasCycle,
	stringifyValue = function(p2) --[[ Line: 26 ]]
		-- upvalues: hasCycle (copy), TutilsModule (copy)
		return if typeof(p2) == "table" and hasCycle(p2) then "table-with-cycle" else TutilsModule.toString(p2)
	end
}