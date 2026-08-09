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
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var5 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local experienceDetailsPageUtilsModule = require(script.Parent.ExperienceDetailsPageUtils)

return reactModule.memo(function(p0) --[[ line: 39 | named "PeekViewTopBar" ]]
	-- upvalues: useDispatch (ref), useDeviceInsets (ref), useTokens (ref), useSelector (ref), fFlagUseNavigationSelectors (ref), selectors (ref), appPage (ref), reactModule (ref), peekViewState (ref), experienceDetailsPageUtilsModule (ref), fFlagSignalsNavP3Dispatch (ref), var5 (ref), navigateBack (ref), view (ref), iconButton (ref), iconName (ref), buttonVariant (ref), buttonSize (ref)
	local pageProps = p0.pageProps
	local onClose = p0.onClose
	local var7 = useDispatch()
	local var8 = useDeviceInsets()
	local var9 = useTokens()
	local var10 = useSelector(function(p1) --[[ line: 47 ]]
		-- upvalues: fFlagUseNavigationSelectors (copy), selectors (copy), appPage (copy)
		local var13 = if fFlagUseNavigationSelectors then selectors.selectLegacyHistory(p1) else p1.Navigation.history
		local var14 = var13 and var13[#var13]
		local var15 = 0
		
		if var14 then
			for i = 1, #var14 do
				if var14[i].name == appPage.GameDetail then
					var15 += 1
					
					if var15 <= 1 then
						continue
					end
					return true
				end
			end
		end
		return false
	end)
	reactModule.useEffect(function() --[[ line: 66 ]]
		-- upvalues: var10 (ref), var7 (ref), peekViewState (copy)
		return function() --[[ line: 67 ]]
			-- upvalues: var10 (copy), var7 (copy), peekViewState (copy)
			if not var10 then
				var7({
					type = "SetGameDetailsPeekViewState",
					viewState = peekViewState.Closed
				})
			end
		end
	end, { var7, var10 })
	local showBackButton = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(pageProps, "showBackButton")
	local var12 = if showBackButton ~= nil then var10 else showBackButton
	
	return reactModule.createElement(view, {
		tag = "row align-y-center size-full",
		padding = {
			top = UDim.new(0, var8.top),
			left = UDim.new(0, var9.Padding.Large)
		}
	}, {
		NavButton = reactModule.createElement(iconButton, {
			isCircular = true,
			icon = if var12 then iconName.ChevronLargeLeft else iconName.X,
			variant = buttonVariant.Utility,
			size = buttonSize.Medium,
			onActivated = reactModule.useCallback(function() --[[ line: 81 ]]
				-- upvalues: var12 (ref), fFlagSignalsNavP3Dispatch (copy), var5 (copy), var7 (ref), navigateBack (copy), onClose (ref)
				if not var12 then
					onClose()
					
					return
				elseif fFlagSignalsNavP3Dispatch then
					var5.back()
					
					return
				end
				var7(navigateBack())
			end, { var12, var7, onClose })
		})
	})
end)