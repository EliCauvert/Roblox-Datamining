local _09aFAF809aFAF409aFAF409aFAF409aFAF12 = require(script:FindFirstAncestor("SquadsCore").Parent.RegExp)("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$")

return function(p1): boolean --[[ Line: 9 | Named "validateSquadId" ]]
	-- upvalues: _09aFAF809aFAF409aFAF409aFAF409aFAF12 (copy)
	return if p1 and p1 ~= "" and _09aFAF809aFAF409aFAF409aFAF409aFAF12:exec(p1) then true else false
end