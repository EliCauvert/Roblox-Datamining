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
local TeleportToVIPServerModule = require(PurchasePrompt.Utils.teleportToVIPServer)
local _ = require(PurchasePrompt.types)
local VIPServerConfigurationViewModule = require(script.Parent.VIPServerConfigurationView)
local UseVIPServerConfigurationViewModelModule = require(script.Parent.useVIPServerConfigurationViewModel)
local VIPServerJoinViewModule = require(script.Parent.VIPServerJoinView)
local UseVIPServerJoinViewModelModule = require(script.Parent.useVIPServerJoinViewModel)

local function VIPServerConfiguration(p1)
	-- upvalues: UseVIPServerConfigurationViewModelModule (copy), Players (copy), ReactModule (copy), VIPServerConfigurationViewModule (copy)
	return ReactModule.createElement(VIPServerConfigurationViewModule, (UseVIPServerConfigurationViewModelModule({
		defaultServerName = p1.serverName,
		generateLink = p1.generateLink,
		save = p1.save,
		searchUsers = p1.searchUsers,
		onSaved = p1.onSaved,
		onClose = p1.onClose,
		players = Players
	})))
end

local function VIPServerJoin(p1)
	-- upvalues: UseVIPServerJoinViewModelModule (copy), TeleportToVIPServerModule (copy), ReactModule (copy), VIPServerJoinViewModule (copy)
	return ReactModule.createElement(VIPServerJoinViewModule, (UseVIPServerJoinViewModelModule({
		vipServerAccessCode = p1.vipServerAccessCode,
		serverName = p1.serverName,
		gameName = p1.gameName,
		thumbnailUrl = p1.thumbnailUrl,
		teleport = TeleportToVIPServerModule,
		onClose = p1.onClose
	})))
end

local function VIPServerPostPurchase(p1)
	-- upvalues: ReactModule (copy), VIPServerJoin (copy), VIPServerConfiguration (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local VipServerAccessCode = p1.vipServerAccessCode
	local OnCloseFunction = p1.onClose
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: VipServerAccessCode (copy), UseStateResult2 (copy), OnCloseFunction (copy)
		if VipServerAccessCode == nil then
			OnCloseFunction()
			
			return
		else
			UseStateResult2(true)
		end
	end, { VipServerAccessCode, OnCloseFunction })
	
	return if UseStateResult and VipServerAccessCode ~= nil then ReactModule.createElement(VIPServerJoin, {
		vipServerAccessCode = VipServerAccessCode,
		serverName = p1.serverName,
		gameName = p1.gameName,
		thumbnailUrl = p1.thumbnailUrl,
		onClose = OnCloseFunction
	}) else ReactModule.createElement(VIPServerConfiguration, {
		serverName = p1.serverName,
		generateLink = p1.generateLink,
		save = p1.save,
		searchUsers = p1.searchUsers,
		onSaved = UseResult,
		onClose = OnCloseFunction
	})
end

return require(PurchasePrompt.connectToStore)(function(p1)
	return {
		serverName = p1.promptRequest.vipServerName or "",
		vipServerAccessCode = p1.promptRequest.vipServerAccessCode,
		gameName = p1.productInfo.name or "",
		thumbnailUrl = p1.productInfo.imageUrl
	}
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
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), VIPServerPostPurchase (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		FocusRoot = ReactModule.createElement(FocusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, {
			VIPServerPostPurchase = ReactModule.createElement(VIPServerPostPurchase, p1)
		})
	})
end)