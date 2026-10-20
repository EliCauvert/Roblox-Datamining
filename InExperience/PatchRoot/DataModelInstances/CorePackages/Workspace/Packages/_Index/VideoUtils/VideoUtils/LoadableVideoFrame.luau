local VideoUtils = script:FindFirstAncestor("VideoUtils")
local Parent = VideoUtils.Parent
local VideoFrameWrapperModule = require(VideoUtils.VideoFrameWrapper)
local GetAuthorizedVideoUriModule = require(VideoUtils.getAuthorizedVideoUri)
local ArgCheckModule = require(Parent.ArgCheck)
local LoadableImage = require(Parent.UIBlox).App.Loading.LoadableImage
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local FFlagLuaAppEdpMediaGalleryAutoAdvance = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance
local FFlagLuaAppEdpMediaGalleryFullScreen = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppEdpConsoleMediaGalleryVideo = require(Parent.SharedFlags).FFlagLuaAppEdpConsoleMediaGalleryVideo
local FFlagLuaAppEnableHomepageOneByTwoTile = require(Parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local FFlagLuaAppHomePageFirstImageLoadObserver = require(Parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver
local FFlagLuaAppSduiVideoThumbnail = require(Parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local FFlagLuaAppHomeMomentVideoFallback = require(Parent.SharedFlags).FFlagLuaAppHomeMomentVideoFallback

local function LoadableVideoFrame(Image, p1)
	-- upvalues: ReactModule (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (copy), FFlagLuaAppEnableHomepageOneByTwoTile (copy), ArgCheckModule (copy), FFlagLuaAppHomePageFirstImageLoadObserver (copy), VideoFrameWrapperModule (copy), FFlagLuaAppHomeMomentVideoFallback (copy), GetAuthorizedVideoUriModule (copy), FFlagLuaAppSduiVideoThumbnail (copy), LoadableImage (copy), Skeleton (copy), Radius (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen or FFlagLuaAppEdpConsoleMediaGalleryVideo or FFlagLuaAppEnableHomepageOneByTwoTile then nil else ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	
	if Image.shouldStartPlayback and UseRefResult1.current == nil then
		UseRefResult1.current = tick()
	elseif not Image.shouldStartPlayback then
		UseRefResult1.current = nil
	end
	local IsNotThumbnailMatch: boolean = Image.thumbnail ~= nil and Image.thumbnail ~= ""
	local UseResult = if FFlagLuaAppEdpMediaGalleryAutoAdvance then ReactModule.useCallback(function()
		-- upvalues: Image (copy)
		if Image.onVideoEnded then
			Image.onVideoEnded()
		end
	end, { Image.onVideoEnded }) else nil
	
	return ReactModule.createElement("Frame", {
		[ReactModule.Tag] = if FFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true
	}, {
		VideoFrame = ReactModule.createElement(VideoFrameWrapperModule, {
			zIndex = 4,
			videoFrameRef = if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen or FFlagLuaAppEdpConsoleMediaGalleryVideo or FFlagLuaAppEnableHomepageOneByTwoTile then p1 else UseRefResult,
			video = if FFlagLuaAppHomeMomentVideoFallback then GetAuthorizedVideoUriModule(Image.video, Image.accessContext) else Image.video,
			isPlaying = Image.shouldStartPlayback,
			looped = Image.looped,
			volume = if Image.muted then 0 else nil,
			onLoaded = ReactModule.useCallback(function()
				-- upvalues: FFlagLuaAppEdpMediaGalleryAutoAdvance (upval), FFlagLuaAppEdpMediaGalleryFullScreen (upval), FFlagLuaAppEdpConsoleMediaGalleryVideo (upval), FFlagLuaAppEnableHomepageOneByTwoTile (upval), p1 (copy), UseRefResult (copy), ArgCheckModule (upval), UseRefResult1 (copy), Image (copy), UseStateResult2 (copy)
				local Current = nil
				
				if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen or FFlagLuaAppEdpConsoleMediaGalleryVideo or FFlagLuaAppEnableHomepageOneByTwoTile then
					if typeof(p1) == "table" then
						Current = p1.current
					else
						warn(`unsupported ref type: {typeof(p1)}`)
					end
				else
					Current = UseRefResult.current
				end
				if Current ~= nil then
					local CurrentTime = tick()
					ArgCheckModule.assert(UseRefResult1.current and UseRefResult1.current <= CurrentTime)
					local CurrentTimeDelta: number = if UseRefResult1.current and UseRefResult1.current <= CurrentTime then CurrentTime - UseRefResult1.current else -1
					
					if Image.onVideoLoaded then
						Image.onVideoLoaded(Current.TimeLength, CurrentTimeDelta)
					end
					UseStateResult2(true)
				end
			end, {
				Image.onVideoLoaded,
				if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen or FFlagLuaAppEdpConsoleMediaGalleryVideo or FFlagLuaAppEnableHomepageOneByTwoTile then p1 else UseRefResult,
				UseRefResult1
			}),
			onLooped = ReactModule.useCallback(function()
				-- upvalues: Image (copy)
				if Image.onVideoLooped then
					Image.onVideoLooped()
				end
			end, { Image.onVideoLooped }),
			onEnded = if FFlagLuaAppEdpMediaGalleryAutoAdvance then UseResult else nil,
			cornerRadius = Image.cornerRadius
		}),
		VideoThumbnail = if FFlagLuaAppSduiVideoThumbnail and Image.thumbnailComponentOverride then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1)
		}, { Thumbnail = Image.thumbnailComponentOverride }) elseif IsNotThumbnailMatch then ReactModule.createElement(LoadableImage, {
			BackgroundTransparency = 1,
			showFailedStateWhenLoadingFailed = true,
			useShimmerAnimationWhileLoading = true,
			ZIndex = 2,
			Image = Image.thumbnail,
			Size = UDim2.new(1, 0, 1, if Image.ScaleType == Enum.ScaleType.Tile then Image.cornerRadius else 0),
			cornerRadius = UDim.new(0, Image.cornerRadius),
			ScaleType = Image.ScaleType,
			TileSize = if Image.ScaleType == Enum.ScaleType.Tile and Image.cornerRadius then UDim2.new(1, 0, 1, -Image.cornerRadius) else nil
		}) else nil,
		Skeleton = if Image.shouldStartPlayback and not UseStateResult then ReactModule.createElement(Skeleton, {
			ZIndex = 3,
			Size = UDim2.fromScale(1, 1),
			radius = if Image.cornerRadius then Radius.Medium else nil
		}) else nil
	})
end

return if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen or FFlagLuaAppEdpConsoleMediaGalleryVideo or FFlagLuaAppEnableHomepageOneByTwoTile then ReactModule.forwardRef(LoadableVideoFrame) else LoadableVideoFrame