local Parent = script:FindFirstAncestor("GameDetailRodux").Parent
local PromiseModule = require(Parent.Promise)
local PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
local ApiFetchPlayabilityStatus = require(Parent.PlayabilityRodux).PlayabilityStatus.ApiFetchPlayabilityStatus
local PerformFetch = require(Parent.Http).PerformFetch
local FetchGamesProductInfo = require(Parent.GameProductInfoRodux).FetchGamesProductInfo

return {
	KeyMapper = function(Text): string --[[ Line: 9 ]]
		return "luaapp.playability-and-productinfo." .. Text
	end,
	Fetch = function(p1, Text) --[[ Line: 17 ]]
		-- upvalues: PerformFetch (copy), ApiFetchPlayabilityStatus (copy), PlayabilityStatusEnum (copy), FetchGamesProductInfo (copy), PromiseModule (copy)
		assert(type(Text) == "string", "FetchPlayabilityAndProductInfo thunk expects universeId to be a string")
		
		return PerformFetch.Single("luaapp.playability-and-productinfo." .. Text, function(p2) --[[ Line: 20 ]]
			-- upvalues: ApiFetchPlayabilityStatus (upval), p1 (copy), Text (copy), PlayabilityStatusEnum (upval), FetchGamesProductInfo (upval), PromiseModule (upval)
			return p2:dispatch(ApiFetchPlayabilityStatus.Fetch(p1, { Text })):andThen(function(Result) --[[ Line: 23 ]]
				-- upvalues: ApiFetchPlayabilityStatus (upval), Text (upval), p2 (copy), PlayabilityStatusEnum (upval), FetchGamesProductInfo (upval), p1 (upval), PromiseModule (upval)
				local UnwrapResult, _ = Result[ApiFetchPlayabilityStatus.KeyMapper(Text)]:unwrap()
				
				if UnwrapResult then
					local PlayabilityStatusEntry = p2:getState().PlayabilityStatus[Text]
					
					return if PlayabilityStatusEntry.isPlayable == false and (PlayabilityStatusEntry.playabilityStatus == PlayabilityStatusEnum.PurchaseRequired or PlayabilityStatusEntry.playabilityStatus == PlayabilityStatusEnum.FiatPurchaseRequired) then p2:dispatch(FetchGamesProductInfo.Fetch(p1, { Text })):andThen(function(Result) --[[ Line: 39 ]]
						-- upvalues: FetchGamesProductInfo (upval), Text (upval), PromiseModule (upval), PlayabilityStatusEntry (copy)
						local UnwrapResult, _ = Result[FetchGamesProductInfo.KeyMapper(Text)]:unwrap()
						
						return if UnwrapResult then PromiseModule.resolve(PlayabilityStatusEntry.playabilityStatus) else PromiseModule.reject()
					end) else PromiseModule.resolve(PlayabilityStatusEntry.playabilityStatus)
				else
					return PromiseModule.reject()
				end
			end)
		end)
	end,
	GetFetchingStatus = function(p1, Text) --[[ Line: 59 ]]
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, "luaapp.playability-and-productinfo." .. Text)
	end
}