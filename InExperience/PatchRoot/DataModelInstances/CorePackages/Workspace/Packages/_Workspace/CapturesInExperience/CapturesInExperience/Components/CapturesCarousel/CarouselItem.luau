local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local CapturesCommonModule = require(Parent1.CapturesCommon)
local ReactModule = require(Parent1.React)
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local UseScreenSizeFunction = require(Parent1.RobloxAppHooks).useScreenSize
local UseStyleFunction = require(Parent1.UIBlox).Core.Style.useStyle
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local GetContentFromObjectFunction = CapturesCommonModule.Utils.getContentFromObject
local GetCaptureSizeModule = require(Parent.Utils.getCaptureSize)
local MediaPlayer = CapturesCommonModule.Components.MediaPlayer
local _ = require(Parent.Types)
local FFlagUseMediaPlayerInCarousel = require(Parent1.SharedFlags).FFlagUseMediaPlayerInCarousel
local FFlagUseRbxstorageInGalleryModule = require(Parent.Flags.FFlagUseRbxstorageInGallery)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local MemoizeResult = require(Parent1.AppCommonLib).memoize(function(Vector, Vector1): Vector2 --[[ Line: 33 ]]
	local XRatio = Vector.X / Vector.Y
	local X = Vector1.X
	local Floored = math.floor(X / XRatio)
	
	if Vector1.Y < Floored then
		Floored = Vector1.Y
		X = math.floor(Floored * XRatio)
	end
	return Vector2.new(X, Floored)
end)

local function _(XScale): UDim2 --[[ Line: 47 | Named "getDeleteTransitionSize" ]]
	return UDim2.fromScale(XScale, XScale)
end

local function getDeleteTransitionTransparency(p1) --[[ Line: 51 ]]
	-- upvalues: UserGameSettings (copy)
	return if UserGameSettings.ReducedMotion then p1 else 1
end

local function getCapturesItemSize(XScale): UDim2 --[[ Line: 55 ]]
	-- upvalues: UserGameSettings (copy)
	return if UserGameSettings.ReducedMotion then UDim2.fromScale(1, 1) else UDim2.fromScale(XScale, XScale)
end

local _ = function(Vector, Vector1): UDim2 --[[ Line: 59 | Named "getFullScreenSize" ]]
	local XRatio = Vector.X / Vector.Y
	local XRatio1 = Vector1.X / XRatio
	
	return if XRatio1 <= Vector1.Y then UDim2.fromOffset(Vector1.X, XRatio1) else UDim2.fromOffset(Vector1.Y * XRatio, Vector1.Y)
end

