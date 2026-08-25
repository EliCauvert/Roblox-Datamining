local appStorageService = game:GetService("AppStorageService")
local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")
local cryoModule = require(script:FindFirstAncestor("SocialCommon").Parent.Cryo)

return function(p0)
	-- upvalues: playersService (ref), appStorageService (ref), httpService (ref), cryoModule (ref)
	local isKeyAvailableInEngine = p0.isKeyAvailableInEngine
	local dismissedValue = p0.dismissedValue
	local appStorageKey = p0.appStorageKey
	local playersService_1 = p0.PlayersService or playersService
	local appStorageService_1 = p0.AppStorageService or appStorageService
	
	local function _()
		-- upvalues: playersService_1 (ref)
		local localPlayer = playersService_1.LocalPlayer
		
		return if localPlayer and localPlayer.UserId and localPlayer.UserId > 0 then tostring(localPlayer.UserId) else nil
	end
	
	local _ = function(p1)
		-- upvalues: httpService (copy), appStorageService_1 (ref), appStorageKey (ref)
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p1 (ref)
			return httpService:JSONEncode(p1)
		end)
		
		if ok then
			appStorageService_1:SetItem(appStorageKey, status)
			appStorageService_1:Flush()
		end
	end
	
	local _ = function()
		-- upvalues: appStorageService_1 (ref), appStorageKey (ref), httpService (copy)
		local var7 = appStorageService_1:GetItem(appStorageKey) or ""
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), var7 (ref)
			return httpService:JSONDecode(var7)
		end)
		
		return if ok and type(status) == "table" then status else nil
	end
	
	local function setImpressionCountPerUser(value, p2)
		-- upvalues: appStorageService_1 (ref), appStorageKey (ref), httpService (copy), cryoModule (copy)
		local var8 = appStorageService_1:GetItem(appStorageKey) or ""
		local ok_1, status = pcall(function()
			-- upvalues: httpService (copy), var8 (ref)
			return httpService:JSONDecode(var8)
		end)
		local var9 = cryoModule.Dictionary.join((if ok_1 and type(status) == "table" then status else nil) or {}, { [value] = p2 })
		ok_1, status_1 = pcall(function()
			-- upvalues: httpService (copy), var9 (ref)
			return httpService:JSONEncode(var9)
		end)
		
		if ok_1 then
			appStorageService_1:SetItem(appStorageKey, status_1)
			appStorageService_1:Flush()
		end
	end
	
	local _ = function(p3)
		-- upvalues: appStorageService_1 (ref), appStorageKey (ref), httpService (copy)
		local var10 = appStorageService_1:GetItem(appStorageKey) or ""
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), var10 (ref)
			return httpService:JSONDecode(var10)
		end)
		local var11 = if ok and type(status) == "table" then status else nil
		
		return var11 and (var11[p3] and (tonumber(var11[p3]) or 0))
	end
	
	local _ = function(value)
		-- upvalues: playersService_1 (ref), isKeyAvailableInEngine (ref), setImpressionCountPerUser (ref)
		local localPlayer = playersService_1.LocalPlayer
		local var12 = if localPlayer and localPlayer.UserId and localPlayer.UserId > 0 then tostring(localPlayer.UserId) else nil
		
		if isKeyAvailableInEngine and var12 then
			setImpressionCountPerUser(var12, value)
		end
	end
	
	return {
		getValue = function()
			-- upvalues: playersService_1 (ref), isKeyAvailableInEngine (ref), appStorageService_1 (ref), appStorageKey (ref), httpService (copy), dismissedValue (ref)
			local localPlayer = playersService_1.LocalPlayer
			local var13 = if localPlayer and localPlayer.UserId and localPlayer.UserId > 0 then tostring(localPlayer.UserId) else nil
			
			if not isKeyAvailableInEngine or not var13 then
				return dismissedValue
			end
			local var14 = appStorageService_1:GetItem(appStorageKey) or ""
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), var14 (ref)
				return httpService:JSONDecode(var14)
			end)
			local var15 = if ok and type(status) == "table" then status else nil
			
			return var15 and (var15[var13] and (tonumber(var15[var13]) or 0))
		end,
		incrementValue = function()
			-- upvalues: playersService_1 (ref), isKeyAvailableInEngine (ref), appStorageService_1 (ref), appStorageKey (ref), httpService (copy), dismissedValue (ref), setImpressionCountPerUser (ref)
			local var17
			local localPlayer = playersService_1.LocalPlayer
			local var16 = if localPlayer and localPlayer.UserId and localPlayer.UserId > 0 then tostring(localPlayer.UserId) else nil
			
			if isKeyAvailableInEngine and var16 then
				local var20
				local var18 = appStorageService_1:GetItem(appStorageKey) or ""
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), var18 (ref)
					return httpService:JSONDecode(var18)
				end)
				local var19 = if ok and type(status) == "table" then status else nil
				
				if var19 and var19[var16] then
					var20 = tonumber(var19[var16])
					
					if not var20 then
						var20 = 0
					end
					var17 = var20
				end
			else
				var17 = dismissedValue
			end
			local var21 = var17 + 1
			var16 = playersService_1.LocalPlayer
			local var22 = if var16 and var16.UserId and var16.UserId > 0 then tostring(var16.UserId) else nil
			
			if isKeyAvailableInEngine and var22 then
				setImpressionCountPerUser(var22, var21)
			end
		end,
		dismissValue = function()
			-- upvalues: dismissedValue (ref), playersService_1 (ref), isKeyAvailableInEngine (ref), setImpressionCountPerUser (ref)
			local localPlayer = playersService_1.LocalPlayer
			local var23 = if localPlayer and localPlayer.UserId and localPlayer.UserId > 0 then tostring(localPlayer.UserId) else nil
			
			if isKeyAvailableInEngine and var23 then
				setImpressionCountPerUser(var23, dismissedValue)
			end
		end
	}
end