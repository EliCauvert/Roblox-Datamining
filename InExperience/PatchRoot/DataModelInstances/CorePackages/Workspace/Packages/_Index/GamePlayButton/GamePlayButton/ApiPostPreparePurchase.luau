local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local httpService = game:GetService("HttpService")
local parent = gamePlayButton.Parent
local apiFetchGameDetails = require(parent.GameDetailRodux).GameDetails.ApiFetchGameDetails
local fetchGamePlayabilityAndProductInfo = require(parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local performFetch = require(parent.Http).PerformFetch
local promiseModule = require(parent.Promise)
local fiatPaidAccessPostPreparePurchaseRequestModule = require(gamePlayButton.FiatPaidAccessPostPreparePurchaseRequest)
local openFiatPurchasePageModule = require(gamePlayButton.OpenFiatPurchasePage)

local _ = function(p1)
	return "luaapp.fiatpaidaccess.prepare-purchase." .. p0
end

return {
	GetFetchingStatus = function(p1, p2)
		-- upvalues: performFetch (ref)
		return performFetch.GetStatus(p1, "luaapp.fiatpaidaccess.prepare-purchase." .. p2)
	end,
	Fetch = function(p1, p2, p3, p4)
		-- upvalues: performFetch (ref), fiatPaidAccessPostPreparePurchaseRequestModule (ref), httpService (ref), openFiatPurchasePageModule (ref), apiFetchGameDetails (ref), fetchGamePlayabilityAndProductInfo (ref), promiseModule (ref)
		return performFetch.Single("luaapp.fiatpaidaccess.prepare-purchase." .. p5, function(p5)
			-- upvalues: fiatPaidAccessPostPreparePurchaseRequestModule (copy), p1 (ref), p2 (ref), p4 (ref), httpService (copy), openFiatPurchasePageModule (copy), apiFetchGameDetails (copy), p3 (ref), fetchGamePlayabilityAndProductInfo (copy), promiseModule (copy)
			return fiatPaidAccessPostPreparePurchaseRequestModule(p1, p2, p4):andThen(function(p6)
				-- upvalues: httpService (copy), p5 (ref), openFiatPurchasePageModule (copy), apiFetchGameDetails (copy), p1 (copy), p3 (copy), fetchGamePlayabilityAndProductInfo (copy), promiseModule (copy)
				local checkoutUrl = p6 and (p6.responseBody and p6.responseBody.checkoutUrl)
				
				if checkoutUrl then
					local var1 = httpService:JSONDecode(checkoutUrl)
					
					if var1 and var1.checkoutUrl then
						p5:dispatch(openFiatPurchasePageModule(var1.checkoutUrl, function()
							-- upvalues: p5 (copy), apiFetchGameDetails (copy), p1 (copy), p3 (copy), fetchGamePlayabilityAndProductInfo (copy)
							p5:dispatch(apiFetchGameDetails.Fetch(p1, { p3 }))
							p5:dispatch(fetchGamePlayabilityAndProductInfo.Fetch(p1, p3))
						end))
						
						return promiseModule.resolve(p6)
					end
				end
				return promiseModule.reject("Invalid Response")
			end)
		end)
	end
}