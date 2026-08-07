local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local reactModule = require(parent.React)

return function() --[[ line: 13 | named "useInExpOpenLink" ]]
	-- upvalues: reactModule (ref), default (ref)
	return reactModule.useCallback(function(p0) --[[ line: 14 ]]
		-- upvalues: default (copy)
		if p0 ~= nil and p0 ~= "" then
			default:openURL(p0)
		end
	end, {})
end