local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local SignalsModule = require(Parent.Signals)
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.HttpClient)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local DataStatus = require(DataHydration.DataHydrationTypes).DataStatus
local FetchAvatarBackgroundModule = require(script.Parent.fetchAvatarBackground)
local GetAvatarBackgroundImageUrlModule = require(script.Parent.getAvatarBackgroundImageUrl)
local _ = require(script.Parent.AvatarBackgroundStoreTypes)

return function(p1)
	-- upvalues: CreateSingleEntityResolverModule (copy), FetchAvatarBackgroundModule (copy), GetAvatarBackgroundImageUrlModule (copy), PromiseModule (copy), SignalsModule (copy), DataStatus (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local T = {}
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2)
		-- upvalues: FetchAvatarBackgroundModule (upval), config (copy)
		return FetchAvatarBackgroundModule(p2, config)
	end, {
		cache = { ttlSeconds = P0.ttlSeconds },
		resolver = {
			replaceItems = true,
			onClear = function()
				-- upvalues: T (ref)
				local T1 = T
				T = {}
				
				for _, value in T1 do
					value("avatar background store was cleared")
				end
			end
		}
	})
	
	return {
		getAndFetchAvatarBackground = function(p2)
			-- upvalues: SingleEntityResolverModule (copy)
			return (SingleEntityResolverModule.getAndFetch((tonumber(p2))))
		end,
		getAndFetchAvatarBackgroundImageUrl = function(p2, p3)
			-- upvalues: SingleEntityResolverModule (copy), GetAvatarBackgroundImageUrlModule (upval)
			local DataResult = SingleEntityResolverModule.getAndFetch((tonumber(p2))).data(p3)
			local AssetId = DataResult and DataResult.assetId
			
			return if AssetId then GetAvatarBackgroundImageUrlModule(AssetId) else nil
		end,
		awaitAvatarBackground = function(p2)
			-- upvalues: SingleEntityResolverModule (copy), PromiseModule (upval), T (ref), SignalsModule (upval), DataStatus (upval)
			local AndFetch = SingleEntityResolverModule.getAndFetch((tonumber(p2)))
			
			return PromiseModule.new(function(Callback2, Callback3, Callback: (any) -> ())
				-- upvalues: T (upval), SignalsModule (upval), AndFetch (copy), DataStatus (upval)
				local Flag = false
				local Callback1 = nil
				local t = {}
				
				local function settle()
					-- upvalues: Flag (ref), T (upval), t (copy), Callback1 (ref)
					Flag = true
					T[t] = nil
					
					if Callback1 then
						Callback1()
					end
				end
				
				T[t] = function(p3)
					-- upvalues: Flag (ref), Callback3 (copy), settle (copy)
					if not Flag then
						Flag = true
						Callback3(p3)
						task.defer(settle)
						
						return
					end
				end
				
				Callback1 = SignalsModule.createEffect(function(p3)
					-- upvalues: AndFetch (upval), Flag (ref), DataStatus (upval), Callback2 (copy), Callback3 (copy), T (upval), t (copy), Callback1 (ref)
					local StatusResult = AndFetch.status(p3)
					
					if Flag or StatusResult == DataStatus.NotReady then return end
					if StatusResult == DataStatus.Ready then
						Callback2(AndFetch.data(false) or {})
					else
						Callback3("Avatar background lookup failed")
					end
					Flag = true
					T[t] = nil
					
					if Callback1 then
						Callback1()
					end
				end)
				
				if Flag then
					Flag = true
					T[t] = nil
					
					if Callback1 then
						Callback1()
					end
				end
				Callback(settle)
			end)
		end,
		clear = SingleEntityResolverModule.clear,
		dispose = function()
			-- upvalues: T (ref), SingleEntityResolverModule (copy)
			local T1 = T
			T = {}
			
			for _, value in T1 do
				value("avatar background store was cleared")
			end
			SingleEntityResolverModule.dispose()
		end
	}
end