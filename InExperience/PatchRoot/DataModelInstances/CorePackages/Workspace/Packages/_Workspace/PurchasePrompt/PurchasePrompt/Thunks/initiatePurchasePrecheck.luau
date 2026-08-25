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
	return thunkModule.new(script.Name, list, function(p0, p1)
		-- upvalues: analyticsModule (copy), networkModule (copy), externalSettingsModule (copy), resolvePurchasePrecheckModule (copy), purchaseWarningModule (copy), getUpsellFlowModule (copy), selectedRobuxPackageModule (copy), upsellFlowModule (copy), setButtonStateModule (copy), buttonStateModule (copy), getPurchaseWarningModule (copy)
		local state = p0:getState()
		local var14 = p1[analyticsModule]
		local var15 = p1[networkModule]
		local var16 = p1[externalSettingsModule]
		
		if var16.isStudio() then
			return resolvePurchasePrecheckModule(purchaseWarningModule.NoAction)
		end
		local productId_1
		local var17 = getUpsellFlowModule(var16.getPlatform())
		local productId = state.productInfo.productId
		local robuxProductId = selectedRobuxPackageModule.getRobuxProductId(state)
		local _ = nil
		local var19 = state.accountInfo.membershipType == 4
		
		if var17 == upsellFlowModule.Web then
			productId_1 = selectedRobuxPackageModule.getProductId(state)
			robuxProductId = nil
		else
			productId_1 = nil
		end
		p0:dispatch(setButtonStateModule(buttonStateModule.Disabled))
		
		return getPurchaseWarningModule(var15, robuxProductId, productId_1, var19):andThen(function(p2)
			-- upvalues: p0 (ref), setButtonStateModule (copy), buttonStateModule (copy), var14 (ref), productId (ref), robuxProductId (write), productId_1 (write), resolvePurchasePrecheckModule (copy), purchaseWarningModule (copy)
			p0:dispatch(setButtonStateModule(buttonStateModule.Enabled))
			
			if p2 then
				if p2.action == "U13PaymentModal" then
					var14.signalScaryModalShown(productId, "U13PaymentModal", robuxProductId or productId_1)
					
					return p0:dispatch(resolvePurchasePrecheckModule(purchaseWarningModule.U13PaymentModal))
				elseif p2.action == "U13MonthlyThreshold1Modal" then
					var14.signalScaryModalShown(productId, "U13MonthlyThreshold1Modal", robuxProductId or productId_1)
					
					return p0:dispatch(resolvePurchasePrecheckModule(purchaseWarningModule.U13MonthlyThreshold1Modal))
				elseif p2.action == "U13MonthlyThreshold2Modal" then
					var14.signalScaryModalShown(productId, "U13MonthlyThreshold2Modal", robuxProductId or productId_1)
					
					return p0:dispatch(resolvePurchasePrecheckModule(purchaseWarningModule.U13MonthlyThreshold2Modal))
				elseif p2.action == "ParentalConsentWarningPaymentModal13To17" then
					var14.signalScaryModalShown(productId, "ParentalConsentWarningPaymentModal13To17", robuxProductId or productId_1)
					
					return p0:dispatch(resolvePurchasePrecheckModule(purchaseWarningModule.ParentalConsentWarningPaymentModal13To17))
				end
			end
			p0:dispatch(resolvePurchasePrecheckModule(purchaseWarningModule.NoAction))
		end):catch(function(_)
			-- upvalues: p0 (ref), setButtonStateModule (copy), buttonStateModule (copy), resolvePurchasePrecheckModule (copy), purchaseWarningModule (copy)
			p0:dispatch(setButtonStateModule(buttonStateModule.Enabled))
			p0:dispatch(resolvePurchasePrecheckModule(purchaseWarningModule.NoAction))
		end)
	end)
end