local UserInputService = game:GetService("UserInputService")
local NotificationsUpsell = script:FindFirstAncestor("NotificationsUpsell")
local Parent = NotificationsUpsell.Parent
local PromiseModule = require(Parent.Promise)
local FIntStreamPushPermissionClientAttributesTimeoutMsModule = require(NotificationsUpsell.Flags.FIntStreamPushPermissionClientAttributesTimeoutMs)
local Keys = {
	PERMISSION_STATUS = "pushNotificationPermissionStatus",
	UPSELL_STATUS = "pushNotificationUpsellStatus",
	RATIONALE_STATUS = "pushNotificationRationaleStatus",
	PUSH_NOTIFICATIONS_ENABLED = "pushNotificationsEnabled",
	CAN_OPEN_NOTIFICATION_SETTINGS = "canOpenNotificationSettings",
	ANDROID_SDK_LEVEL = "androidSdkLevel"
}
local BuildPushPermissionClientAttributesModule = {
	Keys = Keys,
	UNKNOWN = "UNKNOWN",
	_getPlatform = function()
		-- upvalues: UserInputService (copy)
		return UserInputService:GetPlatform()
	end,
	_permissionsProtocol = require(Parent.PermissionsProtocol).PermissionsProtocol,
	_systemInfoProtocol = require(Parent.SystemInfoProtocol).SystemInfoProtocol
}

local function _(p1)
	return if typeof(p1) == "string" and p1 ~= "" then p1 else "UNKNOWN"
end

local _ = function(p1, p2)
	return if typeof(p1) == "table" then p1[p2] else nil
end

local _ = function()
	-- upvalues: BuildPushPermissionClientAttributesModule (copy)
	local Success, Result = pcall(BuildPushPermissionClientAttributesModule._getPlatform)
	
	return if Success then Result else nil
end

local _ = function(): string
	-- upvalues: BuildPushPermissionClientAttributesModule (copy)
	local Success, Result = pcall(BuildPushPermissionClientAttributesModule._permissionsProtocol.isOpenNotificationSettingsSupported)
	
	return if Success then if Result == true then "true" else "false" else "UNKNOWN"
end

local _ = function()
	-- upvalues: BuildPushPermissionClientAttributesModule (copy)
	local SystemInfoProtocol = BuildPushPermissionClientAttributesModule._systemInfoProtocol
	local Success, Result = pcall(function()
		-- upvalues: SystemInfoProtocol (copy)
		return SystemInfoProtocol.default:getSystemInfo({ SystemInfoProtocol.InfoNames.SYSTEM_VERSION })
	end)
	local SystemVersion = if Success and typeof(Result) == "table" then Result.systemVersion else nil
	
	return if typeof(SystemVersion) == "string" and SystemVersion ~= "" then SystemVersion else "UNKNOWN"
end

local function settleWithin(Read)
	-- upvalues: PromiseModule (copy), FIntStreamPushPermissionClientAttributesTimeoutMsModule (copy)
	return PromiseModule.new(function(Callback)
		-- upvalues: PromiseModule (upval), Read (copy), FIntStreamPushPermissionClientAttributesTimeoutMsModule (upval)
		PromiseModule.try(Read):andThen(function(Result)
			-- upvalues: Callback (copy)
			Callback(if typeof(Result) == "string" and Result ~= "" then Result else "UNKNOWN")
		end, function()
			-- upvalues: Callback (copy)
			Callback("UNKNOWN")
		end)
		task.delay(FIntStreamPushPermissionClientAttributesTimeoutMsModule / 1000, Callback, "UNKNOWN")
	end)
end

function BuildPushPermissionClientAttributesModule.build()
	-- upvalues: BuildPushPermissionClientAttributesModule (copy), PromiseModule (copy), Keys (copy), settleWithin (copy)
	local Success, Result = pcall(BuildPushPermissionClientAttributesModule._getPlatform)
	local Result1 = if Success then Result else nil
	local IsResultMatch = Result1 == Enum.Platform.Android
	
	if Result1 ~= Enum.Platform.IOS and not IsResultMatch then
		return PromiseModule.resolve({})
	end
	local PermissionsProtocol = BuildPushPermissionClientAttributesModule._permissionsProtocol
	local list = { PermissionsProtocol.Permissions.POST_NOTIFICATIONS }
	local Success1, Result2 = pcall(BuildPushPermissionClientAttributesModule._permissionsProtocol.isOpenNotificationSettingsSupported)
	local True: string = if Success1 then if Result2 == true then "true" else "false" else "UNKNOWN"
	local config = { [Keys.CAN_OPEN_NOTIFICATION_SETTINGS] = True }
	
	if IsResultMatch then
		local ANDROIDSDKLEVEL = Keys.ANDROID_SDK_LEVEL
		local SystemInfoProtocol = BuildPushPermissionClientAttributesModule._systemInfoProtocol
		local Success2, Result3 = pcall(function()
			-- upvalues: SystemInfoProtocol (copy)
			return SystemInfoProtocol.default:getSystemInfo({ SystemInfoProtocol.InfoNames.SYSTEM_VERSION })
		end)
		local SystemVersion = if Success2 and typeof(Result3) == "table" then Result3.systemVersion else nil
		config[ANDROIDSDKLEVEL] = if typeof(SystemVersion) == "string" and SystemVersion ~= "" then SystemVersion else "UNKNOWN"
	end
	local List = {
		{
			key = Keys.PERMISSION_STATUS,
			read = function()
				-- upvalues: PermissionsProtocol (copy), list (copy)
				return PermissionsProtocol.default:hasPermissions(list):andThen(function(Result)
					return if typeof(Result) == "table" then Result.status else nil
				end)
			end
		},
		{
			key = Keys.UPSELL_STATUS,
			read = function()
				-- upvalues: PermissionsProtocol (copy), list (copy)
				return PermissionsProtocol.default:shouldShowUpsell(list):andThen(function(Result)
					return if typeof(Result) == "table" then Result.upsellStatus else nil
				end)
			end
		},
		{
			key = Keys.RATIONALE_STATUS,
			read = function()
				-- upvalues: PermissionsProtocol (copy), list (copy)
				return PermissionsProtocol.default:shouldShowRationale(list):andThen(function(Result)
					return if typeof(Result) == "table" then Result.upsellStatus else nil
				end)
			end
		}
	}
	
	if IsResultMatch and True == "true" then
		table.insert(List, {
			key = Keys.PUSH_NOTIFICATIONS_ENABLED,
			read = function()
				-- upvalues: PermissionsProtocol (copy)
				return PermissionsProtocol.default:getPushNotificationsEnabled():andThen(function(Result)
					local Enabled = if typeof(Result) == "table" then Result.enabled else nil
					
					return if Enabled == true then "true" elseif Enabled == false then "false" else nil
				end)
			end
		})
	end
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, settleWithin(value.read))
	end
	return PromiseModule.all(List1):andThen(function(Result)
		-- upvalues: List (copy), config (copy)
		for i, value in List do
			config[value.key] = Result[i]
		end
		return config
	end)
end

return BuildPushPermissionClientAttributesModule