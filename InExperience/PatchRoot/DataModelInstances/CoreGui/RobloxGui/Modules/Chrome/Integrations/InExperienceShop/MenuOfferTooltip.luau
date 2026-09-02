local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local inExperienceOffersModule = require(corePackagesService.Workspace.Packages.InExperienceOffers)
local useMappedSignal = require(corePackagesService.Workspace.Packages.Chrome).Hooks.useMappedSignal
local fFlagOfferNotifyOnGlobalIcon = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagOfferNotifyOnGlobalIcon
local inExperienceShopModule = nil
local toggleInExperienceShopWindow = nil

if fFlagOfferNotifyOnGlobalIcon then
	inExperienceShopModule = require(corePackagesService.Workspace.Packages.InExperienceShop)
	toggleInExperienceShopWindow = require(chrome.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow
end
local serviceModule = require(chrome.Service)
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local tooltipContextModule = require(chrome.ChromeShared.Unibar.Tooltips.TooltipContext)
local useIsTooltipTurnModule = require(chrome.ChromeShared.Unibar.Tooltips.useIsTooltipTurn)
local educationalTooltip = foundationModule.EducationalTooltip
local overlayProvider = foundationModule.OverlayProvider
local buttonVariant = foundationModule.Enums.ButtonVariant
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local featureKeys = inExperienceOffersModule.FeatureKeys
local getOffersStore = inExperienceOffersModule.getOffersStore
local isNotificationEligible = inExperienceOffersModule.Utils.isNotificationEligible
local selectActiveOffer = inExperienceOffersModule.Utils.selectActiveOffer
local useOffersForKey = inExperienceOffersModule.Hooks.useOffersForKey
local useSignalState = signalsReactModule.useSignalState
local menuOfferTooltipPriority = game:DefineFastInt("MenuOfferTooltipPriority", 1500)
local menuOfferTooltipShowDelayMs = game:DefineFastInt("MenuOfferTooltipShowDelayMs", 1500)
local menuOfferTooltipDismissDelayMs = game:DefineFastInt("MenuOfferTooltipDismissDelayMs", 7000)

local function MenuOfferTooltipContent(p1)
	-- upvalues: useOffersForKey (ref), featureKeys (ref), useSignalState (ref), getOffersStore (ref), reactModule (ref), isNotificationEligible (ref), selectActiveOffer (ref), constantsModule (ref), serviceModule (ref), toggleInExperienceShopWindow (write), tooltipContextModule (ref), useIsTooltipTurnModule (ref), useMappedSignal (ref), fFlagOfferNotifyOnGlobalIcon (ref), menuOfferTooltipPriority (ref), menuOfferTooltipShowDelayMs (ref), menuOfferTooltipDismissDelayMs (ref), guiService (ref), buttonVariant (ref), overlayProvider (ref), educationalTooltip (ref), popoverSide (ref), popoverAlign (ref)
	local var1 = useOffersForKey(featureKeys.RobloxShop)
	local var2 = useSignalState(getOffersStore(false).getOfferExposureSnapshot)
	local var3 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), var2 (ref), isNotificationEligible (copy), selectActiveOffer (copy)
		if var1 == nil or var2 == nil then
			return nil
		end
		local t = {}
		
		for i, v in var1 do
			if isNotificationEligible(v, var2) then
				table.insert(t, v)
			end
		end
		return selectActiveOffer(t, "tooltip")
	end, { var1, var2 })
	local var4, var5 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), p1 (ref)
		var5(p1.anchorRef ~= nil and p1.anchorRef.current ~= nil)
	end, { p1.anchorRef })
	local var6, var7 = reactModule.useState(false)
	local var8 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		var7(true)
	end, {})
	local var9 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), constantsModule (copy), serviceModule (copy), toggleInExperienceShopWindow (copy), getOffersStore (copy)
		var8()
		local iNEXPERIENCESHOPID = constantsModule.IN_EXPERIENCE_SHOP_ID
		
		if serviceModule:isWindowOpen(iNEXPERIENCESHOPID) then return end
		if serviceModule:isIntegrationValid(iNEXPERIENCESHOPID) then
			serviceModule:activate(iNEXPERIENCESHOPID)
			
			return
		elseif toggleInExperienceShopWindow and getOffersStore(false).getIsInExperienceShopGlobalIconAvailable(false) then
			toggleInExperienceShopWindow()
		end
	end, { var8 })
	local var10 = if var3 ~= nil then nil else var3.presentationData.tooltip
	local var11 = if var3 ~= nil then nil else var3.offerId
	local var12 = reactModule.useContext(tooltipContextModule)
	local MENU_OFFER_TOOLTIP = useIsTooltipTurnModule("MENU_OFFER_TOOLTIP") or false
	local var13 = reactModule.useRef(var12)
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var12 (ref)
		var13.current = var12
	end, { var12 })
	local iNEXPERIENCESHOPID = serviceModule:integrations()[constantsModule.IN_EXPERIENCE_SHOP_ID]
	local var14 = if fFlagOfferNotifyOnGlobalIcon then useSignalState(getOffersStore(false).getHasInExperienceShopOpened) else false
	local var15 = var10 ~= nil and (p1.visible == true and (useMappedSignal(if iNEXPERIENCESHOPID then iNEXPERIENCESHOPID.availability else nil) == serviceModule.AvailabilitySignal.Available and (var4 and not var6)))
	
	if fFlagOfferNotifyOnGlobalIcon then
		var15 = var10 ~= nil and (p1.visible == true and (var4 and (not var6 and not var14)))
	end
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var15 (write), menuOfferTooltipPriority (copy), menuOfferTooltipShowDelayMs (copy), menuOfferTooltipDismissDelayMs (copy)
		local current = var13.current
		
		if var15 and current ~= nil then
			current.registerTooltip("MENU_OFFER_TOOLTIP", menuOfferTooltipPriority, menuOfferTooltipShowDelayMs, menuOfferTooltipDismissDelayMs)
			
			return function()
				-- upvalues: current (ref)
				current.unregisterTooltip("MENU_OFFER_TOOLTIP")
			end
		end
		return nil
	end, { var15, var11 })
	local MENU_OFFER_TOOLTIP_1 = var15 and MENU_OFFER_TOOLTIP
	reactModule.useEffect(function()
		-- upvalues: var15 (write), serviceModule (copy), var8 (ref), guiService (copy)
		if var15 then
			local var16 = serviceModule:onIntegrationActivated():connect(function()
				-- upvalues: var8 (copy)
				var8()
			end)
			local menuOpenedConnection = guiService.MenuOpened:Connect(function()
				-- upvalues: var8 (copy)
				var8()
			end)
			
			return function()
				-- upvalues: var16 (ref), menuOpenedConnection (ref)
				var16:disconnect()
				menuOpenedConnection:Disconnect()
			end
		end
		return nil
	end, { var15, var8 })
	
	return if var10 == nil or not MENU_OFFER_TOOLTIP_1 then nil else reactModule.createElement(overlayProvider, nil, {
		Tooltip = reactModule.createElement(educationalTooltip, {
			isOpen = true,
			testId = "menu-offer-tooltip",
			anchorRef = p1.anchorRef,
			title = var10.title .. string.rep(" ", 10),
			side = popoverSide.Bottom,
			align = popoverAlign.Start,
			actions = {
				{
					text = var10.buttonText,
					variant = buttonVariant.Emphasis,
					onActivated = var9
				}
			},
			onClose = var8,
			onPressedOutside = var8
		})
	})
