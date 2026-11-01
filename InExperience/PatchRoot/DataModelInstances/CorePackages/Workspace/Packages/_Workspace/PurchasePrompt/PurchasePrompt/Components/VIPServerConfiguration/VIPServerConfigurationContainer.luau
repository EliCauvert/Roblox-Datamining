local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local ReactModule = require(Parent.React)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Localization = require(Parent.RobloxAppLocales).Localization
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local GenerateVIPServerLinkModule = require(PurchasePrompt.Thunks.generateVIPServerLink)
local SaveVIPServerConfigurationModule = require(PurchasePrompt.Thunks.saveVIPServerConfiguration)
local SearchUsersModule = require(PurchasePrompt.Thunks.searchUsers)
local _ = require(PurchasePrompt.types)
local VIPServerConfigurationViewModule = require(script.Parent.VIPServerConfigurationView)
local UseVIPServerConfigurationViewModelModule = require(script.Parent.useVIPServerConfigurationViewModel)

local function VIPServerConfiguration(p1)
	-- upvalues: UseVIPServerConfigurationViewModelModule (copy), Players (copy), ReactModule (copy), VIPServerConfigurationViewModule (copy)
	return ReactModule.createElement(VIPServerConfigurationViewModule, (UseVIPServerConfigurationViewModelModule({
		defaultServerName = p1.defaultServerName,
		generateLink = p1.generateLink,
		save = p1.save,
		searchUsers = p1.searchUsers,
		onClose = p1.onClose,
		players = Players
	})))
end

return require(PurchasePrompt.connectToStore)(function(p1)
	return { defaultServerName = p1.promptRequest.vipServerName or "" }
end, function(Callback)
	-- upvalues: GenerateVIPServerLinkModule (copy), SaveVIPServerConfigurationModule (copy), SearchUsersModule (copy)
	return {
		generateLink = function()
			-- upvalues: Callback (copy), GenerateVIPServerLinkModule (upval)
			return Callback(GenerateVIPServerLinkModule())
		end,
		save = function(p1)
			-- upvalues: Callback (copy), SaveVIPServerConfigurationModule (upval)
			return Callback(SaveVIPServerConfigurationModule(p1))
		end,
		searchUsers = function(p1)
			-- upvalues: Callback (copy), SearchUsersModule (upval)
			return Callback(SearchUsersModule(p1))
		end
	}
end)(function(p1)
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), VIPServerConfiguration (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		FocusRoot = ReactModule.createElement(FocusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, {
			VIPServerConfiguration = ReactModule.createElement(VIPServerConfiguration, p1)
		})
	})
end)