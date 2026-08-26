local parent = script.Parent.Parent
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local isSubjectToDesktopPolicies = require(parent.SharedFlags).isSubjectToDesktopPolicies

return function(p1, p2)
	-- upvalues: isSubjectToDesktopPolicies (ref), default (ref)
	return pcall(function()
		-- upvalues: p2 (ref), isSubjectToDesktopPolicies (copy), default (copy), p1 (ref)
		if p2 and not isSubjectToDesktopPolicies() then
			game:Shutdown()
		end
		default:isURLRegistered(p1):andThen(function(p3)
			-- upvalues: default (copy), p1 (copy), p2 (copy)
			if p3 then
				default:detectURL(p1)
				
				return
			elseif p2 then
				game:Shutdown()
				default:detectURL(p1)
			end
		end)
	end)
end