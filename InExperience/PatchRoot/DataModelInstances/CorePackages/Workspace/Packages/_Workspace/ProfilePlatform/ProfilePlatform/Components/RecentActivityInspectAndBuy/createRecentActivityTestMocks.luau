local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local roduxModule = require(parent.Rodux)
local t = {
	sheetRootProps = nil,
	dialogRootProps = nil,
	dialogTitleProps = nil,
	dialogActionsProps = nil
}

local function resetCaptured()
	-- upvalues: t (ref)
	t.sheetRootProps = nil
	t.dialogRootProps = nil
	t.dialogTitleProps = nil
	t.dialogActionsProps = nil
end

local function renderChildren(p1)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", nil, p1.children or p1[reactModule.Children])
end

local function createFoundationMock(p1)
	-- upvalues: t (ref), renderChildren (ref), reactModule (ref)
	return setmetatable({
		Sheet = {
			Root = function(p2)
				-- upvalues: t (copy), renderChildren (copy)
				t.sheetRootProps = p2
				
				return renderChildren(p2)
			end,
			Header = renderChildren,
			Content = renderChildren,
			Actions = renderChildren
		},
		Dialog = {
			Root = function(p2)
				-- upvalues: t (copy), renderChildren (copy)
				t.dialogRootProps = p2
				
				return renderChildren(p2)
			end,
			Title = function(p2)
				-- upvalues: t (copy), reactModule (copy)
				t.dialogTitleProps = p2
				
				return reactModule.createElement("Frame")
			end,
			Content = renderChildren,
			Actions = function(p2)
				-- upvalues: t (copy), reactModule (copy)
				t.dialogActionsProps = p2
				
				return reactModule.createElement("Frame")
			end
		}
	}, { __index = p1 })
end

local t_1 = {
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

local function createLocalizationMock()
	-- upvalues: t_1 (ref)
	return {
		Hooks = {
			useLocalization = function(p1)
				-- upvalues: t_1 (copy)
				local t = {}
				
				for i, v in p1 do
					local var1 = if type(v) == "table" then v[1] else v
					t[i] = t_1[var1] or var1
				end
				return t
			end
		},
		NumberLocalization = {
			localize = function(p2, _)
				return tostring(p2)
			end
		}
	}
end

local t_2 = {
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

local function getPriceStatusInShop(p1)
	-- upvalues: t_2 (ref)
	return if p1 then if p1.isOwned then t_2.Owned elseif p1.isOffSale then t_2.OffSale elseif p1.collectibleItemDetails then t_2.PurchaseFromResale elseif p1.priceInRobux == 0 then t_2.Free elseif p1.priceInRobux then t_2.PurchaseFromRoblox else t_2.Unavailable else t_2.Unavailable
end

return {
	captured = t,
	resetCaptured = resetCaptured,
	createFoundationMock = createFoundationMock,
	createLocalizationMock = createLocalizationMock,
	createInspectAndBuyMock = function(p1)
		-- upvalues: getPriceStatusInShop (ref), t_2 (ref)
		return {
			Components = p1 or {},
			Utils = {
				getPriceStatusInShop = getPriceStatusInShop,
				getPriceLineContent = function(_, _, _)
					return {}
				end
			},
			Enums = { PriceStatus = t_2 },
			Constants = {
				AssetLocalizationKeys = {},
				BundleLocalizationKeys = {},
				PriceStatusLocalizationKeys = {}
			}
		}
	end,
	createMockStore = function()
		-- upvalues: roduxModule (ref)
		return roduxModule.Store.new(function()
			return {
				ScreenSize = Vector2.new(800, 600),
				TopBar = { statusBarHeight = 0 }
			}
		end, {}, { roduxModule.thunkMiddleware })
	end,
	makeDisplayItem = function(p1)
		local t = {
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
		
		if p1 then
			for i, v in p1 do
				t[i] = v
			end
		end
		return t
	end,
	PriceStatus = t_2
}