local var5
local appStorageService = game:GetService("AppStorageService")
game:DefineFastInt("ExperienceChatUserProfileApiRollout_v1", 0)
game:DefineFastFlag("ExperienceChatUserProfileApiEnabledForAll_v1", false)

local _ = function(p0)
	-- upvalues: appStorageService (ref)
	local appInstallationIdItem = (p0 or appStorageService):GetItem("AppInstallationId")
	local var8 = typeof(appInstallationIdItem)
	
	return if var8 == "number" then appInstallationIdItem elseif var8 == "string" then if string.len(appInstallationIdItem) <= 0 then nil else tonumber(string.sub(appInstallationIdItem, -2)) else nil
end

local _ = function(p1, p2)
	-- upvalues: appStorageService (ref)
	local var9 = p1()
	local appInstallationIdItem = (p2 or appStorageService):GetItem("AppInstallationId")
	local var11 = typeof(appInstallationIdItem)
	local var12 = if var11 == "number" then appInstallationIdItem elseif var11 == "string" then if string.len(appInstallationIdItem) <= 0 then nil else tonumber(string.sub(appInstallationIdItem, -2)) else nil
	
	return if var12 == nil then var9 >= 100 else var12 % 100 + 1 <= var9
end

local _ = function(p3, p4)
	-- upvalues: appStorageService (ref)
	local var17
	local var13 = p3()
	local appInstallationIdItem = (p4 or appStorageService):GetItem("AppInstallationId")
	local var15 = typeof(appInstallationIdItem)
	local var16 = if var15 == "number" then appInstallationIdItem elseif var15 == "string" then if string.len(appInstallationIdItem) <= 0 then nil else tonumber(string.sub(appInstallationIdItem, -2)) else nil
	
	if var16 == nil then
		var17 = var13 >= 100
		var17 = nil
	else
		var17 = var16 % 100 + 1 <= var13
	end
	return function()
		-- upvalues: var17 (ref)
		return var17
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
local var3 = typeof(appInstallationIdItem)
local var4 = if var3 == "number" then appInstallationIdItem elseif var3 == "string" then if string.len(appInstallationIdItem) <= 0 then nil else tonumber(string.sub(appInstallationIdItem, -2)) else nil

if var4 == nil then
	var5 = experienceChatUserProfileApiRolloutV1FastInt >= 100
	var5 = nil
else
	var5 = var4 % 100 + 1 <= experienceChatUserProfileApiRolloutV1FastInt
end
local var6 = function()
	-- upvalues: var5 (ref)
	return var5
end

return function()
	-- upvalues: var6 (ref)
	return game:GetFastFlag("ExperienceChatUserProfileApiEnabledForAll_v1") or var6()
end