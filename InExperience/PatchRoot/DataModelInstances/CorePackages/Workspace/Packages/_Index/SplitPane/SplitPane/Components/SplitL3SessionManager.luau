local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local roactServices = require(parent.RoactServices).RoactServices
local appSessionService = require(parent.RoactServiceTags).AppSessionService
local signalsReactModule = require(parent.SignalsReact)
local splitL3SessionHelperModule = require(script.Parent.Parent.Utils.SplitL3SessionHelper)
local splitL3StoreModule = require(script.Parent.Parent.Stores.SplitL3Store)
local splitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local splitPaneContextModule = require(script.Parent.Parent.Context.SplitPaneContext)

local function SplitL3SessionManagerActive(p1)
	-- upvalues: splitL3StoreModule (ref), signalsReactModule (ref), reactModule (ref), splitL3SessionHelperModule (ref)
	local store = splitL3StoreModule.getStore()
	local var1 = signalsReactModule.useSignalState(store.getSplitL2SessionVersion)
	local var2 = signalsReactModule.useSignalState(store.getPendingSplitSubPaneTag)
	local var3 = signalsReactModule.useSignalState(store.getPendingSplitSubPaneDetail)
	local sessionService = p1.sessionService
	reactModule.useLayoutEffect(function()
		-- upvalues: sessionService (ref), splitL3SessionHelperModule (copy), var2 (ref), var3 (ref)
		if sessionService == nil then
			return
		end
		splitL3SessionHelperModule.applySplitSubPaneSession(sessionService, var2, var3)
	end, { var1, var2, var3, sessionService })
	reactModule.useEffect(function()
		-- upvalues: sessionService (ref), splitL3StoreModule (copy), splitL3SessionHelperModule (copy)
		if sessionService == nil or sessionService.SessionChangedSignal == nil then
			return
		end
		local sessionChangedSignalConnection = sessionService.SessionChangedSignal:connect(function()
			-- upvalues: splitL3StoreModule (copy), splitL3SessionHelperModule (copy), sessionService (copy)
			local store = splitL3StoreModule.getStore()
			splitL3SessionHelperModule.applySplitSubPaneSession(sessionService, store.getPendingSplitSubPaneTag(false), store.getPendingSplitSubPaneDetail(false))
		end)
		
		return function()
			-- upvalues: sessionChangedSignalConnection (ref), splitL3SessionHelperModule (copy), sessionService (copy)
			sessionChangedSignalConnection:disconnect()
			splitL3SessionHelperModule.applySplitSubPaneSession(sessionService, nil)
		end
	end, { sessionService })
	
	return nil
end

return roactServices.connect({ sessionService = appSessionService })(function(p1)
	-- upvalues: signalsReactModule (ref), splitPaneStoreModule (ref), reactModule (ref), splitPaneContextModule (ref), splitL3SessionHelperModule (ref), SplitL3SessionManagerActive (ref)
	local sessionService = p1.sessionService
	local var1 = signalsReactModule.useSignalState(splitPaneStoreModule.getStore().getIsBreakpointEnabled)
	local resolveEligibility = reactModule.useContext(splitPaneContextModule).resolveEligibility
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref), sessionService (ref), splitL3SessionHelperModule (copy)
		if var1 then return end
		if sessionService == nil then
			return
		end
		splitL3SessionHelperModule.applySplitSubPaneSession(sessionService, nil)
	end, { var1, sessionService })
	reactModule.useLayoutEffect(function()
		-- upvalues: p1 (ref), splitL3SessionHelperModule (copy), resolveEligibility (ref)
		if p1.connectRouteSignal == nil then
			return
		end
		return splitL3SessionHelperModule.subscribeToRouteSignal(p1.connectRouteSignal, resolveEligibility)
	end, { p1.connectRouteSignal, resolveEligibility })
	
	return if var1 then reactModule.createElement(SplitL3SessionManagerActive, { sessionService = sessionService }) else nil
end)