local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local _ = require(CorePackages.Workspace.Packages.AppBlox)
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local _ = require(CorePackages.Workspace.Packages.VideoUtils)
local GameDetailsEvents = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents
local MediaGallerySwipedFunction = GameDetailsEvents.MediaGallerySwiped
local MediaGalleryMediaChangedFunction = GameDetailsEvents.MediaGalleryMediaChanged
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local MediaGallerySnappingModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.ExperienceDetails.MediaGallerySnapping)
local FFlagLuaAppEdpMediaGalleryRedesignIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignIxp
local FFlagLuaAppEdpMediaGalleryVideoPreviewIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp
local FFlagLuaAppEdpMediaGalleryVideoPreview = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local FFlagLuaAppEdpMediaGalleryRedesignTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignTelemetry
local FFlagLuaAppAddUniverseIdToGameDetailsEvents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), ReactModule (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy), MediaGallerySwipedFunction (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy), MediaGalleryMediaChangedFunction (copy), MediaGallerySnappingModule (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy)
	local UseTokensResult = UseTokensFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local Surface0 = UseTokensResult.Color.Surface.Surface_0
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.fromOffset(0, 0))
	local UseResult = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else ReactModule.useCallback(function()
		-- upvalues: p1 (copy), MediaGallerySwipedFunction (upval), UseRoactServiceResult (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (upval)
		if p1.rootPlaceId then
			MediaGallerySwipedFunction(UseRoactServiceResult, "MediaGallerySnappingFull", p1.rootPlaceId, if FFlagLuaAppAddUniverseIdToGameDetailsEvents then { universeId = p1.universeId } else nil)
		end
	end, {
		p1.rootPlaceId,
		UseRoactServiceResult,
		if FFlagLuaAppAddUniverseIdToGameDetailsEvents then p1.universeId else nil
	})
	local UseResult1 = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then ReactModule.useCallback(function(ImageAssetId, VideoAssetId, AutoAdvance)
		-- upvalues: p1 (copy), MediaGalleryMediaChangedFunction (upval), UseRoactServiceResult (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (upval)
		if p1.rootPlaceId then
			MediaGalleryMediaChangedFunction(UseRoactServiceResult, "MediaGallerySnappingFull", p1.rootPlaceId, {
				imageAssetId = ImageAssetId,
				videoAssetId = VideoAssetId,
				autoAdvance = AutoAdvance,
				universeId = if FFlagLuaAppAddUniverseIdToGameDetailsEvents then p1.universeId else nil
			})
		end
	end, {
		p1.rootPlaceId,
		UseRoactServiceResult,
		if FFlagLuaAppAddUniverseIdToGameDetailsEvents then p1.universeId else nil
	}) else nil
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Surface0.Color3,
		BackgroundTransparency = Surface0.Transparency,
		BorderSizePixel = 0,
		[ReactModule.Change.AbsoluteSize] = function(Frame: Frame)
			-- upvalues: UseBindingResult2 (copy)
			local X = Frame.AbsoluteSize.X
			local Y = Frame.AbsoluteSize.Y
			local Floored = math.floor(Y * 1.7777777777777777)
			
			if X < Floored then
				Floored = X
				Y = math.floor(Floored / 1.7777777777777777)
			end
			UseBindingResult2(UDim2.fromOffset(Floored, Y))
		end
	}, {
		FullscreenMediaGallery = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 0,
			Size = UseBindingResult,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}, {
			MediaGallery = ReactModule.createElement(MediaGallerySnappingModule, {
				itemPadding = 0,
				clipsNonCurrentItems = true,
				isFullscreen = true,
				items = p1.items,
				borderRadius = UDim.new(0, 0),
				onVideoPlayActivated = p1.onVideoPlayActivated,
				onSwipe = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else UseResult,
				onMediaGalleryMediaChanged = if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then UseResult1 else nil,
				startIndex = p1.startIndex,
				onFullscreenToggleButtonActivated = p1.exitFullscreen,
				videoPlaybackCoordinator = if FFlagLuaAppEdpMediaGalleryVideoPreview then p1.videoPlaybackCoordinator else nil,
				videoAnalytics = if FFlagLuaAppEdpMediaGalleryVideoPreview then p1.videoAnalytics else nil,
				universeId = p1.universeId,
				mediaGalleryRedesignEnabledIxp = if FFlagLuaAppEdpMediaGalleryRedesignIxp then p1.mediaGalleryRedesignEnabledIxp else nil,
				mediaGalleryVideoPreviewEnabledIxp = if FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then p1.mediaGalleryVideoPreviewEnabledIxp else nil
			})
		})
	})
end)