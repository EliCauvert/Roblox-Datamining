local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local signalsReactModule = require(parent.SignalsReact)
local appSplitViewModule = require(parent.AppSplitView)
local viewState = require(parent.Navigation).ViewState
local constants = require(parent.NavigationRodux).Constants
local splitPaneContextModule = require(script.Parent.Parent.Context.SplitPaneContext)
local splitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local computeSplitEligibilityModule = require(script.Parent.Parent.Utils.computeSplitEligibility)
local supportPaneMode = appSplitViewModule.Enums.SupportPaneMode
local splitPaneSlot = appSplitViewModule.Enums.SplitPaneSlot
local tempRnSwitchNavigatorName = constants.TempRnSwitchNavigatorName

return function(p1, p2)
	-- upvalues: splitPaneStoreModule (ref), signalsReactModule (ref), computeSplitEligibilityModule (ref), reactModule (ref), splitPaneContextModule (ref), tempRnSwitchNavigatorName (ref), splitPaneSlot (ref), viewState (ref), roactNavigationModule (ref), supportPaneMode (ref)
	local options
	local store = splitPaneStoreModule.getStore()
	local var1 = signalsReactModule.useSignalState(store.getIsBreakpointEnabled)
	local var2 = computeSplitEligibilityModule(p1)
	local var3 = var1 and var2
	local var4 = reactModule.useContext(splitPaneContextModule).renderSupportContent ~= nil
	local var5 = p1[1] ~= nil and (p1[1].descriptor ~= nil and (p1[1].descriptor.state ~= nil and p1[1].descriptor.state.routeName == tempRnSwitchNavigatorName))
	local t = {}
	local var6 = nil
	local var7 = false
	
	if var3 then
		for i = #p1, 1, -1 do
			options = p1[i].descriptor.options
			local splitPaneEligibility = options.splitPaneEligibility
			
			if splitPaneEligibility == splitPaneSlot.Support then
				table.insert(t, 1, i)
			elseif (options.transparent or options.overlayEnabled) and splitPaneEligibility == nil or #t <= 0 then
				continue
			end
			var6 = i
		end
	elseif not var1 then
		for i, v in p1 do
			if v.descriptor.options.splitPaneEligibility == splitPaneSlot.Support and v.viewState ~= viewState.Closing then
				var7 = true
				break
			end
		end
	end
	local var8 = var6 ~= nil and #t > 0
	options = var7 or (var8 or var3 and (var4 and p2 >= 1))
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), store (ref), var2 (ref), p1 (ref), splitPaneSlot (copy), roactNavigationModule (copy)
		if not var5 then return end
		local isSplitEligible = store.getIsSplitEligible(false)
		store.setIsSplitEligible(var2)
		
		if not isSplitEligible or var2 then return end
		local descriptor = p1[1].descriptor
		
		if descriptor == nil or descriptor.navigation == nil then return end
		local navigation = descriptor.navigation
		
		for i = #p1, 2, -1 do
			local descriptor_1 = p1[i].descriptor
			
			if descriptor_1 ~= nil then
				local splitPaneEligibility = descriptor_1.options.splitPaneEligibility
				
				if splitPaneEligibility ~= nil and splitPaneEligibility ~= splitPaneSlot.Content then
					local var9 = if descriptor_1.state ~= nil then descriptor_1.state.key else nil
					
					if var9 ~= nil then
						navigation.dispatch(roactNavigationModule.StackActions.pop({ prune = false, immediate = true, key = var9 }))
					end
				end
			end
		end
	end, { var5, var2, p1, store })
	reactModule.useEffect(function()
		-- upvalues: options (ref), var5 (ref), store (ref), supportPaneMode (copy), p1 (ref), viewState (copy), splitPaneSlot (copy)
		if options then return end
		if var5 and store.getSupportPaneMode(false) ~= supportPaneMode.Normal then
			store.setSupportPaneMode(supportPaneMode.Normal)
		end
		for i, v in p1 do
			if v.viewState == viewState.Closing and v.descriptor.options.splitPaneEligibility == splitPaneSlot.Support then
				v.setClosed()
			end
		end
	end, { var5, options, p1, store })
	
	return {
		isSplitLayoutEnabled = options,
		isRouteActiveOnPane = var8,
		paneIndices = t
	}
end