return function(p1) --[[ Line: 85 ]]
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), UseScreenSizeFunction (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureTypeModule (copy), GetCaptureSizeModule (copy), MemoizeResult (copy), UserGameSettings (copy), GetContentFromObjectFunction (copy), getCapturesItemSize (copy), FFlagUseMediaPlayerInCarousel (copy), MediaPlayer (copy), FFlagUseRbxstorageInGalleryModule (copy), getDeleteTransitionTransparency (copy)
	local UseStyleResult = UseStyleFunction()
	local ItemSize = p1.itemSize
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local ImagePadding = p1.imagePadding
	local ItemIndex = p1.itemIndex
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 99 ]]
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.AbsolutePosition.X)
	end, { UseBindingResult2 })
	ReactModule.useEffect(function() --[[ Line: 103 ]]
		-- upvalues: UseRefResult1 (copy)
		return function() --[[ Line: 104 ]]
			-- upvalues: UseRefResult1 (upval)
			if UseRefResult1.current then
				UseRefResult1.current.Video = ""
			end
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 111 ]]
		-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), p1 (copy), UseStateResult2 (copy), ItemSize (copy), CaptureTypeModule (upval), GetCaptureSizeModule (upval)
		if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			if p1.capture.CaptureType == Enum.CaptureType.Screenshot then
				UseStateResult2(ItemSize)
			end
			return
		elseif p1.capture.type ~= CaptureTypeModule.Video then
			task.spawn(function() --[[ Line: 123 ]]
				-- upvalues: GetCaptureSizeModule (upval), p1 (upval), UseStateResult2 (upval), ItemSize (upval)
				local CaptureSizeModule = GetCaptureSizeModule(p1.capture.contentId)
				
				if CaptureSizeModule then
					UseStateResult2(CaptureSizeModule)
					
					return
				else
					UseStateResult2(ItemSize)
				end
			end)
			
			return
		else
		end
	end, { ItemSize, p1.capture })
	local UseResult1 = ReactModule.useCallback(function(Current) --[[ Line: 134 ]]
		-- upvalues: UseRefResult1 (copy), UseStateResult2 (copy)
		UseRefResult1.current = Current
		local Resolution = Current.Resolution
		UseStateResult2(Vector2.new(Resolution.X, Resolution.Y))
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p2) --[[ Line: 140 ]]
		-- upvalues: ItemSize (copy), UseScreenSizeResult (copy)
		local XRatio = UseScreenSizeResult.X / 2
		local NewX = p2 + ItemSize.X / 2
		local Magnitude = math.abs(XRatio - NewX)
		
		return math.sign(XRatio - NewX), (math.min(1, (if Magnitude < 25 then 0 else Magnitude - 25) / (ItemSize.X - 25)))
	end, { ItemSize, ItemIndex, UseScreenSizeResult })
	local UseResult3 = ReactModule.useCallback(function(p2): UDim2 --[[ Line: 158 ]]
		-- upvalues: UseResult2 (copy), MemoizeResult (upval), UseStateResult (copy), ItemSize (copy), p1 (copy)
		local _, UseResultResult2 = UseResult2(p2)
		local MemoizeResultResult = MemoizeResult(UseStateResult, ItemSize)
		
		if UseResultResult2 == 0 then
			return UDim2.fromOffset(MemoizeResultResult.X, MemoizeResultResult.Y)
		else
			local v1 = 1 - UseResultResult2 * (1 - p1.unfocusedSizeMultiplier)
			
			return UDim2.fromOffset(math.floor(MemoizeResultResult.X * v1), (math.floor(MemoizeResultResult.Y * v1)))
		end
	end, {
		UseStateResult,
		ItemSize,
		p1.unfocusedSizeMultiplier,
		UseResult2
	})
	local UseResult4 = ReactModule.useCallback(function(p2): UDim2 --[[ Line: 177 ]]
		-- upvalues: UseResult2 (copy), UseResult3 (copy), ItemSize (copy), ImagePadding (copy)
		local UseResultResult, UseResultResult2 = UseResult2(p2)
		
		return if UseResultResult2 == 0 then UDim2.fromScale(0.5, 0.5) else UDim2.new(0.5, (ItemSize.X / 2 - ImagePadding - UseResult3(p2).X.Offset / 2) * UseResultResult2 * UseResultResult, 0.5, 0)
	end, {
		UseStateResult, ImagePadding, ItemSize, UseScreenSizeResult, UseResult2,
		UseResult3
	})
	local Transparency = UseStyleResult.Theme.Overlay.Transparency
	local UseResult5 = ReactModule.useCallback(function(p2): number --[[ Line: 198 ]]
		-- upvalues: UseResult2 (copy), Transparency (copy)
		local _, UseResultResult2 = UseResult2(p2)
		
		return 1 - (1 - Transparency) * UseResultResult2
	end, { Transparency, UseResult2 })
	local UseResult6 = ReactModule.useCallback(function(p2) --[[ Line: 203 ]]
		-- upvalues: UserGameSettings (upval), UseResult5 (copy)
		local AbsoluteXPosition = p2.absoluteXPosition
		local FadeOutBinding: number = p2.fadeOutBinding
		
		return if UserGameSettings.ReducedMotion and FadeOutBinding then 1 elseif FadeOutBinding then math.min(UseResult5(AbsoluteXPosition), FadeOutBinding) else UseResult5(AbsoluteXPosition)
	end, { UseResult5 })
	local UseResult7 = ReactModule.useCallback(function() --[[ Line: 217 ]]
		-- upvalues: p1 (copy), UseStateResult2_1 (copy), UseStateResult1 (copy)
		if p1.onExpandCallback then
			p1.onExpandCallback(p1.itemIndex)
		end
		UseStateResult2_1(not UseStateResult1)
	end, { UseStateResult1, p1.onExpandCallback, p1.itemIndex })
	local UseResult8 = ReactModule.useCallback(function() --[[ Line: 224 ]]
		-- upvalues: p1 (copy)
		if p1.onMuteCallback then
			p1.onMuteCallback()
		end
	end, { p1.onMuteCallback })
	local UseResult9 = ReactModule.useCallback(function() --[[ Line: 230 ]]
		-- upvalues: ReactModule (upval)
		return (ReactModule.createElement("Frame", { Size = UDim2.fromScale(1, 1) }))
	end, {})
	local IsCaptureTypeMatch: boolean = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then p1.capture.CaptureType == Enum.CaptureType.Screenshot else p1.capture.type == CaptureTypeModule.Screenshot
	local IsCaptureTypeMatch1: boolean = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then p1.capture.CaptureType == Enum.CaptureType.Video else p1.capture.type == CaptureTypeModule.Video
	local ContentFromObject = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then GetContentFromObjectFunction(p1.capture) else p1.capture.contentId
	local Capture = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then p1.capture else p1.capture.videoCapture
	local CreateElementFunction = ReactModule.createElement
	local v1 = "Frame"
	local config = {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1, 1),
		[ReactModule.Change.AbsolutePosition] = UseResult
	}
	local config1 = {
		FullScreenOffset = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, if UseStateResult1 then 16 else 0)
		})
	}
	local CreateElementFunction1 = ReactModule.createElement
	local v2 = "Frame"
	local config2 = {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = if UseStateResult1 then UDim2.fromScale(0.5, 0.5) else UseBindingResult:map(UseResult4)
	}
	local _UDim2 = nil
	
	if UseStateResult1 then
		local XRatio = UseStateResult.X / UseStateResult.Y
		local XRatio1 = UseScreenSizeResult.X / XRatio
		_UDim2 = if XRatio1 <= UseScreenSizeResult.Y then UDim2.fromOffset(UseScreenSizeResult.X, XRatio1) else UDim2.fromOffset(UseScreenSizeResult.Y * XRatio, UseScreenSizeResult.Y)
	else
		_UDim2 = UseBindingResult:map(UseResult3)
	end
	config2.Size = _UDim2
	config1.CaptureContainer = CreateElementFunction1(v2, config2, {
		CaptureImage = if IsCaptureTypeMatch then ReactModule.createElement("ImageLabel", {
			BorderSizePixel = 0,
			ZIndex = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color,
			BackgroundTransparency = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then 0 else 1,
			Image = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then nil else ContentFromObject,
			ImageContent = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then ContentFromObject else nil,
			Position = UDim2.fromScale(0.5, 0.5),
			ScaleType = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then Enum.ScaleType.Fit else Enum.ScaleType.Crop,
			Size = if p1.fadeOutBinding then p1.fadeOutBinding:map(getCapturesItemSize) else UDim2.fromScale(1, 1),
			Visible = UseStateResult ~= Vector2.new(0, 0)
		}) else nil,
		CaptureVideo = if IsCaptureTypeMatch1 then if FFlagUseMediaPlayerInCarousel then ReactModule.createElement(MediaPlayer, {
			BorderSizePixel = 0,
			Looped = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color,
			BackgroundTransparency = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then 0 else 1,
			isOverlayDisabled = not p1.isSelected or p1.isDisabled,
			isTimeHidden = UseScreenSizeResult.Y < UseScreenSizeResult.X and UseStateResult.X < UseStateResult.Y and not UseStateResult1,
			onExpandCallback = UseResult7,
			onMuteCallback = UseResult8,
			onLoaded = UseResult1,
			Playing = p1.isSelected and UseBindingResult:map(function(p2): boolean --[[ Line: 305 ]]
				-- upvalues: UseResult2 (copy)
				local _, UseResultResult2 = UseResult2(p2)
				
				return UseResultResult2 < 0.5
			end),
			Position = UDim2.fromScale(0.5, 0.5),
			renderOnFailed = UseResult9,
			Size = if p1.fadeOutBinding then p1.fadeOutBinding:map(getCapturesItemSize) else UDim2.fromScale(1, 1),
			VideoContent = GetContentFromObjectFunction(Capture),
			videoRef = UseRefResult,
			ZIndex = if UseStateResult1 then 5 else 1
		}) else ReactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Playing = UseBindingResult:map(function(p2): boolean --[[ Line: 321 ]]
				-- upvalues: UseResult2 (copy)
				local _, UseResultResult2 = UseResult2(p2)
				
				return UseResultResult2 < 0.5
			end),
			Position = UDim2.fromScale(0.5, 0.5),
			Looped = true,
			Size = if p1.fadeOutBinding then p1.fadeOutBinding:map(getCapturesItemSize) else UDim2.fromScale(1, 1),
			Video = if FFlagUseRbxstorageInGalleryModule then nil else p1.capture.contentId,
			VideoContent = if FFlagUseRbxstorageInGalleryModule then GetContentFromObjectFunction(p1.capture.videoCapture) else nil,
			Volume = 0,
			ZIndex = 1,
			[ReactModule.Event.Loaded] = UseResult1
		}) else nil,
		Overlay = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = UseStyleResult.Theme.Overlay.Color,
			BackgroundTransparency = ReactModule.joinBindings({
				absoluteXPosition = UseBindingResult,
				fadeOutBinding = p1.fadeOutBinding
			}):map(UseResult6),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = if p1.fadeOutBinding then p1.fadeOutBinding:map(getCapturesItemSize) else UDim2.fromScale(1, 1)
		}),
		TransitionOverlay = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color,
			BackgroundTransparency = if p1.transitionBinding then p1.transitionBinding:map(getDeleteTransitionTransparency) else 1,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(1, 1)
		}),
		FullScreenBackground = if FFlagUseMediaPlayerInCarousel and UseStateResult1 then ReactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			ZIndex = 4,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(UseScreenSizeResult.X, UseScreenSizeResult.Y)
		}) else nil
	})
	
	return CreateElementFunction(v1, config, config1)
end