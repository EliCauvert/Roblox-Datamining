local isSubjectToDesktopPolicies = require(script:FindFirstAncestor("GameDetail").Parent.SharedFlags).isSubjectToDesktopPolicies
local playersService = game:GetService("Players")

return function() --[[ line: 6 ]]
	-- upvalues: playersService (ref), isSubjectToDesktopPolicies (ref)
	return if playersService.LocalPlayer then isSubjectToDesktopPolicies() else false
end