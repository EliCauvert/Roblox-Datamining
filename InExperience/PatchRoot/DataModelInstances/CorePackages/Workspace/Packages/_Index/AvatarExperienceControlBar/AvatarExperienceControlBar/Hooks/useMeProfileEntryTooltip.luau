local AppStorageService = game:GetService("AppStorageService")
local ReactModule = require(script:FindFirstAncestor("AvatarExperienceControlBar").Parent.React)
local Flag = false

return function(p1, p2) --[[ Line: 10 | Named "useMeProfileEntryTooltip" ]]
	-- upvalues: ReactModule (copy), Flag (ref), AppStorageService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function() --[[ Line: 13 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy), Flag (upval), AppStorageService (upval), p2 (copy)
		if not p1 then
			UseStateResult2(nil)
			
			return
		end
		if Flag then
			UseStateResult2(nil)
			
			return
		else
			local Success, Result = pcall(function() --[[ Line: 22 ]]
				-- upvalues: AppStorageService (upval)
				return AppStorageService:GetItem("MeProfileEntryTooltipShown")
			end)
			UseStateResult2(if Success and Result == "1" then nil else p2)
		end
	end, { p1, p2 })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 28 ]]
		-- upvalues: Flag (upval), AppStorageService (upval)
		if not Flag then
			Flag = true
			pcall(function() --[[ Line: 34 ]]
				-- upvalues: AppStorageService (upval)
				AppStorageService:SetItem("MeProfileEntryTooltipShown", "1")
				AppStorageService:Flush()
			end)
			
			return
		end
	end, {})
	local IsUseStateResultMatch: boolean = p1 and (p2 ~= nil and UseStateResult == p2)
	
	return {
		showTooltip = IsUseStateResultMatch,
		onShown = UseResult,
		dismiss = ReactModule.useCallback(function() --[[ Line: 41 ]]
			-- upvalues: IsUseStateResultMatch (copy), UseResult (copy), UseStateResult2 (copy)
			if IsUseStateResultMatch then
				UseResult()
			end
			UseStateResult2(nil)
		end, { IsUseStateResultMatch, UseResult })
	}
end