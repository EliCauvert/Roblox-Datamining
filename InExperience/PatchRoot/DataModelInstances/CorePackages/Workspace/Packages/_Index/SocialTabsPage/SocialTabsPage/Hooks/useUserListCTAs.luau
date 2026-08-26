local parent = script:FindFirstAncestor("SocialTabsPage").Parent
local reactModule = require(parent.React)
local profileCTAService = require(parent.ProfileCtaService).ProfileCTAService

return function(p1)
	-- upvalues: reactModule (ref), profileCTAService (ref)
	local var1, var2 = reactModule.useState({})
	reactModule.useEffect(function()
		-- upvalues: profileCTAService (copy)
		local var3 = profileCTAService.connectRealTimeUpdates()
		
		return function()
			-- upvalues: var3 (ref)
			var3.Disconnect()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), profileCTAService (copy), var2 (ref)
		if #p1 == 0 then
			return
		end
		var2(profileCTAService.getProfileCTAs(p1))
	end, { p1 })
	
	return var1
end