local ContentProvider = game:GetService("ContentProvider")
local VideoUtils = script:FindFirstAncestor("VideoUtils")
local Parent = VideoUtils.Parent
local EditedVideoFrameModule = require(VideoUtils.EditedVideoFrame)
local VideoFrameWrapperModule = require(VideoUtils.VideoFrameWrapper)
local GetAuthorizedVideoUriModule = require(VideoUtils.getAuthorizedVideoUri)
local ArgCheckModule = require(Parent.ArgCheck)
local LoadableImage = require(Parent.UIBlox).App.Loading.LoadableImage
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local GetVideoEditsModule = require(script.Parent.getVideoEdits)
local FFlagLuaAppEdpMediaGalleryAutoAdvance = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance
local FFlagLuaAppEdpMediaGalleryFullScreen = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppEdpConsoleMediaGalleryVideo = require(Parent.SharedFlags).FFlagLuaAppEdpConsoleMediaGalleryVideo
local FFlagLuaAppEnableHomepageOneByTwoTile = require(Parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local FFlagLuaAppHomePageFirstImageLoadObserver = require(Parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver
local FFlagLuaAppSduiVideoThumbnail = require(Parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local FFlagLuaAppHomeMomentVideoFallback = require(Parent.SharedFlags).FFlagLuaAppHomeMomentVideoFallback
local FFlagLuaAppVideoLoadFailureFallback = require(Parent.SharedFlags).FFlagLuaAppVideoLoadFailureFallback
local FFlagLuaAppVideoPlayerTrimAndMusic = require(Parent.SharedFlags).FFlagLuaAppVideoPlayerTrimAndMusic

local function LoadableVideoFrame(Image, p1)
	-- upvalues: ReactModule (copy), FFlagLuaAppVideoLoadFailureFallback (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (copy), FFlagLuaAppEnableHomepageOneByTwoTile (copy), FFlagLuaAppHomeMomentVideoFallback (copy), GetAuthorizedVideoUriModule (copy), ContentProvider (copy), ArgCheckModule (copy), FFlagLuaAppVideoPlayerTrimAndMusic (copy), GetVideoEditsModule (copy), FFlagLuaAppHomePageFirstImageLoadObserver (copy), EditedVideoFrameModule (copy), VideoFrameWrapperModule (copy), FFlagLuaAppSduiVideoThumbnail (copy), LoadableImage (copy), Skeleton (copy), Radius (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local v1 = nil
	local Callback = nil
	local UseRefResult = nil
	local UseRefResult1 = nil
	
	if FFlagLuaAppVideoLoadFailureFallback then
		v1, Callback = ReactModule.useState(false)
		UseRefResult = ReactModule.useRef(nil)
		UseRefResult1 = ReactModule.useRef(Image.onVideoLoadFailed)
		UseRefResult1.current = Image.onVideoLoadFailed
	end
	local UseRefResult2 = if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen or FFlagLuaAppEdpConsoleMediaGalleryVideo or FFlagLuaAppEnableHomepageOneByTwoTile then nil else ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	
	if Image.shouldStartPlayback and UseRefResult3.current == nil then
		UseRefResult3.current = tick()
	elseif not Image.shouldStartPlayback then
		UseRefResult3.current = nil
	end
	local IsNotThumbnailMatch: boolean = Image.thumbnail ~= nil and Image.thumbnail ~= ""
	local Video = nil
	
	if FFlagLuaAppVideoLoadFailureFallback then
		Video = if FFlagLuaAppHomeMomentVideoFallback then GetAuthorizedVideoUriModule(Image.video, Image.accessContext) else Image.video
		ReactModule.useEffect(function()
			-- upvalues: Callback (ref), Image (copy), Video (ref), UseRefResult (ref), UseRefResult1 (ref), ContentProvider (upval)
			Callback(false)
			
			if Image.shouldStartPlayback and Video ~= "" then
				local Current = { finished = false, failed = false, connection = nil }
				UseRefResult.current = Current
				
				local function onFetchStatus(AssetFetchStatus)
					-- upvalues: Current (copy), Callback (upval), UseRefResult1 (upval)
					if Current.finished or AssetFetchStatus ~= Enum.AssetFetchStatus.Failure and AssetFetchStatus ~= Enum.AssetFetchStatus.TimedOut then return end
					Current.finished = true
					Current.failed = true
					
					if Current.connection then
						Current.connection:Disconnect()
					end
					Callback(true)
					
					if UseRefResult1.current then
						UseRefResult1.current(AssetFetchStatus.Name)
					end
				end
				
				Current.connection = ContentProvider:GetAssetFetchStatusChangedSignal(Video):Connect(onFetchStatus)
				onFetchStatus(ContentProvider:GetAssetFetchStatus(Video))
				
				return function()
					-- upvalues: Current (copy), UseRefResult (upval)
					Current.finished = true
					UseRefResult.current = nil
					
					if Current.connection then
						Current.connection:Disconnect()
					end
				end
			else
				return nil
			end
		end, {
			Video,
			Image.shouldStartPlayback,
			UseRefResult,
			UseRefResult1
		})
	end
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
		VideoFrame = ReactModule.createElement(if FFlagLuaAppVideoPlayerTrimAndMusic and Image.edits then EditedVideoFrameModule else VideoFrameWrapperModule, {
			zIndex = 4,
			videoFrameRef = if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen or FFlagLuaAppEdpConsoleMediaGalleryVideo or FFlagLuaAppEnableHomepageOneByTwoTile then p1 else UseRefResult2,
			video = if FFlagLuaAppVideoLoadFailureFallback then Video elseif FFlagLuaAppHomeMomentVideoFallback then GetAuthorizedVideoUriModule(Image.video, Image.accessContext) else Image.video,
			isPlaying = Image.shouldStartPlayback and (not FFlagLuaAppVideoLoadFailureFallback or not v1),
			looped = Image.looped,
			edits = if FFlagLuaAppVideoPlayerTrimAndMusic then Image.edits else nil,
			volume = if Image.muted then 0 else nil,
			onLoaded = ReactModule.useCallback(function()
				-- upvalues: FFlagLuaAppVideoLoadFailureFallback (upval), UseRefResult (ref), FFlagLuaAppEdpMediaGalleryAutoAdvance (upval), FFlagLuaAppEdpMediaGalleryFullScreen (upval), FFlagLuaAppEdpConsoleMediaGalleryVideo (upval), FFlagLuaAppEnableHomepageOneByTwoTile (upval), p1 (copy), UseRefResult2 (copy), ArgCheckModule (upval), UseRefResult3 (copy), Image (copy), FFlagLuaAppVideoPlayerTrimAndMusic (upval), GetVideoEditsModule (upval), UseStateResult2 (copy)
				if FFlagLuaAppVideoLoadFailureFallback and UseRefResult.current then
					local Current = UseRefResult.current
					
					if Current.failed then return end
					Current.finished = true
					
					if Current.connection then
						Current.connection:Disconnect()
					end
				end
				local Sound = nil
				
				if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen or FFlagLuaAppEdpConsoleMediaGalleryVideo or FFlagLuaAppEnableHomepageOneByTwoTile then
					if typeof(p1) == "table" then
						Sound = p1.current
					else
						warn(`unsupported ref type: {typeof(p1)}`)
					end
				else
					Sound = UseRefResult2.current
				end
				if Sound ~= nil then
					local CurrentTime = tick()
					ArgCheckModule.assert(UseRefResult3.current and UseRefResult3.current <= CurrentTime)
					local CurrentTimeDelta: number = if UseRefResult3.current and UseRefResult3.current <= CurrentTime then CurrentTime - UseRefResult3.current else -1
					
					if Image.onVideoLoaded then
						local TimeLength = nil
						if FFlagLuaAppVideoPlayerTrimAndMusic and Image.edits and Image.edits.trim then
							local PlaybackRange, PlaybackRange2 = GetVideoEditsModule.getPlaybackRange(Sound.TimeLength, Image.edits.trim)
							TimeLength = PlaybackRange2 - PlaybackRange
						else
							TimeLength = Sound.TimeLength
						end
						Image.onVideoLoaded(if FFlagLuaAppVideoPlayerTrimAndMusic then TimeLength else Sound.TimeLength, CurrentTimeDelta)
					end
					UseStateResult2(true)
				end
			end, {
				Image.onVideoLoaded,
				if FFlagLuaAppVideoPlayerTrimAndMusic and Image.edits and Image.edits.trim then Image.edits.trim.startTime else nil,
				if FFlagLuaAppVideoPlayerTrimAndMusic and Image.edits and Image.edits.trim then Image.edits.trim.endTime else nil,
				if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen or FFlagLuaAppEdpConsoleMediaGalleryVideo or FFlagLuaAppEnableHomepageOneByTwoTile then p1 else UseRefResult2,
				UseRefResult3,
				if FFlagLuaAppVideoLoadFailureFallback then UseRefResult else nil
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
		Skeleton = if Image.shouldStartPlayback and not UseStateResult and (not FFlagLuaAppVideoLoadFailureFallback or not v1) then ReactModule.createElement(Skeleton, {
			ZIndex = 3,
			Size = UDim2.fromScale(1, 1),
			radius = if Image.cornerRadius then Radius.Medium else nil
		}) else nil
	})
end

return if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen or FFlagLuaAppEdpConsoleMediaGalleryVideo or FFlagLuaAppEnableHomepageOneByTwoTile then ReactModule.forwardRef(LoadableVideoFrame) else LoadableVideoFrame