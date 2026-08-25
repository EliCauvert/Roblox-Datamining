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

return function(p0, p1)
	-- upvalues: splitPaneStoreModule (ref), signalsReactModule (ref), computeSplitEligibilityModule (ref), reactModule (ref), splitPaneContextModule (ref), tempRnSwitchNavigatorName (ref), splitPaneSlot (ref), viewState (ref), roactNavigationModule (ref), supportPaneMode (ref)
	local options
	local store = splitPaneStoreModule.getStore()
	local var8 = signalsReactModule.useSignalState(store.getIsBreakpointEnabled)
	local var9 = computeSplitEligibilityModule(p0)
	local var9_1 = var8 and var9
	local var11 = reactModule.useContext(splitPaneContextModule).renderSupportContent ~= nil
	local var12 = p0[1] ~= nil and (p0[1].descriptor ~= nil and (p0[1].descriptor.state ~= nil and p0[1].descriptor.state.routeName == tempRnSwitchNavigatorName))
	local t = {}
	local var14 = nil
	local var15 = false
	
	if var9_1 then
		for i = #p0, 1, -1 do
			options = p0[i].descriptor.options
			local splitPaneEligibility = options.splitPaneEligibility
			
			if splitPaneEligibility == splitPaneSlot.Support then
				table.insert(t, 1, i)
			elseif (options.transparent or options.overlayEnabled) and splitPaneEligibility == nil or #t <= 0 then
				continue
			end
			var14 = i
		end
	elseif not var8 then
		for i, v in p0 do
			if v.descriptor.options.splitPaneEligibility == splitPaneSlot.Support and v.viewState ~= viewState.Closing then
				var15 = true
				break
			end
		end
	end
	local var16 = var14 ~= nil and #t > 0
	options = var15 or (var16 or var9_1 and (var11 and p1 >= 1))
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), store (ref), var9 (ref), p0 (ref), splitPaneSlot (copy), roactNavigationModule (copy)
		if not var12 then return end
		local isSplitEligible = store.getIsSplitEligible(false)
		store.setIsSplitEligible(var9)
		
		if not isSplitEligible or var9 then return end
		local descriptor = p0[1].descriptor
		
		if descriptor == nil or descriptor.navigation == nil then return end
		local navigation = descriptor.navigation
		
		for i = #p0, 2, -1 do
			local descriptor_1 = p0[i].descriptor
			
			if descriptor_1 ~= nil then
				local splitPaneEligibility = descriptor_1.options.splitPaneEligibility
				
				if splitPaneEligibility ~= nil and splitPaneEligibility ~= splitPaneSlot.Content then
					local var18 = if descriptor_1.state ~= nil then descriptor_1.state.key else nil
					
					if var18 ~= nil then
						navigation.dispatch(roactNavigationModule.StackActions.pop({ prune = false, immediate = true, key = var18 }))
					end
				end
			end
		end
	end, { var12, var9, p0, store })
	reactModule.useEffect(function()
		-- upvalues: options (ref), var12 (ref), store (ref), supportPaneMode (copy), p0 (ref), viewState (copy), splitPaneSlot (copy)
		if options then return end
		if var12 and store.getSupportPaneMode(false) ~= supportPaneMode.Normal then
			store.setSupportPaneMode(supportPaneMode.Normal)
		end
		for i, v in p0 do
			if v.viewState == viewState.Closing and v.descriptor.options.splitPaneEligibility == splitPaneSlot.Support then
				v.setClosed()
			end
		end
	end, { var12, options, p0, store })
	
	return {
		isSplitLayoutEnabled = options,
		isRouteActiveOnPane = var16,
		paneIndices = t
	}
end