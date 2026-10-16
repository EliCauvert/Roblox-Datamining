local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local MediaPlayerModule = require(Parent.Components.MediaPlayer)
local _ = require(Parent.Types)
local GetCropSizeModule = require(Parent.Utils.getCropSize)
local GetFitSizeModule = require(Parent.Utils.getFitSize)
local FFlagUseRbxStorageInCapturesCommonModule = require(Parent.Flags.FFlagUseRbxStorageInCapturesCommon)

return function(p1) --[[ Line: 25 ]]
	-- upvalues: ReactModule (copy), GetFitSizeModule (copy), GetCropSizeModule (copy), CaptureTypeModule (copy), FFlagUseRbxStorageInCapturesCommonModule (copy), MediaPlayerModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(UDim2.fromScale(1, 1))
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 30 ]]
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(p2.Resolution)
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Frame) --[[ Line: 35 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize)
	end, {})
	ReactModule.useEffect(function() --[[ Line: 39 ]]
		-- upvalues: p1 (copy), UseStateResult2_2 (copy), GetFitSizeModule (upval), UseStateResult (copy), UseStateResult1 (copy), GetCropSizeModule (upval)
		if p1.scaleType == Enum.ScaleType.Fit then
			UseStateResult2_2(GetFitSizeModule(UseStateResult, UseStateResult1))
			
			return
		else
			UseStateResult2_2(GetCropSizeModule(UseStateResult, UseStateResult1))
		end
	end, { UseStateResult, UseStateResult1 })
	
	return ReactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Image = if p1.capture.type == CaptureTypeModule.Screenshot then p1.capture.contentId elseif FFlagUseRbxStorageInCapturesCommonModule then p1.capture.thumbnailKey else nil,
		ScaleType = p1.scaleType or Enum.ScaleType.Crop,
		Size = UDim2.fromScale(1, 1),
		[ReactModule.Change.AbsoluteSize] = if FFlagUseRbxStorageInCapturesCommonModule then nil else UseResult1,
		[ReactModule.Event.Activated] = p1.onActivated
	}, {
		Overlay = p1.overlay,
		VideoPreview = if FFlagUseRbxStorageInCapturesCommonModule and p1.capture.type == CaptureTypeModule.Video and p1.shouldUseMediaPlayer and p1.mediaPlayerProps then ReactModule.createElement(MediaPlayerModule, p1.mediaPlayerProps) elseif FFlagUseRbxStorageInCapturesCommonModule or p1.capture.type ~= CaptureTypeModule.Video then nil elseif p1.shouldUseMediaPlayer and p1.mediaPlayerProps then ReactModule.createElement(MediaPlayerModule, p1.mediaPlayerProps) else ReactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Playing = p1.isVideoPlaying == true,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UseStateResult3,
			Video = p1.capture.contentId,
			[ReactModule.Event.Loaded] = UseResult
		})
	})
end