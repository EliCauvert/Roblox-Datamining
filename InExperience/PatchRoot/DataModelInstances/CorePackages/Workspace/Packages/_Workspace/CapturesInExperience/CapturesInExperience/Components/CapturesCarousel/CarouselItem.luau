local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local appCommonLibModule = require(parent_1.AppCommonLib)
local capturesCommonModule = require(parent_1.CapturesCommon)
local reactModule = require(parent_1.React)
local robloxAppHooksModule = require(parent_1.RobloxAppHooks)
local UIBloxModule = require(parent_1.UIBlox)
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local memoize = appCommonLibModule.memoize
local useScreenSize = robloxAppHooksModule.useScreenSize
local useStyle = UIBloxModule.Core.Style.useStyle
local captureTypeModule = require(parent.Enums.CaptureType)
local getContentFromObject = capturesCommonModule.Utils.getContentFromObject
local getCaptureSizeModule = require(parent.Utils.getCaptureSize)
local mediaPlayer = capturesCommonModule.Components.MediaPlayer
local _ = require(parent.Types)
local fFlagUseMediaPlayerInCarousel = require(parent_1.SharedFlags).FFlagUseMediaPlayerInCarousel
local fFlagUseRbxstorageInGalleryModule = require(parent.Flags.FFlagUseRbxstorageInGallery)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local var10 = memoize(function(p0, p1)
	local var13 = p0.X / p0.Y
	local x = p1.X
	local floored = math.floor(x / var13)
	
	if p1.Y < floored then
		floored = p1.Y
		x = math.floor(floored * var13)
	end
	return Vector2.new(x, floored)
end)

local function _(p2)
	return UDim2.fromScale(p2, p2)
end

local function getDeleteTransitionTransparency(p3)
	-- upvalues: userGameSettingsService (ref)
	return if userGameSettingsService.ReducedMotion then p3 else 1
end

local function getCapturesItemSize(p4)
	-- upvalues: userGameSettingsService (ref)
	return if userGameSettingsService.ReducedMotion then UDim2.fromScale(1, 1) else UDim2.fromScale(p4, p4)
end

local _ = function(p5, p6)
	local var15 = p5.X / p5.Y
	local var16 = p6.X / var15
	
	return if var16 <= p6.Y then UDim2.fromOffset(p6.X, var16) else UDim2.fromOffset(p6.Y * var15, p6.Y)
end

