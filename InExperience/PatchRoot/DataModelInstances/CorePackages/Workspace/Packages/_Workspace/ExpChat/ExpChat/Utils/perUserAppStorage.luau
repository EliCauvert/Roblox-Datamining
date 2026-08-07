local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")

local function _() --[[ line: 12 | named "getLocalUserKey" ]]
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return if localPlayer == nil then "" else tostring(localPlayer.UserId)
end

local function readLookup(p0) --[[ line: 20 ]]
	-- upvalues: appStorageService (ref), httpService (ref)
	local ok, status = pcall(function() --[[ line: 21 ]]
		-- upvalues: appStorageService (copy), p0 (ref)
		return appStorageService:GetItem(p0)
	end)
	
	if not ok or type(status) ~= "string" or status == "" then
		return {}
	end
	local ok_1, status_1 = pcall(function() --[[ line: 27 ]]
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 and type(status_1) == "table" then status_1 else {}
end

local function writeLookup(p1, p2) --[[ line: 36 ]]
	-- upvalues: httpService (ref), appStorageService (ref)
	local ok, status = pcall(function() --[[ line: 37 ]]
		-- upvalues: httpService (copy), p2 (ref)
		return httpService:JSONEncode(p2)
	end)
	
	return if ok and type(status) == "string" then pcall(function() --[[ line: 43 ]]
		-- upvalues: appStorageService (copy), p1 (ref), status (ref)
		appStorageService:SetItem(p1, status)
		appStorageService:Flush()
	end) else false
end

return {
	getEntry = function(p3) --[[ line: 54 ]]
		-- upvalues: playersService (ref), readLookup (ref)
		local localPlayer = playersService.LocalPlayer
		local var5 = if localPlayer == nil then "" else tostring(localPlayer.UserId)
		
		if var5 == "" then
			return {}
		end
		local var6 = readLookup(p3)[var5]
		
		return if type(var6) == "table" then var6 else {}
	end,
	updateEntry = function(p4, p5) --[[ line: 71 ]]
		-- upvalues: playersService (ref), readLookup (ref), writeLookup (ref)
		local localPlayer = playersService.LocalPlayer
		local var7 = if localPlayer == nil then "" else tostring(localPlayer.UserId)
		
		if var7 == "" then return end
		local var8 = readLookup(p4)
		local var9 = var8[var7]
		local var10 = p5(if type(var9) == "table" then var9 else {})
		
		if var10 == nil then
			return
		end
		var8[var7] = var10
		writeLookup(p4, var8)
	end
}