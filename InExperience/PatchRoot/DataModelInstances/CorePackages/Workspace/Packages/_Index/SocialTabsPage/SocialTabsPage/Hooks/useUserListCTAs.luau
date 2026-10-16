local Parent = script:FindFirstAncestor("SocialTabsPage").Parent
local ReactModule = require(Parent.React)
local ProfileCTAService = require(Parent.ProfileCtaService).ProfileCTAService

return function(p1) --[[ Line: 8 | Named "useUserListCTAs" ]]
	-- upvalues: ReactModule (copy), ProfileCTAService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	ReactModule.useEffect(function() --[[ Line: 11 ]]
		-- upvalues: ProfileCTAService (upval)
		local ConnectRealTimeUpdatesResult = ProfileCTAService.connectRealTimeUpdates()
		
		return function() --[[ Line: 13 ]]
			-- upvalues: ConnectRealTimeUpdatesResult (copy)
			ConnectRealTimeUpdatesResult.Disconnect()
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 18 ]]
		-- upvalues: p1 (copy), ProfileCTAService (upval), UseStateResult2 (copy)
		if #p1 ~= 0 then
			UseStateResult2((ProfileCTAService.getProfileCTAs(p1)))
			
			return
		end
	end, { p1 })
	
	return UseStateResult
end