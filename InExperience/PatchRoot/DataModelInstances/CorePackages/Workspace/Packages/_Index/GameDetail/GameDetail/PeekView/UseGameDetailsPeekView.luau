local isSubjectToDesktopPolicies = require(script:FindFirstAncestor("GameDetail").Parent.SharedFlags).isSubjectToDesktopPolicies
local playersService = game:GetService("Players")

return function()
	-- upvalues: playersService (ref), isSubjectToDesktopPolicies (ref)
	return if playersService.LocalPlayer then isSubjectToDesktopPolicies() else false
end