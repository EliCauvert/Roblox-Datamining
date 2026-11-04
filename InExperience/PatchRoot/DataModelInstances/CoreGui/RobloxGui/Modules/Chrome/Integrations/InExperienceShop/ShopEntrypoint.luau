local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local ReactModule = require(CorePackages.Packages.React)
local SignalsModule = require(CorePackages.Packages.Signals)
local ServiceModule = require(Chrome.Service)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local InitializeShopMenuControllerModule: (any, any) -> () = require(Chrome.Integrations.InExperienceShop.initializeShopMenuController)
local ShopChromeWrapperModule = require(Chrome.Integrations.InExperienceShop.ShopChromeWrapper)
local ShopWindowLayoutModule = require(Chrome.Integrations.InExperienceShop.ShopWindowLayout)
local ChromeUtilsModule = require(Chrome.ChromeShared.Service.ChromeUtils)
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local InExperienceShopModule = require(CorePackages.Workspace.Packages.InExperienceShop)
local FFlagEnableFreeTrialBlueDot = InExperienceShopModule.FFlagEnableFreeTrialBlueDot
local FFlagEnableShopPrefetch = InExperienceShopModule.FFlagEnableShopPrefetch
local FFlagHideShopMenuOnFailure = InExperienceShopModule.FFlagHideShopMenuOnFailure
local FFlagCenterInExperienceShopWindow = InExperienceShopModule.FFlagCenterInExperienceShopWindow
local FFlagFixInExperienceShopCursorLock = InExperienceShopModule.FFlagFixInExperienceShopCursorLock
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableMenuTrailingBadge = SharedFlagsModule.FFlagEnableMenuTrailingBadge
local FFlagExperienceShopNewIconography = InExperienceShopModule.FFlagExperienceShopNewIconography
local FFlagEnableAnyFreeTrialToolTipModule = require(CorePackages.Workspace.Packages.InExperienceShop.FFlagEnableAnyFreeTrialToolTip)
local FFlagEnableFreeTrialShopMenuBadge = InExperienceShopModule.FFlagEnableFreeTrialShopMenuBadge
local FFlagMenuBadgePreferFreeTrialOverOffer = InExperienceShopModule.FFlagMenuBadgePreferFreeTrialOverOffer
local ShopCoreGuiToggleSupportedEngineFeature = game:GetEngineFeature("ShopCoreGuiToggleSupported")
local EnableOpenShopSignalEngineFeature = game:GetEngineFeature("EnableOpenShopSignal")
local NewResult = ChromeUtilsModule.MappedSignal.new(ServiceModule:onIntegrationStatusChanged(), function()
	-- upvalues: ServiceModule (copy), ConstantsModule (copy)
	return ServiceModule:isWindowOpen(ConstantsModule.IN_EXPERIENCE_SHOP_ID)
end)
local MAXWINDOWWIDTH = ShopWindowLayoutModule.MAX_WINDOW_WIDTH
local MAXWINDOWHEIGHT = ShopWindowLayoutModule.MAX_WINDOW_HEIGHT
local NewResult1 = require(Chrome.ChromeShared.Service.WindowSizeSignal).new(MAXWINDOWWIDTH, MAXWINDOWHEIGHT, false, true)
local InExperienceShopNewBadgeStorageKey = game:DefineFastString("InExperienceShopNewBadgeStorageKey", "InExperienceShopNewBadgeStorageKey")
local NewBadgeDismissalMaxCountInExperienceShop = game:DefineFastInt("NewBadgeDismissalMaxCountInExperienceShop", 5)
local FFlagEnableMenuTrailingBadge1 = game:DefineFastFlag("EnableNewBadgeInExperienceShop", false) and FFlagEnableMenuTrailingBadge
local CustomText = nil
local OfferBadgeTextSignal = nil
local DismissFunction = nil

if SharedFlagsModule.FFlagShowOfferBadge then
	local InExperienceOffersModule = require(CorePackages.Workspace.Packages.InExperienceOffers)
	OfferBadgeTextSignal = InExperienceOffersModule.Utils.createOfferBadgeTextSignal(InExperienceOffersModule.FeatureKeys.RobloxShop)
	CustomText = OfferBadgeTextSignal
