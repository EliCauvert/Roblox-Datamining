local AppStorageService = game:GetService("AppStorageService")
local ReactModule = require(script:FindFirstAncestor("FlyoutSidePanel").Parent.React)
game:DefineFastInt("PlusReferralFlyoutBannerMaxImpressions", 10)

local function _(p1): number
	-- upvalues: AppStorageService (copy)
	local Success, Result = pcall(function()
		-- upvalues: AppStorageService (upval), p1 (copy)
		return AppStorageService:GetItem(p1)
	end)
	
	return Success and typeof(Result) == "string" and Result ~= "" and tonumber(Result) or 0
end

local _ = function(p1)
	-- upvalues: AppStorageService (copy)
	pcall(function()
		-- upvalues: p1 (copy), AppStorageService (upval)
		local Success, Result = pcall(function()
			-- upvalues: AppStorageService (upval), p1 (copy)
			return AppStorageService:GetItem(p1)
		end)
		AppStorageService:SetItem(p1, (tostring((Success and typeof(Result) == "string" and Result ~= "" and tonumber(Result) or 0) + 1)))
		AppStorageService:Flush()
	end)
end

return function(p1, Key, p2): boolean
	-- upvalues: ReactModule (copy), AppStorageService (copy)
	local UseStateResult = ReactModule.useState(function(): number
		-- upvalues: Key (copy), AppStorageService (upval)
		local Success, Result = pcall(function()
			-- upvalues: AppStorageService (upval), Key (copy)
			return AppStorageService:GetItem(Key)
		end)
		
		return Success and typeof(Result) == "string" and Result ~= "" and tonumber(Result) or 0
	end)
	local P4 = p2 or game:GetFastInt("PlusReferralFlyoutBannerMaxImpressions")
	local IsPMatch: boolean = p1 and (P4 == 0 or UseStateResult < P4)
	ReactModule.useEffect(function()
		-- upvalues: IsPMatch (copy), Key (copy), AppStorageService (upval)
		if IsPMatch then
			pcall(function()
				-- upvalues: Key (copy), AppStorageService (upval)
				local Success, Result = pcall(function()
					-- upvalues: AppStorageService (upval), Key (copy)
					return AppStorageService:GetItem(Key)
				end)
				AppStorageService:SetItem(Key, (tostring((Success and typeof(Result) == "string" and Result ~= "" and tonumber(Result) or 0) + 1)))
				AppStorageService:Flush()
			end)
		end
	end, { IsPMatch, Key })
	
	return IsPMatch
end