local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local starterGuiService = game:GetService("StarterGui")
local reactModule = require(corePackagesService.Packages.React)
local serviceModule = require(chrome.Service)
local chromeModule = require(corePackagesService.Workspace.Packages.Chrome)
local windowSizeSignalModule = require(chrome.ChromeShared.Service.WindowSizeSignal)
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local shopChromeWrapperModule = require(chrome.Integrations.InExperienceShop.ShopChromeWrapper)
local shopWindowLayoutModule = require(chrome.Integrations.InExperienceShop.ShopWindowLayout)
local chromeUtilsModule = require(chrome.ChromeShared.Service.ChromeUtils)
local mappedSignal = chromeUtilsModule.MappedSignal
local sideSheetPlacement = chromeModule.Enums.SideSheetPlacement
local inExperienceShopModule = require(corePackagesService.Workspace.Packages.InExperienceShop)
local fFlagEnableShopPrefetch = inExperienceShopModule.FFlagEnableShopPrefetch
local fFlagHideShopMenuOnFailure = inExperienceShopModule.FFlagHideShopMenuOnFailure
local fFlagCenterInExperienceShopWindow = inExperienceShopModule.FFlagCenterInExperienceShopWindow
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableMenuTrailingBadge = sharedFlagsModule.FFlagEnableMenuTrailingBadge
local fFlagShowOfferBadge = sharedFlagsModule.FFlagShowOfferBadge
local fFlagExperienceShopNewIconography = inExperienceShopModule.FFlagExperienceShopNewIconography
local shopCoreGuiToggleSupportedEngineFeature = game:GetEngineFeature("ShopCoreGuiToggleSupported")
local enableOpenShopSignalEngineFeature = game:GetEngineFeature("EnableOpenShopSignal")
local var1 = mappedSignal.new(serviceModule:onIntegrationStatusChanged(), function()
	-- upvalues: serviceModule (ref), constantsModule (ref)
	return serviceModule:isWindowOpen(constantsModule.IN_EXPERIENCE_SHOP_ID)
end)
local MAX_WINDOW_WIDTH = shopWindowLayoutModule.MAX_WINDOW_WIDTH
local MAX_WINDOW_HEIGHT = shopWindowLayoutModule.MAX_WINDOW_HEIGHT
local var2 = windowSizeSignalModule.new(MAX_WINDOW_WIDTH, MAX_WINDOW_HEIGHT, false, true)
local inExperienceShopNewBadgeStorageKey = game:DefineFastString("InExperienceShopNewBadgeStorageKey", "InExperienceShopNewBadgeStorageKey")
local newBadgeDismissalMaxCountInExperienceShop = game:DefineFastInt("NewBadgeDismissalMaxCountInExperienceShop", 5)
local fFlagEnableMenuTrailingBadge_1 = game:DefineFastFlag("EnableNewBadgeInExperienceShop", false) and fFlagEnableMenuTrailingBadge
local var3 = nil

if fFlagShowOfferBadge then
	local inExperienceOffersModule = require(corePackagesService.Workspace.Packages.InExperienceOffers)
	var3 = inExperienceOffersModule.Utils.createOfferBadgeTextSignal(inExperienceOffersModule.FeatureKeys.RobloxShop)
end
local unavailable
local var4 = if fFlagEnableMenuTrailingBadge_1 or var3 ~= nil then {
	localStorageKey = inExperienceShopNewBadgeStorageKey,
	maxViewCount = if fFlagEnableMenuTrailingBadge_1 then newBadgeDismissalMaxCountInExperienceShop else 0,
	customText = var3
} else nil
local var5 = if shopCoreGuiToggleSupportedEngineFeature then starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.All) or starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.ExperienceShop) else false
local var6 = true

local function _()
	-- upvalues: var5 (write), fFlagHideShopMenuOnFailure (ref), var6 (write), serviceModule (ref)
	if var5 and not fFlagHideShopMenuOnFailure then
		return serviceModule.AvailabilitySignal.Available
	end
	var6 = false
	
	return serviceModule.AvailabilitySignal.Unavailable
end

local _ = function()
	-- upvalues: fFlagCenterInExperienceShopWindow (ref), shopWindowLayoutModule (ref), serviceModule (ref), constantsModule (ref)
	if fFlagCenterInExperienceShopWindow then
		shopWindowLayoutModule.toggleInExperienceShopWindow()
		
		return
	end
	serviceModule:toggleWindow(constantsModule.IN_EXPERIENCE_SHOP_ID)
end

local t = {
	label = "Feature.Avatar.Action.Shop",
	cachePosition = true,
	draggable = true
}

