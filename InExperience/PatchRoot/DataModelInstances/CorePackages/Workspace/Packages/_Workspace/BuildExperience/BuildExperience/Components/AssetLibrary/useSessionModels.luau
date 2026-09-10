local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(script.Parent.AssetLibraryTypes)
local filterAssetTilesModule = require(script.Parent.filterAssetTiles)
local fFlagBuildExperienceAssetLibraryModelApiDevModule = require(buildExperience.Flags.FFlagBuildExperienceAssetLibraryModelApiDev)

local function adaptFirstPage(p1, p2)
	local t = {}
	
	for i, v in p1 do
		local t_1 = {
			path = v.path,
			name = v.name,
			thumbnail = if v.status == "ready" then v.imageUrl else nil
		}
		table.insert(t, {
			assetId = nil,
			assetType = "Model",
			subtitle = nil,
			tileKey = `session-model-{i}`,
			displayName = v.name,
			thumbnail = t_1.thumbnail,
			modelIdentity = t_1,
			onActivated = if p2 == nil then nil else function()
				-- upvalues: p2 (ref), t_1 (ref)
				p2(t_1)
			end
		})
	end
	return t
end

return function(p3)
	-- upvalues: reactModule (ref), fFlagBuildExperienceAssetLibraryModelApiDevModule (ref), creatorAgentChatModule (ref), signalsModule (ref), filterAssetTilesModule (ref), adaptFirstPage (ref)
	local store = p3.store or (reactModule.useMemo(function()
		-- upvalues: fFlagBuildExperienceAssetLibraryModelApiDevModule (copy), p3 (ref), creatorAgentChatModule (copy)
		return if not (not fFlagBuildExperienceAssetLibraryModelApiDevModule or p3.enabled == false or p3.store ~= nil or (p3.sessionId == nil or p3.sessionId == "") and (p3.universeId == nil or p3.universeId == 0)) then creatorAgentChatModule.createMockStore({
			initialSessions = {
				{
					sessionId = if p3.sessionId == nil or p3.sessionId == "" then "asset-library-model-api-dev" else p3.sessionId
				}
			}
		}) else nil
	end, { p3.enabled, p3.sessionId, p3.universeId, p3.store }) or creatorAgentChatModule.getCreatorAgentChatStore())
	local var1, var2 = reactModule.useState(0)
	local var3 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(function(p4)
			return p4 + 1
		end)
	end, {})
	local var4, var5 = reactModule.useState({
		status = "NotReady",
		coverage = "Incomplete",
		nextPageToken = nil,
		assets = {},
		onRetry = var3
	})
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), var5 (ref), var3 (ref), store (ref), signalsModule (copy), filterAssetTilesModule (copy), adaptFirstPage (copy)
		local sessionId = p3.sessionId
		local universeId = p3.universeId
		
		if p3.enabled == false or (sessionId == nil or sessionId == "") and (universeId == nil or universeId == 0) then
			var5({
				status = "Ready",
				coverage = "Incomplete",
				nextPageToken = nil,
				assets = {},
				onRetry = var3
			})
			
			return
		end
		local var6 = false
		var5({
			status = "Loading",
			coverage = "Incomplete",
			nextPageToken = nil,
			assets = {},
			onRetry = var3
		})
		local var7 = nil
		local var8 = nil
		local var9 = nil
		local var10 = nil
		
		local function setFailed()
			-- upvalues: var5 (copy), var3 (copy)
			var5({
				status = "Failed",
				coverage = "Incomplete",
				nextPageToken = nil,
				assets = {},
				onRetry = var3
			})
		end
		
		local function requestModels(p4)
			-- upvalues: var8 (write), store (copy), var10 (write), signalsModule (copy), var6 (write), setFailed (ref), var5 (copy), filterAssetTilesModule (copy), adaptFirstPage (copy), p3 (copy), var3 (copy)
			var8 = store.sessionListModels({ pageSize = 20, sessionId = p4 })
			var10 = signalsModule.createEffect(function(p5)
				-- upvalues: var8 (copy), var6 (copy), setFailed (copy), var5 (copy), filterAssetTilesModule (copy), adaptFirstPage (copy), p3 (copy), var3 (copy)
				local var11 = var8.state(p5)
				
				if var6 or var11.status == "pending" then return end
				if var11.status == "failed" then
					setFailed()
					
					return
				end
				local result = var11.result
				var5({
					status = "Ready",
					coverage = "Incomplete",
					assets = filterAssetTilesModule(adaptFirstPage(if result == nil or typeof(result.models) ~= "table" then {} else result.models, p3.onOpenModel), p3.query),
					nextPageToken = if result ~= nil then nil else result.nextPageToken,
					onRetry = var3
				})
			end)
		end
		
		if sessionId == nil or sessionId == "" then
			var7 = store.sessionFindByUniverse({
				sort = "desc",
				application = "build",
				universeId = universeId
			})
			var9 = signalsModule.createEffect(function(p4)
				-- upvalues: var7 (write), var6 (write), setFailed (ref), var5 (copy), var3 (copy), requestModels (ref)
				local var11 = var7.state(p4)
				
				if var6 or var11.status == "pending" then return end
				if var11.status == "failed" then
					setFailed()
					
					return
				end
				local result = var11.result
				local var12 = (if result == nil or typeof(result.sessions) ~= "table" then {} else result.sessions)[1]
				
				if var12 == nil or typeof(var12.sessionId) ~= "string" then
					var5({
						status = "Ready",
						coverage = "Incomplete",
						nextPageToken = nil,
						assets = {},
						onRetry = var3
					})
					
					return
				end
				requestModels(var12.sessionId)
			end)
		else
			requestModels(sessionId)
		end
		return function()
			-- upvalues: var6 (write), var9 (write), var10 (write), var7 (write), var8 (write)
			var6 = true
			
			if var9 ~= nil then
				var9()
			end
			if var10 ~= nil then
				var10()
			end
			if var7 ~= nil then
				var7.dispose()
			end
			if var8 ~= nil then
				var8.dispose()
			end
		end
	end, {
		p3.enabled, p3.query, p3.sessionId, p3.universeId, p3.onOpenModel, var1,
		store, var3
	})
	
	return var4
end