local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local AppContextModule = require(PurchasePrompt.Utils.AppContext)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local WindowStateModule = require(PurchasePrompt.Enums.WindowState)
local RobloxSubscriptionPurchaseAppModule = require(PurchasePrompt.Parent.RobloxSubscriptionPurchaseApp)
local RobloxSubscriptionFlowCompleteReason = RobloxSubscriptionPurchaseAppModule.RobloxSubscriptionFlowCompleteReason
local SurfaceName = RobloxSubscriptionPurchaseAppModule.SurfaceName
local SurfaceContext = RobloxSubscriptionPurchaseAppModule.SurfaceContext
local PurchaseClientSessionIdType = RobloxSubscriptionPurchaseAppModule.PurchaseClientSessionIdType

return function(p1) --[[ Line: 24 | Named "startRobuxUpsellPlusPurchase" ]]
	-- upvalues: PromptStateModule (copy), WindowStateModule (copy), PurchaseClientSessionIdType (copy), RobloxSubscriptionPurchaseAppModule (copy), RobloxSubscriptionFlowCompleteReason (copy), SurfaceName (copy), AppContextModule (copy), SurfaceContext (copy)
	p1.setPromptState(PromptStateModule.BlackbirdUpsellInProgress)
	p1.setWindowState(WindowStateModule.Suspended)
	local Config = if type(p1.purchaseFlowUUID) == "string" and p1.purchaseFlowUUID ~= "" then {
		clientSessionIdType = PurchaseClientSessionIdType.PurchaseFlowUUID,
		clientSessionId = p1.purchaseFlowUUID
	} else nil
	RobloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase({ showBackButton = true }, {
		onFlowComplete = function(UpsellPurchaseSucceeded) --[[ Line: 40 ]]
			-- upvalues: p1 (copy), RobloxSubscriptionFlowCompleteReason (upval)
			if p1.onFlowEnded then
				p1.onFlowEnded()
			end
			if UpsellPurchaseSucceeded ~= RobloxSubscriptionFlowCompleteReason.UpsellPurchaseSucceeded then
				p1.completeRequest()
				
				return
			end
			if p1.onRobloxSubscriptionUpsellSuccess then
				p1.onRobloxSubscriptionUpsellSuccess()
			end
			p1.retryPurchaseAfterUpsell()
		end,
		onBackButtonActivated = function() --[[ Line: 53 ]]
			-- upvalues: p1 (copy), PromptStateModule (upval), WindowStateModule (upval)
			if p1.onFlowEnded then
				p1.onFlowEnded()
			end
			p1.setPromptState(PromptStateModule.RobuxUpsell)
			p1.setWindowState(WindowStateModule.Shown)
		end
	}, nil, SurfaceName.InGameRobuxUpsell, if AppContextModule.get() == AppContextModule.Enum.IN_APP then SurfaceContext.InApp else SurfaceContext.InGame, nil, if Config then { clientSessionId = Config } else nil)
end