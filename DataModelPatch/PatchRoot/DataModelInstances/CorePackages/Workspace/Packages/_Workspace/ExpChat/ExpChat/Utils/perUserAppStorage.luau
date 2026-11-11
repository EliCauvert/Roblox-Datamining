local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local function _(): string
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return if LocalPlayer == nil then "" else tostring(LocalPlayer.UserId)
end

local function readLookup(Key)
	-- upvalues: AppStorageService (copy), HttpService (copy)
	local Success, Result = pcall(function()
		-- upvalues: AppStorageService (upval), Key (copy)
		return AppStorageService:GetItem(Key)
	end)
	
	if Success and type(Result) == "string" and Result ~= "" then
		local Success1, Result1 = pcall(function()
			-- upvalues: HttpService (upval), Result (copy)
			return HttpService:JSONDecode(Result)
		end)
		
		return if Success1 and type(Result1) == "table" then Result1 else {}
	else
		return {}
	end
end

local function writeLookup(Key, Input)
	-- upvalues: HttpService (copy), AppStorageService (copy)
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), Input (copy)
		return HttpService:JSONEncode(Input)
	end)
	
	return if Success and type(Result) == "string" then pcall(function()
		-- upvalues: AppStorageService (upval), Key (copy), Result (copy)
		AppStorageService:SetItem(Key, Result)
		AppStorageService:Flush()
	end) else false
end

return {
	getEntry = function(p1)
		-- upvalues: Players (copy), readLookup (copy)
		local LocalPlayer = Players.LocalPlayer
		local Text: string = if LocalPlayer == nil then "" else tostring(LocalPlayer.UserId)
		
		if Text == "" then
			return {}
		else
			local LookupEntry = readLookup(p1)[Text]
			
			return if type(LookupEntry) == "table" then LookupEntry else {}
		end
	end,
	updateEntry = function(p1, Callback)
		-- upvalues: Players (copy), readLookup (copy), writeLookup (copy)
		local LocalPlayer = Players.LocalPlayer
		local Text: string = if LocalPlayer == nil then "" else tostring(LocalPlayer.UserId)
		
		if Text == "" then return end
		local Lookup = readLookup(p1)
		local LookupEntry = Lookup[Text]
		local CallbackResult = Callback(if type(LookupEntry) == "table" then LookupEntry else {})
		
		if CallbackResult ~= nil then
			Lookup[Text] = CallbackResult
			writeLookup(p1, Lookup)
			
			return
		end
	end
}