local parent = script.Parent.Parent
local _ = game:GetService("UserInputService")
local setButtonStateModule = require(parent.Actions.SetButtonState)
local purchaseWarningModule = require(parent.Enums.PurchaseWarning)
local buttonStateModule = require(parent.Enums.ButtonState)
local upsellFlowModule = require(parent.Enums.UpsellFlow)
local networkModule = require(parent.Services.Network)
local getPurchaseWarningModule = require(parent.Network.getPurchaseWarning)
local getUpsellFlowModule = require(parent.NativeUpsell.getUpsellFlow)
local analyticsModule = require(parent.Services.Analytics)
local externalSettingsModule = require(parent.Services.ExternalSettings)
local thunkModule = require(parent.Thunk)
local selectedRobuxPackageModule = require(parent.Utils.SelectedRobuxPackage)
local resolvePurchasePrecheckModule = require(script.Parent.resolvePurchasePrecheck)
local _ = require(parent.Actions.SetPromptState)
local _ = require(parent.Enums.PromptState)
local list = { analyticsModule, networkModule, externalSettingsModule }

return function()
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), networkModule (ref), externalSettingsModule (ref), resolvePurchasePrecheckModule (ref), purchaseWarningModule (ref), getUpsellFlowModule (ref), selectedRobuxPackageModule (ref), upsellFlowModule (ref), setButtonStateModule (ref), buttonStateModule (ref), getPurchaseWarningModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: analyticsModule (copy), networkModule (copy), externalSettingsModule (copy), resolvePurchasePrecheckModule (copy), purchaseWarningModule (copy), getUpsellFlowModule (copy), selectedRobuxPackageModule (copy), upsellFlowModule (copy), setButtonStateModule (copy), buttonStateModule (copy), getPurchaseWarningModule (copy)
		local state = p1:getState()
		local var1 = p2[analyticsModule]
		local var2 = p2[networkModule]
		local var3 = p2[externalSettingsModule]
		
		if var3.isStudio() then
			return resolvePurchasePrecheckModule(purchaseWarningModule.NoAction)
		end
		local productId_1
		local var4 = getUpsellFlowModule(var3.getPlatform())
		local productId = state.productInfo.productId
		local robuxProductId = selectedRobuxPackageModule.getRobuxProductId(state)
		local _ = nil
		local var5 = state.accountInfo.membershipType == 4
		
		if var4 == upsellFlowModule.Web then
			productId_1 = selectedRobuxPackageModule.getProductId(state)
			robuxProductId = nil
		else
			productId_1 = nil
		end
		p1:dispatch(setButtonStateModule(buttonStateModule.Disabled))
		
		return getPurchaseWarningModule(var2, robuxProductId, productId_1, var5):andThen(function(p3)
			-- upvalues: p1 (ref), setButtonStateModule (copy), buttonStateModule (copy), var1 (ref), productId (ref), robuxProductId (write), productId_1 (write), resolvePurchasePrecheckModule (copy), purchaseWarningModule (copy)
			p1:dispatch(setButtonStateModule(buttonStateModule.Enabled))
			
			if p3 then
				if p3.action == "U13PaymentModal" then
					var1.signalScaryModalShown(productId, "U13PaymentModal", robuxProductId or productId_1)
					
					return p1:dispatch(resolvePurchasePrecheckModule(purchaseWarningModule.U13PaymentModal))
				elseif p3.action == "U13MonthlyThreshold1Modal" then
					var1.signalScaryModalShown(productId, "U13MonthlyThreshold1Modal", robuxProductId or productId_1)
					
					return p1:dispatch(resolvePurchasePrecheckModule(purchaseWarningModule.U13MonthlyThreshold1Modal))
				elseif p3.action == "U13MonthlyThreshold2Modal" then
					var1.signalScaryModalShown(productId, "U13MonthlyThreshold2Modal", robuxProductId or productId_1)
					
					return p1:dispatch(resolvePurchasePrecheckModule(purchaseWarningModule.U13MonthlyThreshold2Modal))
				elseif p3.action == "ParentalConsentWarningPaymentModal13To17" then
					var1.signalScaryModalShown(productId, "ParentalConsentWarningPaymentModal13To17", robuxProductId or productId_1)
					
					return p1:dispatch(resolvePurchasePrecheckModule(purchaseWarningModule.ParentalConsentWarningPaymentModal13To17))
				end
			end
			p1:dispatch(resolvePurchasePrecheckModule(purchaseWarningModule.NoAction))
		end):catch(function(_)
			-- upvalues: p1 (ref), setButtonStateModule (copy), buttonStateModule (copy), resolvePurchasePrecheckModule (copy), purchaseWarningModule (copy)
			p1:dispatch(setButtonStateModule(buttonStateModule.Enabled))
			p1:dispatch(resolvePurchasePrecheckModule(purchaseWarningModule.NoAction))
		end)
	end)
end