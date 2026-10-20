local CorePackages = game:GetService("CorePackages")
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local SquadRootViewType = require(CorePackages.Workspace.Packages.SquadsCore.Enums).SquadRootViewType
local CentralOverlayType = require(CorePackages.Workspace.Packages.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay
local UseChatIsVisibleModule = require(CorePackages.Workspace.Packages.AppChat.useChatIsVisible)
local FFlagEnableSquadTopBannerWideMode = SharedFlagsModule.FFlagEnableSquadTopBannerWideMode
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil

return (require(CorePackages.Workspace.Packages.SquadsCore.SquadExternalContractProvider).makeSquadContract(CryoModule.Dictionary.union(require(CorePackages.Workspace.Packages.AppChat.SquadContract), {
	setSquadPrompt = function(p1, p2)
		-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
		p1:dispatch(SetCentralOverlayFunction(CentralOverlayType.SquadPrompt, p2))
	end,
	showSearchOverlay = function(Callback: (any) -> (), p1)
		-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy), CryoModule (copy)
		Callback(SetCentralOverlayFunction(CentralOverlayType.SearchPageOverlay, CryoModule.Dictionary.join({
			isFocused = true,
			initialSearchText = "",
			searchType = "Games"
		}, p1 or {})))
	end,
	closeSquadPrompt = require(CorePackages.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay,
	useSquadRootView = function()
		-- upvalues: FFlagSignalsNavP3hMisc (copy), FFlagEnableSquadTopBannerWideMode (copy), UseSelectorFunction (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), AppPage (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), UseChatIsVisibleModule (copy), SquadRootViewType (copy)
		local UseSelectorResult = nil
		if FFlagSignalsNavP3hMisc and FFlagEnableSquadTopBannerWideMode then
			local UseSelectorResult1 = UseSelectorFunction(function(p1): boolean
				return p1.Navigation ~= nil
			end)
			local UseSignalStateResult = UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentLegacyRoute)
			
			if UseSelectorResult1 then
				UseSelectorResult = false
				
				if UseSignalStateResult then
					for _, value in UseSignalStateResult do
						if value.name == AppPage.Chat then
							UseSelectorResult = true
							break
						end
					end
				end
			else
				UseSelectorResult = true
			end
		else
			UseSelectorResult = if FFlagEnableSquadTopBannerWideMode then UseSelectorFunction(function(p1): boolean
				-- upvalues: FFlagUseNavigationSelectors (upval), Selectors (upval), AppPage (upval)
				if not p1.Navigation then
					return true
				end
				local SelectLegacyHistoryResult = if FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p1) else p1.Navigation.history
				
				if not SelectLegacyHistoryResult then
					return false
				end
				local SelectLegacyHistoryResultEntry = SelectLegacyHistoryResult[#SelectLegacyHistoryResult]
				
				if not SelectLegacyHistoryResultEntry then
					return false
				end
				for _, value in SelectLegacyHistoryResultEntry do
					if value.name == AppPage.Chat then
						return true
					end
				end
				return false
			end) else UseChatIsVisibleModule()
		end
		return if UseSelectorResult then SquadRootViewType.UAAppChatPage else SquadRootViewType.None
	end,
	useSquadTopBannerManager = function()
		-- upvalues: ReactModule (copy), CryoModule (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState({})
		
		return {
			disableSquadTopBanner = ReactModule.useCallback(function(p1, p2)
				-- upvalues: UseStateResult2 (copy), CryoModule (upval)
				UseStateResult2(function(p3)
					-- upvalues: p1 (copy), p2 (copy), CryoModule (upval)
					return if p2 == (p3[p1] == true) then p3 else CryoModule.Dictionary.join(p3, { [p1] = if p2 then true else CryoModule.None })
				end)
			end, { UseStateResult2 }),
			useSquadTopBannerDisabled = ReactModule.useCallback(function(): boolean
				-- upvalues: UseStateResult (copy)
				for _, value in pairs(UseStateResult) do
					if value == true then
						return true
					end
				end
				return false
			end, { UseStateResult })
		}
	end
})))