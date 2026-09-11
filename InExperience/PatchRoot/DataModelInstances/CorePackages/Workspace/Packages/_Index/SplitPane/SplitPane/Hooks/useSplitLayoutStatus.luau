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
local splitPaneSlot = appSplitViewModule.Enums.SplitPaneSlot
local tempRnSwitchNavigatorName = constants.TempRnSwitchNavigatorName

return function(p1, p2)
	-- upvalues: splitPaneStoreModule (ref), signalsReactModule (ref), computeSplitEligibilityModule (ref), reactModule (ref), splitPaneContextModule (ref), tempRnSwitchNavigatorName (ref), splitPaneSlot (ref), viewState (ref), roactNavigationModule (ref)
	local options, v
	local store = splitPaneStoreModule.getStore()
	local var1 = signalsReactModule.useSignalState(store.getIsBreakpointEnabled)
	local var2 = signalsReactModule.useSignalState(store.getSupportPaneMode)
	local var3 = computeSplitEligibilityModule(p1)
	local var4 = var1 and var3
	local var5 = reactModule.useContext(splitPaneContextModule).renderSupportContent ~= nil
	local var6 = p1[1] ~= nil and (p1[1].descriptor ~= nil and (p1[1].descriptor.state ~= nil and p1[1].descriptor.state.routeName == tempRnSwitchNavigatorName))
	local t = {}
	local var7 = nil
	local var8 = false
	
	if var4 then
		for i = #p1, 1, -1 do
			options = p1[i].descriptor.options
			v = options.splitPaneEligibility
			
			if v == splitPaneSlot.Support then
				table.insert(t, 1, i)
			elseif (options.transparent or options.overlayEnabled) and v == nil or #t <= 0 then
				continue
			end
			var7 = i
		end
	elseif not var1 then
		for i, v in p1 do
			if v.descriptor.options.splitPaneEligibility == splitPaneSlot.Support and v.viewState ~= viewState.Closing then
				var8 = true
				break
			end
		end
	end
	local var9 = var7 ~= nil and #t > 0
	options = var8 or (var9 or var4 and (var5 and p2 >= 1))
	v = nil
	
	if var4 then
		for i_1 = #p1, 1, -1 do
			local options_1 = p1[i_1].descriptor.options
			local splitPaneEligibility = options_1.splitPaneEligibility
			
			if splitPaneEligibility == splitPaneSlot.Support or (options_1.transparent or options_1.overlayEnabled) and splitPaneEligibility == nil then
				continue
			end
			v = i_1
			break
		end
	end
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), store (ref), var3 (ref), p1 (ref), splitPaneSlot (copy), roactNavigationModule (copy)
		if not var6 then return end
		local isSplitEligible = store.getIsSplitEligible(false)
		store.setIsSplitEligible(var3)
		
		if not isSplitEligible or var3 then return end
		local descriptor = p1[1].descriptor
		
		if descriptor == nil or descriptor.navigation == nil then return end
		local navigation = descriptor.navigation
		
		for i = #p1, 2, -1 do
			local descriptor_1 = p1[i].descriptor
			
			if descriptor_1 ~= nil then
				local splitPaneEligibility = descriptor_1.options.splitPaneEligibility
				
				if splitPaneEligibility ~= nil and splitPaneEligibility ~= splitPaneSlot.Content then
					local var10 = if descriptor_1.state ~= nil then descriptor_1.state.key else nil
					
					if var10 ~= nil then
						navigation.dispatch(roactNavigationModule.StackActions.pop({ prune = false, immediate = true, key = var10 }))
					end
				end
			end
		end
	end, { var6, var3, p1, store })
	reactModule.useEffect(function()
		-- upvalues: options (ref), var6 (ref), store (ref), p1 (ref), viewState (copy), splitPaneSlot (copy)
		if options then return end
		if var6 then
			store.setTemporarySupportPaneMode(nil)
		end
		for i, v in p1 do
			if v.viewState == viewState.Closing and v.descriptor.options.splitPaneEligibility == splitPaneSlot.Support then
				v.setClosed()
			end
		end
	end, { var6, options, p1, store })
	
	return {
		isSplitLayoutEnabled = options,
		isRouteActiveOnPane = var9,
		paneIndices = t,
		contentTopCandidate = v,
		splitPrimaryIndex = var7,
		supportPaneMode = var2,
		isRootAppStack = var6,
		isSplitEnabled = var4
	}
end