return function(p7)
	-- upvalues: useStyle (ref), reactModule (ref), useScreenSize (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), getCaptureSizeModule (ref), var10 (ref), userGameSettingsService (ref), getContentFromObject (ref), getCapturesItemSize (ref), fFlagUseMediaPlayerInCarousel (ref), mediaPlayer (ref), fFlagUseRbxstorageInGalleryModule (ref), getDeleteTransitionTransparency (ref)
	local var37
	local var17 = useStyle()
	local itemSize = p7.itemSize
	local var18, var19 = reactModule.useBinding(0)
	local var20, var21 = reactModule.useState(Vector2.new(0, 0))
	local var22 = useScreenSize()
	local var23 = reactModule.useRef(nil)
	local var24 = reactModule.useRef(nil)
	local var25, var26 = reactModule.useState(false)
	local imagePadding = p7.imagePadding
	local itemIndex = p7.itemIndex
	local var27 = reactModule.useCallback(function(p8)
		-- upvalues: var19 (ref)
		var19(p8.AbsolutePosition.X)
	end, { var19 })
	reactModule.useEffect(function()
		-- upvalues: var24 (ref)
		return function()
			-- upvalues: var24 (copy)
			if var24.current then
				var24.current.Video = ""
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), p7 (ref), var21 (ref), itemSize (ref), captureTypeModule (copy), getCaptureSizeModule (copy)
		if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			if p7.capture.CaptureType == Enum.CaptureType.Screenshot then
				var21(itemSize)
			end
			return
		elseif p7.capture.type == captureTypeModule.Video then
			return
		end
		task.spawn(function()
			-- upvalues: getCaptureSizeModule (copy), p7 (copy), var21 (copy), itemSize (copy)
			local var49 = getCaptureSizeModule(p7.capture.contentId)
			
			if var49 then
				var21(var49)
				
				return
			end
			var21(itemSize)
		end)
	end, { itemSize, p7.capture })
	local var28 = reactModule.useCallback(function(p9)
		-- upvalues: var24 (ref), var21 (ref)
		var24.current = p9
		local resolution = p9.Resolution
		var21(Vector2.new(resolution.X, resolution.Y))
	end, {})
	local var29 = reactModule.useCallback(function(p10)
		-- upvalues: itemSize (ref), var22 (ref)
		local var50 = var22.X / 2
		local var51 = p10 + itemSize.X / 2
		local absValue = math.abs(var50 - var51)
		
		return math.sign(var50 - var51), math.min(1, (if absValue < 25 then 0 else absValue - 25) / (itemSize.X - 25))
	end, { itemSize, itemIndex, var22 })
	local var30 = reactModule.useCallback(function(p11)
		-- upvalues: var29 (ref), var10 (copy), var20 (ref), itemSize (ref), p7 (ref)
		local _, var53 = var29(p11)
		local var54 = var10(var20, itemSize)
		
		if var53 == 0 then
			return UDim2.fromOffset(var54.X, var54.Y)
		end
		local var55 = 1 - var53 * (1 - p7.unfocusedSizeMultiplier)
		
		return UDim2.fromOffset(math.floor(var54.X * var55), math.floor(var54.Y * var55))
	end, { var20, itemSize, p7.unfocusedSizeMultiplier, var29 })
	local var31 = reactModule.useCallback(function(p12)
		-- upvalues: var29 (ref), var30 (ref), itemSize (ref), imagePadding (ref)
		local var56, var57 = var29(p12)
		
		return if var57 == 0 then UDim2.fromScale(0.5, 0.5) else UDim2.new(0.5, (itemSize.X / 2 - imagePadding - var30(p12).X.Offset / 2) * var57 * var56, 0.5, 0)
	end, {
		var20, imagePadding, itemSize, var22, var29, var30
	})
	local transparency = var17.Theme.Overlay.Transparency
	local var32 = reactModule.useCallback(function(p13)
		-- upvalues: var29 (ref), transparency (ref)
		local _, var58 = var29(p13)
		
		return 1 - (1 - transparency) * var58
	end, { transparency, var29 })
	local var33 = reactModule.useCallback(function(p14)
		-- upvalues: userGameSettingsService (copy), var32 (ref)
		local absoluteXPosition = p14.absoluteXPosition
		local fadeOutBinding = p14.fadeOutBinding
		
		return if userGameSettingsService.ReducedMotion and fadeOutBinding then 1 elseif fadeOutBinding then math.min(var32(absoluteXPosition), fadeOutBinding) else var32(absoluteXPosition)
	end, { var32 })
	local var34 = reactModule.useCallback(function()
		-- upvalues: p7 (ref), var26 (ref), var25 (ref)
		if p7.onExpandCallback then
			p7.onExpandCallback(p7.itemIndex)
		end
		var26(not var25)
	end, { var25, p7.onExpandCallback, p7.itemIndex })
	local var35 = reactModule.useCallback(function()
		-- upvalues: p7 (ref)
		if p7.onMuteCallback then
			p7.onMuteCallback()
		end
	end, { p7.onMuteCallback })
	local var36 = reactModule.useCallback(function()
		-- upvalues: reactModule (copy)
		return reactModule.createElement("Frame", { Size = UDim2.fromScale(1, 1) })
	end, {})
	
	if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
		var37 = p7.capture.CaptureType == Enum.CaptureType.Screenshot
		var37 = nil
	else
		var37 = p7.capture.type == captureTypeModule.Screenshot
	end
	local var38
	if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
		var38 = p7.capture.CaptureType == Enum.CaptureType.Video
		var38 = nil
	else
		var38 = p7.capture.type == captureTypeModule.Video
	end
	local var46
	local var39 = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then getContentFromObject(p7.capture) else p7.capture.contentId
	local var40 = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then p7.capture else p7.capture.videoCapture
	local createElement = reactModule.createElement
	local var41 = "Frame"
	local t = {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1, 1),
		[reactModule.Change.AbsolutePosition] = var27
	}
	local t_1 = {
		FullScreenOffset = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, if var25 then 16 else 0) })
	}
	local createElement_1 = reactModule.createElement
	local var44 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = if var25 then UDim2.fromScale(0.5, 0.5) else var18:map(var31)
	}
	
	if var25 then
		local var47 = var20.X / var20.Y
		local var48 = var22.X / var47
		var46 = if var48 <= var22.Y then UDim2.fromOffset(var22.X, var48) else UDim2.fromOffset(var22.Y * var47, var22.Y)
	else
		var46 = var18:map(var30)
	end
	t_2.Size = var46
	t_1.CaptureContainer = createElement_1(var44, t_2, {
		CaptureImage = if var37 then reactModule.createElement("ImageLabel", {
			BorderSizePixel = 0,
			ZIndex = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = var17.Theme.BackgroundContrast.Color,
			BackgroundTransparency = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then 0 else 1,
			Image = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then nil else var39,
			ImageContent = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then var39 else nil,
			Position = UDim2.fromScale(0.5, 0.5),
			ScaleType = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then Enum.ScaleType.Fit else Enum.ScaleType.Crop,
			Size = if p7.fadeOutBinding then p7.fadeOutBinding:map(getCapturesItemSize) else UDim2.fromScale(1, 1),
			Visible = var20 ~= Vector2.new(0, 0)
		}) else nil,
		CaptureVideo = if var38 then if fFlagUseMediaPlayerInCarousel then reactModule.createElement(mediaPlayer, {
			BorderSizePixel = 0,
			Looped = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = var17.Theme.BackgroundContrast.Color,
			BackgroundTransparency = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then 0 else 1,
			isOverlayDisabled = not p7.isSelected or p7.isDisabled,
			isTimeHidden = var22.Y < var22.X and (var20.X < var20.Y and not var25),
			onExpandCallback = var34,
			onMuteCallback = var35,
			onLoaded = var28,
			Playing = p7.isSelected and var18:map(function(p16)
				-- upvalues: var29 (ref)
				local _, var60 = var29(p16)
				
				return var60 < 0.5
			end),
			Position = UDim2.fromScale(0.5, 0.5),
			renderOnFailed = var36,
			Size = if p7.fadeOutBinding then p7.fadeOutBinding:map(getCapturesItemSize) else UDim2.fromScale(1, 1),
			VideoContent = getContentFromObject(var40),
			videoRef = var23,
			ZIndex = if var25 then 5 else 1
		}) else reactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Playing = var18:map(function(p15)
				-- upvalues: var29 (ref)
				local _, var59 = var29(p15)
				
				return var59 < 0.5
			end),
			Position = UDim2.fromScale(0.5, 0.5),
			Looped = true,
			Size = if p7.fadeOutBinding then p7.fadeOutBinding:map(getCapturesItemSize) else UDim2.fromScale(1, 1),
			Video = if not fFlagUseRbxstorageInGalleryModule then p7.capture.contentId else nil,
			VideoContent = if fFlagUseRbxstorageInGalleryModule then getContentFromObject(p7.capture.videoCapture) else nil,
			Volume = 0,
			ZIndex = 1,
			[reactModule.Event.Loaded] = var28
		}) else nil,
		Overlay = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = var17.Theme.Overlay.Color,
			BackgroundTransparency = reactModule.joinBindings({
				absoluteXPosition = var18,
				fadeOutBinding = p7.fadeOutBinding
			}):map(var33),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = if p7.fadeOutBinding then p7.fadeOutBinding:map(getCapturesItemSize) else UDim2.fromScale(1, 1)
		}),
		TransitionOverlay = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = var17.Theme.BackgroundContrast.Color,
			BackgroundTransparency = if p7.transitionBinding then p7.transitionBinding:map(getDeleteTransitionTransparency) else 1,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(1, 1)
		}),
		FullScreenBackground = if fFlagUseMediaPlayerInCarousel and var25 then reactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			ZIndex = 4,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = var17.Theme.BackgroundContrast.Color,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(var22.X, var22.Y)
		}) else nil
	})
	
	return createElement(var41, t, t_1)
end