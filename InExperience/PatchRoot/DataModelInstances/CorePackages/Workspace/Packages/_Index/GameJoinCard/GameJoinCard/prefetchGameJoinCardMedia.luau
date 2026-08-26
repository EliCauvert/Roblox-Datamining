local contentProviderService = game:GetService("ContentProvider")
local parent = script:FindFirstAncestor("GameJoinCard").Parent
local dataHydrationModule = require(parent.DataHydration)
local dataStatus = dataHydrationModule.DataStatus
local getGameMediaStore = dataHydrationModule.Game.getGameMediaStore
local gameMediaImageType = require(parent.DiscoveryTypes).GameMediaImageType
local signalsModule = require(parent.Signals)
local foundationModule = require(parent.Foundation)
local getRbxThumb = foundationModule.Utility.getRbxThumb
local thumbnailType = foundationModule.Enums.ThumbnailType
local thumbnailSize = foundationModule.Enums.ThumbnailSize
local bannerImageConstantsModule = require(script.Parent.BannerImageConstants)
local fFlagMobileGameJoinCardThumbnailModule = require(script.Parent.Flags.FFlagMobileGameJoinCardThumbnail)

local function preloadFirstImage(p1)
	-- upvalues: gameMediaImageType (ref), bannerImageConstantsModule (ref), contentProviderService (ref)
	if not p1 then return end
	for i, v in p1 do
		if v.assetTypeId == gameMediaImageType.Image and v.imageId then
			local formattedText = string.format("rbxthumb://type=Asset&id=%s&w=%d&h=%d", tostring(v.imageId), bannerImageConstantsModule.DEFAULT_BANNER_WIDTH, bannerImageConstantsModule.DEFAULT_BANNER_HEIGHT)
			task.spawn(function()
				-- upvalues: contentProviderService (copy), formattedText (ref)
				pcall(function()
					-- upvalues: contentProviderService (copy), formattedText (copy)
					contentProviderService:PreloadAsync({ formattedText })
				end)
			end)
			
			return
		end
	end
end

local function prefetchUniverseMedia(p2)
	-- upvalues: getGameMediaStore (ref), dataStatus (ref), preloadFirstImage (ref), signalsModule (ref)
	local andFetchGameMedia = getGameMediaStore(false).getAndFetchGameMedia(p2)
	local var1 = andFetchGameMedia.status(false)
	
	if var1 == dataStatus.NotReady then
		local var2 = nil
		var2 = signalsModule.createEffect(function(p3)
			-- upvalues: andFetchGameMedia (ref), dataStatus (copy), var2 (write), preloadFirstImage (copy)
			local var3 = andFetchGameMedia.status(p3)
			
			if var3 == dataStatus.NotReady then return end
			if var2 then
				var2()
				var2 = nil
			end
			if var3 == dataStatus.Ready then
				preloadFirstImage(andFetchGameMedia.data(false))
			end
		end)
		
		return
	elseif var1 == dataStatus.Ready then
		preloadFirstImage(andFetchGameMedia.data(false))
	end
end

local function _(p2, p3)
	-- upvalues: contentProviderService (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref)
	p3 = p3 or contentProviderService
	local var1 = getRbxThumb(thumbnailType.GameIcon, p2, thumbnailSize.Medium)
	task.spawn(function()
		-- upvalues: p3 (ref), var1 (ref)
		pcall(function()
			-- upvalues: p3 (copy), var1 (copy)
			p3:PreloadAsync({ var1 })
		end)
	end)
end

return function(p2, p3)
	-- upvalues: fFlagMobileGameJoinCardThumbnailModule (ref), contentProviderService (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), prefetchUniverseMedia (ref)
	if not p2 then return end
	for i, v in p2 do
		if v.universeId and v.universeId ~= "" then
			if fFlagMobileGameJoinCardThumbnailModule then
				p3 = p3 or contentProviderService
				local var1 = getRbxThumb(thumbnailType.GameIcon, tostring(v.universeId), thumbnailSize.Medium)
				task.spawn(function()
					-- upvalues: p3 (ref), var1 (ref)
					pcall(function()
						-- upvalues: p3 (copy), var1 (copy)
						p3:PreloadAsync({ var1 })
					end)
				end)
			end
			prefetchUniverseMedia(tostring(v.universeId))
		end
	end
end