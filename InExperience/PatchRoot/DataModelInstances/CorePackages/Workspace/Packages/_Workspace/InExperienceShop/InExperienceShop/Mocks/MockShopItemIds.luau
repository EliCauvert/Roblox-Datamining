local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local promiseModule = require(inExperienceShop.Parent.Promise)
local _ = require(inExperienceShop.Types)
local t = {
	categories = {
		{
			id = 1,
			name = "Top picks",
			items = {
				{ id = 3520436958, type = "Product" }, { id = 1804642568, type = "GamePass" },
				{ id = 3533934241, type = "Product" }, { id = 1804340575, type = "GamePass" },
				{ id = 3539559418, type = "Product" }, { id = 3579160491, type = "Product" },
				{ id = 1714448958, type = "GamePass" }, { id = 3579160539, type = "Product" },
				{ id = 40724707, type = "Product" }, { id = 40895184, type = "Product" },
				{ id = 11839038, type = "GamePass" }, { id = 39470721, type = "Product" },
				{ id = 39470723, type = "Product" }, { id = 11839039, type = "GamePass" },
				{ id = 40896176, type = "Product" }, { id = 40896176, type = "Product" },
				{ id = 11809057, type = "GamePass" }
			}
		},
		{
			id = 2,
			name = "Coins",
			items = {
				{ id = 1716550603, type = "GamePass" }, { id = 3579160572, type = "Product" },
				{ id = 3579166829, type = "Product" }, { id = 3579166863, type = "Product" },
				{ id = 1683715929, type = "GamePass" }, { id = 3579166918, type = "Product" },
				{ id = 3579166948, type = "Product" }, { id = 3520436958, type = "Product" },
				{ id = 11836039, type = "GamePass" }, { id = 39470725, type = "Product" },
				{ id = 39470724, type = "Product" }, { id = 11839038, type = "GamePass" },
				{ id = 39470721, type = "Product" }, { id = 39470723, type = "Product" },
				{ id = 11839039, type = "GamePass" }, { id = 40896176, type = "Product" },
				{ id = 39470718, type = "Product" }, { id = 40895184, type = "Product" }
			}
		},
		{
			id = 3,
			name = "Boosts",
			items = {
				{ id = 3533934241, type = "Product" }, { id = 3539559418, type = "Product" },
				{ id = 1804642568, type = "GamePass" }, { id = 3579160491, type = "Product" },
				{ id = 3579160539, type = "Product" }, { id = 1804340575, type = "GamePass" },
				{ id = 3579160572, type = "Product" }, { id = 3579166829, type = "Product" },
				{ id = 3579166863, type = "Product" }, { id = 1714448958, type = "GamePass" },
				{ id = 40896176, type = "Product" }, { id = 39470718, type = "Product" },
				{ id = 40895184, type = "Product" }, { id = 11836039, type = "GamePass" },
				{ id = 39470725, type = "Product" }, { id = 39470724, type = "Product" },
				{ id = 11839038, type = "GamePass" }, { id = 39470721, type = "Product" },
				{ id = 39470723, type = "Product" }, { id = 11839039, type = "GamePass" }
			}
		},
		{
			id = 4,
			name = "Upgrades",
			items = {
				{ id = 3579166918, type = "Product" }, { id = 1716550603, type = "GamePass" },
				{ id = 3579166948, type = "Product" }, { id = 3520436958, type = "Product" },
				{ id = 3533934241, type = "Product" }, { id = 3539559418, type = "Product" },
				{ id = 1683715929, type = "GamePass" }, { id = 3579160491, type = "Product" },
				{ id = 39470725, type = "Product" }, { id = 39470724, type = "Product" },
				{ id = 11839038, type = "GamePass" }
			}
		},
		{
			id = 5,
			name = "Cosmetics",
			items = {
				{ id = 1804642568, type = "GamePass" }, { id = 3579160539, type = "Product" },
				{ id = 3579160572, type = "Product" }, { id = 3579166829, type = "Product" },
				{ id = 3579166863, type = "Product" }, { id = 3579166918, type = "Product" },
				{ id = 1804340575, type = "GamePass" }, { id = 3579166948, type = "Product" },
				{ id = 3520436958, type = "Product" }, { id = 11809057, type = "GamePass" },
				{ id = 40895184, type = "Product" }, { id = 40724707, type = "Product" },
				{ id = 39470720, type = "Product" }, { id = 39470718, type = "Product" }
			}
		},
		{
			id = 6,
			name = "Gear",
			items = {
				{ id = 3533934241, type = "Product" }, { id = 1714448958, type = "GamePass" },
				{ id = 3539559418, type = "Product" }, { id = 3579160491, type = "Product" },
				{ id = 3579160539, type = "Product" }, { id = 1716550603, type = "GamePass" },
				{ id = 3579160572, type = "Product" }, { id = 3579166829, type = "Product" },
				{ id = 3579166863, type = "Product" }, { id = 39470720, type = "Product" },
				{ id = 40895184, type = "Product" }, { id = 40724707, type = "Product" },
				{ id = 11809057, type = "GamePass" }, { id = 39470718, type = "Product" },
				{ id = 11836039, type = "GamePass" }
			}
		},
		{
			id = 7,
			name = "Robux",
			items = {
				{
					id = 512,
					type = "Robux",
					info = {
						robux = 5250,
						productId = 512,
						providerProductId = "5250_Robux",
						price = {
							usdAmount = 49.99,
							amount = 49.99,
							currency = {
								currencyCode = "USD",
								id = 0,
								currencyType = 0,
								currencySymbol = "$"
							}
						}
					},
					bonusItem = { id = 11809057, type = "GamePass" }
				},
				{
					id = 513,
					type = "Robux",
					info = {
						robux = 11000,
						productId = 513,
						providerProductId = "11000_Robux",
						price = {
							usdAmount = 99.99,
							amount = 99.99,
							currency = {
								currencyCode = "USD",
								id = 0,
								currencyType = 0,
								currencySymbol = "$"
							}
						}
					},
					bonusItem = { id = 11809057, type = "GamePass" }
				},
				{
					id = 514,
					type = "Robux",
					info = {
						robux = 24000,
						productId = 514,
						providerProductId = "24000_Robux",
						price = {
							usdAmount = 199.99,
							amount = 199.99,
							currency = {
								currencyCode = "USD",
								id = 0,
								currencyType = 0,
								currencySymbol = "$"
							}
						}
					},
					bonusItem = { id = 11809057, type = "GamePass" }
				},
				{
					id = 511,
					type = "Robux",
					info = {
						robux = 2000,
						productId = 511,
						providerProductId = "2000_Robux",
						price = {
							usdAmount = 19.99,
							amount = 19.99,
							currency = {
								currencyCode = "USD",
								id = 0,
								currencyType = 0,
								currencySymbol = "$"
							}
						}
					}
				}
			},
			metadata = {
				paymentSessionId = "4c49d1c0-19d2-4805-a0d1-f0fecd174ab7"
			}
		}
	},
	metadata = {
		inExperienceGlobalIconEnabled = if require(inExperienceShop.Flags.FFlagInExperienceShopExpectStringMetadataValues) then "true" else true
	}
}

return {
	MOCK_RESPONSE_FOR_TESTING = t,
	getShopItemIds = function(p0) --[[ line: 264 ]]
		-- upvalues: promiseModule (ref), t (ref)
		return promiseModule.delay(if p0 ~= nil then 0.5 else p0):andThen(function() --[[ line: 266 ]]
			-- upvalues: t (copy)
			return t
		end)
	end
}