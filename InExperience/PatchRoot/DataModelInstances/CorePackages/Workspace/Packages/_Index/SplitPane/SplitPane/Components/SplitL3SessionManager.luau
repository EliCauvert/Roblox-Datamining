local Parent = script:FindFirstAncestor("SplitPane").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local SplitL3SessionHelperModule = require(script.Parent.Parent.Utils.SplitL3SessionHelper)
local SplitL3StoreModule = require(script.Parent.Parent.Stores.SplitL3Store)
local SplitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local SplitPaneContextModule = require(script.Parent.Parent.Context.SplitPaneContext)

local function SplitL3SessionManagerActive(p1)
	-- upvalues: SplitL3StoreModule (copy), SignalsReactModule (copy), ReactModule (copy), SplitL3SessionHelperModule (copy)
	local Store = SplitL3StoreModule.getStore()
	local UseSignalStateResult = SignalsReactModule.useSignalState(Store.getPendingSplitSubPaneTag)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(Store.getPendingSplitSubPaneDetail)
	local SessionService = p1.sessionService
	ReactModule.useLayoutEffect(function()
		-- upvalues: SessionService (copy), SplitL3SessionHelperModule (upval), UseSignalStateResult (copy), UseSignalStateResult1 (copy)
		if SessionService ~= nil then
			SplitL3SessionHelperModule.applySplitSubPaneSession(SessionService, UseSignalStateResult, UseSignalStateResult1)
			
			return
		end
	end, {
		SignalsReactModule.useSignalState(Store.getSplitL2SessionVersion),
		UseSignalStateResult,
		UseSignalStateResult1,
		SessionService
	})
	ReactModule.useEffect(function()
		-- upvalues: SessionService (copy), SplitL3StoreModule (upval), SplitL3SessionHelperModule (upval)
		if SessionService == nil or SessionService.SessionChangedSignal == nil then return end
		local SessionChangedSignalConnection = SessionService.SessionChangedSignal:connect(function()
			-- upvalues: SplitL3StoreModule (upval), SplitL3SessionHelperModule (upval), SessionService (upval)
			local Store = SplitL3StoreModule.getStore()
			SplitL3SessionHelperModule.applySplitSubPaneSession(SessionService, Store.getPendingSplitSubPaneTag(false), Store.getPendingSplitSubPaneDetail(false))
		end)
		
		return function()
			-- upvalues: SessionChangedSignalConnection (copy), SplitL3SessionHelperModule (upval), SessionService (upval)
			SessionChangedSignalConnection:disconnect()
			SplitL3SessionHelperModule.applySplitSubPaneSession(SessionService, nil)
		end
	end, { SessionService })
	
	return nil
end

return require(Parent.RoactServices).RoactServices.connect({
	sessionService = require(Parent.RoactServiceTags).AppSessionService
})(function(p1)
	-- upvalues: SignalsReactModule (copy), SplitPaneStoreModule (copy), ReactModule (copy), SplitPaneContextModule (copy), SplitL3SessionHelperModule (copy), SplitL3SessionManagerActive (copy)
	local SessionService = p1.sessionService
	local UseSignalStateResult = SignalsReactModule.useSignalState(SplitPaneStoreModule.getStore().getIsBreakpointEnabled)
	local ResolveEligibility = ReactModule.useContext(SplitPaneContextModule).resolveEligibility
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseSignalStateResult (copy), SessionService (copy), SplitL3SessionHelperModule (upval)
		if UseSignalStateResult then return end
		if SessionService ~= nil then
			SplitL3SessionHelperModule.applySplitSubPaneSession(SessionService, nil)
			
			return
		end
	end, { UseSignalStateResult, SessionService })
	ReactModule.useLayoutEffect(function()
		-- upvalues: p1 (copy), SplitL3SessionHelperModule (upval), ResolveEligibility (copy)
		if p1.connectRouteSignal == nil then return end
		return SplitL3SessionHelperModule.subscribeToRouteSignal(p1.connectRouteSignal, ResolveEligibility)
	end, { p1.connectRouteSignal, ResolveEligibility })
	
	return if UseSignalStateResult then ReactModule.createElement(SplitL3SessionManagerActive, { sessionService = SessionService }) else nil
end)