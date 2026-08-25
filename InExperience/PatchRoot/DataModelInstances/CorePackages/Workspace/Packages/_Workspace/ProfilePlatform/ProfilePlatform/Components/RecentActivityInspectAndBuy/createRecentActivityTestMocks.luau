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

local function renderChildren(p0)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", nil, p0.children or p0[reactModule.Children])
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
			Root = function(p3)
				-- upvalues: t (copy), renderChildren (copy)
				t.dialogRootProps = p3
				
				return renderChildren(p3)
			end,
			Title = function(p4)
				-- upvalues: t (copy), reactModule (copy)
				t.dialogTitleProps = p4
				
				return reactModule.createElement("Frame")
			end,
			Content = renderChildren,
			Actions = function(p5)
				-- upvalues: t (copy), reactModule (copy)
				t.dialogActionsProps = p5
				
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
			useLocalization = function(p6)
				-- upvalues: t_1 (copy)
				local t = {}
				
				for i, v in p6 do
					local var11 = if type(v) == "table" then v[1] else v
					t[i] = t_1[var11] or var11
				end
				return t
			end
		},
		NumberLocalization = {
			localize = function(p7, _)
				return tostring(p7)
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

local function getPriceStatusInShop(p8)
	-- upvalues: t_2 (ref)
	return if p8 then if p8.isOwned then t_2.Owned elseif p8.isOffSale then t_2.OffSale elseif p8.collectibleItemDetails then t_2.PurchaseFromResale elseif p8.priceInRobux == 0 then t_2.Free elseif p8.priceInRobux then t_2.PurchaseFromRoblox else t_2.Unavailable else t_2.Unavailable
end

return {
	captured = t,
	resetCaptured = resetCaptured,
	createFoundationMock = createFoundationMock,
	createLocalizationMock = createLocalizationMock,
	createInspectAndBuyMock = function(p9)
		-- upvalues: getPriceStatusInShop (ref), t_2 (ref)
		return {
			Components = p9 or {},
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
	makeDisplayItem = function(p10)
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
		
		if p10 then
			for i, v in p10 do
				t[i] = v
			end
		end
		return t
	end,
	PriceStatus = t_2
}