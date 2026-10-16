local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local RoduxModule = require(Parent.Rodux)
local Captured = {
	sheetRootProps = nil,
	dialogRootProps = nil,
	dialogTitleProps = nil,
	dialogActionsProps = nil
}

local function renderChildren(DialogRootProps) --[[ Line: 31 ]]
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", nil, DialogRootProps.children or DialogRootProps[ReactModule.Children])
end

local config = {
	["Feature.Catalog.Label.BuyItems"] = "Buy Items",
	["Feature.Profile.Header.BuyWholeLook"] = "Buy whole look",
	["IAPExperience.PurchasePrompt.Header.BuyAvatar"] = "Buy avatar",
	["IAPExperience.PurchasePrompt.Action.Buy"] = "Buy",
	["IAPExperience.PurchasePrompt.Label.TotalPriceV2"] = "Total price",
	["IAPExperience.InsufficientRobux.Title.InsufficientRobux"] = "Not enough Robux",
	["IAPExperience.InsufficientRobux.Text.CurrentBalance"] = "Current balance",
	["IAPExperience.InsufficientRobux.Text.MissingRobux"] = "You need",
	["IAPExperience.InsufficientRobux.Action.BuyRobux"] = "Buy Robux"
}
local PriceStatus = {
	Owned = "Owned",
	Free = "Free",
	PurchaseFromRoblox = "PurchaseFromRoblox",
	PurchaseFromResale = "PurchaseFromResale",
	OffSale = "OffSale",
	SoldOut = "SoldOut",
	Unavailable = "Unavailable",
	InExperienceOnly = "InExperienceOnly",
	QuantityLimitReached = "QuantityLimitReached"
}

local function getPriceStatusInShop(p1) --[[ Line: 118 ]]
	-- upvalues: PriceStatus (copy)
	return if p1 then if p1.isOwned then PriceStatus.Owned elseif p1.isOffSale then PriceStatus.OffSale elseif p1.collectibleItemDetails then PriceStatus.PurchaseFromResale elseif p1.priceInRobux == 0 then PriceStatus.Free elseif p1.priceInRobux then PriceStatus.PurchaseFromRoblox else PriceStatus.Unavailable else PriceStatus.Unavailable
end

return {
	captured = Captured,
	resetCaptured = function() --[[ Line: 24 ]]
		-- upvalues: Captured (copy)
		Captured.sheetRootProps = nil
		Captured.dialogRootProps = nil
		Captured.dialogTitleProps = nil
		Captured.dialogActionsProps = nil
	end,
	createFoundationMock = function(p1) --[[ Line: 35 ]]
		-- upvalues: Captured (copy), renderChildren (copy), ReactModule (copy)
		return (setmetatable({
			Sheet = {
				Root = function(SheetRootProps) --[[ Line: 36 ]]
					-- upvalues: Captured (upval), renderChildren (upval)
					Captured.sheetRootProps = SheetRootProps
					
					return renderChildren(SheetRootProps)
				end,
				Header = renderChildren,
				Content = renderChildren,
				Actions = renderChildren
			},
			Dialog = {
				Root = function(DialogRootProps) --[[ Line: 41 ]]
					-- upvalues: Captured (upval), renderChildren (upval)
					Captured.dialogRootProps = DialogRootProps
					
					return renderChildren(DialogRootProps)
				end,
				Title = function(DialogTitleProps) --[[ Line: 46 ]]
					-- upvalues: Captured (upval), ReactModule (upval)
					Captured.dialogTitleProps = DialogTitleProps
					
					return ReactModule.createElement("Frame")
				end,
				Content = renderChildren,
				Actions = function(DialogActionsProps) --[[ Line: 51 ]]
					-- upvalues: Captured (upval), ReactModule (upval)
					Captured.dialogActionsProps = DialogActionsProps
					
					return ReactModule.createElement("Frame")
				end
			}
		}, { __index = p1 }))
	end,
	createLocalizationMock = function() --[[ Line: 86 ]]
		-- upvalues: config (copy)
		return {
			Hooks = {
				useLocalization = function(List) --[[ Line: 89 ]]
					-- upvalues: config (upval)
					local t = {}
					
					for i, value in List do
						local v1 = if type(value) == "table" then value[1] else value
						t[i] = config[v1] or v1
					end
					return t
				end
			},
			NumberLocalization = {
				localize = function(p1, _): string --[[ Line: 99 ]]
					return (tostring(p1))
				end
			}
		}
	end,
	createInspectAndBuyMock = function(p1) --[[ Line: 140 ]]
		-- upvalues: getPriceStatusInShop (copy), PriceStatus (copy)
		return {
			Components = p1 or {},
			Utils = {
				getPriceStatusInShop = getPriceStatusInShop,
				getPriceLineContent = function(_, _, _) --[[ Line: 145 ]]
					return {}
				end
			},
			Enums = { PriceStatus = PriceStatus },
			Constants = {
				AssetLocalizationKeys = {},
				BundleLocalizationKeys = {},
				PriceStatusLocalizationKeys = {}
			}
		}
	end,
	createMockStore = function() --[[ Line: 160 ]]
		-- upvalues: RoduxModule (copy)
		return RoduxModule.Store.new(function() --[[ Line: 161 ]]
			return {
				ScreenSize = Vector2.new(800, 600),
				TopBar = { statusBarHeight = 0 }
			}
		end, {}, { RoduxModule.thunkMiddleware })
	end,
	makeDisplayItem = function(List) --[[ Line: 169 ]]
		local config = {
			id = "1",
			name = "Test Item",
			priceInRobux = 100,
			itemSubType = "8",
			isOwned = false,
			isOffSale = false,
			saleLocationType = "ShopAndAllExperiences",
			collectibleProductId = "product-1",
			itemType = "Asset",
			bundlePartsCount = 0,
			creator = { creatorName = "Creator", creatorHasVerifiedBadge = false },
			bundleAssetIds = {}
		}
		
		if List then
			for i, value in List do
				config[i] = value
			end
		end
		return config
	end,
	PriceStatus = PriceStatus
}