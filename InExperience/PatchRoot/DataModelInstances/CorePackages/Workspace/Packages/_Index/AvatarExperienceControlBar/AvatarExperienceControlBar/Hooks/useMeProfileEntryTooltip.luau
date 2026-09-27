local appStorageService = game:GetService("AppStorageService")
local reactModule = require(script:FindFirstAncestor("AvatarExperienceControlBar").Parent.React)
local var1 = false

return function(p1, p2)
	-- upvalues: reactModule (ref), var1 (write), appStorageService (ref)
	local var2, var3 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), var1 (copy), appStorageService (copy), p2 (ref)
		if not p1 then
			var3(nil)
			
			return
		elseif var1 then
			var3(nil)
			
			return
		end
		local ok, status = pcall(function()
			-- upvalues: appStorageService (copy)
			return appStorageService:GetItem("MeProfileEntryTooltipShown")
		end)
		var3(if ok and status == "1" then nil else p2)
	end, { p1, p2 })
	local var4 = reactModule.useCallback(function()
		-- upvalues: var1 (copy), appStorageService (copy)
		if var1 then
			return
		end
		var1 = true
		pcall(function()
			-- upvalues: appStorageService (copy)
			appStorageService:SetItem("MeProfileEntryTooltipShown", "1")
			appStorageService:Flush()
		end)
	end, {})
	local var5 = p1 and (p2 ~= nil and var2 == p2)
	
	return {
		showTooltip = var5,
		onShown = var4,
		dismiss = reactModule.useCallback(function()
			-- upvalues: var5 (ref), var4 (ref), var3 (ref)
			if var5 then
				var4()
			end
			var3(nil)
		end, { var5, var4 })
	}
end