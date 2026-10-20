local RccInExperienceNameSettingsEnabledAllowList = game:DefineFastString("RccInExperienceNameSettingsEnabledAllowList", "")
local T = nil

return {
	isAllowListedUserId = function(p1): boolean
		-- upvalues: T (ref), RccInExperienceNameSettingsEnabledAllowList (copy)
		local Text = tostring(p1)
		
		if T == nil then
			T = {}
			
			for i in string.gmatch(RccInExperienceNameSettingsEnabledAllowList, "[^,]+") do
				T[i] = true
			end
		end
		return T[Text] == true
	end
}