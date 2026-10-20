return function(p1)
	return {
		paymentsGateway = {
			getUpsellProduct = p1.fromString("apis:payments-gateway/v1/products/get-upsell-product"),
			preparePayment = p1.fromString("apis:payments-gateway/v1/prepare-payment"),
			checkUserPurchaseSettings = p1.fromString("apis:payments-gateway/v1/check-user-purchase-settings")
		},
		purchaseWarning = {
			getPurchaseWarning = function(p2, p3, p4)
				-- upvalues: p1 (copy)
				local Formatted = ""
				
				if p2 == nil then
					if p3 == nil then
						warn(string.format("%s - Invalid parameters, needs mobileProductId or productId", (tostring(script.Name))))
						
						return nil
					end
					Formatted = string.format("%s?productId=%d", "apis:purchase-warning/v1/purchase-warnings", p3)
				else
					Formatted = string.format("%s?mobileProductId=%s", "apis:purchase-warning/v1/purchase-warnings", p2)
				end
				if p4 then
					Formatted = string.format("%s&is13To17ScaryModalEnabled=True", Formatted)
				end
				return p1.fromString(Formatted)()
			end,
			ackPurchaseWarning = p1.fromString("apis:purchase-warning/v1/purchase-warnings/acknowledge")
		},
		vngPayments = {
			getVngShopUrl = p1.fromString("apis:vng-payments/v1/getVngShopUrl")
		},
		info = {
			developerProduct = p1.fromString("www:developer-product/{universeId}/product/{productId}")
		}
	}
end