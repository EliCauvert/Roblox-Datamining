local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local ReactModule = require(Parent.React)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local SharedFlagsModule = require(Parent.SharedFlags)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local AppPage = RobloxAppEnumsModule.AppPage
local CentralOverlayType = RobloxAppEnumsModule.CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local UseModalSignalStoreModule = require(ServerTriggeredModals.SignalStores.useModalSignalStore)
local EntryPointModule = require(ServerTriggeredModals.EntryPoint)
local FetchPromptsModule = require(ServerTriggeredModals.SduiV2.fetchPrompts)
local PromptsEntryPointModule = require(ServerTriggeredModals.SduiV2.PromptsEntryPoint)
local PromptStyleModule = require(ServerTriggeredModals.SduiV2.PromptStyle)
local UsePromptEntriesModule = require(ServerTriggeredModals.SduiV2.usePromptEntries)
local FFlagSduiAllowNoConfigsBuilt = SharedFlagsModule.FFlagSduiAllowNoConfigsBuilt
local FFlagEnableHomepagePromptsForModalsAndBanners = SharedFlagsModule.FFlagEnableHomepagePromptsForModalsAndBanners
local FFlagPromptsImpressionUsesTitle = SharedFlagsModule.FFlagPromptsImpressionUsesTitle

local function _(p1): boolean
	return p1 ~= nil and (p1.config ~= nil and (p1.identifier ~= nil and (p1.robloxComponentType ~= nil and p1.title ~= nil)))
end

return ReactModule.memo((require(Parent.RoactNavigation).withNavigationFocus(function(p1)
	-- upvalues: UseDispatchFunction (copy), UseModalSignalStoreModule (copy), UseSignalStateFunction (copy), EntryPointModule (copy), ReactModule (copy), PromptsEntryPointModule (copy), FFlagSduiAllowNoConfigsBuilt (copy), SduiLoadTimer (copy), FetchPromptsModule (copy), FFlagEnableHomepagePromptsForModalsAndBanners (copy), UsePromptEntriesModule (copy), PromptStyleModule (copy), GetSduiApiStoreFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), AppPage (copy), FFlagPromptsImpressionUsesTitle (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseModalSignalStoreModuleResult = UseModalSignalStoreModule()
	local UseSignalStateResult = UseSignalStateFunction(UseModalSignalStoreModuleResult.getMetadataGetter(EntryPointModule.HomepageLaunch))
	local UseSignalStateResult1 = UseSignalStateFunction(UseModalSignalStoreModuleResult.getHasShownGetter(EntryPointModule.HomepageLaunch))
	local IsFocused = p1.isFocused
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PromptsEntryPointModule (upval), FFlagSduiAllowNoConfigsBuilt (upval), SduiLoadTimer (upval)
		return {
			surfaceKey = "HomepagePrompts",
			configKey = "HomepagePrompts",
			clearOnEmptyResponse = true,
			clientAttributes = nil,
			replaceOnFetch = nil,
			entryPoint = PromptsEntryPointModule.HomepageLaunch,
			allowNoConfigsBuilt = if FFlagSduiAllowNoConfigsBuilt then true else nil,
			loadTimer = SduiLoadTimer.createLoadTimer("HomepagePrompts")
		}
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: FetchPromptsModule (upval), UseMemoResult (copy)
		FetchPromptsModule(UseMemoResult)
	end, { UseMemoResult })
	local HomepagePrompt = nil
	HomepagePrompt = if FFlagEnableHomepagePromptsForModalsAndBanners then UsePromptEntriesModule("HomepagePrompts", PromptStyleModule.Modal)[1] else UseSignalStateFunction((ReactModule.useCallback(function(p2)
		-- upvalues: GetSduiApiStoreFunction (upval)
		local DataResult = GetSduiApiStoreFunction().getData("HomepagePrompts").data(p2)
		
		return DataResult and DataResult.HomepagePrompts
	end, {})))
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult1 (copy), UseSignalStateResult (copy), IsFocused (copy), HomepagePrompt (ref), UseModalSignalStoreModuleResult (copy), EntryPointModule (upval), UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), AppPage (upval), FFlagPromptsImpressionUsesTitle (upval)
		if UseSignalStateResult1 then return end
		if UseSignalStateResult then return end
		if not IsFocused then return end
		local HomepagePrompt1 = HomepagePrompt
		
		if HomepagePrompt1 ~= nil and (HomepagePrompt1.config ~= nil and (HomepagePrompt1.identifier ~= nil and (HomepagePrompt1.robloxComponentType ~= nil and HomepagePrompt1.title ~= nil))) then
			UseModalSignalStoreModuleResult.setHasShown(EntryPointModule.HomepageLaunch, true)
			UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.SduiPromptModal, {
				configKey = "HomepagePrompts",
				appPage = AppPage.Home,
				modalId = HomepagePrompt.identifier,
				modalType = if FFlagPromptsImpressionUsesTitle then HomepagePrompt.title else HomepagePrompt.robloxComponentType
			}))
			
			return
		end
	end, {
		UseSignalStateResult1, UseSignalStateResult, IsFocused, UseDispatchResult,
		UseModalSignalStoreModuleResult, HomepagePrompt
	})
	
	return nil
end)))