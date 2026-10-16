local AppStorageService = game:GetService("AppStorageService")
game:DefineFastInt("ExperienceChatUserProfileApiRollout_v1", 0)
game:DefineFastFlag("ExperienceChatUserProfileApiEnabledForAll_v1", false)

local function _(p1) --[[ Line: 8 ]]
	-- upvalues: AppStorageService (copy)
	local AppInstallationIdItem: string = (if p1 then p1 else AppStorageService):GetItem("AppInstallationId")
	local ValueType = typeof(AppInstallationIdItem)
	
	return if ValueType == "number" then AppInstallationIdItem elseif ValueType == "string" then if string.len(AppInstallationIdItem) <= 0 then nil else tonumber((string.sub(AppInstallationIdItem, -2))) else nil
end

local _ = function(Callback, p1): boolean --[[ Line: 35 ]]
	-- upvalues: AppStorageService (copy)
	local CallbackResult: number = Callback()
	local AppInstallationIdItem: string = (if p1 then p1 else AppStorageService):GetItem("AppInstallationId")
	local ValueType = typeof(AppInstallationIdItem)
	local AppInstallationIdItem1 = if ValueType == "number" then AppInstallationIdItem elseif ValueType == "string" then if string.len(AppInstallationIdItem) <= 0 then nil else tonumber((string.sub(AppInstallationIdItem, -2))) else nil
	
	return if AppInstallationIdItem1 == nil then CallbackResult >= 100 else AppInstallationIdItem1 % 100 + 1 <= CallbackResult
end

local _ = function(Callback, p1) --[[ Line: 51 ]]
	-- upvalues: AppStorageService (copy)
	local CallbackResult: number = Callback()
	local AppInstallationIdItem: string = (if p1 then p1 else AppStorageService):GetItem("AppInstallationId")
	local ValueType = typeof(AppInstallationIdItem)
	local AppInstallationIdItem1 = if ValueType == "number" then AppInstallationIdItem elseif ValueType == "string" then if string.len(AppInstallationIdItem) <= 0 then nil else tonumber((string.sub(AppInstallationIdItem, -2))) else nil
	local IsCallbackResultAbove: boolean = if AppInstallationIdItem1 == nil then CallbackResult >= 100 else AppInstallationIdItem1 % 100 + 1 <= CallbackResult
	
	return function() --[[ Line: 57 ]]
		-- upvalues: IsCallbackResultAbove (copy)
		return IsCallbackResultAbove
	end
end

local _ = function() --[[ Line: 62 ]]
	return game:GetFastInt("ExperienceChatUserProfileApiRollout_v1")
end

local _ = function() --[[ Line: 66 ]]
	return game:GetFastFlag("ExperienceChatUserProfileApiEnabledForAll_v1")
end

local ExperienceChatUserProfileApiRolloutV1FastInt: number = game:GetFastInt("ExperienceChatUserProfileApiRollout_v1")
local AppInstallationIdItem: string = AppStorageService:GetItem("AppInstallationId")
local ValueType = typeof(AppInstallationIdItem)
local AppInstallationIdItem1 = if ValueType == "number" then AppInstallationIdItem elseif ValueType == "string" then if string.len(AppInstallationIdItem) <= 0 then nil else tonumber((string.sub(AppInstallationIdItem, -2))) else nil
local IsExperienceChatUserProfileApiRolloutV1FastIntAbove: boolean = if AppInstallationIdItem1 == nil then ExperienceChatUserProfileApiRolloutV1FastInt >= 100 else AppInstallationIdItem1 % 100 + 1 <= ExperienceChatUserProfileApiRolloutV1FastInt

local function v11() --[[ Line: 57 ]]
	-- upvalues: IsExperienceChatUserProfileApiRolloutV1FastIntAbove (copy)
	return IsExperienceChatUserProfileApiRolloutV1FastIntAbove
end

return function() --[[ Line: 72 ]]
	-- upvalues: v11 (copy)
	return game:GetFastFlag("ExperienceChatUserProfileApiEnabledForAll_v1") or v11()
end