end

return reactModule.memo(function(p2)
	-- upvalues: fFlagOfferNotifyOnGlobalIcon (ref), useSignalState (ref), getOffersStore (ref), serviceModule (ref), constantsModule (ref), useMappedSignal (ref), inExperienceShopModule (write), reactModule (ref), MenuOfferTooltipContent (ref)
	if fFlagOfferNotifyOnGlobalIcon then
		local var4 = useSignalState(getOffersStore(false).getIsInExperienceShopGlobalIconAvailable)
		local iNEXPERIENCESHOPID = serviceModule:integrations()[constantsModule.IN_EXPERIENCE_SHOP_ID]
		local var5 = useMappedSignal(if iNEXPERIENCESHOPID then iNEXPERIENCESHOPID.availability else nil) == serviceModule.AvailabilitySignal.Available
		local var6 = useSignalState(function(p3)
			-- upvalues: inExperienceShopModule (copy)
			local getShopGlobalIconStore = inExperienceShopModule.GetShopGlobalIconStore
			
			return if getShopGlobalIconStore then getShopGlobalIconStore(p3).getIconInstance(p3) else nil
		end)
		local var7 = reactModule.useRef(var6)
		var7.current = var6
		
		return if var4 then if var7.current == nil then nil else reactModule.createElement(MenuOfferTooltipContent, { visible = true, anchorRef = var7 }) elseif var5 then reactModule.createElement(MenuOfferTooltipContent, p2) else nil
	end
end)