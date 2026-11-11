local AppStorageService = game:GetService("AppStorageService")
local LocalizationService = game:GetService("LocalizationService")
local NotificationService = game:GetService("NotificationService")
local CorePackages = game:GetService("CorePackages")
local LocalStorageKey = require(CorePackages.Workspace.Packages.LocalStorage).Enums.LocalStorageKey
local MessageBus = require(CorePackages.Workspace.Packages.MessageBus).MessageBus
local TModule = require(CorePackages.Packages.t)
local LocalStorageListener = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Roact).PureComponent:extend("LocalStorageListener")
local config = {
	mid = MessageBus.getMessageId("Locale", "RobloxLocaleIdChanged"),
	validateParams = TModule.strictInterface({ localeId = TModule.string })
}

function LocalStorageListener:init() end

function LocalStorageListener:render() end

function LocalStorageListener.didMount(p1)
	-- upvalues: AppStorageService (copy), LocalStorageKey (copy), LocalizationService (copy), MessageBus (copy), config (copy), NotificationService (copy)
	local Item = AppStorageService:GetItem(LocalStorageKey.RobloxLocaleId)
	
	if Item ~= "" then
		LocalizationService:SetRobloxLocaleId(Item)
	end
	p1.connections = {
		AppStorageService.ItemWasSet:Connect(function(AuthenticatedTheme, LocaleId)
			-- upvalues: LocalStorageKey (upval), LocalizationService (upval), MessageBus (upval), config (upval), NotificationService (upval)
			if AuthenticatedTheme == LocalStorageKey.RobloxLocaleId then
				LocalizationService:SetRobloxLocaleId(LocaleId)
				MessageBus.publish(config, { localeId = LocaleId })
				
				return
			end
			if AuthenticatedTheme == LocalStorageKey.AuthenticatedTheme then
				NotificationService.SelectedTheme = LocaleId
			end
		end)
	}
end

function LocalStorageListener.willUnmount(p1)
	for _, connection in ipairs(p1.connections) do
		connection:Disconnect()
	end
end

return LocalStorageListener