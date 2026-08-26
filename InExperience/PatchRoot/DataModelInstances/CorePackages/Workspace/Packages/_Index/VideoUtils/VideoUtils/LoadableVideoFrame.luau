local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local videoFrameWrapperModule = require(videoUtils.VideoFrameWrapper)
local argCheckModule = require(parent.ArgCheck)
local loadableImage = require(parent.UIBlox).App.Loading.LoadableImage
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local fFlagLuaAppEdpMediaGalleryAutoAdvance = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance
local fFlagLuaAppEdpMediaGalleryFullScreen = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local fFlagLuaAppEdpConsoleMediaGalleryVideo = require(parent.SharedFlags).FFlagLuaAppEdpConsoleMediaGalleryVideo
local fFlagLuaAppEnableHomepageOneByTwoTile = require(parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppHomePageFirstImageLoadObserver = require(parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver
local fFlagLuaAppSduiVideoThumbnail = require(parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail

local function LoadableVideoFrame(p1, p2)
	-- upvalues: reactModule (ref), fFlagLuaAppEdpMediaGalleryAutoAdvance (ref), fFlagLuaAppEdpMediaGalleryFullScreen (ref), fFlagLuaAppEdpConsoleMediaGalleryVideo (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), argCheckModule (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), videoFrameWrapperModule (ref), fFlagLuaAppSduiVideoThumbnail (ref), loadableImage (ref), skeleton (ref), radius (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = if fFlagLuaAppEdpMediaGalleryAutoAdvance or fFlagLuaAppEdpMediaGalleryFullScreen or (fFlagLuaAppEdpConsoleMediaGalleryVideo or fFlagLuaAppEnableHomepageOneByTwoTile) then nil else reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	
	if p1.shouldStartPlayback and var4.current == nil then
		var4.current = tick()
	elseif not p1.shouldStartPlayback then
		var4.current = nil
	end
	local createElement_1
	local var5 = p1.thumbnail ~= nil and p1.thumbnail ~= ""
	local useCallback = reactModule.useCallback
	useCallback = useCallback(function()
		-- upvalues: fFlagLuaAppEdpMediaGalleryAutoAdvance (copy), fFlagLuaAppEdpMediaGalleryFullScreen (copy), fFlagLuaAppEdpConsoleMediaGalleryVideo (copy), fFlagLuaAppEnableHomepageOneByTwoTile (copy), p2 (ref), var3 (ref), argCheckModule (copy), var4 (ref), p1 (ref), var2 (ref)
		local current = nil
		
		if not fFlagLuaAppEdpMediaGalleryAutoAdvance and not fFlagLuaAppEdpMediaGalleryFullScreen and (not fFlagLuaAppEdpConsoleMediaGalleryVideo and not fFlagLuaAppEnableHomepageOneByTwoTile) then
			current = var3.current
		elseif typeof(p2) == "table" then
			current = p2.current
		else
			warn(`unsupported ref type: {typeof(p2)}`)
		end
		if current ~= nil then
			local currentTime = tick()
			argCheckModule.assert(var4.current and var4.current <= currentTime)
			local var6 = if var4.current and var4.current <= currentTime then currentTime - var4.current else -1
			
			if p1.onVideoLoaded then
				p1.onVideoLoaded(current.TimeLength, var6)
			end
			var2(true)
		end
	end, {
		p1.onVideoLoaded,
		if fFlagLuaAppEdpMediaGalleryAutoAdvance or fFlagLuaAppEdpMediaGalleryFullScreen or (fFlagLuaAppEdpConsoleMediaGalleryVideo or fFlagLuaAppEnableHomepageOneByTwoTile) then p2 else var3,
		var4
	})
	local var6 = if fFlagLuaAppEdpMediaGalleryAutoAdvance then reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.onVideoEnded then
			p1.onVideoEnded()
		end
	end, { p1.onVideoEnded }) else nil
	local var7 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.onVideoLooped then
			p1.onVideoLooped()
		end
	end, { p1.onVideoLooped })
	local createElement = reactModule.createElement
	local var8 = "Frame"
	local t = {
		[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true
	}
	local t_1 = {
		VideoFrame = reactModule.createElement(videoFrameWrapperModule, {
			zIndex = 4,
			videoFrameRef = if fFlagLuaAppEdpMediaGalleryAutoAdvance or fFlagLuaAppEdpMediaGalleryFullScreen or (fFlagLuaAppEdpConsoleMediaGalleryVideo or fFlagLuaAppEnableHomepageOneByTwoTile) then p2 else var3,
			video = p1.video,
			isPlaying = p1.shouldStartPlayback,
			looped = p1.looped,
			volume = if p1.muted then 0 else nil,
			onLoaded = useCallback,
			onLooped = var7,
			onEnded = if fFlagLuaAppEdpMediaGalleryAutoAdvance then var6 else nil,
			cornerRadius = p1.cornerRadius
		})
	}
	
	if fFlagLuaAppSduiVideoThumbnail and p1.thumbnailComponentOverride then
		createElement_1 = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1)
		}, { Thumbnail = p1.thumbnailComponentOverride })
	elseif var5 then
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(loadableImage, {
			BackgroundTransparency = 1,
			showFailedStateWhenLoadingFailed = true,
			useShimmerAnimationWhileLoading = true,
			ZIndex = 2,
			Image = p1.thumbnail,
			Size = UDim2.new(1, 0, 1, if p1.ScaleType == Enum.ScaleType.Tile then p1.cornerRadius else 0),
			cornerRadius = UDim.new(0, p1.cornerRadius),
			ScaleType = p1.ScaleType,
			TileSize = if p1.ScaleType == Enum.ScaleType.Tile and p1.cornerRadius then UDim2.new(1, 0, 1, -p1.cornerRadius) else nil
		})
	else
		createElement_1 = nil
	end
	t_1.VideoThumbnail = createElement_1
	t_1.Skeleton = if p1.shouldStartPlayback and not var1 then reactModule.createElement(skeleton, {
		ZIndex = 3,
		Size = UDim2.fromScale(1, 1),
		radius = if p1.cornerRadius then radius.Medium else nil
	}) else nil
	
	return createElement(var8, t, t_1)
end

return if fFlagLuaAppEdpMediaGalleryAutoAdvance or fFlagLuaAppEdpMediaGalleryFullScreen or (fFlagLuaAppEdpConsoleMediaGalleryVideo or fFlagLuaAppEnableHomepageOneByTwoTile) then reactModule.forwardRef(LoadableVideoFrame) else LoadableVideoFrame