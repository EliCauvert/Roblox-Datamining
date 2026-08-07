local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local captureTypeModule = require(parent.Enums.CaptureType)
local mediaPlayerModule = require(parent.Components.MediaPlayer)
local _ = require(parent.Types)
local getCropSizeModule = require(parent.Utils.getCropSize)
local getFitSizeModule = require(parent.Utils.getFitSize)
local fFlagUseRbxStorageInCapturesCommonModule = require(parent.Flags.FFlagUseRbxStorageInCapturesCommon)

return function(p0) --[[ line: 25 ]]
	-- upvalues: reactModule (ref), getFitSizeModule (ref), getCropSizeModule (ref), captureTypeModule (ref), fFlagUseRbxStorageInCapturesCommonModule (ref), mediaPlayerModule (ref)
	local var6, var7 = reactModule.useState(Vector2.new(0, 0))
	local var8, var9 = reactModule.useState(Vector2.new(0, 0))
	local var10, var11 = reactModule.useState(UDim2.fromScale(1, 1))
	local var12 = reactModule.useCallback(function(p1) --[[ line: 30 ]]
		-- upvalues: var9 (ref)
		var9(p1.Resolution)
	end, {})
	local var13 = reactModule.useCallback(function(p2) --[[ line: 35 ]]
		-- upvalues: var7 (ref)
		var7(p2.AbsoluteSize)
	end, {})
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: p0 (ref), var11 (ref), getFitSizeModule (copy), var6 (ref), var8 (ref), getCropSizeModule (copy)
		if p0.scaleType == Enum.ScaleType.Fit then
			var11(getFitSizeModule(var6, var8))
			
			return
		end
		var11(getCropSizeModule(var6, var8))
	end, { var6, var8 })
	
	return reactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Image = if p0.capture.type == captureTypeModule.Screenshot then p0.capture.contentId elseif fFlagUseRbxStorageInCapturesCommonModule then p0.capture.thumbnailKey else nil,
		ScaleType = p0.scaleType or Enum.ScaleType.Crop,
		Size = UDim2.fromScale(1, 1),
		[reactModule.Change.AbsoluteSize] = if not fFlagUseRbxStorageInCapturesCommonModule then var13 else nil,
		[reactModule.Event.Activated] = p0.onActivated
	}, {
		Overlay = p0.overlay,
		VideoPreview = if fFlagUseRbxStorageInCapturesCommonModule and p0.capture.type == captureTypeModule.Video and (p0.shouldUseMediaPlayer and p0.mediaPlayerProps) then reactModule.createElement(mediaPlayerModule, p0.mediaPlayerProps) elseif fFlagUseRbxStorageInCapturesCommonModule or p0.capture.type ~= captureTypeModule.Video then nil elseif p0.shouldUseMediaPlayer and p0.mediaPlayerProps then reactModule.createElement(mediaPlayerModule, p0.mediaPlayerProps) else reactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Playing = p0.isVideoPlaying == true,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = var10,
			Video = p0.capture.contentId,
			[reactModule.Event.Loaded] = var12
		})
	})
end