local Parent = script:FindFirstAncestor("SocialTabsPage").Parent
local ReactModule = require(Parent.React)
local ProfileCTAService = require(Parent.ProfileCtaService).ProfileCTAService

return function(p1)
	-- upvalues: ReactModule (copy), ProfileCTAService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	ReactModule.useEffect(function()
		-- upvalues: ProfileCTAService (upval)
		local ConnectRealTimeUpdatesResult = ProfileCTAService.connectRealTimeUpdates()
		
		return function()
			-- upvalues: ConnectRealTimeUpdatesResult (copy)
			ConnectRealTimeUpdatesResult.Disconnect()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), ProfileCTAService (upval), UseStateResult2 (copy)
		if #p1 ~= 0 then
			UseStateResult2((ProfileCTAService.getProfileCTAs(p1)))
			
			return
		end
	end, { p1 })
	
	return UseStateResult
end