local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetShareLinkV2StoreModule = require(AppChat.Stores.GetShareLinkV2Store)
local _ = require(script.Parent.ShareLinkV2Presentation)
local GetShareLinkV2PresentationModule = require(script.Parent.getShareLinkV2Presentation)
local Signal = SignalsModule.createSignal(nil)
local Signal1 = SignalsModule.createSignal(require(Parent.DataHydration).DataStatus.NotReady)

return function(p1) --[[ Line: 18 | Named "useShareLinkV2Presentation" ]]
	-- upvalues: GetShareLinkV2StoreModule (copy), ReactModule (copy), UseSignalStateFunction (copy), Signal (copy), Signal1 (copy), GetShareLinkV2PresentationModule (copy)
	local ShareLinkV2StoreModule = GetShareLinkV2StoreModule(false)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 20 ]]
		-- upvalues: p1 (copy), ShareLinkV2StoreModule (copy)
		return if p1 then ShareLinkV2StoreModule.getAndFetchClassification(p1) else nil
	end, { ShareLinkV2StoreModule, p1 or "" })
	local UseSignalStateResult = UseSignalStateFunction(if UseMemoResult then UseMemoResult.data else Signal)
	local UseSignalStateResult1 = UseSignalStateFunction(if UseMemoResult then UseMemoResult.status else Signal1)
	
	return if UseMemoResult == nil then nil else GetShareLinkV2PresentationModule(UseSignalStateResult, UseSignalStateResult1)
end