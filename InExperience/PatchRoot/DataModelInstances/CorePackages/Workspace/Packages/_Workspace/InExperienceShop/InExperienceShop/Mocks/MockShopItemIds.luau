local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local promiseModule = require(inExperienceShop.Parent.Promise)
local _ = require(inExperienceShop.Types)
local t = {
	categories = {
		{
			id = 1,
			name = "Top picks",
			items = {
				{ id = 101, type = "Product" }, { id = 201, type = "GamePass" },
				{ id = 102, type = "Product" }, { id = 202, type = "GamePass" },
				{ id = 103, type = "Product" }, { id = 104, type = "Product" },
				{ id = 203, type = "GamePass" }, { id = 105, type = "Product" },
				{ id = 117, type = "Product" }, { id = 118, type = "Product" },
				{ id = 208, type = "GamePass" }, { id = 119, type = "Product" },
				{ id = 114, type = "Product" }, { id = 207, type = "GamePass" },
				{ id = 115, type = "Product" }, { id = 115, type = "Product" },
				{ id = 3456, type = "GamePass" }
			}
		},
		{
			id = 2,
			name = "Coins",
			items = {
				{ id = 204, type = "GamePass" }, { id = 106, type = "Product" },
				{ id = 107, type = "Product" }, { id = 108, type = "Product" },
				{ id = 205, type = "GamePass" }, { id = 109, type = "Product" },
				{ id = 110, type = "Product" }, { id = 101, type = "Product" },
				{ id = 206, type = "GamePass" }, { id = 116, type = "Product" },
				{ id = 113, type = "Product" }, { id = 208, type = "GamePass" },
				{ id = 119, type = "Product" }, { id = 114, type = "Product" },
				{ id = 207, type = "GamePass" }, { id = 115, type = "Product" },
				{ id = 112, type = "Product" }, { id = 118, type = "Product" }
			}
		},
		{
			id = 3,
			name = "Boosts",
			items = {
				{ id = 102, type = "Product" }, { id = 103, type = "Product" },
				{ id = 201, type = "GamePass" }, { id = 104, type = "Product" },
				{ id = 105, type = "Product" }, { id = 202, type = "GamePass" },
				{ id = 106, type = "Product" }, { id = 107, type = "Product" },
				{ id = 108, type = "Product" }, { id = 203, type = "GamePass" },
				{ id = 115, type = "Product" }, { id = 112, type = "Product" },
				{ id = 118, type = "Product" }, { id = 206, type = "GamePass" },
				{ id = 116, type = "Product" }, { id = 113, type = "Product" },
				{ id = 208, type = "GamePass" }, { id = 119, type = "Product" },
				{ id = 114, type = "Product" }, { id = 207, type = "GamePass" }
			}
		},
		{
			id = 4,
			name = "Upgrades",
			items = {
				{ id = 109, type = "Product" }, { id = 204, type = "GamePass" },
				{ id = 110, type = "Product" }, { id = 101, type = "Product" },
				{ id = 102, type = "Product" }, { id = 103, type = "Product" },
				{ id = 205, type = "GamePass" }, { id = 104, type = "Product" },
				{ id = 116, type = "Product" }, { id = 113, type = "Product" },
				{ id = 208, type = "GamePass" }
			}
		},
		{
			id = 5,
			name = "Cosmetics",
			items = {
				{ id = 201, type = "GamePass" }, { id = 105, type = "Product" },
				{ id = 106, type = "Product" }, { id = 107, type = "Product" },
				{ id = 108, type = "Product" }, { id = 109, type = "Product" },
				{ id = 202, type = "GamePass" }, { id = 110, type = "Product" },
				{ id = 101, type = "Product" }, { id = 3456, type = "GamePass" },
				{ id = 118, type = "Product" }, { id = 117, type = "Product" },
				{ id = 111, type = "Product" }, { id = 112, type = "Product" }
			}
		},
		{
			id = 6,
			name = "Gear",
			items = {
				{ id = 102, type = "Product" }, { id = 203, type = "GamePass" },
				{ id = 103, type = "Product" }, { id = 104, type = "Product" },
				{ id = 105, type = "Product" }, { id = 204, type = "GamePass" },
				{ id = 106, type = "Product" }, { id = 107, type = "Product" },
				{ id = 108, type = "Product" }, { id = 111, type = "Product" },
				{ id = 118, type = "Product" }, { id = 117, type = "Product" },
				{ id = 3456, type = "GamePass" }, { id = 112, type = "Product" },
				{ id = 206, type = "GamePass" }
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
					bonusItem = { id = 3456, type = "GamePass" }
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
					bonusItem = { id = 3456, type = "GamePass" }
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
					bonusItem = { id = 3456, type = "GamePass" }
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
			metadata = { paymentSessionId = "1234" }
		}
	},
	metadata = {
		inExperienceGlobalIconEnabled = if require(inExperienceShop.Flags.FFlagInExperienceShopExpectStringMetadataValues) then "true" else true
	}
}

return {
	MOCK_RESPONSE_FOR_TESTING = t,
	getShopItemIds = function(p1)
		-- upvalues: promiseModule (ref), t (ref)
		return promiseModule.delay(if p1 ~= nil then 0.5 else p1):andThen(function()
			-- upvalues: t (copy)
			return t
		end)
	end
}