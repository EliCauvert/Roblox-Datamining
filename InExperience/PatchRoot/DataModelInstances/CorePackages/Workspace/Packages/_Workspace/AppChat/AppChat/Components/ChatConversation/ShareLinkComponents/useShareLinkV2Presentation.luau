local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local dataHydrationModule = require(parent.DataHydration)
local useSignalState = require(parent.SignalsReact).useSignalState
local getShareLinkV2StoreModule = require(appChat.Stores.GetShareLinkV2Store)
local _ = require(script.Parent.ShareLinkV2Presentation)
local getShareLinkV2PresentationModule = require(script.Parent.getShareLinkV2Presentation)
local var1 = signalsModule.createSignal(nil)
local var2 = signalsModule.createSignal(dataHydrationModule.DataStatus.NotReady)

return function(p1)
	-- upvalues: getShareLinkV2StoreModule (ref), reactModule (ref), useSignalState (ref), var1 (ref), var2 (ref), getShareLinkV2PresentationModule (ref)
	local var3 = getShareLinkV2StoreModule(false)
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var3 (ref)
		return if p1 then var3.getAndFetchClassification(p1) else nil
	end, { var3, p1 or "" })
	
	return if var4 == nil then nil else getShareLinkV2PresentationModule(useSignalState(if var4 then var4.data else var1), useSignalState(if var4 then var4.status else var2))
end