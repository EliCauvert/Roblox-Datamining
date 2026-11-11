local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local PromiseModule = require(Parent.Promise)
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local FetchStatusRoduxModule = require(Parent.FetchStatusRodux)
local FetchStatusReducer = FetchStatusRoduxModule.FetchStatusReducer
local FetchStatusNamespace = FetchStatusRoduxModule.FetchStatusNamespace
local NextDataExpirationTimeRoduxModule = require(Parent.NextDataExpirationTimeRodux)
local NextDataExpirationTimeReducer = NextDataExpirationTimeRoduxModule.NextDataExpirationTimeReducer
local ExpirationTimeNamespace = NextDataExpirationTimeRoduxModule.ExpirationTimeNamespace
local ApiFetchSortTokensModule = require(DiscoveryMonolith.Modules.LuaApp.Thunks.Games.ApiFetchSortTokens)
local FFlagLuaAppFixGamesListSortTokenExpiringTime = require(Parent.SharedFlags).FFlagLuaAppFixGamesListSortTokenExpiringTime
local v1 = if FFlagLuaAppFixGamesListSortTokenExpiringTime then nil else 600

local function _(Fetching, p1, p2): boolean
	-- upvalues: FFlagLuaAppFixGamesListSortTokenExpiringTime (copy), RetrievalStatus (copy), v1 (copy)
	return if FFlagLuaAppFixGamesListSortTokenExpiringTime then Fetching ~= RetrievalStatus.Fetching and p1 <= p2 else Fetching ~= RetrievalStatus.Fetching and p1 - v1 <= p2
end

return function(p1, p2)
	-- upvalues: FetchStatusReducer (copy), FetchStatusNamespace (copy), NextDataExpirationTimeReducer (copy), ExpirationTimeNamespace (copy), FFlagLuaAppFixGamesListSortTokenExpiringTime (copy), RetrievalStatus (copy), v1 (copy), ApiFetchSortTokensModule (copy), PromiseModule (copy)
	return function(p3)
		-- upvalues: p2 (copy), FetchStatusReducer (upval), FetchStatusNamespace (upval), NextDataExpirationTimeReducer (upval), ExpirationTimeNamespace (upval), FFlagLuaAppFixGamesListSortTokenExpiringTime (upval), RetrievalStatus (upval), v1 (upval), ApiFetchSortTokensModule (upval), p1 (copy), PromiseModule (upval)
		local DispatchResults = {}
		local CurrentTime = tick()
		local State = p3:getState()
		
		for _, value in ipairs(p2) do
			local PersonalizationEntry = State.Personalization[FetchStatusReducer.key][FetchStatusNamespace.GameSortToken][value]
			local v2 = nil
			local PersonalizationEntry1 = State.Personalization[NextDataExpirationTimeReducer.key][ExpirationTimeNamespace.GameSortGroup]
			
			if PersonalizationEntry1 then
				v2 = PersonalizationEntry1[value]
			end
			local V18 = v2 or 0
			
			if if FFlagLuaAppFixGamesListSortTokenExpiringTime then PersonalizationEntry ~= RetrievalStatus.Fetching and V18 <= CurrentTime else PersonalizationEntry ~= RetrievalStatus.Fetching and CurrentTime >= V18 - v1 then
				table.insert(DispatchResults, p3:dispatch(ApiFetchSortTokensModule(p1, value, nil)))
			end
		end
		return PromiseModule.all(DispatchResults)
	end
end