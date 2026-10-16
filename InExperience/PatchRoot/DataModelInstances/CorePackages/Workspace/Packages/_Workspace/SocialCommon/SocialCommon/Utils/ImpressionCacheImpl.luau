local AppStorageService = game:GetService("AppStorageService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local CryoModule = require(script:FindFirstAncestor("SocialCommon").Parent.Cryo)

return function(p1) --[[ Line: 23 | Named "ImpressionCacheImpl" ]]
	-- upvalues: Players (copy), AppStorageService (copy), HttpService (copy), CryoModule (copy)
	local IsKeyAvailableInEngine = p1.isKeyAvailableInEngine
	local DismissedValue = p1.dismissedValue
	local AppStorageKey = p1.appStorageKey
	local PlayersService = p1.PlayersService or Players
	local AppStorageService1 = p1.AppStorageService or AppStorageService
	
	local function _() --[[ Line: 31 | Named "getLocalUserId" ]]
		-- upvalues: PlayersService (copy)
		local LocalPlayer = PlayersService.LocalPlayer
		
		return if LocalPlayer and LocalPlayer.UserId and LocalPlayer.UserId > 0 then tostring(LocalPlayer.UserId) else nil
	end
	
	local _ = function(p2) --[[ Line: 40 | Named "updateStoredValue" ]]
		-- upvalues: HttpService (upval), AppStorageService1 (copy), AppStorageKey (copy)
		local Success, Result = pcall(function() --[[ Line: 41 ]]
			-- upvalues: HttpService (upval), p2 (copy)
			return HttpService:JSONEncode(p2)
		end)
		
		if Success then
			AppStorageService1:SetItem(AppStorageKey, Result)
			AppStorageService1:Flush()
		end
	end
	
	local _ = function() --[[ Line: 50 | Named "getStoredValue" ]]
		-- upvalues: AppStorageService1 (copy), AppStorageKey (copy), HttpService (upval)
		local Item = AppStorageService1:GetItem(AppStorageKey) or ""
		local Success, Result = pcall(function() --[[ Line: 53 ]]
			-- upvalues: HttpService (upval), Item (copy)
			return HttpService:JSONDecode(Item)
		end)
		
		return if Success and type(Result) == "table" then Result else nil
	end
	
	local function setImpressionCountPerUser(p2, DismissedValue) --[[ Line: 60 ]]
		-- upvalues: AppStorageService1 (copy), AppStorageKey (copy), HttpService (upval), CryoModule (upval)
		local Item = AppStorageService1:GetItem(AppStorageKey) or ""
		local Success, Result = pcall(function() --[[ Line: 53 ]]
			-- upvalues: HttpService (upval), Item (copy)
			return HttpService:JSONDecode(Item)
		end)
		local JoinResult = CryoModule.Dictionary.join((if Success and type(Result) == "table" then Result else nil) or {}, { [p2] = DismissedValue })
		local Success1, Result1 = pcall(function() --[[ Line: 41 ]]
			-- upvalues: HttpService (upval), JoinResult (copy)
			return HttpService:JSONEncode(JoinResult)
		end)
		
		if Success1 then
			AppStorageService1:SetItem(AppStorageKey, Result1)
			AppStorageService1:Flush()
		end
	end
	
	local _ = function(p2): number --[[ Line: 68 | Named "getImpressionCountPerUser" ]]
		-- upvalues: AppStorageService1 (copy), AppStorageKey (copy), HttpService (upval)
		local Item = AppStorageService1:GetItem(AppStorageKey) or ""
		local Success, Result = pcall(function() --[[ Line: 53 ]]
			-- upvalues: HttpService (upval), Item (copy)
			return HttpService:JSONDecode(Item)
		end)
		local Result1 = if Success and type(Result) == "table" then Result else nil
		
		return Result1 and Result1[p2] and tonumber(Result1[p2]) or 0
	end
	
	local _ = function(p2) --[[ Line: 76 | Named "setValue" ]]
		-- upvalues: PlayersService (copy), IsKeyAvailableInEngine (copy), setImpressionCountPerUser (copy)
		local LocalPlayer = PlayersService.LocalPlayer
		local Text = if LocalPlayer and LocalPlayer.UserId and LocalPlayer.UserId > 0 then tostring(LocalPlayer.UserId) else nil
		
		if IsKeyAvailableInEngine and Text then
			setImpressionCountPerUser(Text, p2)
		end
	end
	
	return {
		getValue = function() --[[ Line: 83 ]]
			-- upvalues: PlayersService (copy), IsKeyAvailableInEngine (copy), AppStorageService1 (copy), AppStorageKey (copy), HttpService (upval), DismissedValue (copy)
			local LocalPlayer = PlayersService.LocalPlayer
			local Text = if LocalPlayer and LocalPlayer.UserId and LocalPlayer.UserId > 0 then tostring(LocalPlayer.UserId) else nil
			
			if IsKeyAvailableInEngine and Text then
				local Item = AppStorageService1:GetItem(AppStorageKey) or ""
				local Success, Result = pcall(function() --[[ Line: 53 ]]
					-- upvalues: HttpService (upval), Item (copy)
					return HttpService:JSONDecode(Item)
				end)
				local Result1 = if Success and type(Result) == "table" then Result else nil
				
				return Result1 and Result1[Text] and tonumber(Result1[Text]) or 0
			else
				return DismissedValue
			end
		end,
		incrementValue = function() --[[ Line: 93 ]]
			-- upvalues: PlayersService (copy), IsKeyAvailableInEngine (copy), AppStorageService1 (copy), AppStorageKey (copy), HttpService (upval), DismissedValue (copy), setImpressionCountPerUser (copy)
			local LocalPlayer = PlayersService.LocalPlayer
			local Text = if LocalPlayer and LocalPlayer.UserId and LocalPlayer.UserId > 0 then tostring(LocalPlayer.UserId) else nil
			local Number = nil
			
			if IsKeyAvailableInEngine and Text then
				local Item = AppStorageService1:GetItem(AppStorageKey) or ""
				local Success, Result = pcall(function() --[[ Line: 53 ]]
					-- upvalues: HttpService (upval), Item (copy)
					return HttpService:JSONDecode(Item)
				end)
				local Result1 = if Success and type(Result) == "table" then Result else nil
				Number = Result1 and Result1[Text] and tonumber(Result1[Text]) or 0
			else
				Number = DismissedValue
			end
			local NewNumber = Number + 1
			local LocalPlayer1 = PlayersService.LocalPlayer
			local Text1 = if LocalPlayer1 and LocalPlayer1.UserId and LocalPlayer1.UserId > 0 then tostring(LocalPlayer1.UserId) else nil
			
			if IsKeyAvailableInEngine and Text1 then
				setImpressionCountPerUser(Text1, NewNumber)
			end
		end,
		dismissValue = function() --[[ Line: 97 ]]
			-- upvalues: DismissedValue (copy), PlayersService (copy), IsKeyAvailableInEngine (copy), setImpressionCountPerUser (copy)
			local LocalPlayer = PlayersService.LocalPlayer
			local Text = if LocalPlayer and LocalPlayer.UserId and LocalPlayer.UserId > 0 then tostring(LocalPlayer.UserId) else nil
			
			if IsKeyAvailableInEngine and Text then
				setImpressionCountPerUser(Text, DismissedValue)
			end
		end
	}
end