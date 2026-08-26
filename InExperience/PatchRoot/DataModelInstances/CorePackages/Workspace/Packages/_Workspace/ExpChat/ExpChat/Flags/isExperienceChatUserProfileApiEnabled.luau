local var1
local appStorageService = game:GetService("AppStorageService")
game:DefineFastInt("ExperienceChatUserProfileApiRollout_v1", 0)
game:DefineFastFlag("ExperienceChatUserProfileApiEnabledForAll_v1", false)

local _ = function(p1)
	-- upvalues: appStorageService (ref)
	local appInstallationIdItem = (p1 or appStorageService):GetItem("AppInstallationId")
	local var2 = typeof(appInstallationIdItem)
	
	return if var2 == "number" then appInstallationIdItem elseif var2 == "string" then if string.len(appInstallationIdItem) <= 0 then nil else tonumber(string.sub(appInstallationIdItem, -2)) else nil
end

local _ = function(p1, p2)
	-- upvalues: appStorageService (ref)
	local var2 = p1()
	local appInstallationIdItem = (p2 or appStorageService):GetItem("AppInstallationId")
	local var3 = typeof(appInstallationIdItem)
	local var4 = if var3 == "number" then appInstallationIdItem elseif var3 == "string" then if string.len(appInstallationIdItem) <= 0 then nil else tonumber(string.sub(appInstallationIdItem, -2)) else nil
	
	return if var4 == nil then var2 >= 100 else var4 % 100 + 1 <= var2
end

local _ = function(p1, p2)
	-- upvalues: appStorageService (ref)
	local var2
	local var3 = p1()
	local appInstallationIdItem = (p2 or appStorageService):GetItem("AppInstallationId")
	local var4 = typeof(appInstallationIdItem)
	local var5 = if var4 == "number" then appInstallationIdItem elseif var4 == "string" then if string.len(appInstallationIdItem) <= 0 then nil else tonumber(string.sub(appInstallationIdItem, -2)) else nil
	
	if var5 == nil then
		var2 = var3 >= 100
		var2 = nil
	else
		var2 = var5 % 100 + 1 <= var3
	end
	return function()
		-- upvalues: var2 (ref)
		return var2
	end
end

local _ = function()
	return game:GetFastInt("ExperienceChatUserProfileApiRollout_v1")
end

local _ = function()
	return game:GetFastFlag("ExperienceChatUserProfileApiEnabledForAll_v1")
end

local experienceChatUserProfileApiRolloutV1FastInt = game:GetFastInt("ExperienceChatUserProfileApiRollout_v1")
local appInstallationIdItem = appStorageService:GetItem("AppInstallationId")
local var2 = typeof(appInstallationIdItem)
local var3 = if var2 == "number" then appInstallationIdItem elseif var2 == "string" then if string.len(appInstallationIdItem) <= 0 then nil else tonumber(string.sub(appInstallationIdItem, -2)) else nil

if var3 == nil then
	var1 = experienceChatUserProfileApiRolloutV1FastInt >= 100
	var1 = nil
else
	var1 = var3 % 100 + 1 <= experienceChatUserProfileApiRolloutV1FastInt
end
local var4 = function()
	-- upvalues: var1 (ref)
	return var1
end

return function()
	-- upvalues: var4 (ref)
	return game:GetFastFlag("ExperienceChatUserProfileApiEnabledForAll_v1") or var4()
end