if var5 and not fFlagHideShopMenuOnFailure then
	unavailable = serviceModule.AvailabilitySignal.Available
else
	var6 = false
	unavailable = serviceModule.AvailabilitySignal.Unavailable
end
t.initialAvailability = unavailable
t.id = constantsModule.IN_EXPERIENCE_SHOP_ID
t.sideSheetPlacement = sideSheetPlacement.Page
t.windowSize = var2
t.startingWindowPosition = shopWindowLayoutModule.getStartingWindowPosition()

function t.activated(_)
	-- upvalues: fFlagCenterInExperienceShopWindow (ref), shopWindowLayoutModule (ref), serviceModule (ref), constantsModule (ref)
	if fFlagCenterInExperienceShopWindow then
		shopWindowLayoutModule.toggleInExperienceShopWindow()
		
		return
	end
	serviceModule:toggleWindow(constantsModule.IN_EXPERIENCE_SHOP_ID)
end

t.menuTrailingBadgeConfig = var4
t.isActivated = var1
t.components = {
	Icon = function()
		-- upvalues: commonIconModule (ref), fFlagExperienceShopNewIconography (ref), var1 (ref)
		return commonIconModule(if fFlagExperienceShopNewIconography then "ShoppingBasket" else "BuildingStore", nil, var1)
	end,
	Window = function()
		-- upvalues: reactModule (ref), shopChromeWrapperModule (ref), var2 (ref), MAX_WINDOW_WIDTH (ref), MAX_WINDOW_HEIGHT (ref)
		return reactModule.createElement(shopChromeWrapperModule, {
			windowSize = var2,
			maxWindowWidth = MAX_WINDOW_WIDTH,
			maxWindowHeight = MAX_WINDOW_HEIGHT
		})
	end
}
local var7 = serviceModule:register(t)

if fFlagEnableShopPrefetch then
	local prefetchShopDataOnGameJoinModule = require(corePackagesService.Workspace.Packages.InExperienceShop.prefetchShopDataOnGameJoin)
	
	if fFlagHideShopMenuOnFailure then
		task.spawn(prefetchShopDataOnGameJoinModule, function(p1)
			-- upvalues: var6 (write), var5 (write), var7 (ref)
			if not p1 then return end
			var6 = true
			
			if var5 then
				var7.availability:available()
			end
		end)
	else
		task.spawn(prefetchShopDataOnGameJoinModule)
	end
end
if enableOpenShopSignalEngineFeature then
	marketplaceService.OpenShopRequested:Connect(function(p1)
		-- upvalues: playersService (ref), fFlagHideShopMenuOnFailure (ref), var6 (write), serviceModule (ref), constantsModule (ref), fFlagCenterInExperienceShopWindow (ref), shopWindowLayoutModule (ref)
		if p1 == playersService.LocalPlayer then
			if fFlagHideShopMenuOnFailure and not var6 then return end
			if not serviceModule:isWindowOpen(constantsModule.IN_EXPERIENCE_SHOP_ID) then
				if fFlagCenterInExperienceShopWindow then
					shopWindowLayoutModule.toggleInExperienceShopWindow()
					
					return
				end
				serviceModule:toggleWindow(constantsModule.IN_EXPERIENCE_SHOP_ID)
			end
		end
	end)
end
if shopCoreGuiToggleSupportedEngineFeature then
	local _ = function()
		-- upvalues: var5 (write), fFlagHideShopMenuOnFailure (ref), var6 (write), var7 (ref), serviceModule (ref), constantsModule (ref)
		if var5 and (not fFlagHideShopMenuOnFailure or var6) then
			var7.availability:available()
			
			return
		elseif serviceModule:isWindowOpen(constantsModule.IN_EXPERIENCE_SHOP_ID) then
			serviceModule:toggleWindow(constantsModule.IN_EXPERIENCE_SHOP_ID)
		end
		var7.availability:unavailable()
	end
	
	chromeUtilsModule.setCoreGuiAvailability(var7, Enum.CoreGuiType.ExperienceShop, function(p1)
		-- upvalues: var5 (write), fFlagHideShopMenuOnFailure (ref), var6 (write), var7 (ref), serviceModule (ref), constantsModule (ref)
		var5 = p1
		
		if var5 and (not fFlagHideShopMenuOnFailure or var6) then
			var7.availability:available()
			
			return
		elseif serviceModule:isWindowOpen(constantsModule.IN_EXPERIENCE_SHOP_ID) then
			serviceModule:toggleWindow(constantsModule.IN_EXPERIENCE_SHOP_ID)
		end
		var7.availability:unavailable()
	end)
end
return var7