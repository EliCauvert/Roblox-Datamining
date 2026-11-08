local AppStorageService = game:GetService("AppStorageService")
local Parent = script.Parent.Parent
local Default = require(Parent.PermissionsProtocol).PermissionsProtocol.default
local PromiseModule = require(Parent.Promise)
local FFlagPushPermissionRequestOpensAndroidSettings = require(Parent.SharedFlags).FFlagPushPermissionRequestOpensAndroidSettings
local NotificationsUpsellConstantsModule = require(script.Parent.NotificationsUpsellConstants)
local PushNotificationsUpsellUtilsModule = require(script.Parent.Util.PushNotificationsUpsellUtils)
local PushPermissionRequestEnvironmentModule = require(script.Parent.Util.pushPermissionRequestEnvironment)

local function requestOsPrompt()
	-- upvalues: Default (copy), PushNotificationsUpsellUtilsModule (copy), AppStorageService (copy), NotificationsUpsellConstantsModule (copy)
	return Default:requestPermissions({ Default.Permissions.POST_NOTIFICATIONS }):andThen(function(Result)
		-- upvalues: PushNotificationsUpsellUtilsModule (upval), AppStorageService (upval), NotificationsUpsellConstantsModule (upval)
		PushNotificationsUpsellUtilsModule.setPushSysUpsellPromptTimestamp(AppStorageService, os.time())
		PushNotificationsUpsellUtilsModule.incrementPushUpsellPromptedCount(AppStorageService, NotificationsUpsellConstantsModule.LocalStorageKeys.PromptShownCount)
		
		return Result
	end)
end

local function settleWithin(p1)
	-- upvalues: PromiseModule (copy), PushPermissionRequestEnvironmentModule (copy)
	return PromiseModule.new(function(Callback)
		-- upvalues: PromiseModule (upval), p1 (copy), PushPermissionRequestEnvironmentModule (upval)
		PromiseModule.try(p1):andThen(Callback, function()
			-- upvalues: Callback (copy)
			Callback(nil)
		end)
		task.delay(PushPermissionRequestEnvironmentModule.statusReadTimeoutSeconds, Callback, nil)
	end)
end

local function _(p1): boolean
	-- upvalues: Default (copy)
	return typeof(p1) == "table" and p1.upsellStatus == Default.UpsellStatus.HIDE
end

local function shouldOpenSettings()
	-- upvalues: PushPermissionRequestEnvironmentModule (copy), PromiseModule (copy), Default (copy), settleWithin (copy)
	local Success, Result = pcall(PushPermissionRequestEnvironmentModule.getPlatform)
	
	if not Success or Result ~= Enum.Platform.Android then
		return PromiseModule.resolve(false)
	end
	local Success1, Result1 = pcall(Default.isOpenNotificationSettingsSupported)
	
	if Success1 and Result1 == true then
		local list = { Default.Permissions.POST_NOTIFICATIONS }
		
		local function v18()
			-- upvalues: Default (upval)
			return Default:getPushNotificationsEnabled()
		end
		
		local function v19()
			-- upvalues: Default (upval), list (copy)
			return Default:shouldShowUpsell(list)
		end
		
		return PromiseModule.all({
			PromiseModule.new(function(Callback)
				-- upvalues: PromiseModule (upval), v18 (copy), PushPermissionRequestEnvironmentModule (upval)
				PromiseModule.try(v18):andThen(Callback, function()
					-- upvalues: Callback (copy)
					Callback(nil)
				end)
				task.delay(PushPermissionRequestEnvironmentModule.statusReadTimeoutSeconds, Callback, nil)
			end),
			PromiseModule.new(function(Callback)
				-- upvalues: PromiseModule (upval), v19 (copy), PushPermissionRequestEnvironmentModule (upval)
				PromiseModule.try(v19):andThen(Callback, function()
					-- upvalues: Callback (copy)
					Callback(nil)
				end)
				task.delay(PushPermissionRequestEnvironmentModule.statusReadTimeoutSeconds, Callback, nil)
			end),
			settleWithin(function()
				-- upvalues: Default (upval), list (copy)
				return Default:shouldShowRationale(list)
			end)
		}):andThen(function(Entry): boolean
			-- upvalues: Default (upval)
			local Entry1 = Entry[1]
			local IsUpsellStatusMatch = false
			
			if typeof(Entry1) == "table" then
				IsUpsellStatusMatch = false
				
				if Entry1.enabled == false then
					local Entry2 = Entry[2]
					IsUpsellStatusMatch = typeof(Entry2) == "table" and Entry2.upsellStatus == Default.UpsellStatus.HIDE
					
					if IsUpsellStatusMatch then
						local Entry3 = Entry[3]
						IsUpsellStatusMatch = typeof(Entry3) == "table" and Entry3.upsellStatus == Default.UpsellStatus.HIDE
					end
				end
			end
			return IsUpsellStatusMatch
		end)
	else
		return PromiseModule.resolve(false)
	end
end

local function openNotificationSettings()
	-- upvalues: Default (copy), PromiseModule (copy)
	local OpenSettingsStatus = Default.OpenSettingsStatus
	
	return Default:openNotificationSettings():andThen(function(Result)
		-- upvalues: OpenSettingsStatus (copy), PromiseModule (upval)
		local Status = if typeof(Result) == "table" and Result.status ~= nil then Result.status else OpenSettingsStatus.FAILED
		
		return if Status == OpenSettingsStatus.FAILED then PromiseModule.reject({ openSettingsStatus = Status }) else { openSettingsStatus = Status }
	end)
end

return function(p1)
	-- upvalues: FFlagPushPermissionRequestOpensAndroidSettings (copy), shouldOpenSettings (copy), openNotificationSettings (copy), requestOsPrompt (copy)
	return if FFlagPushPermissionRequestOpensAndroidSettings and p1 ~= nil and p1.allowOpenSettings == true then shouldOpenSettings():andThen(function(Result)
		-- upvalues: openNotificationSettings (upval), requestOsPrompt (upval)
		return if Result then openNotificationSettings() else requestOsPrompt()
	end) else requestOsPrompt()
end