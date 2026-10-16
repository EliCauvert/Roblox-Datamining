local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local HttpService = game:GetService("HttpService")
local Parent = GamePlayButton.Parent
local ApiFetchGameDetails = require(Parent.GameDetailRodux).GameDetails.ApiFetchGameDetails
local FetchGamePlayabilityAndProductInfo = require(Parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local PerformFetch = require(Parent.Http).PerformFetch
local PromiseModule = require(Parent.Promise)
local FiatPaidAccessPostPreparePurchaseRequestModule = require(GamePlayButton.FiatPaidAccessPostPreparePurchaseRequest)
local OpenFiatPurchasePageModule = require(GamePlayButton.OpenFiatPurchasePage)

local function _(Text): string --[[ Line: 16 ]]
	return "luaapp.fiatpaidaccess.prepare-purchase." .. Text
end

return {
	GetFetchingStatus = function(p1, Text) --[[ Line: 20 ]]
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, "luaapp.fiatpaidaccess.prepare-purchase." .. Text)
	end,
	Fetch = function(p1, p2, Text, p3) --[[ Line: 24 ]]
		-- upvalues: PerformFetch (copy), FiatPaidAccessPostPreparePurchaseRequestModule (copy), HttpService (copy), OpenFiatPurchasePageModule (copy), ApiFetchGameDetails (copy), FetchGamePlayabilityAndProductInfo (copy), PromiseModule (copy)
		return PerformFetch.Single("luaapp.fiatpaidaccess.prepare-purchase." .. Text, function(p4) --[[ Line: 25 ]]
			-- upvalues: FiatPaidAccessPostPreparePurchaseRequestModule (upval), p1 (copy), p2 (copy), p3 (copy), HttpService (upval), OpenFiatPurchasePageModule (upval), ApiFetchGameDetails (upval), Text (copy), FetchGamePlayabilityAndProductInfo (upval), PromiseModule (upval)
			return FiatPaidAccessPostPreparePurchaseRequestModule(p1, p2, p3):andThen(function(Result) --[[ Line: 27 ]]
				-- upvalues: HttpService (upval), p4 (copy), OpenFiatPurchasePageModule (upval), ApiFetchGameDetails (upval), p1 (upval), Text (upval), FetchGamePlayabilityAndProductInfo (upval), PromiseModule (upval)
				local CheckoutUrl = Result and (Result.responseBody and Result.responseBody.checkoutUrl)
				
				if CheckoutUrl then
					local Data = HttpService:JSONDecode(CheckoutUrl)
					
					if Data and Data.checkoutUrl then
						p4:dispatch(OpenFiatPurchasePageModule(Data.checkoutUrl, function() --[[ Line: 34 ]]
							-- upvalues: p4 (upval), ApiFetchGameDetails (upval), p1 (upval), Text (upval), FetchGamePlayabilityAndProductInfo (upval)
							p4:dispatch(ApiFetchGameDetails.Fetch(p1, { Text }))
							p4:dispatch(FetchGamePlayabilityAndProductInfo.Fetch(p1, Text))
						end))
						
						return PromiseModule.resolve(Result)
					end
				end
				return PromiseModule.reject("Invalid Response")
			end)
		end)
	end
}