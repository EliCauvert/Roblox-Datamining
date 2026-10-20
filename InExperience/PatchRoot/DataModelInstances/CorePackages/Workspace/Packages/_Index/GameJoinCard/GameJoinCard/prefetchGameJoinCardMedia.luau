local ContentProvider = game:GetService("ContentProvider")
local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local DataHydrationModule = require(Parent.DataHydration)
local DataStatus = DataHydrationModule.DataStatus
local GetGameMediaStoreFunction = DataHydrationModule.Game.getGameMediaStore
local GameMediaImageType = require(Parent.DiscoveryTypes).GameMediaImageType
local SignalsModule = require(Parent.Signals)
local FoundationModule = require(Parent.Foundation)
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailType = FoundationModule.Enums.ThumbnailType
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize
local BannerImageConstantsModule = require(script.Parent.BannerImageConstants)
local FFlagMobileGameJoinCardThumbnailModule = require(script.Parent.Flags.FFlagMobileGameJoinCardThumbnail)

local function preloadFirstImage(DataResult)
	-- upvalues: GameMediaImageType (copy), BannerImageConstantsModule (copy), ContentProvider (copy)
	if not DataResult then return end
	for _, value in DataResult do
		if value.assetTypeId == GameMediaImageType.Image and value.imageId then
			local Formatted = string.format("rbxthumb://type=Asset&id=%s&w=%d&h=%d", tostring(value.imageId), BannerImageConstantsModule.DEFAULT_BANNER_WIDTH, BannerImageConstantsModule.DEFAULT_BANNER_HEIGHT)
			task.spawn(function()
				-- upvalues: ContentProvider (upval), Formatted (copy)
				pcall(function()
					-- upvalues: ContentProvider (upval), Formatted (upval)
					ContentProvider:PreloadAsync({ Formatted })
				end)
			end)
			break
		end
	end
end

local function prefetchUniverseMedia(p1)
	-- upvalues: GetGameMediaStoreFunction (copy), DataStatus (copy), preloadFirstImage (copy), SignalsModule (copy)
	local AndFetchGameMedia = GetGameMediaStoreFunction(false).getAndFetchGameMedia(p1)
	local StatusResult = AndFetchGameMedia.status(false)
	
	if StatusResult == DataStatus.NotReady then
		local Callback = nil
		Callback = SignalsModule.createEffect(function(p2)
			-- upvalues: AndFetchGameMedia (copy), DataStatus (upval), Callback (ref), preloadFirstImage (upval)
			local StatusResult = AndFetchGameMedia.status(p2)
			
			if StatusResult == DataStatus.NotReady then return end
			if Callback then
				Callback()
				Callback = nil
			end
			if StatusResult == DataStatus.Ready then
				preloadFirstImage(AndFetchGameMedia.data(false))
			end
		end)
		
		return
	end
	if StatusResult == DataStatus.Ready then
		preloadFirstImage(AndFetchGameMedia.data(false))
	end
end

local function _(p1, p2)
	-- upvalues: ContentProvider (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy)
	local P4 = p2 or ContentProvider
	local RbxThumb = GetRbxThumbFunction(ThumbnailType.GameIcon, p1, ThumbnailSize.Medium)
	task.spawn(function()
		-- upvalues: P4 (copy), RbxThumb (copy)
		pcall(function()
			-- upvalues: P4 (upval), RbxThumb (upval)
			P4:PreloadAsync({ RbxThumb })
		end)
	end)
end

return function(List, p1)
	-- upvalues: FFlagMobileGameJoinCardThumbnailModule (copy), ContentProvider (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy), prefetchUniverseMedia (copy)
	if not List then return end
	for _, value in List do
		if value.universeId and value.universeId ~= "" then
			if FFlagMobileGameJoinCardThumbnailModule then
				local P6 = p1 or ContentProvider
				local RbxThumb = GetRbxThumbFunction(ThumbnailType.GameIcon, tostring(value.universeId), ThumbnailSize.Medium)
				task.spawn(function()
					-- upvalues: P6 (copy), RbxThumb (copy)
					pcall(function()
						-- upvalues: P6 (upval), RbxThumb (upval)
						P6:PreloadAsync({ RbxThumb })
					end)
				end)
			end
			prefetchUniverseMedia((tostring(value.universeId)))
		end
	end
end