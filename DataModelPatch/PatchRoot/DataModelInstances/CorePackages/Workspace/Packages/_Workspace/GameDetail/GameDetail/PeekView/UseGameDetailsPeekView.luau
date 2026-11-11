local IsSubjectToDesktopPoliciesFunction = require(script:FindFirstAncestor("GameDetail").Parent.SharedFlags).isSubjectToDesktopPolicies
local Players = game:GetService("Players")

return function(): boolean
	-- upvalues: Players (copy), IsSubjectToDesktopPoliciesFunction (copy)
	return if Players.LocalPlayer then not IsSubjectToDesktopPoliciesFunction() else false
end