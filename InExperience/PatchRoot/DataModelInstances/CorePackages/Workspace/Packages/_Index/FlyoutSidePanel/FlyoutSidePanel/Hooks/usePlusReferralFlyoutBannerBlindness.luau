local appStorageService = game:GetService("AppStorageService")
local reactModule = require(script:FindFirstAncestor("FlyoutSidePanel").Parent.React)
game:DefineFastInt("PlusReferralFlyoutBannerMaxImpressions", 10)

local function _()
	return game:GetFastInt("PlusReferralFlyoutBannerMaxImpressions")
end

local _ = function(p1)
	-- upvalues: appStorageService (ref)
	local ok, status = pcall(function()
		-- upvalues: appStorageService (copy), p1 (ref)
		return appStorageService:GetItem(p1)
	end)
	
	return if ok and typeof(status) == "string" and status ~= "" then tonumber(status) or 0 else 0
end

local _ = function(p1)
	-- upvalues: appStorageService (ref)
	pcall(function()
		-- upvalues: p1 (ref), appStorageService (copy)
		local ok, status = pcall(function()
			-- upvalues: appStorageService (copy), p1 (ref)
			return appStorageService:GetItem(p1)
		end)
		appStorageService:SetItem(p1, tostring((if ok and typeof(status) == "string" and status ~= "" then tonumber(status) or 0 else 0) + 1))
		appStorageService:Flush()
	end)
end

return function(p1, p2)
	-- upvalues: reactModule (ref), appStorageService (ref)
	local plusReferralFlyoutBannerMaxImpressionsFastInt = game:GetFastInt("PlusReferralFlyoutBannerMaxImpressions")
	local var1 = p1 and (if plusReferralFlyoutBannerMaxImpressionsFastInt ~= 0 then reactModule.useState(function()
		-- upvalues: p2 (ref), appStorageService (copy)
		local ok, status = pcall(function()
			-- upvalues: appStorageService (copy), p2 (ref)
			return appStorageService:GetItem(p2)
		end)
		
		return if ok and typeof(status) == "string" and status ~= "" then tonumber(status) or 0 else 0
	end) < plusReferralFlyoutBannerMaxImpressionsFastInt else true)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p2 (ref), appStorageService (copy)
		if var1 then
			local var2 = p2
			pcall(function()
				-- upvalues: var2 (ref), appStorageService (copy)
				local ok, status = pcall(function()
					-- upvalues: appStorageService (copy), var2 (ref)
					return appStorageService:GetItem(var2)
				end)
				appStorageService:SetItem(var2, tostring((if ok and typeof(status) == "string" and status ~= "" then tonumber(status) or 0 else 0) + 1))
				appStorageService:Flush()
			end)
		end
	end, { var1, p2 })
	
	return var1
end