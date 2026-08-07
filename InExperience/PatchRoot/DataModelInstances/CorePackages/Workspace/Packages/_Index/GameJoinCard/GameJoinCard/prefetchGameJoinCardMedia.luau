local contentProviderService = game:GetService("ContentProvider")
local parent = script:FindFirstAncestor("GameJoinCard").Parent
local dataHydrationModule = require(parent.DataHydration)
local dataStatus = dataHydrationModule.DataStatus
local getGameMediaStore = dataHydrationModule.Game.getGameMediaStore
local gameMediaImageType = require(parent.DiscoveryTypes).GameMediaImageType
local signalsModule = require(parent.Signals)
local bannerImageConstantsModule = require(script.Parent.BannerImageConstants)

local function preloadFirstImage(p0) --[[ line: 27 ]]
	-- upvalues: gameMediaImageType (ref), bannerImageConstantsModule (ref), contentProviderService (ref)
	if not p0 then return end
	for i, v in p0 do
		if v.assetTypeId == gameMediaImageType.Image and v.imageId then
			local formattedText = string.format("rbxthumb://type=Asset&id=%s&w=%d&h=%d", tostring(v.imageId), bannerImageConstantsModule.DEFAULT_BANNER_WIDTH, bannerImageConstantsModule.DEFAULT_BANNER_HEIGHT)
			task.spawn(function() --[[ line: 39 ]]
				-- upvalues: contentProviderService (copy), formattedText (ref)
				pcall(function() --[[ line: 40 ]]
					-- upvalues: contentProviderService (copy), formattedText (copy)
					contentProviderService:PreloadAsync({ formattedText })
				end)
			end)
			
			return
		end
	end
end

local function prefetchUniverseMedia(p1) --[[ line: 49 ]]
	-- upvalues: getGameMediaStore (ref), dataStatus (ref), preloadFirstImage (ref), signalsModule (ref)
	local andFetchGameMedia = getGameMediaStore(false).getAndFetchGameMedia(p1)
	local var8 = andFetchGameMedia.status(false)
	
	if var8 == dataStatus.NotReady then
		local var9 = nil
		var9 = signalsModule.createEffect(function(p2) --[[ line: 63 ]]
			-- upvalues: andFetchGameMedia (ref), dataStatus (copy), var9 (write), preloadFirstImage (copy)
			local var10 = andFetchGameMedia.status(p2)
			
			if var10 == dataStatus.NotReady then return end
			if var9 then
				var9()
				var9 = nil
			end
			if var10 == dataStatus.Ready then
				preloadFirstImage(andFetchGameMedia.data(false))
			end
		end)
		
		return
	elseif var8 == dataStatus.Ready then
		preloadFirstImage(andFetchGameMedia.data(false))
	end
end

return function(p3) --[[ line: 78 | named "prefetchGameJoinCardMedia" ]]
	-- upvalues: prefetchUniverseMedia (ref)
	if not p3 then return end
	for i, v in p3 do
		if v.universeId and v.universeId ~= "" then
			prefetchUniverseMedia(tostring(v.universeId))
		end
	end
end