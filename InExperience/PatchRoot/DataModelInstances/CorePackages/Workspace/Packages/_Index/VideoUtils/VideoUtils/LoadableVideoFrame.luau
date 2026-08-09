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
local fFlagLuaAppVideoFrameSingleTilePooling = require(parent.SharedFlags).FFlagLuaAppVideoFrameSingleTilePooling
local fFlagLuaAppHomePageFirstImageLoadObserver = require(parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver

local function LoadableVideoFrame(p0, p1) --[[ line: 37 ]]
	-- upvalues: reactModule (ref), fFlagLuaAppEdpMediaGalleryAutoAdvance (ref), fFlagLuaAppEdpMediaGalleryFullScreen (ref), argCheckModule (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), fFlagLuaAppVideoFrameSingleTilePooling (ref), videoFrameWrapperModule (ref), loadableImage (ref), skeleton (ref), radius (ref)
	local var6, var7 = reactModule.useState(false)
	local var8 = if fFlagLuaAppEdpMediaGalleryAutoAdvance or fFlagLuaAppEdpMediaGalleryFullScreen then nil else reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	
	if p0.shouldStartPlayback and var9.current == nil then
		var9.current = tick()
	elseif not p0.shouldStartPlayback then
		var9.current = nil
	end
	local var16
	local var10 = p0.thumbnail ~= nil and p0.thumbnail ~= ""
	local useCallback = reactModule.useCallback
	useCallback = useCallback(function() --[[ line: 55 ]]
		-- upvalues: fFlagLuaAppEdpMediaGalleryAutoAdvance (copy), fFlagLuaAppEdpMediaGalleryFullScreen (copy), p1 (ref), var8 (ref), argCheckModule (copy), var9 (ref), p0 (ref), var7 (ref)
		local current = nil
		
		if not fFlagLuaAppEdpMediaGalleryAutoAdvance and not fFlagLuaAppEdpMediaGalleryFullScreen then
			current = var8.current
		elseif typeof(p1) == "table" then
			current = p1.current
		else
			warn(`unsupported ref type: {typeof(p1)}`)
		end
		if current ~= nil then
			local currentTime = tick()
			argCheckModule.assert(var9.current and var9.current <= currentTime)
			local var18 = if var9.current and var9.current <= currentTime then currentTime - var9.current else -1
			
			if p0.onVideoLoaded then
				p0.onVideoLoaded(current.TimeLength, var18)
			end
			var7(true)
		end
	end, {
		p0.onVideoLoaded,
		if fFlagLuaAppEdpMediaGalleryAutoAdvance or fFlagLuaAppEdpMediaGalleryFullScreen then p1 else var8,
		var9
	})
	local var11 = if fFlagLuaAppEdpMediaGalleryAutoAdvance then reactModule.useCallback(function() --[[ line: 92 ]]
		-- upvalues: p0 (ref)
		if p0.onVideoEnded then
			p0.onVideoEnded()
		end
	end, { p0.onVideoEnded }) else nil
	local var12 = reactModule.useCallback(function() --[[ line: 99 ]]
		-- upvalues: p0 (ref)
		if p0.onVideoLooped then
			p0.onVideoLooped()
		end
	end, { p0.onVideoLooped })
	local createElement = reactModule.createElement
	local var13 = "Frame"
	local t = {
		[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true
	}
	local t_1 = {}
	
	if fFlagLuaAppVideoFrameSingleTilePooling or p0.shouldStartPlayback then
		var16 = reactModule.createElement
		var16 = var16(videoFrameWrapperModule, {
			zIndex = 4,
			videoFrameRef = if fFlagLuaAppEdpMediaGalleryAutoAdvance or fFlagLuaAppEdpMediaGalleryFullScreen then p1 else var8,
			video = p0.video,
			isPlaying = if fFlagLuaAppVideoFrameSingleTilePooling then p0.shouldStartPlayback else nil,
			looped = p0.looped,
			volume = if p0.muted then 0 else nil,
			onLoaded = useCallback,
			onLooped = var12,
			onEnded = if fFlagLuaAppEdpMediaGalleryAutoAdvance then var11 else nil,
			cornerRadius = p0.cornerRadius
		})
	else
		var16 = nil
	end
	local createElement_1
	t_1.VideoFrame = var16
	
	if var10 then
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(loadableImage, {
			BackgroundTransparency = 1,
			showFailedStateWhenLoadingFailed = true,
			useShimmerAnimationWhileLoading = true,
			ZIndex = 2,
			Image = p0.thumbnail,
			Size = UDim2.new(1, 0, 1, if p0.ScaleType == Enum.ScaleType.Tile then p0.cornerRadius else 0),
			cornerRadius = UDim.new(0, p0.cornerRadius),
			ScaleType = p0.ScaleType,
			TileSize = if p0.ScaleType == Enum.ScaleType.Tile and p0.cornerRadius then UDim2.new(1, 0, 1, -p0.cornerRadius) else nil
		})
	else
		createElement_1 = nil
	end
	t_1.VideoThumbnail = createElement_1
	t_1.Skeleton = if p0.shouldStartPlayback and not var6 then reactModule.createElement(skeleton, {
		ZIndex = 3,
		Size = UDim2.fromScale(1, 1),
		radius = if p0.cornerRadius then radius.Medium else nil
	}) else nil
	
	return createElement(var13, t, t_1)
end

return if fFlagLuaAppEdpMediaGalleryAutoAdvance or fFlagLuaAppEdpMediaGalleryFullScreen then reactModule.forwardRef(LoadableVideoFrame) else LoadableVideoFrame