local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local RobloxSubscriptionPurchaseAppModule = require(Parent.RobloxSubscriptionPurchaseApp)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local LoggerModule = require(ServerTriggeredModals.Logger)
local ReportPromptImpressionModule = require(ServerTriggeredModals.reportPromptImpression)
local SendModalImpressionEventFunction = require(Parent.ServerTriggeredModalImpressions).sendModalImpressionEvent
local PromptsEntryPointModule = require(script.Parent.PromptsEntryPoint)
local _ = require(script.Parent.Types.PromptsTypes)
local _ = require(ServerTriggeredModals.SignalStores.createModalSignalStore)
local _ = require(ServerTriggeredModals.EntryPoint)
local InitiateRobloxSubscriptionPurchaseFunction = RobloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase
local SurfaceName = RobloxSubscriptionPurchaseAppModule.SurfaceName
local SurfaceContext = RobloxSubscriptionPurchaseAppModule.SurfaceContext
local RobloxPlusSheetKind = RobloxSubscriptionPurchaseAppModule.RobloxPlusSheetKind
local Tbl = {}
local Signal, Signal2 = SignalsModule.createSignal(nil)

local function useIsScreenFocused()
	-- upvalues: ReactModule (copy), RoactNavigationModule (copy)
	local UseContextResult = ReactModule.useContext(RoactNavigationModule.Context)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseContextResult ~= nil and UseContextResult.isFocused())
	ReactModule.useEffect(function()
		-- upvalues: UseContextResult (copy), UseStateResult2 (copy), RoactNavigationModule (upval)
		if UseContextResult == nil then
			UseStateResult2(false)
			
			return
		end
		local AddListenerResult = UseContextResult.addListener(RoactNavigationModule.Events.WillFocus, function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(true)
		end)
		local AddListenerResult1 = UseContextResult.addListener(RoactNavigationModule.Events.WillBlur, function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
		UseStateResult2(UseContextResult.isFocused())
		
		return function()
			-- upvalues: AddListenerResult (copy), AddListenerResult1 (copy)
			AddListenerResult.remove()
			AddListenerResult1.remove()
		end
	end, { UseContextResult })
	
	return UseStateResult
end

return {
	handlePromptsResponse = function(p1)
		-- upvalues: LocalUserIdStore (copy), Tbl (copy), Signal2 (copy)
		if type(p1) ~= "table" then return end
		local CustomPrompts = p1.custom_prompts
		
		if type(CustomPrompts) ~= "table" or CustomPrompts.PlusUpsellSheetHomeLaunch == nil then return end
		local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
		
		if CurrentUserId ~= "" and not Tbl[CurrentUserId] then
			Tbl[CurrentUserId] = true
			Signal2(CurrentUserId)
			
			return
		end
	end,
	usePlusUpsellSheetPrompt = function(p1)
		-- upvalues: SignalsReactModule (copy), Signal (copy), useIsScreenFocused (copy), UseSelectorFunction (copy), ReactModule (copy), PromptsEntryPointModule (copy), LocalUserIdStore (copy), Signal2 (copy), InitiateRobloxSubscriptionPurchaseFunction (copy), RobloxPlusSheetKind (copy), SurfaceName (copy), SurfaceContext (copy), ReportPromptImpressionModule (copy), LoggerModule (copy), SendModalImpressionEventFunction (copy)
		local EntryPoint = p1.entryPoint
		local HasShownKey = p1.hasShownKey
		local ModalSignalStore = p1.modalSignalStore
		local UseSignalStateResult = SignalsReactModule.useSignalState(Signal)
		local UseIsScreenFocusedResult = useIsScreenFocused()
		local UseSelectorResult = UseSelectorFunction(function(p2)
			return p2.CentralOverlay and p2.CentralOverlay.OverlayType
		end)
		ReactModule.useEffect(function()
			-- upvalues: EntryPoint (copy), PromptsEntryPointModule (upval), UseSignalStateResult (copy), UseIsScreenFocusedResult (copy), UseSelectorResult (copy), Signal (upval), ModalSignalStore (copy), HasShownKey (copy), LocalUserIdStore (upval), Signal2 (upval), InitiateRobloxSubscriptionPurchaseFunction (upval), RobloxPlusSheetKind (upval), SurfaceName (upval), SurfaceContext (upval), ReportPromptImpressionModule (upval), LoggerModule (upval), SendModalImpressionEventFunction (upval)
			if EntryPoint ~= PromptsEntryPointModule.HomepageLaunch or UseSignalStateResult == nil then return end
			if not UseIsScreenFocusedResult or UseSelectorResult ~= nil then return end
			if Signal(false) ~= UseSignalStateResult then return end
			if ModalSignalStore.getHasShownGetter(HasShownKey)(false) or ModalSignalStore.getMetadataGetter(HasShownKey)(false) then return end
			if UseSignalStateResult == LocalUserIdStore.getCurrentUserId(false) then
				Signal2(nil)
				ModalSignalStore.setHasShown(HasShownKey, true)
				InitiateRobloxSubscriptionPurchaseFunction({ sheetKind = RobloxPlusSheetKind.TT }, nil, nil, SurfaceName.HomepageLaunchPrompt, SurfaceContext.InApp)
				ReportPromptImpressionModule("PlusUpsellSheetHomeLaunch", "PlusUpsellSheetHomeLaunch"):catch(function()
					-- upvalues: LoggerModule (upval)
					LoggerModule:warning("Failed to report Plus upsell sheet prompt impression")
				end)
				SendModalImpressionEventFunction("PlusUpsellSheetHomeLaunch", "PlusUpsellSheetHomeLaunch")
				
				return
			else
				Signal2(nil)
			end
		end, {
			EntryPoint, UseSignalStateResult, UseIsScreenFocusedResult, UseSelectorResult,
			ModalSignalStore, HasShownKey
		})
	end,
	resetForTests = function()
		-- upvalues: Tbl (copy), Signal2 (copy)
		table.clear(Tbl)
		Signal2(nil)
	end
}