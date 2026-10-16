local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local InExperienceOffersModule = require(CorePackages.Workspace.Packages.InExperienceOffers)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local UseMappedSignalFunction = require(CorePackages.Workspace.Packages.Chrome).Hooks.useMappedSignal
local FFlagOfferNotifyOnGlobalIcon = SharedFlagsModule.FFlagOfferNotifyOnGlobalIcon
local FFlagHideOfferNotificationsWhenShopEmpty = SharedFlagsModule.FFlagHideOfferNotificationsWhenShopEmpty
local InExperienceShopModule = nil
local ToggleInExperienceShopWindowFunction = nil

if FFlagOfferNotifyOnGlobalIcon then
	InExperienceShopModule = require(CorePackages.Workspace.Packages.InExperienceShop)
	ToggleInExperienceShopWindowFunction = require(Chrome.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow
end
local ServiceModule = require(Chrome.Service)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local TooltipContextModule = require(Chrome.ChromeShared.Unibar.Tooltips.TooltipContext)
local UseIsTooltipTurnModule = require(Chrome.ChromeShared.Unibar.Tooltips.useIsTooltipTurn)
local EducationalTooltip = FoundationModule.EducationalTooltip
local OverlayProvider = FoundationModule.OverlayProvider
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local FeatureKeys = InExperienceOffersModule.FeatureKeys
local GetOffersStoreFunction = InExperienceOffersModule.getOffersStore
local IsNotificationEligibleFunction = InExperienceOffersModule.Utils.isNotificationEligible
local SelectActiveOfferFunction = InExperienceOffersModule.Utils.selectActiveOffer
local UseOffersForKeyFunction = InExperienceOffersModule.Hooks.useOffersForKey
local UseShopHasItemsFunction = InExperienceOffersModule.Hooks.useShopHasItems
local UseSignalStateFunction = SignalsReactModule.useSignalState
local MenuOfferTooltipPriority = game:DefineFastInt("MenuOfferTooltipPriority", 1500)
local MenuOfferTooltipShowDelayMs = game:DefineFastInt("MenuOfferTooltipShowDelayMs", 1500)
local MenuOfferTooltipDismissDelayMs = game:DefineFastInt("MenuOfferTooltipDismissDelayMs", 7000)

local function MenuOfferTooltipContent(p1) --[[ Line: 60 ]]
	-- upvalues: UseOffersForKeyFunction (copy), FeatureKeys (copy), UseSignalStateFunction (copy), GetOffersStoreFunction (copy), ReactModule (copy), IsNotificationEligibleFunction (copy), SelectActiveOfferFunction (copy), ConstantsModule (copy), ServiceModule (copy), ToggleInExperienceShopWindowFunction (ref), TooltipContextModule (copy), UseIsTooltipTurnModule (copy), UseMappedSignalFunction (copy), FFlagOfferNotifyOnGlobalIcon (copy), FFlagHideOfferNotificationsWhenShopEmpty (copy), UseShopHasItemsFunction (copy), MenuOfferTooltipPriority (copy), MenuOfferTooltipShowDelayMs (copy), MenuOfferTooltipDismissDelayMs (copy), GuiService (copy), ButtonVariant (copy), OverlayProvider (copy), EducationalTooltip (copy), PopoverSide (copy), PopoverAlign (copy)
	local UseOffersForKeyResult = UseOffersForKeyFunction(FeatureKeys.RobloxShop)
	local UseSignalStateResult = UseSignalStateFunction(GetOffersStoreFunction(false).getOfferExposureSnapshot)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 67 ]]
		-- upvalues: UseOffersForKeyResult (copy), UseSignalStateResult (copy), IsNotificationEligibleFunction (upval), SelectActiveOfferFunction (upval)
		if UseOffersForKeyResult == nil or UseSignalStateResult == nil then
			return nil
		end
		local List = {}
		
		for _, value in UseOffersForKeyResult do
			if IsNotificationEligibleFunction(value, UseSignalStateResult) then
				table.insert(List, value)
			end
		end
		return SelectActiveOfferFunction(List, "tooltip")
	end, { UseOffersForKeyResult, UseSignalStateResult })
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 83 ]]
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(p1.anchorRef ~= nil and p1.anchorRef.current ~= nil)
	end, { p1.anchorRef })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 89 ]]
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(true)
	end, {})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 93 ]]
		-- upvalues: UseResult (copy), ConstantsModule (upval), ServiceModule (upval), ToggleInExperienceShopWindowFunction (upval), GetOffersStoreFunction (upval)
		UseResult()
		local INEXPERIENCESHOPID = ConstantsModule.IN_EXPERIENCE_SHOP_ID
		
		if ServiceModule:isWindowOpen(INEXPERIENCESHOPID) then return end
		if ServiceModule:isIntegrationValid(INEXPERIENCESHOPID) then
			ServiceModule:activate(INEXPERIENCESHOPID)
			
			return
		end
		if ToggleInExperienceShopWindowFunction and GetOffersStoreFunction(false).getIsInExperienceShopGlobalIconAvailable(false) then
			ToggleInExperienceShopWindowFunction()
		end
	end, { UseResult })
	local Tooltip = if UseMemoResult == nil then nil else UseMemoResult.presentationData.tooltip
	local OfferId = if UseMemoResult == nil then nil else UseMemoResult.offerId
	local UseContextResult = ReactModule.useContext(TooltipContextModule)
	local MENUOFFERTOOLTIP = UseIsTooltipTurnModule("MENU_OFFER_TOOLTIP") or false
	local UseRefResult = ReactModule.useRef(UseContextResult)
	ReactModule.useEffect(function() --[[ Line: 117 ]]
		-- upvalues: UseRefResult (copy), UseContextResult (copy)
		UseRefResult.current = UseContextResult
	end, { UseContextResult })
	local IntegrationsResultEntry = ServiceModule:integrations()[ConstantsModule.IN_EXPERIENCE_SHOP_ID]
	local IsUseMappedSignalResultMatch = UseMappedSignalFunction(if IntegrationsResultEntry then IntegrationsResultEntry.availability else nil) == ServiceModule.AvailabilitySignal.Available
	local UseSignalStateResult1 = if FFlagOfferNotifyOnGlobalIcon then UseSignalStateFunction(GetOffersStoreFunction(false).getHasInExperienceShopOpened) else false
	local Inverted: boolean = FFlagHideOfferNotificationsWhenShopEmpty and not UseShopHasItemsFunction()
	local NoUseSignalStateResult1: boolean = if FFlagOfferNotifyOnGlobalIcon then not Inverted and (Tooltip ~= nil and (p1.visible == true and (UseStateResult and (not UseStateResult1 and not UseSignalStateResult1)))) else not Inverted and (Tooltip ~= nil and (p1.visible == true and (IsUseMappedSignalResultMatch and (UseStateResult and not UseStateResult1))))
	ReactModule.useEffect(function() --[[ Line: 144 ]]
		-- upvalues: UseRefResult (copy), NoUseSignalStateResult1 (ref), MenuOfferTooltipPriority (upval), MenuOfferTooltipShowDelayMs (upval), MenuOfferTooltipDismissDelayMs (upval)
		local Current = UseRefResult.current
		
		if NoUseSignalStateResult1 and Current ~= nil then
			Current.registerTooltip("MENU_OFFER_TOOLTIP", MenuOfferTooltipPriority, MenuOfferTooltipShowDelayMs, MenuOfferTooltipDismissDelayMs)
			
			return function() --[[ Line: 157 ]]
				-- upvalues: Current (copy)
				Current.unregisterTooltip("MENU_OFFER_TOOLTIP")
			end
		else
			return nil
		end
	end, { NoUseSignalStateResult1, OfferId })
	local MENUOFFERTOOLTIP1 = NoUseSignalStateResult1 and MENUOFFERTOOLTIP
	ReactModule.useEffect(function() --[[ Line: 165 ]]
		-- upvalues: NoUseSignalStateResult1 (ref), ServiceModule (upval), UseResult (copy), GuiService (upval)
		if NoUseSignalStateResult1 then
			local Connection = ServiceModule:onIntegrationActivated():connect(function() --[[ Line: 170 ]]
				-- upvalues: UseResult (upval)
				UseResult()
			end)
			local MenuOpenedConnection = GuiService.MenuOpened:Connect(function() --[[ Line: 173 ]]
				-- upvalues: UseResult (upval)
				UseResult()
			end)
			
			return function() --[[ Line: 177 ]]
				-- upvalues: Connection (copy), MenuOpenedConnection (copy)
				Connection:disconnect()
				MenuOpenedConnection:Disconnect()
			end
		else
			return nil
		end
	end, { NoUseSignalStateResult1, UseResult })
	
	return if Tooltip == nil or not MENUOFFERTOOLTIP1 then nil else ReactModule.createElement(OverlayProvider, nil, {
		Tooltip = ReactModule.createElement(EducationalTooltip, {
			isOpen = true,
			testId = "menu-offer-tooltip",
			anchorRef = p1.anchorRef,
			title = Tooltip.title .. string.rep(" ", 10),
			side = PopoverSide.Bottom,
			align = PopoverAlign.Start,
			actions = {
				{
					text = Tooltip.buttonText,
					variant = ButtonVariant.Emphasis,
					onActivated = UseResult1
				}
			},
			onClose = UseResult,
			onPressedOutside = UseResult
		})
	})
