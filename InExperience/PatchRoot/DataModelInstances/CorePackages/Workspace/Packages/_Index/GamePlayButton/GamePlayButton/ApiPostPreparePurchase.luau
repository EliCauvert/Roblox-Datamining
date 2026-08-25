local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local httpService = game:GetService("HttpService")
local parent = gamePlayButton.Parent
local apiFetchGameDetails = require(parent.GameDetailRodux).GameDetails.ApiFetchGameDetails
local fetchGamePlayabilityAndProductInfo = require(parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local performFetch = require(parent.Http).PerformFetch
local promiseModule = require(parent.Promise)
local fiatPaidAccessPostPreparePurchaseRequestModule = require(gamePlayButton.FiatPaidAccessPostPreparePurchaseRequest)
local openFiatPurchasePageModule = require(gamePlayButton.OpenFiatPurchasePage)

local _ = function(p0)
	return "luaapp.fiatpaidaccess.prepare-purchase." .. p0
end

return {
	GetFetchingStatus = function(p1, p2)
		-- upvalues: performFetch (ref)
		return performFetch.GetStatus(p1, "luaapp.fiatpaidaccess.prepare-purchase." .. p2)
	end,
	Fetch = function(p3, p4, p5, p6)
		-- upvalues: performFetch (ref), fiatPaidAccessPostPreparePurchaseRequestModule (ref), httpService (ref), openFiatPurchasePageModule (ref), apiFetchGameDetails (ref), fetchGamePlayabilityAndProductInfo (ref), promiseModule (ref)
		return performFetch.Single("luaapp.fiatpaidaccess.prepare-purchase." .. p5, function(p7)
			-- upvalues: fiatPaidAccessPostPreparePurchaseRequestModule (copy), p3 (ref), p4 (ref), p6 (ref), httpService (copy), openFiatPurchasePageModule (copy), apiFetchGameDetails (copy), p5 (ref), fetchGamePlayabilityAndProductInfo (copy), promiseModule (copy)
			return fiatPaidAccessPostPreparePurchaseRequestModule(p3, p4, p6):andThen(function(p8)
				-- upvalues: httpService (copy), p7 (ref), openFiatPurchasePageModule (copy), apiFetchGameDetails (copy), p3 (copy), p5 (copy), fetchGamePlayabilityAndProductInfo (copy), promiseModule (copy)
				local checkoutUrl = p8 and (p8.responseBody and p8.responseBody.checkoutUrl)
				
				if checkoutUrl then
					local var6 = httpService:JSONDecode(checkoutUrl)
					
					if var6 and var6.checkoutUrl then
						p7:dispatch(openFiatPurchasePageModule(var6.checkoutUrl, function()
							-- upvalues: p7 (copy), apiFetchGameDetails (copy), p3 (copy), p5 (copy), fetchGamePlayabilityAndProductInfo (copy)
							p7:dispatch(apiFetchGameDetails.Fetch(p3, { p5 }))
							p7:dispatch(fetchGamePlayabilityAndProductInfo.Fetch(p3, p5))
						end))
						
						return promiseModule.resolve(p8)
					end
				end
				return promiseModule.reject("Invalid Response")
			end)
		end)
	end
}