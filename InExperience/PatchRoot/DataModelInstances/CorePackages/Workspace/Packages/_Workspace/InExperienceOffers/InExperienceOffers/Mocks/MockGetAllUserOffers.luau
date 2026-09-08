local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local promiseModule = require(inExperienceOffers.Parent.Promise)
local _ = require(inExperienceOffers.Types)
local t = {
	offers = {
		{
			offerId = "mock-welcome-offer",
			offerStatus = "AVAILABLE",
			expirationTimeInUTC = "2030-01-01T00:00:00Z",
			featureKeys = { "ROBLOX_SHOP", "MARKETPLACE_CART" },
			presentationData = {
				{
					type = "BANNER",
					banner = {
						title = "Sample banner offer",
						icon = "rbxassetid://0",
						modal = {
							title = "Sample offer modal title",
							body = "Sample offer description with terms.",
							icon = "rbxassetid://0",
							buttonText = "Shop now",
							termsAndConditions = {
								title = "Terms & Conditions",
								body = "Sample terms and conditions.",
								buttonText = "View terms"
							}
						}
					}
				},
				{ type = "MENU_BADGE", menuBadge = { title = "20% off" } },
				{
					type = "TOOLTIP",
					tooltip = { title = "Sample tooltip", buttonText = "Shop now" }
				}
			}
		},
		{
			offerId = "mock-no-terms-offer",
			offerStatus = "AVAILABLE",
			expirationTimeInUTC = "2030-01-01T00:00:00Z",
			featureKeys = { "ROBLOX_SHOP" },
			presentationData = {
				{
					type = "BANNER",
					banner = {
						title = "Sample banner (no terms)",
						icon = "rbxassetid://0",
						modal = {
							title = "Sample offer modal (no terms)",
							body = "Sample offer description without terms.",
							icon = "rbxassetid://0",
							buttonText = "Shop now"
						}
					}
				}
			}
		},
		{
			offerId = "mock-no-modal-offer",
			offerStatus = "AVAILABLE",
			expirationTimeInUTC = "2030-01-01T00:00:00Z",
			featureKeys = { "ROBLOX_SHOP" },
			presentationData = {
				{
					type = "BANNER",
					banner = {
						title = "Sample banner (no modal)",
						icon = "rbxassetid://0"
					}
				}
			}
		},
		{
			offerId = "mock-used-offer",
			offerStatus = "USED",
			expirationTimeInUTC = "2030-01-01T00:00:00Z",
			featureKeys = { "ROBLOX_SHOP" },
			presentationData = {
				{
					type = "BANNER",
					banner = { title = "Sample used offer", icon = "rbxassetid://0" }
				}
			}
		},
		{
			offerId = "mock-contentless-offer",
			offerStatus = "UNAVAILABLE",
			featureKeys = { "MARKETPLACE_CART" }
		}
	}
}

return function(_)
	-- upvalues: promiseModule (ref), t (ref)
	return promiseModule.resolve(t)
end