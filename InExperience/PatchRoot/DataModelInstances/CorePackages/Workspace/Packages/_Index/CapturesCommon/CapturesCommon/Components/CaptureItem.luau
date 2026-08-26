local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local captureTypeModule = require(parent.Enums.CaptureType)
local mediaPlayerModule = require(parent.Components.MediaPlayer)
local _ = require(parent.Types)
local getCropSizeModule = require(parent.Utils.getCropSize)
local getFitSizeModule = require(parent.Utils.getFitSize)
local fFlagUseRbxStorageInCapturesCommonModule = require(parent.Flags.FFlagUseRbxStorageInCapturesCommon)

return function(p1)
	-- upvalues: reactModule (ref), getFitSizeModule (ref), getCropSizeModule (ref), captureTypeModule (ref), fFlagUseRbxStorageInCapturesCommonModule (ref), mediaPlayerModule (ref)
	local var1, var2 = reactModule.useState(Vector2.new(0, 0))
	local var3, var4 = reactModule.useState(Vector2.new(0, 0))
	local var5, var6 = reactModule.useState(UDim2.fromScale(1, 1))
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref)
		var4(p2.Resolution)
	end, {})
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref)
		var2(p2.AbsoluteSize)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var6 (ref), getFitSizeModule (copy), var1 (ref), var3 (ref), getCropSizeModule (copy)
		if p1.scaleType == Enum.ScaleType.Fit then
			var6(getFitSizeModule(var1, var3))
			
			return
		end
		var6(getCropSizeModule(var1, var3))
	end, { var1, var3 })
	
	return reactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Image = if p1.capture.type == captureTypeModule.Screenshot then p1.capture.contentId elseif fFlagUseRbxStorageInCapturesCommonModule then p1.capture.thumbnailKey else nil,
		ScaleType = p1.scaleType or Enum.ScaleType.Crop,
		Size = UDim2.fromScale(1, 1),
		[reactModule.Change.AbsoluteSize] = if not fFlagUseRbxStorageInCapturesCommonModule then var8 else nil,
		[reactModule.Event.Activated] = p1.onActivated
	}, {
		Overlay = p1.overlay,
		VideoPreview = if fFlagUseRbxStorageInCapturesCommonModule and p1.capture.type == captureTypeModule.Video and (p1.shouldUseMediaPlayer and p1.mediaPlayerProps) then reactModule.createElement(mediaPlayerModule, p1.mediaPlayerProps) elseif fFlagUseRbxStorageInCapturesCommonModule or p1.capture.type ~= captureTypeModule.Video then nil elseif p1.shouldUseMediaPlayer and p1.mediaPlayerProps then reactModule.createElement(mediaPlayerModule, p1.mediaPlayerProps) else reactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Playing = p1.isVideoPlaying == true,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = var5,
			Video = p1.capture.contentId,
			[reactModule.Event.Loaded] = var7
		})
	})
end