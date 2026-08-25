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

local function preloadFirstImage(p0)
	-- upvalues: gameMediaImageType (ref), bannerImageConstantsModule (ref), contentProviderService (ref)
	if not p0 then return end
	for i, v in p0 do
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

local function prefetchUniverseMedia(p1)
	-- upvalues: getGameMediaStore (ref), dataStatus (ref), preloadFirstImage (ref), signalsModule (ref)
	local andFetchGameMedia = getGameMediaStore(false).getAndFetchGameMedia(p1)
	local var10 = andFetchGameMedia.status(false)
	
	if var10 == dataStatus.NotReady then
		local var11 = nil
		var11 = signalsModule.createEffect(function(p2)
			-- upvalues: andFetchGameMedia (ref), dataStatus (copy), var11 (write), preloadFirstImage (copy)
			local var12 = andFetchGameMedia.status(p2)
			
			if var12 == dataStatus.NotReady then return end
			if var11 then
				var11()
				var11 = nil
			end
			if var12 == dataStatus.Ready then
				preloadFirstImage(andFetchGameMedia.data(false))
			end
		end)
		
		return
	elseif var10 == dataStatus.Ready then
		preloadFirstImage(andFetchGameMedia.data(false))
	end
end

local function _(p3, p4)
	-- upvalues: contentProviderService (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref)
	p4 = p4 or contentProviderService
	local var14 = getRbxThumb(thumbnailType.GameIcon, p3, thumbnailSize.Medium)
	task.spawn(function()
		-- upvalues: p4 (ref), var14 (ref)
		pcall(function()
			-- upvalues: p4 (copy), var14 (copy)
			p4:PreloadAsync({ var14 })
		end)
	end)
end

return function(p5, p6)
	-- upvalues: fFlagMobileGameJoinCardThumbnailModule (ref), contentProviderService (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), prefetchUniverseMedia (ref)
	if not p5 then return end
	for i, v in p5 do
		if v.universeId and v.universeId ~= "" then
			if fFlagMobileGameJoinCardThumbnailModule then
				p6 = p6 or contentProviderService
				local var16 = getRbxThumb(thumbnailType.GameIcon, tostring(v.universeId), thumbnailSize.Medium)
				task.spawn(function()
					-- upvalues: p6 (ref), var16 (ref)
					pcall(function()
						-- upvalues: p6 (copy), var16 (copy)
						p6:PreloadAsync({ var16 })
					end)
				end)
			end
			prefetchUniverseMedia(tostring(v.universeId))
		end
	end
end