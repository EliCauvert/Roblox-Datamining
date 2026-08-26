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
local var1 = memoize(function(p1, p2)
	local var2 = p1.X / p1.Y
	local x = p2.X
	local floored = math.floor(x / var2)
	
	if p2.Y < floored then
		floored = p2.Y
		x = math.floor(floored * var2)
	end
	return Vector2.new(x, floored)
end)

local function _(p1)
	return UDim2.fromScale(p1, p1)
end

local function getDeleteTransitionTransparency(p1)
	-- upvalues: userGameSettingsService (ref)
	return if userGameSettingsService.ReducedMotion then p1 else 1
end

local function getCapturesItemSize(p1)
	-- upvalues: userGameSettingsService (ref)
	return if userGameSettingsService.ReducedMotion then UDim2.fromScale(1, 1) else UDim2.fromScale(p1, p1)
end

local _ = function(p1, p2)
	local var2 = p1.X / p1.Y
	local var3 = p2.X / var2
	
	return if var3 <= p2.Y then UDim2.fromOffset(p2.X, var3) else UDim2.fromOffset(p2.Y * var2, p2.Y)
end

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), useScreenSize (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), getCaptureSizeModule (ref), var1 (ref), userGameSettingsService (ref), getContentFromObject (ref), getCapturesItemSize (ref), fFlagUseMediaPlayerInCarousel (ref), mediaPlayer (ref), fFlagUseRbxstorageInGalleryModule (ref), getDeleteTransitionTransparency (ref)
	local var2
	local var3 = useStyle()
	local itemSize = p1.itemSize
	local var4, var5 = reactModule.useBinding(0)
	local var6, var7 = reactModule.useState(Vector2.new(0, 0))
	local var8 = useScreenSize()
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	local var11, var12 = reactModule.useState(false)
	local imagePadding = p1.imagePadding
	local itemIndex = p1.itemIndex
	local var13 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref)
		var5(p2.AbsolutePosition.X)
	end, { var5 })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref)
		return function()
			-- upvalues: var10 (copy)
			if var10.current then
				var10.current.Video = ""
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), p1 (ref), var7 (ref), itemSize (ref), captureTypeModule (copy), getCaptureSizeModule (copy)
		if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			if p1.capture.CaptureType == Enum.CaptureType.Screenshot then
				var7(itemSize)
			end
			return
		elseif p1.capture.type == captureTypeModule.Video then
			return
		end
		task.spawn(function()
			-- upvalues: getCaptureSizeModule (copy), p1 (copy), var7 (copy), itemSize (copy)
			local var14 = getCaptureSizeModule(p1.capture.contentId)
			
			if var14 then
				var7(var14)
				
				return
			end
			var7(itemSize)
		end)
	end, { itemSize, p1.capture })
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var10 (ref), var7 (ref)
		var10.current = p2
		local resolution = p2.Resolution
		var7(Vector2.new(resolution.X, resolution.Y))
	end, {})
	local var15 = reactModule.useCallback(function(p2)
		-- upvalues: itemSize (ref), var8 (ref)
		local var16 = var8.X / 2
		local var17 = p2 + itemSize.X / 2
		local absValue = math.abs(var16 - var17)
		
		return math.sign(var16 - var17), math.min(1, (if absValue < 25 then 0 else absValue - 25) / (itemSize.X - 25))
	end, { itemSize, itemIndex, var8 })
	local var16 = reactModule.useCallback(function(p2)
		-- upvalues: var15 (ref), var1 (copy), var6 (ref), itemSize (ref), p1 (ref)
		local _, var17 = var15(p2)
		local var18 = var1(var6, itemSize)
		
		if var17 == 0 then
			return UDim2.fromOffset(var18.X, var18.Y)
		end
		local var19 = 1 - var17 * (1 - p1.unfocusedSizeMultiplier)
		
		return UDim2.fromOffset(math.floor(var18.X * var19), math.floor(var18.Y * var19))
	end, { var6, itemSize, p1.unfocusedSizeMultiplier, var15 })
	local var17 = reactModule.useCallback(function(p2)
		-- upvalues: var15 (ref), var16 (ref), itemSize (ref), imagePadding (ref)
		local var18, var19 = var15(p2)
		
		return if var19 == 0 then UDim2.fromScale(0.5, 0.5) else UDim2.new(0.5, (itemSize.X / 2 - imagePadding - var16(p2).X.Offset / 2) * var19 * var18, 0.5, 0)
	end, {
		var6, imagePadding, itemSize, var8, var15, var16
	})
	local transparency = var3.Theme.Overlay.Transparency
	local var18 = reactModule.useCallback(function(p2)
		-- upvalues: var15 (ref), transparency (ref)
		local _, var19 = var15(p2)
		
		return 1 - (1 - transparency) * var19
	end, { transparency, var15 })
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: userGameSettingsService (copy), var18 (ref)
		local absoluteXPosition = p2.absoluteXPosition
		local fadeOutBinding = p2.fadeOutBinding
		
		return if userGameSettingsService.ReducedMotion and fadeOutBinding then 1 elseif fadeOutBinding then math.min(var18(absoluteXPosition), fadeOutBinding) else var18(absoluteXPosition)
	end, { var18 })
	local var20 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var12 (ref), var11 (ref)
		if p1.onExpandCallback then
			p1.onExpandCallback(p1.itemIndex)
		end
		var12(not var11)
	end, { var11, p1.onExpandCallback, p1.itemIndex })
	local var21 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.onMuteCallback then
			p1.onMuteCallback()
		end
	end, { p1.onMuteCallback })
	local var22 = reactModule.useCallback(function()
		-- upvalues: reactModule (copy)
		return reactModule.createElement("Frame", { Size = UDim2.fromScale(1, 1) })
	end, {})
	
	if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
		var2 = p1.capture.CaptureType == Enum.CaptureType.Screenshot
		var2 = nil
	else
		var2 = p1.capture.type == captureTypeModule.Screenshot
	end
	local var23
	if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
		var23 = p1.capture.CaptureType == Enum.CaptureType.Video
		var23 = nil
	else
		var23 = p1.capture.type == captureTypeModule.Video
	end
	local var24
	local var25 = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then getContentFromObject(p1.capture) else p1.capture.contentId
	local var26 = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then p1.capture else p1.capture.videoCapture
	local createElement = reactModule.createElement
	local var27 = "Frame"
	local t = {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1, 1),
		[reactModule.Change.AbsolutePosition] = var13
	}
	local t_1 = {
		FullScreenOffset = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, if var11 then 16 else 0) })
	}
	local createElement_1 = reactModule.createElement
	local var28 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = if var11 then UDim2.fromScale(0.5, 0.5) else var4:map(var17)
	}
	
	if var11 then
		local var29 = var6.X / var6.Y
		local var30 = var8.X / var29
		var24 = if var30 <= var8.Y then UDim2.fromOffset(var8.X, var30) else UDim2.fromOffset(var8.Y * var29, var8.Y)
	else
		var24 = var4:map(var16)
	end
	t_2.Size = var24
	t_1.CaptureContainer = createElement_1(var28, t_2, {
		CaptureImage = if var2 then reactModule.createElement("ImageLabel", {
			BorderSizePixel = 0,
			ZIndex = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = var3.Theme.BackgroundContrast.Color,
			BackgroundTransparency = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then 0 else 1,
			Image = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then nil else var25,
			ImageContent = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then var25 else nil,
			Position = UDim2.fromScale(0.5, 0.5),
			ScaleType = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then Enum.ScaleType.Fit else Enum.ScaleType.Crop,
			Size = if p1.fadeOutBinding then p1.fadeOutBinding:map(getCapturesItemSize) else UDim2.fromScale(1, 1),
			Visible = var6 ~= Vector2.new(0, 0)
		}) else nil,
		CaptureVideo = if var23 then if fFlagUseMediaPlayerInCarousel then reactModule.createElement(mediaPlayer, {
			BorderSizePixel = 0,
			Looped = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = var3.Theme.BackgroundContrast.Color,
			BackgroundTransparency = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then 0 else 1,
			isOverlayDisabled = not p1.isSelected or p1.isDisabled,
			isTimeHidden = var8.Y < var8.X and (var6.X < var6.Y and not var11),
			onExpandCallback = var20,
			onMuteCallback = var21,
			onLoaded = var14,
			Playing = p1.isSelected and var4:map(function(p2)
				-- upvalues: var15 (ref)
				local _, var31 = var15(p2)
				
				return var31 < 0.5
			end),
			Position = UDim2.fromScale(0.5, 0.5),
			renderOnFailed = var22,
			Size = if p1.fadeOutBinding then p1.fadeOutBinding:map(getCapturesItemSize) else UDim2.fromScale(1, 1),
			VideoContent = getContentFromObject(var26),
			videoRef = var9,
			ZIndex = if var11 then 5 else 1
		}) else reactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Playing = var4:map(function(p2)
				-- upvalues: var15 (ref)
				local _, var31 = var15(p2)
				
				return var31 < 0.5
			end),
			Position = UDim2.fromScale(0.5, 0.5),
			Looped = true,
			Size = if p1.fadeOutBinding then p1.fadeOutBinding:map(getCapturesItemSize) else UDim2.fromScale(1, 1),
			Video = if not fFlagUseRbxstorageInGalleryModule then p1.capture.contentId else nil,
			VideoContent = if fFlagUseRbxstorageInGalleryModule then getContentFromObject(p1.capture.videoCapture) else nil,
			Volume = 0,
			ZIndex = 1,
			[reactModule.Event.Loaded] = var14
		}) else nil,
		Overlay = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = var3.Theme.Overlay.Color,
			BackgroundTransparency = reactModule.joinBindings({
				absoluteXPosition = var4,
				fadeOutBinding = p1.fadeOutBinding
			}):map(var19),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = if p1.fadeOutBinding then p1.fadeOutBinding:map(getCapturesItemSize) else UDim2.fromScale(1, 1)
		}),
		TransitionOverlay = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = var3.Theme.BackgroundContrast.Color,
			BackgroundTransparency = if p1.transitionBinding then p1.transitionBinding:map(getDeleteTransitionTransparency) else 1,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(1, 1)
		}),
		FullScreenBackground = if fFlagUseMediaPlayerInCarousel and var11 then reactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			ZIndex = 4,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = var3.Theme.BackgroundContrast.Color,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(var8.X, var8.Y)
		}) else nil
	})
	
	return createElement(var27, t, t_1)
end