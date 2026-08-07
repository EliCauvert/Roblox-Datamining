-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:06 2026 Pacific Standard Time.

return function(p0) --[[ line: 1 ]]
	return {
		paymentsGateway = {
			getUpsellProduct = p0.fromString("apis:payments-gateway/v1/products/get-upsell-product"),
			preparePayment = p0.fromString("apis:payments-gateway/v1/prepare-payment"),
			checkUserPurchaseSettings = p0.fromString("apis:payments-gateway/v1/check-user-purchase-settings")
		},
		purchaseWarning = {
			getPurchaseWarning = function(p1, p2, p3) --[[ line: 9 ]]
				-- upvalues: p0 (ref)
				local var0 = ""
				
				if p1 == nil then
					if p2 == nil then
						warn(string.format("%s - Invalid parameters, needs mobileProductId or productId", tostring(script.Name)))
						
						return nil
					end
					var0 = string.format("%s?productId=%d", "apis:purchase-warning/v1/purchase-warnings", p2)
				else
					var0 = string.format("%s?mobileProductId=%s", "apis:purchase-warning/v1/purchase-warnings", p1)
				end
				if p3 then
					var0 = string.format("%s&is13To17ScaryModalEnabled=True", var0)
				end
				return p0.fromString(var0)()
			end,
			ackPurchaseWarning = p0.fromString("apis:purchase-warning/v1/purchase-warnings/acknowledge")
		},
		vngPayments = {
			getVngShopUrl = p0.fromString("apis:vng-payments/v1/getVngShopUrl")
		},
		info = {
			developerProduct = p0.fromString("www:developer-product/{universeId}/product/{productId}")
		}
	}
end