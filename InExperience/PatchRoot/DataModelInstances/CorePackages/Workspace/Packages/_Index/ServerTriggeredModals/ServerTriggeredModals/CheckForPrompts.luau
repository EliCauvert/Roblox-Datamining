local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local ReactModule = require(Parent.React)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local RoactNavigationModule = require(Parent.RoactNavigation)
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
local LogPromptModalSkippedModule = require(ServerTriggeredModals.logPromptModalSkipped)
local FFlagPromptsModalSkipTelemetryModule = require(ServerTriggeredModals.Flags.FFlagPromptsModalSkipTelemetry)
local FFlagSduiAllowNoConfigsBuilt = SharedFlagsModule.FFlagSduiAllowNoConfigsBuilt
local FFlagEnableHomepagePromptsForModalsAndBanners = SharedFlagsModule.FFlagEnableHomepagePromptsForModalsAndBanners
local FFlagPromptsImpressionUsesTitle = SharedFlagsModule.FFlagPromptsImpressionUsesTitle
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local WithNavigationFocusIgnoringNavigation = if FFlagSignalsNavP3hMisc then require(Parent.RobloxAppNavigation).withNavigationFocusIgnoringNavigation else nil

local function _(p1): boolean
	return p1 ~= nil and (p1.config ~= nil and (p1.identifier ~= nil and (p1.robloxComponentType ~= nil and p1.title ~= nil)))
end

local function CheckForPrompts(p1)
	-- upvalues: UseDispatchFunction (copy), UseModalSignalStoreModule (copy), UseSignalStateFunction (copy), EntryPointModule (copy), ReactModule (copy), PromptsEntryPointModule (copy), FFlagSduiAllowNoConfigsBuilt (copy), SduiLoadTimer (copy), FetchPromptsModule (copy), FFlagEnableHomepagePromptsForModalsAndBanners (copy), UsePromptEntriesModule (copy), PromptStyleModule (copy), GetSduiApiStoreFunction (copy), FFlagPromptsModalSkipTelemetryModule (copy), LogPromptModalSkippedModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), AppPage (copy), FFlagPromptsImpressionUsesTitle (copy)
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
			promptStyles = nil,
			entryPoint = PromptsEntryPointModule.HomepageLaunch,
			allowNoConfigsBuilt = if FFlagSduiAllowNoConfigsBuilt then true else nil,
			loadTimer = SduiLoadTimer.createLoadTimer("HomepagePrompts")
		}
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: FetchPromptsModule (upval), UseMemoResult (copy)
		FetchPromptsModule(UseMemoResult)
	end, { UseMemoResult })
	local Entry1 = nil
	local Entry = nil
	
	if FFlagEnableHomepagePromptsForModalsAndBanners then
		Entry = UsePromptEntriesModule("HomepagePrompts", PromptStyleModule.Modal)
		Entry1 = Entry[1]
	else
		Entry1 = UseSignalStateFunction((ReactModule.useCallback(function(p2)
			-- upvalues: GetSduiApiStoreFunction (upval)
			local DataResult = GetSduiApiStoreFunction().getData("HomepagePrompts").data(p2)
			
			return DataResult and DataResult.HomepagePrompts
		end, {})))
	end
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult1 (copy), FFlagPromptsModalSkipTelemetryModule (upval), LogPromptModalSkippedModule (upval), EntryPointModule (upval), Entry (ref), Entry1 (ref), UseSignalStateResult (copy), IsFocused (copy), UseModalSignalStoreModuleResult (copy), UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), AppPage (upval), FFlagPromptsImpressionUsesTitle (upval)
		if not UseSignalStateResult1 then
			if not UseSignalStateResult then
				if IsFocused then
					local Entry2 = Entry1
					
					if Entry2 ~= nil and (Entry2.config ~= nil and (Entry2.identifier ~= nil and (Entry2.robloxComponentType ~= nil and Entry2.title ~= nil))) then
						UseModalSignalStoreModuleResult.setHasShown(EntryPointModule.HomepageLaunch, true)
						
						if FFlagPromptsModalSkipTelemetryModule then
							LogPromptModalSkippedModule.markShown(EntryPointModule.HomepageLaunch, Entry1)
						end
						UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.SduiPromptModal, {
							configKey = "HomepagePrompts",
							appPage = AppPage.Home,
							modalId = Entry1.identifier,
							modalType = if FFlagPromptsImpressionUsesTitle then Entry1.title else Entry1.robloxComponentType
						}))
						
						return
					elseif FFlagPromptsModalSkipTelemetryModule and Entry1 ~= nil then
						LogPromptModalSkippedModule.log(LogPromptModalSkippedModule.Reason.IncompleteEntry, EntryPointModule.HomepageLaunch, Entry1)
					end
					return
				elseif FFlagPromptsModalSkipTelemetryModule then
					LogPromptModalSkippedModule.logAll(LogPromptModalSkippedModule.Reason.NotFocused, EntryPointModule.HomepageLaunch, Entry or { Entry1 })
				end
				return
			elseif FFlagPromptsModalSkipTelemetryModule then
				LogPromptModalSkippedModule.logAll(LogPromptModalSkippedModule.Reason.LegacyMetadata, EntryPointModule.HomepageLaunch, Entry or { Entry1 })
			end
			return
		elseif FFlagPromptsModalSkipTelemetryModule then
			LogPromptModalSkippedModule.logAll(LogPromptModalSkippedModule.Reason.AlreadyShown, EntryPointModule.HomepageLaunch, Entry or { Entry1 })
		end
	end, {
		UseSignalStateResult1, UseSignalStateResult, IsFocused, UseDispatchResult,
		UseModalSignalStoreModuleResult, Entry1,
		if FFlagPromptsModalSkipTelemetryModule then Entry else nil
	})
	
	return nil
end

return if FFlagSignalsNavP3hMisc then WithNavigationFocusIgnoringNavigation(CheckForPrompts) else ReactModule.memo((RoactNavigationModule.withNavigationFocus(CheckForPrompts)))