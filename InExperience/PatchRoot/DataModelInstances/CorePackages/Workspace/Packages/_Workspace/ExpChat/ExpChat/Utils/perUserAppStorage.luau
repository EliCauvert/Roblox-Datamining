local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")

local function _()
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return if localPlayer == nil then "" else tostring(localPlayer.UserId)
end

local function readLookup(p1)
	-- upvalues: appStorageService (ref), httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: appStorageService (copy), p1 (ref)
		return appStorageService:GetItem(p1)
	end)
	
	if not ok or type(status) ~= "string" or status == "" then
		return {}
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 and type(status_1) == "table" then status_1 else {}
end

local function writeLookup(p1, p2)
	-- upvalues: httpService (ref), appStorageService (ref)
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p2 (ref)
		return httpService:JSONEncode(p2)
	end)
	
	return if ok and type(status) == "string" then pcall(function()
		-- upvalues: appStorageService (copy), p1 (ref), status (ref)
		appStorageService:SetItem(p1, status)
		appStorageService:Flush()
	end) else false
end

return {
	getEntry = function(p1)
		-- upvalues: playersService (ref), readLookup (ref)
		local localPlayer = playersService.LocalPlayer
		local var1 = if localPlayer == nil then "" else tostring(localPlayer.UserId)
		
		if var1 == "" then
			return {}
		end
		local var2 = readLookup(p1)[var1]
		
		return if type(var2) == "table" then var2 else {}
	end,
	updateEntry = function(p1, p2)
		-- upvalues: playersService (ref), readLookup (ref), writeLookup (ref)
		local localPlayer = playersService.LocalPlayer
		local var1 = if localPlayer == nil then "" else tostring(localPlayer.UserId)
		
		if var1 == "" then return end
		local var2 = readLookup(p1)
		local var3 = var2[var1]
		local var4 = p2(if type(var3) == "table" then var3 else {})
		
		if var4 == nil then
			return
		end
		var2[var1] = var4
		writeLookup(p1, var2)
	end
}