local parent = script:FindFirstAncestor("GameDetailRodux").Parent
local promiseModule = require(parent.Promise)
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local apiFetchPlayabilityStatus = require(parent.PlayabilityRodux).PlayabilityStatus.ApiFetchPlayabilityStatus
local performFetch = require(parent.Http).PerformFetch
local fetchGamesProductInfo = require(parent.GameProductInfoRodux).FetchGamesProductInfo

return {
	KeyMapper = function(p1)
		return "luaapp.playability-and-productinfo." .. p0
	end,
	Fetch = function(p1, p2)
		-- upvalues: performFetch (ref), apiFetchPlayabilityStatus (ref), playabilityStatusEnum (ref), fetchGamesProductInfo (ref), promiseModule (ref)
		assert(type(p2) == "string", "FetchPlayabilityAndProductInfo thunk expects universeId to be a string")
		
		return performFetch.Single("luaapp.playability-and-productinfo." .. p2, function(p3)
			-- upvalues: apiFetchPlayabilityStatus (copy), p1 (ref), p2 (ref), playabilityStatusEnum (copy), fetchGamesProductInfo (copy), promiseModule (copy)
			return p3:dispatch(apiFetchPlayabilityStatus.Fetch(p1, { p2 })):andThen(function(p4)
				-- upvalues: apiFetchPlayabilityStatus (copy), p2 (copy), p3 (ref), playabilityStatusEnum (copy), fetchGamesProductInfo (copy), p1 (copy), promiseModule (copy)
				local var1, _ = p4[apiFetchPlayabilityStatus.KeyMapper(p2)]:unwrap()
				
				if not var1 then
					return promiseModule.reject()
				end
				local var2 = p3:getState().PlayabilityStatus[p2]
				
				return if var2.isPlayable == false and (var2.playabilityStatus == playabilityStatusEnum.PurchaseRequired or var2.playabilityStatus == playabilityStatusEnum.FiatPurchaseRequired) then p3:dispatch(fetchGamesProductInfo.Fetch(p1, { p2 })):andThen(function(p5)
					-- upvalues: fetchGamesProductInfo (copy), p2 (copy), promiseModule (copy), var2 (ref)
					local var3, _ = p5[fetchGamesProductInfo.KeyMapper(p2)]:unwrap()
					
					return if var3 then promiseModule.resolve(var2.playabilityStatus) else promiseModule.reject()
				end) else promiseModule.resolve(var2.playabilityStatus)
			end)
		end)
	end,
	GetFetchingStatus = function(p1, p2)
		-- upvalues: performFetch (ref)
		return performFetch.GetStatus(p1, "luaapp.playability-and-productinfo." .. p7)
	end
}