end

return ReactModule.memo(function(p2) --[[ Line: 212 | Named "MenuOfferTooltip" ]]
	-- upvalues: FFlagOfferNotifyOnGlobalIcon (copy), UseSignalStateFunction (copy), GetOffersStoreFunction (copy), ServiceModule (copy), ConstantsModule (copy), UseMappedSignalFunction (copy), InExperienceShopModule (ref), ReactModule (copy), MenuOfferTooltipContent (copy)
	if FFlagOfferNotifyOnGlobalIcon then
		local UseSignalStateResult = UseSignalStateFunction(GetOffersStoreFunction(false).getIsInExperienceShopGlobalIconAvailable)
		local IntegrationsResultEntry = ServiceModule:integrations()[ConstantsModule.IN_EXPERIENCE_SHOP_ID]
		local IsUseMappedSignalResultMatch = UseMappedSignalFunction(if IntegrationsResultEntry then IntegrationsResultEntry.availability else nil) == ServiceModule.AvailabilitySignal.Available
		local UseSignalStateResult1 = UseSignalStateFunction(function(p3) --[[ Line: 220 ]]
			-- upvalues: InExperienceShopModule (upval)
			local GetShopGlobalIconStoreFunction = InExperienceShopModule.GetShopGlobalIconStore
			
			return if GetShopGlobalIconStoreFunction then GetShopGlobalIconStoreFunction(p3).getIconInstance(p3) else nil
		end)
		local UseRefResult = ReactModule.useRef(UseSignalStateResult1)
		UseRefResult.current = UseSignalStateResult1
		
		if UseSignalStateResult then
			return if UseRefResult.current == nil then nil else ReactModule.createElement(MenuOfferTooltipContent, { visible = true, anchorRef = UseRefResult })
		elseif not IsUseMappedSignalResultMatch then
			return nil
		end
	end
	return ReactModule.createElement(MenuOfferTooltipContent, p2)
end)