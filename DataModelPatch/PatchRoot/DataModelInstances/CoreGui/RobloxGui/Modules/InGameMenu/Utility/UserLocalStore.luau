local AppStorageService = game:GetService("AppStorageService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local function _(): string
	-- upvalues: Players (copy)
	return if Players.LocalPlayer and Players.LocalPlayer.UserId > 0 then tostring(Players.LocalPlayer.UserId) else "0"
end

local _ = function(p1): string
	return "u_" .. tostring(p1 or "0")
end

local function getValuesForAllUsers(Key)
	-- upvalues: AppStorageService (copy), HttpService (copy)
	local Item = AppStorageService:GetItem(Key)
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), Item (copy)
		return HttpService:JSONDecode(Item)
	end)
	
	return if Success and type(Result) == "table" then Result else { default = Item }
end

local _ = function(Key, Input)
	-- upvalues: HttpService (copy), AppStorageService (copy)
	AppStorageService:SetItem(Key, (HttpService:JSONEncode(Input)))
end

local UserLocalStore = {}
UserLocalStore.__index = UserLocalStore

function UserLocalStore.new(p1: string)
	-- upvalues: Players (copy), UserLocalStore (copy)
	if not p1 then
		p1 = if Players.LocalPlayer and Players.LocalPlayer.UserId > 0 then tostring(Players.LocalPlayer.UserId) else "0"
	end
	local config = { userId = tostring(p1) }
	setmetatable(config, UserLocalStore)
	
	return config
end

function UserLocalStore:GetItem(Key)
	-- upvalues: getValuesForAllUsers (copy)
	local ValuesForAllUsers = getValuesForAllUsers(Key)
	local ValuesForAllUser = ValuesForAllUsers["u_" .. tostring(self.userId or "0")]
	
	if ValuesForAllUser == nil then
		ValuesForAllUser = ValuesForAllUsers.default
	end
	return ValuesForAllUser
end

function UserLocalStore:SetItem(Key, Json)
	-- upvalues: getValuesForAllUsers (copy), HttpService (copy), AppStorageService (copy)
	local ValuesForAllUsers = getValuesForAllUsers(Key)
	ValuesForAllUsers["u_" .. tostring(self.userId or "0")] = Json
	AppStorageService:SetItem(Key, (HttpService:JSONEncode(ValuesForAllUsers)))
end

function UserLocalStore:Flush()
	-- upvalues: AppStorageService (copy)
	AppStorageService:Flush()
end

UserLocalStore.getItem = UserLocalStore.GetItem
UserLocalStore.setItem = UserLocalStore.SetItem
UserLocalStore.flush = UserLocalStore.Flush

return UserLocalStore