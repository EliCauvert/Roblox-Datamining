local Parent = script.Parent.Parent
local Default = require(Parent.LinkingProtocol).LinkingProtocol.default
local IsSubjectToDesktopPoliciesFunction = require(Parent.SharedFlags).isSubjectToDesktopPolicies

return function(p1, p2) --[[ Line: 10 ]]
	-- upvalues: IsSubjectToDesktopPoliciesFunction (copy), Default (copy)
	return pcall(function() --[[ Line: 11 ]]
		-- upvalues: p2 (copy), IsSubjectToDesktopPoliciesFunction (upval), Default (upval), p1 (copy)
		if p2 and not IsSubjectToDesktopPoliciesFunction() then
			game:Shutdown()
		end
		Default:isURLRegistered(p1):andThen(function(Result) --[[ Line: 15 ]]
			-- upvalues: Default (upval), p1 (upval), p2 (upval)
			if Result then
				Default:detectURL(p1)
				
				return
			end
			if p2 then
				game:Shutdown()
				Default:detectURL(p1)
			end
		end)
	end)
end