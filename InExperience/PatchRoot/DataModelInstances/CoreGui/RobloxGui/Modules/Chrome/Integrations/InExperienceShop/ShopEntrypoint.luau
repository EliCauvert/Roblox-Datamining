local unavailable
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
local fFlagEnableMenuTrailingBadge = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableMenuTrailingBadge
local fFlagExperienceShopNewIconography = inExperienceShopModule.FFlagExperienceShopNewIconography
local shopCoreGuiToggleSupportedEngineFeature = game:GetEngineFeature("ShopCoreGuiToggleSupported")
local enableOpenShopSignalEngineFeature = game:GetEngineFeature("EnableOpenShopSignal")
local var17 = mappedSignal.new(serviceModule:onIntegrationStatusChanged(), function() --[[ line: 31 ]]
	-- upvalues: serviceModule (ref), constantsModule (ref)
	return serviceModule:isWindowOpen(constantsModule.IN_EXPERIENCE_SHOP_ID)
end)
local MAX_WINDOW_WIDTH = shopWindowLayoutModule.MAX_WINDOW_WIDTH
local MAX_WINDOW_HEIGHT = shopWindowLayoutModule.MAX_WINDOW_HEIGHT
local var18 = windowSizeSignalModule.new(MAX_WINDOW_WIDTH, MAX_WINDOW_HEIGHT, false, true)
local inExperienceShopNewBadgeStorageKey = game:DefineFastString("InExperienceShopNewBadgeStorageKey", "InExperienceShopNewBadgeStorageKey")
local newBadgeDismissalMaxCountInExperienceShop = game:DefineFastInt("NewBadgeDismissalMaxCountInExperienceShop", 5)
local fFlagEnableMenuTrailingBadge_1 = game:DefineFastFlag("EnableNewBadgeInExperienceShop", false) and fFlagEnableMenuTrailingBadge
local var22 = if shopCoreGuiToggleSupportedEngineFeature then starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.All) or starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.ExperienceShop) else false
local var23 = true

local function _() --[[ line: 67 | named "getInitialAvailability" ]]
	-- upvalues: var22 (write), fFlagHideShopMenuOnFailure (ref), var23 (write), serviceModule (ref)
	if var22 and not fFlagHideShopMenuOnFailure then
		return serviceModule.AvailabilitySignal.Available
	end
	var23 = false
	
	return serviceModule.AvailabilitySignal.Unavailable
end

local _ = function() --[[ line: 75 | named "toggleShopWindow" ]]
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

if var22 and not fFlagHideShopMenuOnFailure then
	unavailable = serviceModule.AvailabilitySignal.Available
else
	var23 = false
	unavailable = serviceModule.AvailabilitySignal.Unavailable
end
t.initialAvailability = unavailable
t.id = constantsModule.IN_EXPERIENCE_SHOP_ID
t.sideSheetPlacement = sideSheetPlacement.Page
t.windowSize = var18
t.startingWindowPosition = shopWindowLayoutModule.getStartingWindowPosition()

function t.activated(_) --[[ line: 93 ]]
	-- upvalues: fFlagCenterInExperienceShopWindow (ref), shopWindowLayoutModule (ref), serviceModule (ref), constantsModule (ref)
	if fFlagCenterInExperienceShopWindow then
		shopWindowLayoutModule.toggleInExperienceShopWindow()
		
		return
	end
	serviceModule:toggleWindow(constantsModule.IN_EXPERIENCE_SHOP_ID)
end

t.menuTrailingBadgeConfig = if fFlagEnableMenuTrailingBadge_1 then {
	localStorageKey = inExperienceShopNewBadgeStorageKey,
	maxViewCount = newBadgeDismissalMaxCountInExperienceShop
} else nil
t.isActivated = var17
t.components = {
	Icon = function() --[[ line: 104 ]]
		-- upvalues: commonIconModule (ref), fFlagExperienceShopNewIconography (ref), var17 (ref)
		return commonIconModule(if fFlagExperienceShopNewIconography then "ShoppingBasket" else "BuildingStore", nil, var17)
	end,
	Window = function() --[[ line: 111 ]]
		-- upvalues: reactModule (ref), shopChromeWrapperModule (ref), var18 (ref), MAX_WINDOW_WIDTH (ref), MAX_WINDOW_HEIGHT (ref)
		return reactModule.createElement(shopChromeWrapperModule, {
			windowSize = var18,
			maxWindowWidth = MAX_WINDOW_WIDTH,
			maxWindowHeight = MAX_WINDOW_HEIGHT
		})
	end
}
local var25 = serviceModule:register(t)

if fFlagEnableShopPrefetch then
	local prefetchShopDataOnGameJoinModule = require(corePackagesService.Workspace.Packages.InExperienceShop.prefetchShopDataOnGameJoin)
	
	if fFlagHideShopMenuOnFailure then
		task.spawn(prefetchShopDataOnGameJoinModule, function(p0) --[[ line: 129 ]]
			-- upvalues: var23 (write), var22 (write), var25 (ref)
			if not p0 then return end
			var23 = true
			
			if var22 then
				var25.availability:available()
			end
		end)
	else
		task.spawn(prefetchShopDataOnGameJoinModule)
	end
end
if enableOpenShopSignalEngineFeature then
	marketplaceService.OpenShopRequested:Connect(function(p1) --[[ line: 153 ]]
		-- upvalues: playersService (ref), fFlagHideShopMenuOnFailure (ref), var23 (write), serviceModule (ref), constantsModule (ref), fFlagCenterInExperienceShopWindow (ref), shopWindowLayoutModule (ref)
		if p1 == playersService.LocalPlayer then
			if fFlagHideShopMenuOnFailure and not var23 then return end
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
	local _ = function() --[[ line: 171 | named "updateShopAvailability" ]]
		-- upvalues: var22 (write), fFlagHideShopMenuOnFailure (ref), var23 (write), var25 (ref), serviceModule (ref), constantsModule (ref)
		if var22 and (not fFlagHideShopMenuOnFailure or var23) then
			var25.availability:available()
			
			return
		elseif serviceModule:isWindowOpen(constantsModule.IN_EXPERIENCE_SHOP_ID) then
			serviceModule:toggleWindow(constantsModule.IN_EXPERIENCE_SHOP_ID)
		end
		var25.availability:unavailable()
	end
	
	chromeUtilsModule.setCoreGuiAvailability(var25, Enum.CoreGuiType.ExperienceShop, function(p2) --[[ line: 183 ]]
		-- upvalues: var22 (write), fFlagHideShopMenuOnFailure (ref), var23 (write), var25 (ref), serviceModule (ref), constantsModule (ref)
		var22 = p2
		
		if var22 and (not fFlagHideShopMenuOnFailure or var23) then
			var25.availability:available()
			
			return
		elseif serviceModule:isWindowOpen(constantsModule.IN_EXPERIENCE_SHOP_ID) then
			serviceModule:toggleWindow(constantsModule.IN_EXPERIENCE_SHOP_ID)
		end
		var25.availability:unavailable()
	end)
end
return var25