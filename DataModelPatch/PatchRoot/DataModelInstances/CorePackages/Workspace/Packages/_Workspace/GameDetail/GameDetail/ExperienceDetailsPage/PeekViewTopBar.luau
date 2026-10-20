local Parent = script:FindFirstAncestor("GameDetail").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local ButtonSize = FoundationModule.Enums.ButtonSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseDeviceInsetsFunction = require(Parent.Responsive).useDeviceInsets
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigationRoduxModule = require(Parent.NavigationRodux)
local Selectors = NavigationRoduxModule.Selectors
local NavigateBackFunction = NavigationRoduxModule.Thunks.NavigateBack
local PeekViewState = require(Parent.PeekView).PeekViewState
local RoactUtilsModule = require(Parent.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3fGameDetails = SharedFlagsModule.FFlagSignalsNavP3fGameDetails
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local CreateComputedFunction = require(Parent.Signals).createComputed
local GetLegacyNavigationStoreFunction = require(Parent.NavigationRodux).GetLegacyNavigationStore
local ExperienceDetailsPageUtilsModule = require(script.Parent.ExperienceDetailsPageUtils)

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), UseDeviceInsetsFunction (copy), UseTokensFunction (copy), FFlagSignalsNavP3fGameDetails (copy), ReactModule (copy), GetLegacyNavigationStoreFunction (copy), CreateComputedFunction (copy), AppPage (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), PeekViewState (copy), ExperienceDetailsPageUtilsModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), View (copy), IconButton (copy), IconName (copy), ButtonVariant (copy), ButtonSize (copy)
	local PageProps = p1.pageProps
	local OnCloseFunction = p1.onClose
	local UseDispatchResult = UseDispatchFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseSignalStateResult = nil
	UseSignalStateResult = if FFlagSignalsNavP3fGameDetails then UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: GetLegacyNavigationStoreFunction (upval), CreateComputedFunction (upval), AppPage (upval)
		local LegacyNavigationStore = GetLegacyNavigationStoreFunction(false)
		
		return CreateComputedFunction(function(p2): boolean
			-- upvalues: LegacyNavigationStore (copy), AppPage (upval)
			local CurrentLegacyRoute = LegacyNavigationStore.getCurrentLegacyRoute(p2)
			local Count = 0
			
			if CurrentLegacyRoute then
				for i = 1, #CurrentLegacyRoute do
					if CurrentLegacyRoute[i].name == AppPage.GameDetail then
						Count += 1
						
						if Count > 1 then
							return true
						end
					end
				end
			end
			return false
		end)
	end, {}))) else UseSelectorFunction(function(p2): boolean
		-- upvalues: FFlagUseNavigationSelectors (upval), Selectors (upval), AppPage (upval)
		local SelectLegacyHistoryResult = if FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p2) else p2.Navigation.history
		local SelectLegacyHistoryResultEntry = SelectLegacyHistoryResult and SelectLegacyHistoryResult[#SelectLegacyHistoryResult]
		local Count = 0
		
		if SelectLegacyHistoryResultEntry then
			for i = 1, #SelectLegacyHistoryResultEntry do
				if SelectLegacyHistoryResultEntry[i].name == AppPage.GameDetail then
					Count += 1
					
					if Count > 1 then
						return true
					end
				end
			end
		end
		return false
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (ref), UseDispatchResult (copy), PeekViewState (upval)
		return function()
			-- upvalues: UseSignalStateResult (upval), UseDispatchResult (upval), PeekViewState (upval)
			if not UseSignalStateResult then
				UseDispatchResult({
					type = "SetGameDetailsPeekViewState",
					viewState = PeekViewState.Closed
				})
			end
		end
	end, { UseDispatchResult, UseSignalStateResult })
	local ShowBackButtonFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(PageProps, "showBackButton")
	local UseSignalStateResult1 = if ShowBackButtonFromPropsOrNavigationParams == nil then UseSignalStateResult else ShowBackButtonFromPropsOrNavigationParams
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center size-full",
		padding = {
			top = UDim.new(0, UseDeviceInsetsResult.top),
			left = UDim.new(0, UseTokensResult.Padding.Large)
		}
	}, {
		NavButton = ReactModule.createElement(IconButton, {
			isCircular = true,
			icon = if UseSignalStateResult1 then IconName.ChevronLargeLeft else IconName.X,
			variant = ButtonVariant.Utility,
			size = ButtonSize.Medium,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseSignalStateResult1 (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval), OnCloseFunction (copy)
				if not UseSignalStateResult1 then
					OnCloseFunction()
					
					return
				end
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.back()
					
					return
				else
					UseDispatchResult(NavigateBackFunction())
				end
			end, {
				UseSignalStateResult1,
				UseDispatchResult,
				OnCloseFunction
			})
		})
	})
end)