local ReactModule = require(script:FindFirstAncestor("NotificationsUpsell").Parent.React)
local BuildPushPermissionClientAttributesModule = require(script.Parent.buildPushPermissionClientAttributes)

return function()
	-- upvalues: ReactModule (copy), BuildPushPermissionClientAttributesModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: BuildPushPermissionClientAttributesModule (upval), UseStateResult2 (copy)
		local Flag = true
		BuildPushPermissionClientAttributesModule.build():andThen(function(Result)
			-- upvalues: Flag (ref), UseStateResult2 (upval)
			if Flag then
				UseStateResult2(Result)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = false
		end
	end, {})
	
	return UseStateResult
end