local parent = script:FindFirstAncestor("GameDetail").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local buttonSize = foundationModule.Enums.ButtonSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local useTokens = foundationModule.Hooks.useTokens
local useDeviceInsets = require(parent.Responsive).useDeviceInsets
local appPage = require(parent.RobloxAppEnums).AppPage
local navigationRoduxModule = require(parent.NavigationRodux)
local selectors = navigationRoduxModule.Selectors
local navigateBack = navigationRoduxModule.Thunks.NavigateBack
local peekViewState = require(parent.PeekView).PeekViewState
local roactUtilsModule = require(parent.RoactUtils)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagUseNavigationSelectors = sharedFlagsModule.FFlagUseNavigationSelectors
local fFlagSignalsNavP3fGameDetails = sharedFlagsModule.FFlagSignalsNavP3fGameDetails
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local useSignalState = require(parent.SignalsReact).useSignalState
local createComputed = require(parent.Signals).createComputed
local getLegacyNavigationStore = require(parent.NavigationRodux).GetLegacyNavigationStore
local experienceDetailsPageUtilsModule = require(script.Parent.ExperienceDetailsPageUtils)

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), useDeviceInsets (ref), useTokens (ref), fFlagSignalsNavP3fGameDetails (ref), reactModule (ref), getLegacyNavigationStore (ref), createComputed (ref), appPage (ref), useSignalState (ref), useSelector (ref), fFlagUseNavigationSelectors (ref), selectors (ref), peekViewState (ref), experienceDetailsPageUtilsModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateBack (ref), view (ref), iconButton (ref), iconName (ref), buttonVariant (ref), buttonSize (ref)
	local pageProps = p1.pageProps
	local onClose = p1.onClose
	local var2 = useDispatch()
	local var3 = useDeviceInsets()
	local var4 = useTokens()
	local var5 = if fFlagSignalsNavP3fGameDetails then useSignalState(reactModule.useMemo(function()
		-- upvalues: getLegacyNavigationStore (copy), createComputed (copy), appPage (copy)
		local var6 = getLegacyNavigationStore(false)
		
		return createComputed(function(p2)
			-- upvalues: var6 (ref), appPage (copy)
			local currentLegacyRoute = var6.getCurrentLegacyRoute(p2)
			local var7 = 0
			
			if currentLegacyRoute then
				for i = 1, #currentLegacyRoute do
					if currentLegacyRoute[i].name == appPage.GameDetail then
						var7 += 1
						
						if var7 <= 1 then
							continue
						end
						return true
					end
				end
			end
			return false
		end)
	end, {})) else useSelector(function(p2)
		-- upvalues: fFlagUseNavigationSelectors (copy), selectors (copy), appPage (copy)
		local var7 = if fFlagUseNavigationSelectors then selectors.selectLegacyHistory(p2) else p2.Navigation.history
		local var8 = var7 and var7[#var7]
		local var9 = 0
		
		if var8 then
			for i = 1, #var8 do
				if var8[i].name == appPage.GameDetail then
					var9 += 1
					
					if var9 <= 1 then
						continue
					end
					return true
				end
			end
		end
		return false
	end)
	reactModule.useEffect(function()
		-- upvalues: var5 (write), var2 (ref), peekViewState (copy)
		return function()
			-- upvalues: var5 (copy), var2 (copy), peekViewState (copy)
			if not var5 then
				var2({
					type = "SetGameDetailsPeekViewState",
					viewState = peekViewState.Closed
				})
			end
		end
	end, { var2, var5 })
	local showBackButton = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(pageProps, "showBackButton")
	local var10 = if showBackButton ~= nil then var5 else showBackButton
	
	return reactModule.createElement(view, {
		tag = "row align-y-center size-full",
		padding = {
			top = UDim.new(0, var3.top),
			left = UDim.new(0, var4.Padding.Large)
		}
	}, {
		NavButton = reactModule.createElement(iconButton, {
			isCircular = true,
			icon = if var10 then iconName.ChevronLargeLeft else iconName.X,
			variant = buttonVariant.Utility,
			size = buttonSize.Medium,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var10 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateBack (copy), onClose (ref)
				if not var10 then
					onClose()
					
					return
				elseif fFlagSignalsNavP3Dispatch then
					var1.back()
					
					return
				end
				var2(navigateBack())
			end, { var10, var2, onClose })
		})
	})
end)