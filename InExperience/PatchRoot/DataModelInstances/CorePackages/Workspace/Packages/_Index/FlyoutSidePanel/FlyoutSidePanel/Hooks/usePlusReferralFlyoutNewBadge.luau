local appStorageService = game:GetService("AppStorageService")
local reactModule = require(script:FindFirstAncestor("FlyoutSidePanel").Parent.React)

local function _(p1)
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
		-- upvalues: appStorageService (copy), p1 (ref)
		appStorageService:SetItem(p1, "1")
		appStorageService:Flush()
	end)
end

return function(p1, p2)
	-- upvalues: reactModule (ref), appStorageService (ref)
	local var1 = reactModule.useState(function()
		-- upvalues: p2 (ref), appStorageService (copy)
		local ok, status = pcall(function()
			-- upvalues: appStorageService (copy), p2 (ref)
			return appStorageService:GetItem(p2)
		end)
		
		return (if ok and typeof(status) == "string" and status ~= "" then tonumber(status) or 0 else 0) < 1
	end)
	
	return {
		shouldShowNewBadge = var1,
		onActivated = reactModule.useCallback(function()
			-- upvalues: var1 (ref), p2 (ref), appStorageService (copy), p1 (ref)
			if var1 then
				local var2 = p2
				pcall(function()
					-- upvalues: appStorageService (copy), var2 (ref)
					appStorageService:SetItem(var2, "1")
					appStorageService:Flush()
				end)
			end
			p1()
		end, { var1, p1, p2 })
	}
end