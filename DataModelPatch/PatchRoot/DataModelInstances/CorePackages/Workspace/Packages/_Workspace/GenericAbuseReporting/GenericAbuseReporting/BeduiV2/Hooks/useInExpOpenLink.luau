local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local Default = require(Parent.LinkingProtocol).LinkingProtocol.default
local ReactModule = require(Parent.React)

return function()
	-- upvalues: ReactModule (copy), Default (copy)
	return ReactModule.useCallback(function(p1)
		-- upvalues: Default (upval)
		if p1 ~= nil and p1 ~= "" then
			Default:openURL(p1)
		end
	end, {})
end