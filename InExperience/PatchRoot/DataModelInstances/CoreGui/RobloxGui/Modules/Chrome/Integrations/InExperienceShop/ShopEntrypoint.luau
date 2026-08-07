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
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagChromeActivatedMappedSignal = sharedFlagsModule.FFlagChromeActivatedMappedSignal
local fFlagEnableMenuTrailingBadge = sharedFlagsModule.FFlagEnableMenuTrailingBadge
local fFlagExperienceShopNewIconography = inExperienceShopModule.FFlagExperienceShopNewIconography
local shopCoreGuiToggleSupportedEngineFeature = game:GetEngineFeature("ShopCoreGuiToggleSupported")
local enableOpenShopSignalEngineFeature = game:GetEngineFeature("EnableOpenShopSignal")
local var18 = mappedSignal.new(serviceModule:onIntegrationStatusChanged(), function() --[[ line: 32 ]]
	-- upvalues: serviceModule (ref), constantsModule (ref)
	return serviceModule:isWindowOpen(constantsModule.IN_EXPERIENCE_SHOP_ID)
end)
local MAX_WINDOW_WIDTH = shopWindowLayoutModule.MAX_WINDOW_WIDTH
local MAX_WINDOW_HEIGHT = shopWindowLayoutModule.MAX_WINDOW_HEIGHT
local var19 = windowSizeSignalModule.new(MAX_WINDOW_WIDTH, MAX_WINDOW_HEIGHT, false, true)
local inExperienceShopNewBadgeStorageKey = game:DefineFastString("InExperienceShopNewBadgeStorageKey", "InExperienceShopNewBadgeStorageKey")
local newBadgeDismissalMaxCountInExperienceShop = game:DefineFastInt("NewBadgeDismissalMaxCountInExperienceShop", 5)
local fFlagEnableMenuTrailingBadge_1 = game:DefineFastFlag("EnableNewBadgeInExperienceShop", false) and fFlagEnableMenuTrailingBadge
local var23 = if shopCoreGuiToggleSupportedEngineFeature then starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.All) or starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.ExperienceShop) else false
local var24 = true

local function _() --[[ line: 68 | named "getInitialAvailability" ]]
	-- upvalues: var23 (write), fFlagHideShopMenuOnFailure (ref), var24 (write), serviceModule (ref)
	if var23 and not fFlagHideShopMenuOnFailure then
		return serviceModule.AvailabilitySignal.Available
	end
	var24 = false
	
	return serviceModule.AvailabilitySignal.Unavailable
end

local _ = function() --[[ line: 76 | named "toggleShopWindow" ]]
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

if var23 and not fFlagHideShopMenuOnFailure then
	unavailable = serviceModule.AvailabilitySignal.Available
else
	var24 = false
	unavailable = serviceModule.AvailabilitySignal.Unavailable
end
t.initialAvailability = unavailable
t.id = constantsModule.IN_EXPERIENCE_SHOP_ID
t.sideSheetPlacement = sideSheetPlacement.Page
t.windowSize = var19
t.startingWindowPosition = shopWindowLayoutModule.getStartingWindowPosition()

function t.activated(_) --[[ line: 94 ]]
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
t.isActivated = if fFlagChromeActivatedMappedSignal then var18 else function() --[[ line: 105 ]]
	-- upvalues: var18 (ref)
	return var18:get()
end
t.components = {
	Icon = function() --[[ line: 109 ]]
		-- upvalues: commonIconModule (ref), fFlagExperienceShopNewIconography (ref), var18 (ref)
		return commonIconModule(if fFlagExperienceShopNewIconography then "ShoppingBasket" else "BuildingStore", nil, var18)
	end,
	Window = function() --[[ line: 116 ]]
		-- upvalues: reactModule (ref), shopChromeWrapperModule (ref), var19 (ref), MAX_WINDOW_WIDTH (ref), MAX_WINDOW_HEIGHT (ref)
		return reactModule.createElement(shopChromeWrapperModule, {
			windowSize = var19,
			maxWindowWidth = MAX_WINDOW_WIDTH,
			maxWindowHeight = MAX_WINDOW_HEIGHT
		})
	end
}
local var26 = serviceModule:register(t)

if fFlagEnableShopPrefetch then
	local prefetchShopDataOnGameJoinModule = require(corePackagesService.Workspace.Packages.InExperienceShop.prefetchShopDataOnGameJoin)
	
	if fFlagHideShopMenuOnFailure then
		task.spawn(prefetchShopDataOnGameJoinModule, function(p0) --[[ line: 134 ]]
			-- upvalues: var24 (write), var23 (write), var26 (ref)
			if not p0 then return end
			var24 = true
			
			if var23 then
				var26.availability:available()
			end
		end)
	else
		task.spawn(prefetchShopDataOnGameJoinModule)
	end
end
if enableOpenShopSignalEngineFeature then
	marketplaceService.OpenShopRequested:Connect(function(p1) --[[ line: 158 ]]
		-- upvalues: playersService (ref), fFlagHideShopMenuOnFailure (ref), var24 (write), serviceModule (ref), constantsModule (ref), fFlagCenterInExperienceShopWindow (ref), shopWindowLayoutModule (ref)
		if p1 == playersService.LocalPlayer then
			if fFlagHideShopMenuOnFailure and not var24 then return end
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
	local _ = function() --[[ line: 176 | named "updateShopAvailability" ]]
		-- upvalues: var23 (write), fFlagHideShopMenuOnFailure (ref), var24 (write), var26 (ref), serviceModule (ref), constantsModule (ref)
		if var23 and (not fFlagHideShopMenuOnFailure or var24) then
			var26.availability:available()
			
			return
		elseif serviceModule:isWindowOpen(constantsModule.IN_EXPERIENCE_SHOP_ID) then
			serviceModule:toggleWindow(constantsModule.IN_EXPERIENCE_SHOP_ID)
		end
		var26.availability:unavailable()
	end
	
	chromeUtilsModule.setCoreGuiAvailability(var26, Enum.CoreGuiType.ExperienceShop, function(p2) --[[ line: 188 ]]
		-- upvalues: var23 (write), fFlagHideShopMenuOnFailure (ref), var24 (write), var26 (ref), serviceModule (ref), constantsModule (ref)
		var23 = p2
		
		if var23 and (not fFlagHideShopMenuOnFailure or var24) then
			var26.availability:available()
			
			return
		elseif serviceModule:isWindowOpen(constantsModule.IN_EXPERIENCE_SHOP_ID) then
			serviceModule:toggleWindow(constantsModule.IN_EXPERIENCE_SHOP_ID)
		end
		var26.availability:unavailable()
	end)
end
return var26