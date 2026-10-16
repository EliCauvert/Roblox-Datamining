local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local ReactModule = require(CorePackages.Packages.React)
local ServiceModule = require(Chrome.Service)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local InitializeShopMenuControllerModule: (any, any) -> () = require(Chrome.Integrations.InExperienceShop.initializeShopMenuController)
local ShopChromeWrapperModule = require(Chrome.Integrations.InExperienceShop.ShopChromeWrapper)
local ShopWindowLayoutModule = require(Chrome.Integrations.InExperienceShop.ShopWindowLayout)
local ChromeUtilsModule = require(Chrome.ChromeShared.Service.ChromeUtils)
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local InExperienceShopModule = require(CorePackages.Workspace.Packages.InExperienceShop)
local FFlagEnableShopPrefetch = InExperienceShopModule.FFlagEnableShopPrefetch
local FFlagHideShopMenuOnFailure = InExperienceShopModule.FFlagHideShopMenuOnFailure
local FFlagCenterInExperienceShopWindow = InExperienceShopModule.FFlagCenterInExperienceShopWindow
local FFlagFixInExperienceShopCursorLock = InExperienceShopModule.FFlagFixInExperienceShopCursorLock
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableMenuTrailingBadge = SharedFlagsModule.FFlagEnableMenuTrailingBadge
local FFlagExperienceShopNewIconography = InExperienceShopModule.FFlagExperienceShopNewIconography
local ShopCoreGuiToggleSupportedEngineFeature = game:GetEngineFeature("ShopCoreGuiToggleSupported")
local EnableOpenShopSignalEngineFeature = game:GetEngineFeature("EnableOpenShopSignal")
local NewResult = ChromeUtilsModule.MappedSignal.new(ServiceModule:onIntegrationStatusChanged(), function() --[[ Line: 35 ]]
	-- upvalues: ServiceModule (copy), ConstantsModule (copy)
	return ServiceModule:isWindowOpen(ConstantsModule.IN_EXPERIENCE_SHOP_ID)
end)
local MAXWINDOWWIDTH = ShopWindowLayoutModule.MAX_WINDOW_WIDTH
local MAXWINDOWHEIGHT = ShopWindowLayoutModule.MAX_WINDOW_HEIGHT
local NewResult1 = require(Chrome.ChromeShared.Service.WindowSizeSignal).new(MAXWINDOWWIDTH, MAXWINDOWHEIGHT, false, true)
local InExperienceShopNewBadgeStorageKey = game:DefineFastString("InExperienceShopNewBadgeStorageKey", "InExperienceShopNewBadgeStorageKey")
local NewBadgeDismissalMaxCountInExperienceShop = game:DefineFastInt("NewBadgeDismissalMaxCountInExperienceShop", 5)
local FFlagEnableMenuTrailingBadge1 = game:DefineFastFlag("EnableNewBadgeInExperienceShop", false) and FFlagEnableMenuTrailingBadge
local OfferBadgeTextSignal = nil

if SharedFlagsModule.FFlagShowOfferBadge then
	local InExperienceOffersModule = require(CorePackages.Workspace.Packages.InExperienceOffers)
	OfferBadgeTextSignal = InExperienceOffersModule.Utils.createOfferBadgeTextSignal(InExperienceOffersModule.FeatureKeys.RobloxShop)
end
local Config = if FFlagEnableMenuTrailingBadge1 or OfferBadgeTextSignal ~= nil then {
	localStorageKey = InExperienceShopNewBadgeStorageKey,
	maxViewCount = if FFlagEnableMenuTrailingBadge1 then NewBadgeDismissalMaxCountInExperienceShop else 0,
	customText = OfferBadgeTextSignal
} else nil
local CoreGuiEnabled = if ShopCoreGuiToggleSupportedEngineFeature then StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.All) or StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.ExperienceShop) else false
local Flag = true

local function _() --[[ Line: 85 | Named "getInitialAvailability" ]]
	-- upvalues: CoreGuiEnabled (ref), FFlagHideShopMenuOnFailure (copy), Flag (ref), ServiceModule (copy)
	if CoreGuiEnabled and not FFlagHideShopMenuOnFailure then
		return ServiceModule.AvailabilitySignal.Available
	else
		Flag = false
		
		return ServiceModule.AvailabilitySignal.Unavailable
	end
end

local _ = function() --[[ Line: 93 | Named "toggleShopWindow" ]]
	-- upvalues: FFlagCenterInExperienceShopWindow (copy), ShopWindowLayoutModule (copy), ServiceModule (copy), ConstantsModule (copy)
	if FFlagCenterInExperienceShopWindow then
		ShopWindowLayoutModule.toggleInExperienceShopWindow()
		
		return
	else
		ServiceModule:toggleWindow(ConstantsModule.IN_EXPERIENCE_SHOP_ID)
	end
end

local config = {
	label = "Feature.Avatar.Action.Shop",
	cachePosition = true,
	draggable = true
}
local Unavailable = nil

if CoreGuiEnabled and not FFlagHideShopMenuOnFailure then
	Unavailable = ServiceModule.AvailabilitySignal.Available
else
	Flag = false
	Unavailable = ServiceModule.AvailabilitySignal.Unavailable
