local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local ReactModule = require(CorePackages.Packages.React)
local ServiceModule = require(Chrome.Service)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local ShopChromeWrapperModule = require(Chrome.Integrations.InExperienceShop.ShopChromeWrapper)
local ShopWindowLayoutModule = require(Chrome.Integrations.InExperienceShop.ShopWindowLayout)
local ChromeUtilsModule = require(Chrome.ChromeShared.Service.ChromeUtils)
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local InExperienceShopModule = require(CorePackages.Workspace.Packages.InExperienceShop)
local FFlagEnableShopPrefetch = InExperienceShopModule.FFlagEnableShopPrefetch
local FFlagHideShopMenuOnFailure = InExperienceShopModule.FFlagHideShopMenuOnFailure
local FFlagCenterInExperienceShopWindow = InExperienceShopModule.FFlagCenterInExperienceShopWindow
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagChromeActivatedMappedSignal = SharedFlagsModule.FFlagChromeActivatedMappedSignal
local FFlagEnableMenuTrailingBadge = SharedFlagsModule.FFlagEnableMenuTrailingBadge
local FFlagExperienceShopNewIconography = InExperienceShopModule.FFlagExperienceShopNewIconography
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
local CoreGuiEnabled = if ShopCoreGuiToggleSupportedEngineFeature then StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.All) or StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.ExperienceShop) else false
local Flag = true

local function _()
	-- upvalues: CoreGuiEnabled (ref), FFlagHideShopMenuOnFailure (copy), Flag (ref), ServiceModule (copy)
	if CoreGuiEnabled and not FFlagHideShopMenuOnFailure then
		return ServiceModule.AvailabilitySignal.Available
	else
		Flag = false
		
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
config.sideSheetPlacement = SideSheetPlacement.Page
config.windowSize = NewResult1
config.startingWindowPosition = ShopWindowLayoutModule.getStartingWindowPosition()

function config:activated()
	-- upvalues: FFlagCenterInExperienceShopWindow (copy), ShopWindowLayoutModule (copy), ServiceModule (copy), ConstantsModule (copy)
	if FFlagCenterInExperienceShopWindow then
		ShopWindowLayoutModule.toggleInExperienceShopWindow()
		
		return
	else
		ServiceModule:toggleWindow(ConstantsModule.IN_EXPERIENCE_SHOP_ID)
	end
end

config.menuTrailingBadgeConfig = if FFlagEnableMenuTrailingBadge1 then {
	localStorageKey = InExperienceShopNewBadgeStorageKey,
	maxViewCount = NewBadgeDismissalMaxCountInExperienceShop
} else nil
config.isActivated = if FFlagChromeActivatedMappedSignal then NewResult else function()
	-- upvalues: NewResult (copy)
	return NewResult:get()
end
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

if FFlagEnableShopPrefetch then
	local PrefetchShopDataOnGameJoinModule = require(CorePackages.Workspace.Packages.InExperienceShop.prefetchShopDataOnGameJoin)
	
	if FFlagHideShopMenuOnFailure then
		task.spawn(PrefetchShopDataOnGameJoinModule, function(p1)
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
	MarketplaceService.OpenShopRequested:Connect(function(Player)
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
	local _ = function()
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
	
	ChromeUtilsModule.setCoreGuiAvailability(RegisterResult, Enum.CoreGuiType.ExperienceShop, function(p1)
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