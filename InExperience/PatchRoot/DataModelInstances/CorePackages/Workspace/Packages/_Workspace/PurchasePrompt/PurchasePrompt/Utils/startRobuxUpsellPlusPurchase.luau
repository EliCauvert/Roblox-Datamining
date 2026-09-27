local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local appContextModule = require(purchasePrompt.Utils.AppContext)
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local windowStateModule = require(purchasePrompt.Enums.WindowState)
local robloxSubscriptionPurchaseAppModule = require(parent.RobloxSubscriptionPurchaseApp)
local robloxSubscriptionFlowCompleteReason = robloxSubscriptionPurchaseAppModule.RobloxSubscriptionFlowCompleteReason
local surfaceName = robloxSubscriptionPurchaseAppModule.SurfaceName
local surfaceContext = robloxSubscriptionPurchaseAppModule.SurfaceContext
local purchaseClientSessionIdType = robloxSubscriptionPurchaseAppModule.PurchaseClientSessionIdType

return function(p1)
	-- upvalues: promptStateModule (ref), windowStateModule (ref), purchaseClientSessionIdType (ref), robloxSubscriptionPurchaseAppModule (ref), robloxSubscriptionFlowCompleteReason (ref), surfaceName (ref), appContextModule (ref), surfaceContext (ref)
	p1.setPromptState(promptStateModule.BlackbirdUpsellInProgress)
	p1.setWindowState(windowStateModule.Suspended)
	local var1 = if type(p1.purchaseFlowUUID) == "string" and p1.purchaseFlowUUID ~= "" then {
		clientSessionIdType = purchaseClientSessionIdType.PurchaseFlowUUID,
		clientSessionId = p1.purchaseFlowUUID
	} else nil
	robloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase({ showBackButton = true }, {
		onFlowComplete = function(p2)
			-- upvalues: p1 (ref), robloxSubscriptionFlowCompleteReason (copy)
			if p1.onFlowEnded then
				p1.onFlowEnded()
			end
			if p2 ~= robloxSubscriptionFlowCompleteReason.UpsellPurchaseSucceeded then
				p1.completeRequest()
				
				return
			elseif p1.onRobloxSubscriptionUpsellSuccess then
				p1.onRobloxSubscriptionUpsellSuccess()
			end
			p1.retryPurchaseAfterUpsell()
		end,
		onBackButtonActivated = function()
			-- upvalues: p1 (ref), promptStateModule (copy), windowStateModule (copy)
			if p1.onFlowEnded then
				p1.onFlowEnded()
			end
			p1.setPromptState(promptStateModule.RobuxUpsell)
			p1.setWindowState(windowStateModule.Shown)
		end
	}, nil, surfaceName.InGameRobuxUpsell, if appContextModule.get() == appContextModule.Enum.IN_APP then surfaceContext.InApp else surfaceContext.InGame, nil, if var1 then { clientSessionId = var1 } else nil)
end