end
config.initialAvailability = Unavailable
config.id = ConstantsModule.IN_EXPERIENCE_SHOP_ID
config.sideSheetPlacement = SideSheetPlacement.AboveFold
config.windowSize = NewResult1
config.startingWindowPosition = ShopWindowLayoutModule.getStartingWindowPosition()

function config:activated() --[[ Line: 111 ]]
	-- upvalues: FFlagCenterInExperienceShopWindow (copy), ShopWindowLayoutModule (copy), ServiceModule (copy), ConstantsModule (copy)
	if FFlagCenterInExperienceShopWindow then
		ShopWindowLayoutModule.toggleInExperienceShopWindow()
		
		return
	else
		ServiceModule:toggleWindow(ConstantsModule.IN_EXPERIENCE_SHOP_ID)
	end
end

config.menuTrailingBadgeConfig = Config
config.isActivated = NewResult
config.components = {
	Icon = function() --[[ Line: 117 ]]
		-- upvalues: CommonIconModule (copy), FFlagExperienceShopNewIconography (copy), NewResult (copy)
		return CommonIconModule(if FFlagExperienceShopNewIconography then "ShoppingBasket" else "BuildingStore", nil, NewResult)
	end,
	Window = function() --[[ Line: 124 ]]
		-- upvalues: ReactModule (copy), ShopChromeWrapperModule (copy), NewResult1 (copy), MAXWINDOWWIDTH (copy), MAXWINDOWHEIGHT (copy)
		return ReactModule.createElement(ShopChromeWrapperModule, {
			windowSize = NewResult1,
			maxWindowWidth = MAXWINDOWWIDTH,
			maxWindowHeight = MAXWINDOWHEIGHT
		})
	end
}
local RegisterResult = ServiceModule:register(config)

if FFlagFixInExperienceShopCursorLock then
	InitializeShopMenuControllerModule(GuiService, NewResult)
end
if FFlagEnableShopPrefetch then
	local PrefetchShopDataOnGameJoinModule = require(CorePackages.Workspace.Packages.InExperienceShop.prefetchShopDataOnGameJoin)
	
	if FFlagHideShopMenuOnFailure then
		task.spawn(PrefetchShopDataOnGameJoinModule, function(p1) --[[ Line: 146 ]]
			-- upvalues: Flag (ref), CoreGuiEnabled (ref), RegisterResult (copy)
			if not p1 then return end
			Flag = true
			
			if CoreGuiEnabled then
				RegisterResult.availability:available()
			end
		end)
	else
		task.spawn(PrefetchShopDataOnGameJoinModule)
	end
end
if EnableOpenShopSignalEngineFeature then
	MarketplaceService.OpenShopRequested:Connect(function(Player) --[[ Line: 170 ]]
		-- upvalues: Players (copy), FFlagHideShopMenuOnFailure (copy), Flag (ref), ServiceModule (copy), ConstantsModule (copy), FFlagCenterInExperienceShopWindow (copy), ShopWindowLayoutModule (copy)
		if Player == Players.LocalPlayer then
			if FFlagHideShopMenuOnFailure and not Flag then return end
			if not ServiceModule:isWindowOpen(ConstantsModule.IN_EXPERIENCE_SHOP_ID) then
				if FFlagCenterInExperienceShopWindow then
					ShopWindowLayoutModule.toggleInExperienceShopWindow()
					
					return
				end
				ServiceModule:toggleWindow(ConstantsModule.IN_EXPERIENCE_SHOP_ID)
			end
		end
	end)
end
if ShopCoreGuiToggleSupportedEngineFeature then
	local _ = function() --[[ Line: 188 | Named "updateShopAvailability" ]]
		-- upvalues: CoreGuiEnabled (ref), FFlagHideShopMenuOnFailure (copy), Flag (ref), RegisterResult (copy), ServiceModule (copy), ConstantsModule (copy)
		if CoreGuiEnabled and (not FFlagHideShopMenuOnFailure or Flag) then
			RegisterResult.availability:available()
			
			return
		end
		if ServiceModule:isWindowOpen(ConstantsModule.IN_EXPERIENCE_SHOP_ID) then
			ServiceModule:toggleWindow(ConstantsModule.IN_EXPERIENCE_SHOP_ID)
		end
		RegisterResult.availability:unavailable()
	end
	
	ChromeUtilsModule.setCoreGuiAvailability(RegisterResult, Enum.CoreGuiType.ExperienceShop, function(p1) --[[ Line: 200 ]]
		-- upvalues: CoreGuiEnabled (ref), FFlagHideShopMenuOnFailure (copy), Flag (ref), RegisterResult (copy), ServiceModule (copy), ConstantsModule (copy)
		CoreGuiEnabled = p1
		
		if CoreGuiEnabled and (not FFlagHideShopMenuOnFailure or Flag) then
			RegisterResult.availability:available()
			
			return
		end
		if ServiceModule:isWindowOpen(ConstantsModule.IN_EXPERIENCE_SHOP_ID) then
			ServiceModule:toggleWindow(ConstantsModule.IN_EXPERIENCE_SHOP_ID)
		end
		RegisterResult.availability:unavailable()
	end)
end
return RegisterResult