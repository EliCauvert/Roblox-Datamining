local AppStorageService = game:GetService("AppStorageService")
local ReactModule = require(script:FindFirstAncestor("FlyoutSidePanel").Parent.React)

local function _(p1): number --[[ Line: 11 | Named "getImpressionCount" ]]
	-- upvalues: AppStorageService (copy)
	local Success, Result = pcall(function() --[[ Line: 12 ]]
		-- upvalues: AppStorageService (upval), p1 (copy)
		return AppStorageService:GetItem(p1)
	end)
	
	return Success and typeof(Result) == "string" and Result ~= "" and tonumber(Result) or 0
end

local _ = function(p1) --[[ Line: 21 | Named "markSeen" ]]
	-- upvalues: AppStorageService (copy)
	pcall(function() --[[ Line: 22 ]]
		-- upvalues: AppStorageService (upval), p1 (copy)
		AppStorageService:SetItem(p1, "1")
		AppStorageService:Flush()
	end)
end

return function(Callback, Key) --[[ Line: 32 | Named "usePlusReferralFlyoutNewBadge" ]]
	-- upvalues: ReactModule (copy), AppStorageService (copy)
	local UseStateResult = ReactModule.useState(function(): boolean --[[ Line: 33 ]]
		-- upvalues: Key (copy), AppStorageService (upval)
		local Success, Result = pcall(function() --[[ Line: 12 ]]
			-- upvalues: AppStorageService (upval), Key (copy)
			return AppStorageService:GetItem(Key)
		end)
		
		return (Success and typeof(Result) == "string" and Result ~= "" and tonumber(Result) or 0) < 1
	end)
	
	return {
		shouldShowNewBadge = UseStateResult,
		onActivated = ReactModule.useCallback(function() --[[ Line: 37 ]]
			-- upvalues: UseStateResult (copy), Key (copy), AppStorageService (upval), Callback (copy)
			if UseStateResult then
				pcall(function() --[[ Line: 22 ]]
					-- upvalues: AppStorageService (upval), Key (copy)
					AppStorageService:SetItem(Key, "1")
					AppStorageService:Flush()
				end)
			end
			Callback()
		end, { UseStateResult, Callback, Key })
	}
end