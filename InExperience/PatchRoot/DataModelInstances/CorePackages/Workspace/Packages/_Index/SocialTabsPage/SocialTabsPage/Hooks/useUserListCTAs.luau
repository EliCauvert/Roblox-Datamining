local parent = script:FindFirstAncestor("SocialTabsPage").Parent
local reactModule = require(parent.React)
local profileCTAService = require(parent.ProfileCtaService).ProfileCTAService

return function(p0) --[[ line: 8 | named "useUserListCTAs" ]]
	-- upvalues: reactModule (ref), profileCTAService (ref)
	local var1, var2 = reactModule.useState({})
	reactModule.useEffect(function() --[[ line: 11 ]]
		-- upvalues: profileCTAService (copy)
		local var3 = profileCTAService.connectRealTimeUpdates()
		
		return function() --[[ line: 13 ]]
			-- upvalues: var3 (ref)
			var3.Disconnect()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 18 ]]
		-- upvalues: p0 (ref), profileCTAService (copy), var2 (ref)
		if #p0 == 0 then
			return
		end
		var2(profileCTAService.getProfileCTAs(p0))
	end, { p0 })
	
	return var1
end