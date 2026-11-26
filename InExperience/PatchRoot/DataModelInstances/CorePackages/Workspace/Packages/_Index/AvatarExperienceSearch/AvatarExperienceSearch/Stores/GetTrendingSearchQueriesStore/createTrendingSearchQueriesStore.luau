local Players = game:GetService("Players")
local AvatarExperienceSearch = script:FindFirstAncestor("AvatarExperienceSearch")
local Parent = AvatarExperienceSearch.Parent
local SignalsModule = require(Parent.Signals)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local GetTrendingSearchQueriesModule = require(AvatarExperienceSearch.Api.GetTrendingSearchQueries.getTrendingSearchQueries)
local GetLocalUserIdModule = require(AvatarExperienceSearch.Utils.getLocalUserId)
local FIntAXMaxTrendingSearchQueriesModule = require(AvatarExperienceSearch.Flags.FIntAXMaxTrendingSearchQueries)

local function capQueries(p1)
	-- upvalues: FIntAXMaxTrendingSearchQueriesModule (copy)
	return if #p1 <= FIntAXMaxTrendingSearchQueriesModule then p1 else table.move(p1, 1, FIntAXMaxTrendingSearchQueriesModule, 1, {})
end

return function()
	-- upvalues: SignalsModule (copy), GetLocalUserIdModule (copy), Players (copy), GetTrendingSearchQueriesModule (copy), capQueries (copy), MutedErrorFunction (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local ClockTime = nil
	local v1 = nil
	local Flag = false
	
	local function _(): boolean
		-- upvalues: ClockTime (ref)
		return ClockTime ~= nil and os.clock() - ClockTime < 3600
	end
	
	return {
		getQueries = Signal,
		fetchQueriesIfNeeded = function(p1)
			-- upvalues: GetLocalUserIdModule (upval), Players (upval), ClockTime (ref), v1 (ref), Signal2 (copy), Flag (ref), GetTrendingSearchQueriesModule (upval), capQueries (upval), MutedErrorFunction (upval)
			local LocalUserIdModule = GetLocalUserIdModule(Players)
			
			if ClockTime ~= nil and LocalUserIdModule ~= v1 then
				ClockTime = nil
				v1 = nil
				Signal2({})
			end
			if Flag or ClockTime ~= nil and os.clock() - ClockTime < 3600 then
				return function() end
			else
				Flag = true
				local Flag1 = false
				local Flag2 = false
				local TrendingSearchQueriesModule, TrendingSearchQueriesModule2 = GetTrendingSearchQueriesModule(p1)
				TrendingSearchQueriesModule:andThen(function(Result)
					-- upvalues: Flag1 (ref), Flag2 (ref), Flag (upval), ClockTime (upval), v1 (upval), LocalUserIdModule (copy), Signal2 (upval), capQueries (upval)
					if not Flag1 then
						Flag2 = true
						Flag = false
						ClockTime = os.clock()
						v1 = LocalUserIdModule
						Signal2(capQueries(Result))
						
						return
					end
				end, function(p2)
					-- upvalues: Flag1 (ref), Flag2 (ref), Flag (upval), MutedErrorFunction (upval)
					if not Flag1 then
						Flag2 = true
						Flag = false
						MutedErrorFunction(`Failed to fetch trending search queries: {tostring(p2)}`)
						
						return
					end
				end)
				
				return function()
					-- upvalues: Flag1 (ref), Flag2 (ref), Flag (upval), TrendingSearchQueriesModule2 (copy)
					if not Flag1 and not Flag2 then
						Flag1 = true
						Flag = false
						TrendingSearchQueriesModule2()
						
						return
					end
				end
			end
		end
	}
end