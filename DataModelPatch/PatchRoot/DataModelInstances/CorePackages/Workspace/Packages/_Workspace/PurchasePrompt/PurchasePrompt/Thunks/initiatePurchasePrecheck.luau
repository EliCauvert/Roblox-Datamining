local Parent = script.Parent.Parent
local _ = game:GetService("UserInputService")
local SetButtonStateModule = require(Parent.Actions.SetButtonState)
local PurchaseWarningModule = require(Parent.Enums.PurchaseWarning)
local ButtonStateModule = require(Parent.Enums.ButtonState)
local UpsellFlowModule = require(Parent.Enums.UpsellFlow)
local NetworkModule = require(Parent.Services.Network)
local GetPurchaseWarningModule = require(Parent.Network.getPurchaseWarning)
local GetUpsellFlowModule = require(Parent.NativeUpsell.getUpsellFlow)
local AnalyticsModule = require(Parent.Services.Analytics)
local ExternalSettingsModule = require(Parent.Services.ExternalSettings)
local ThunkModule = require(Parent.Thunk)
local SelectedRobuxPackageModule = require(Parent.Utils.SelectedRobuxPackage)
local ResolvePurchasePrecheckModule = require(script.Parent.resolvePurchasePrecheck)
local _ = require(Parent.Actions.SetPromptState)
local _ = require(Parent.Enums.PromptState)
local list = { AnalyticsModule, NetworkModule, ExternalSettingsModule }

return function()
	-- upvalues: ThunkModule (copy), list (copy), AnalyticsModule (copy), NetworkModule (copy), ExternalSettingsModule (copy), ResolvePurchasePrecheckModule (copy), PurchaseWarningModule (copy), GetUpsellFlowModule (copy), SelectedRobuxPackageModule (copy), UpsellFlowModule (copy), SetButtonStateModule (copy), ButtonStateModule (copy), GetPurchaseWarningModule (copy)
	return ThunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: AnalyticsModule (upval), NetworkModule (upval), ExternalSettingsModule (upval), ResolvePurchasePrecheckModule (upval), PurchaseWarningModule (upval), GetUpsellFlowModule (upval), SelectedRobuxPackageModule (upval), UpsellFlowModule (upval), SetButtonStateModule (upval), ButtonStateModule (upval), GetPurchaseWarningModule (upval)
		local State = p1:getState()
		local v1 = p2[AnalyticsModule]
		local v2 = p2[NetworkModule]
		local v3 = p2[ExternalSettingsModule]
		
		if v3.isStudio() then
			return ResolvePurchasePrecheckModule(PurchaseWarningModule.NoAction)
		end
		local UpsellFlowModule1 = GetUpsellFlowModule(v3.getPlatform())
		local ProductId = State.productInfo.productId
		local RobuxProductId = SelectedRobuxPackageModule.getRobuxProductId(State)
		local ProductId1 = nil
		local IsMembershipTypeMatch = State.accountInfo.membershipType == 4
		
		if UpsellFlowModule1 == UpsellFlowModule.Web then
			ProductId1 = SelectedRobuxPackageModule.getProductId(State)
			RobuxProductId = nil
		else
			ProductId1 = nil
		end
		p1:dispatch(SetButtonStateModule(ButtonStateModule.Disabled))
		
		return GetPurchaseWarningModule(v2, RobuxProductId, ProductId1, IsMembershipTypeMatch):andThen(function(Result)
			-- upvalues: p1 (copy), SetButtonStateModule (upval), ButtonStateModule (upval), v1 (copy), ProductId (copy), RobuxProductId (ref), ProductId1 (ref), ResolvePurchasePrecheckModule (upval), PurchaseWarningModule (upval)
			p1:dispatch(SetButtonStateModule(ButtonStateModule.Enabled))
			
			if Result then
				if Result.action == "U13PaymentModal" then
					v1.signalScaryModalShown(ProductId, "U13PaymentModal", RobuxProductId or ProductId1)
					
					return p1:dispatch(ResolvePurchasePrecheckModule(PurchaseWarningModule.U13PaymentModal))
				elseif Result.action == "U13MonthlyThreshold1Modal" then
					v1.signalScaryModalShown(ProductId, "U13MonthlyThreshold1Modal", RobuxProductId or ProductId1)
					
					return p1:dispatch(ResolvePurchasePrecheckModule(PurchaseWarningModule.U13MonthlyThreshold1Modal))
				elseif Result.action == "U13MonthlyThreshold2Modal" then
					v1.signalScaryModalShown(ProductId, "U13MonthlyThreshold2Modal", RobuxProductId or ProductId1)
					
					return p1:dispatch(ResolvePurchasePrecheckModule(PurchaseWarningModule.U13MonthlyThreshold2Modal))
				elseif Result.action == "ParentalConsentWarningPaymentModal13To17" then
					v1.signalScaryModalShown(ProductId, "ParentalConsentWarningPaymentModal13To17", RobuxProductId or ProductId1)
					
					return p1:dispatch(ResolvePurchasePrecheckModule(PurchaseWarningModule.ParentalConsentWarningPaymentModal13To17))
				end
			end
			p1:dispatch(ResolvePurchasePrecheckModule(PurchaseWarningModule.NoAction))
		end):catch(function(_)
			-- upvalues: p1 (copy), SetButtonStateModule (upval), ButtonStateModule (upval), ResolvePurchasePrecheckModule (upval), PurchaseWarningModule (upval)
			p1:dispatch(SetButtonStateModule(ButtonStateModule.Enabled))
			p1:dispatch(ResolvePurchasePrecheckModule(PurchaseWarningModule.NoAction))
		end)
	end)
end