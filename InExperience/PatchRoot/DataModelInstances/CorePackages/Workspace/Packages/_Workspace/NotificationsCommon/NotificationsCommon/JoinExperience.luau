local parent = script.Parent.Parent
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local isSubjectToDesktopPolicies = require(parent.SharedFlags).isSubjectToDesktopPolicies

return function(p0, p1) --[[ line: 10 ]]
	-- upvalues: isSubjectToDesktopPolicies (ref), default (ref)
	return pcall(function() --[[ line: 11 ]]
		-- upvalues: p1 (ref), isSubjectToDesktopPolicies (copy), default (copy), p0 (ref)
		if p1 and not isSubjectToDesktopPolicies() then
			game:Shutdown()
		end
		default:isURLRegistered(p0):andThen(function(p2) --[[ line: 15 ]]
			-- upvalues: default (copy), p0 (copy), p1 (copy)
			if p2 then
				default:detectURL(p0)
				
				return
			elseif p1 then
				game:Shutdown()
				default:detectURL(p0)
			end
		end)
	end)
end