end
if FFlagEnableFreeTrialShopMenuBadge then
	local SubmitFreeTrialMenuBadgeModule = require(CorePackages.Workspace.Packages.InExperienceShop.submitFreeTrialMenuBadge)
	local Callback = SubmitFreeTrialMenuBadgeModule()
	local Callback1 = OfferBadgeTextSignal
	CustomText = if FFlagMenuBadgePreferFreeTrialOverOffer and Callback1 ~= nil then function(p1)
		-- upvalues: Callback (copy), Callback1 (copy)
		local CallbackResult = Callback(p1)
		
		return if CallbackResult == nil then Callback1(p1) else CallbackResult
	end elseif Callback1 == nil then Callback else function(p1)
		-- upvalues: Callback1 (copy), Callback (copy)
		local CallbackResult = Callback1(p1)
		
		return if CallbackResult == nil then Callback(p1) else CallbackResult
	end
	DismissFunction = SubmitFreeTrialMenuBadgeModule.dismiss
	local Flag = false
	
	local function reportTrialBadgeSeen()
		-- upvalues: Flag (ref), Callback (copy), FFlagMenuBadgePreferFreeTrialOverOffer (copy), Callback1 (copy), ServiceModule (copy), ConstantsModule (copy), SubmitFreeTrialMenuBadgeModule (copy)
		if Flag or Callback(false) == nil then return end
		if not FFlagMenuBadgePreferFreeTrialOverOffer and Callback1 ~= nil and Callback1(false) ~= nil then return end
		if ServiceModule:withinCurrentSubmenu(ConstantsModule.IN_EXPERIENCE_SHOP_ID) then
			Flag = true
			SubmitFreeTrialMenuBadgeModule.reportMounted()
			SubmitFreeTrialMenuBadgeModule.reportViewed()
			
			return
		end
	end
	
	ServiceModule:currentSubMenu():connect(function()
		-- upvalues: ServiceModule (copy), ConstantsModule (copy), Flag (ref), reportTrialBadgeSeen (copy)
		if ServiceModule:withinCurrentSubmenu(ConstantsModule.IN_EXPERIENCE_SHOP_ID) then
			reportTrialBadgeSeen()
			
			return
		else
			Flag = false
		end
	end)
	local _ = SignalsModule.createEffect(function(p1)
		-- upvalues: Callback (copy), FFlagMenuBadgePreferFreeTrialOverOffer (copy), Callback1 (copy), reportTrialBadgeSeen (copy)
		Callback(p1)
		
		if not FFlagMenuBadgePreferFreeTrialOverOffer and Callback1 ~= nil then
			Callback1(p1)
		end
		reportTrialBadgeSeen()
	end)
end
local Config = if FFlagEnableMenuTrailingBadge1 or CustomText ~= nil then {
	localStorageKey = InExperienceShopNewBadgeStorageKey,
	maxViewCount = if FFlagEnableMenuTrailingBadge1 then NewBadgeDismissalMaxCountInExperienceShop else 0,
	customText = CustomText
} else nil
local CoreGuiEnabled = if ShopCoreGuiToggleSupportedEngineFeature then StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.All) or StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.ExperienceShop) else false
local Flag1 = true

local function _()
	-- upvalues: CoreGuiEnabled (ref), FFlagHideShopMenuOnFailure (copy), Flag1 (ref), ServiceModule (copy)
	if CoreGuiEnabled and not FFlagHideShopMenuOnFailure then
		return ServiceModule.AvailabilitySignal.Available
	else
		Flag1 = false
		
		return ServiceModule.AvailabilitySignal.Unavailable
	end
end

local _ = function()
	-- upvalues: FFlagCenterInExperienceShopWindow (copy), ShopWindowLayoutModule (copy), ServiceModule (copy), ConstantsModule (copy)
	if FFlagCenterInExperienceShopWindow then
		ShopWindowLayoutModule.toggleInExperienceShopWindow()
		
		return
	else
		ServiceModule:toggleWindow(ConstantsModule.IN_EXPERIENCE_SHOP_ID)
	end
end

