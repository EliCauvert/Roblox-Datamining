local appStorageService = game:GetService("AppStorageService")
local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")
local cryoModule = require(script:FindFirstAncestor("SocialCommon").Parent.Cryo)

return function(p1)
	-- upvalues: playersService (ref), appStorageService (ref), httpService (ref), cryoModule (ref)
	local isKeyAvailableInEngine = p1.isKeyAvailableInEngine
	local dismissedValue = p1.dismissedValue
	local appStorageKey = p1.appStorageKey
	local playersService_1 = p1.PlayersService or playersService
	local appStorageService_1 = p1.AppStorageService or appStorageService
	
	local function _()
		-- upvalues: playersService_1 (ref)
		local localPlayer = playersService_1.LocalPlayer
		
		return if localPlayer and localPlayer.UserId and localPlayer.UserId > 0 then tostring(localPlayer.UserId) else nil
	end
	
	local _ = function(p2)
		-- upvalues: httpService (copy), appStorageService_1 (ref), appStorageKey (ref)
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p2 (ref)
			return httpService:JSONEncode(p2)
		end)
		
		if ok then
			appStorageService_1:SetItem(appStorageKey, status)
			appStorageService_1:Flush()
		end
	end
	
	local _ = function()
		-- upvalues: appStorageService_1 (ref), appStorageKey (ref), httpService (copy)
		local var1 = appStorageService_1:GetItem(appStorageKey) or ""
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), var1 (ref)
			return httpService:JSONDecode(var1)
		end)
		
		return if ok and type(status) == "table" then status else nil
	end
	
	local function setImpressionCountPerUser(value, p2)
		-- upvalues: appStorageService_1 (ref), appStorageKey (ref), httpService (copy), cryoModule (copy)
		local var1 = appStorageService_1:GetItem(appStorageKey) or ""
		local ok_1, status = pcall(function()
			-- upvalues: httpService (copy), var1 (ref)
			return httpService:JSONDecode(var1)
		end)
		local var2 = cryoModule.Dictionary.join((if ok_1 and type(status) == "table" then status else nil) or {}, { [value] = p2 })
		ok_1, status_1 = pcall(function()
			-- upvalues: httpService (copy), var2 (ref)
			return httpService:JSONEncode(var2)
		end)
		
		if ok_1 then
			appStorageService_1:SetItem(appStorageKey, status_1)
			appStorageService_1:Flush()
		end
	end
	
	local _ = function(p2)
		-- upvalues: appStorageService_1 (ref), appStorageKey (ref), httpService (copy)
		local var1 = appStorageService_1:GetItem(appStorageKey) or ""
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), var1 (ref)
			return httpService:JSONDecode(var1)
		end)
		local var2 = if ok and type(status) == "table" then status else nil
		
		return var2 and (var2[p2] and (tonumber(var2[p2]) or 0))
	end
	
	local _ = function(value)
		-- upvalues: playersService_1 (ref), isKeyAvailableInEngine (ref), setImpressionCountPerUser (ref)
		local localPlayer = playersService_1.LocalPlayer
		local var1 = if localPlayer and localPlayer.UserId and localPlayer.UserId > 0 then tostring(localPlayer.UserId) else nil
		
		if isKeyAvailableInEngine and var1 then
			setImpressionCountPerUser(var1, value)
		end
	end
	
	return {
		getValue = function()
			-- upvalues: playersService_1 (ref), isKeyAvailableInEngine (ref), appStorageService_1 (ref), appStorageKey (ref), httpService (copy), dismissedValue (ref)
			local localPlayer = playersService_1.LocalPlayer
			local var1 = if localPlayer and localPlayer.UserId and localPlayer.UserId > 0 then tostring(localPlayer.UserId) else nil
			
			if not isKeyAvailableInEngine or not var1 then
				return dismissedValue
			end
			local var2 = appStorageService_1:GetItem(appStorageKey) or ""
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), var2 (ref)
				return httpService:JSONDecode(var2)
			end)
			local var3 = if ok and type(status) == "table" then status else nil
			
			return var3 and (var3[var1] and (tonumber(var3[var1]) or 0))
		end,
		incrementValue = function()
			-- upvalues: playersService_1 (ref), isKeyAvailableInEngine (ref), appStorageService_1 (ref), appStorageKey (ref), httpService (copy), dismissedValue (ref), setImpressionCountPerUser (ref)
			local var1
			local localPlayer = playersService_1.LocalPlayer
			local var2 = if localPlayer and localPlayer.UserId and localPlayer.UserId > 0 then tostring(localPlayer.UserId) else nil
			
			if isKeyAvailableInEngine and var2 then
				local var3
				local var4 = appStorageService_1:GetItem(appStorageKey) or ""
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), var4 (ref)
					return httpService:JSONDecode(var4)
				end)
				local var5 = if ok and type(status) == "table" then status else nil
				
				if var5 and var5[var2] then
					var3 = tonumber(var5[var2])
					
					if not var3 then
						var3 = 0
					end
					var1 = var3
				end
			else
				var1 = dismissedValue
			end
			local var6 = var1 + 1
			var2 = playersService_1.LocalPlayer
			local var7 = if var2 and var2.UserId and var2.UserId > 0 then tostring(var2.UserId) else nil
			
			if isKeyAvailableInEngine and var7 then
				setImpressionCountPerUser(var7, var6)
			end
		end,
		dismissValue = function()
			-- upvalues: dismissedValue (ref), playersService_1 (ref), isKeyAvailableInEngine (ref), setImpressionCountPerUser (ref)
			local localPlayer = playersService_1.LocalPlayer
			local var1 = if localPlayer and localPlayer.UserId and localPlayer.UserId > 0 then tostring(localPlayer.UserId) else nil
			
			if isKeyAvailableInEngine and var1 then
				setImpressionCountPerUser(var1, dismissedValue)
			end
		end
	}
end