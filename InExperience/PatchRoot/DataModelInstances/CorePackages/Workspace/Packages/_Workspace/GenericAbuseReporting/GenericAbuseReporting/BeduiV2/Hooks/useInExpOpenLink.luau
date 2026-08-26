local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local reactModule = require(parent.React)

return function()
	-- upvalues: reactModule (ref), default (ref)
	return reactModule.useCallback(function(p1)
		-- upvalues: default (copy)
		if p1 ~= nil and p1 ~= "" then
			default:openURL(p1)
		end
	end, {})
end