local _ = function()
	-- upvalues: DismissFunction (ref), ServiceModule (copy), ConstantsModule (copy)
	if DismissFunction ~= nil and not ServiceModule:isWindowOpen(ConstantsModule.IN_EXPERIENCE_SHOP_ID) then
		DismissFunction()
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
	Flag1 = false
	Unavailable = ServiceModule.AvailabilitySignal.Unavailable
end
config.initialAvailability = Unavailable
config.id = ConstantsModule.IN_EXPERIENCE_SHOP_ID
config.sideSheetPlacement = SideSheetPlacement.AboveFold
config.windowSize = NewResult1
config.startingWindowPosition = ShopWindowLayoutModule.getStartingWindowPosition()

function config:activated()
	-- upvalues: DismissFunction (ref), ServiceModule (copy), ConstantsModule (copy), FFlagCenterInExperienceShopWindow (copy), ShopWindowLayoutModule (copy)
	if DismissFunction ~= nil and not ServiceModule:isWindowOpen(ConstantsModule.IN_EXPERIENCE_SHOP_ID) then
		DismissFunction()
	end
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
	Icon = function()
		-- upvalues: CommonIconModule (copy), FFlagExperienceShopNewIconography (copy), NewResult (copy)
		return CommonIconModule(if FFlagExperienceShopNewIconography then "ShoppingBasket" else "BuildingStore", nil, NewResult)
	end,
	Window = function()
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
		task.spawn(PrefetchShopDataOnGameJoinModule, function(p1)
			-- upvalues: Flag1 (ref), CoreGuiEnabled (ref), RegisterResult (copy)
			if not p1 then return end
			Flag1 = true
			
			if CoreGuiEnabled then
				RegisterResult.availability:available()
			end
		end)
	else
		task.spawn(PrefetchShopDataOnGameJoinModule)
	end
end
if FFlagEnableAnyFreeTrialToolTipModule then
	require(CorePackages.Workspace.Packages.InExperienceShop.submitFreeTrialTooltips)()
end
if FFlagEnableFreeTrialBlueDot then
	require(CorePackages.Workspace.Packages.InExperienceShop.submitFreeTrialBlueDot)()
end
if EnableOpenShopSignalEngineFeature then
	MarketplaceService.OpenShopRequested:Connect(function(Player)
		-- upvalues: Players (copy), FFlagHideShopMenuOnFailure (copy), Flag1 (ref), ServiceModule (copy), ConstantsModule (copy), DismissFunction (ref), FFlagCenterInExperienceShopWindow (copy), ShopWindowLayoutModule (copy)
		if Player == Players.LocalPlayer then
			if FFlagHideShopMenuOnFailure and not Flag1 then return end
			if not ServiceModule:isWindowOpen(ConstantsModule.IN_EXPERIENCE_SHOP_ID) then
				if DismissFunction ~= nil and not ServiceModule:isWindowOpen(ConstantsModule.IN_EXPERIENCE_SHOP_ID) then
					DismissFunction()
				end
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
	local _ = function()
		-- upvalues: CoreGuiEnabled (ref), FFlagHideShopMenuOnFailure (copy), Flag1 (ref), RegisterResult (copy), ServiceModule (copy), ConstantsModule (copy)
		if CoreGuiEnabled and (not FFlagHideShopMenuOnFailure or Flag1) then
			RegisterResult.availability:available()
			
			return
		end
		if ServiceModule:isWindowOpen(ConstantsModule.IN_EXPERIENCE_SHOP_ID) then
			ServiceModule:toggleWindow(ConstantsModule.IN_EXPERIENCE_SHOP_ID)
		end
		RegisterResult.availability:unavailable()
	end
	
	ChromeUtilsModule.setCoreGuiAvailability(RegisterResult, Enum.CoreGuiType.ExperienceShop, function(p1)
		-- upvalues: CoreGuiEnabled (ref), FFlagHideShopMenuOnFailure (copy), Flag1 (ref), RegisterResult (copy), ServiceModule (copy), ConstantsModule (copy)
		CoreGuiEnabled = p1
		
		if CoreGuiEnabled and (not FFlagHideShopMenuOnFailure or Flag1) then
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