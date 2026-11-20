local IsSubjectToDesktopPoliciesFunction = require(script:FindFirstAncestor("SocialCards").Parent.SharedFlags).isSubjectToDesktopPolicies

return function()
	-- upvalues: IsSubjectToDesktopPoliciesFunction (copy)
	if game.GameId > 0 and not IsSubjectToDesktopPoliciesFunction() then
		game:Shutdown()
	end
end