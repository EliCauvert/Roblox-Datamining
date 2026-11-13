local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local DataHydrationModule = require(Parent.DataHydration)
local HttpClientModule = require(Parent.HttpClient)
local ClassifyShareLinkV2Module = require(AppChat.Components.ChatConversation.Utils.RobloxUrlUtils.classifyShareLinkV2)
local FFlagAppChatGenericShareLinkCardModule = require(AppChat.Flags.FFlagAppChatGenericShareLinkCard)
local NewResult = require(AppChat.Logger):new(script.Name)
local FetchResolvedShareLinkModule = require(script.Parent.Requests.fetchResolvedShareLink)

return function(p1)
	-- upvalues: DataHydrationModule (copy), NewResult (copy), HttpClientModule (copy), FetchResolvedShareLinkModule (copy), ClassifyShareLinkV2Module (copy), FFlagAppChatGenericShareLinkCardModule (copy)
	local P0 = p1 or {}
	local DataResolver = DataHydrationModule.createDataResolver({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataHydrationModule.createDataCache(P0.ttlSeconds, P0.failedTtlSeconds),
		logError = function(p2)
			-- upvalues: NewResult (upval)
			NewResult:warning(`Error resolving share link v2: {tostring(p2)}`)
		end,
		fetchFn = function(p2)
			-- upvalues: HttpClientModule (upval), FetchResolvedShareLinkModule (upval), P0 (copy), ClassifyShareLinkV2Module (upval)
			return HttpClientModule.asPromise(FetchResolvedShareLinkModule(p2, P0.network)):andThen(ClassifyShareLinkV2Module)
		end
	})
	local Tbl = {}
	
	return {
		getCachedClassification = DataResolver.getCachedItem,
		fetchClassification = DataResolver.fetchItem,
		getAndFetchClassification = DataResolver.getAndFetchItem,
		claimFirstRenderLog = function(Key): boolean
			-- upvalues: Tbl (copy)
			if Tbl[Key] then
				return false
			else
				Tbl[Key] = true
				
				return true
			end
		end,
		clear = if FFlagAppChatGenericShareLinkCardModule then function()
			-- upvalues: Tbl (copy), DataResolver (copy)
			table.clear(Tbl)
			DataResolver.clear()
		end else DataResolver.clear,
		dispose = DataResolver.dispose
	}
end