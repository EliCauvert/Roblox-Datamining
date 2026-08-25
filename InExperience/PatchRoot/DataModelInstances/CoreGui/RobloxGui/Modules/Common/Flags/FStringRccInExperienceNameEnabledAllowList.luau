local rccInExperienceNameSettingsEnabledAllowList = game:DefineFastString("RccInExperienceNameSettingsEnabledAllowList", "")
local var1 = nil

return {
	isAllowListedUserId = function(p0)
		-- upvalues: var1 (write), rccInExperienceNameSettingsEnabledAllowList (ref)
		local var2 = tostring(p0)
		
		if var1 == nil then
			var1 = {}
			
			for i in string.gmatch(rccInExperienceNameSettingsEnabledAllowList, "[^,]+") do
				var1[i] = true
			end
		end
		return var1[var2] == true
	end
}