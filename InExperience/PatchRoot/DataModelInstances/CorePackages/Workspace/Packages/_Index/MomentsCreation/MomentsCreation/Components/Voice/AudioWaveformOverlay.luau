local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseStateFunction = ReactModule.useState
local UseMemoFunction = ReactModule.useMemo
local UseCallbackFunction = ReactModule.useCallback
local ResampleWaveformPeaksModule = require(MomentsCreation.Utils.resampleWaveformPeaks)
local GetFIntMomentsTTSWaveformMinBarHeightPercentModule = require(MomentsCreation.Flags.GetFIntMomentsTTSWaveformMinBarHeightPercent)
local GetFIntMomentsTTSWaveformMaxBarHeightPercentModule = require(MomentsCreation.Flags.GetFIntMomentsTTSWaveformMaxBarHeightPercent)
local GetFFlagMomentsTTSStartTimePositioningModule = require(MomentsCreation.Flags.GetFFlagMomentsTTSStartTimePositioning)

return function(p1) --[[ Line: 55 | Named "AudioWaveformOverlay" ]]
	-- upvalues: UseTokensFunction (copy), UseStateFunction (copy), UseCallbackFunction (copy), UseMemoFunction (copy), GetFFlagMomentsTTSStartTimePositioningModule (copy), GetFIntMomentsTTSWaveformMinBarHeightPercentModule (copy), GetFIntMomentsTTSWaveformMaxBarHeightPercentModule (copy), ResampleWaveformPeaksModule (copy), ReactModule (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = UseStateFunction(0)
	local UseCallbackResult = UseCallbackFunction(function(Frame) --[[ Line: 59 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize.X)
	end, {})
	local UseMemoResult = UseMemoFunction(function(): number --[[ Line: 63 ]]
		-- upvalues: UseStateResult (copy)
		return if UseStateResult <= 0 then 0 else math.max(1, (math.floor((UseStateResult - 8) / 4)))
	end, { UseStateResult })
	local Samples = p1.samples
	local Floored: number = if GetFFlagMomentsTTSStartTimePositioningModule and p1.audioDuration > 0 and p1.videoDuration > 0 then math.floor(#Samples * math.clamp((p1.videoDuration - (p1.startTime or 0)) / p1.audioDuration, 0, 1) + 0.5) else #Samples
	local UseMemoResult1 = UseMemoFunction(function() --[[ Line: 81 ]]
		-- upvalues: GetFIntMomentsTTSWaveformMinBarHeightPercentModule (upval), GetFIntMomentsTTSWaveformMaxBarHeightPercentModule (upval), Floored (ref), Samples (copy), ResampleWaveformPeaksModule (upval), UseMemoResult (copy), ReactModule (upval), UseTokensResult (copy)
		local Frames = {}
		local FIntMomentsTTSWaveformMinBarHeightPercentModuleRatio = GetFIntMomentsTTSWaveformMinBarHeightPercentModule() / 100
		local FIntMomentsTTSWaveformMaxBarHeightPercentModuleRatio = GetFIntMomentsTTSWaveformMaxBarHeightPercentModule() / 100
		local Samples1 = if #Samples <= Floored then Samples else table.move(Samples, 1, Floored, 1, {})
		for LayoutOrder, value in ResampleWaveformPeaksModule(Samples1, UseMemoResult, FIntMomentsTTSWaveformMinBarHeightPercentModuleRatio, FIntMomentsTTSWaveformMaxBarHeightPercentModuleRatio) do
			Frames["bar_" .. LayoutOrder] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 0.3,
				BorderSizePixel = 0,
				Size = UDim2.new(0, 2, value, 0),
				BackgroundColor3 = UseTokensResult.Color.Content.Emphasis.Color3,
				LayoutOrder = LayoutOrder
			}, {
				Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 2) })
			})
		end
		return Frames
	end, { UseMemoResult, Samples, Floored, UseTokensResult })
	
	if p1.videoDuration <= 0 then
		return nil
	end
	local XScale = 0
	local ClampedValue = math.clamp(p1.audioDuration / p1.videoDuration, 0, 1)
	local Thickness = 1
	
	if GetFFlagMomentsTTSStartTimePositioningModule then
		XScale = math.clamp((p1.startTime or 0) / p1.videoDuration, 0, 1)
		ClampedValue = math.clamp(p1.audioDuration / p1.videoDuration, 0, 1 - XScale)
		Thickness = 2
	end
	return ReactModule.createElement("Frame", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.fromScale(XScale, 0.5),
		Size = UDim2.new(ClampedValue, 0, 1, 0),
		BackgroundColor3 = UseTokensResult.Color.ActionEmphasis.Background.Color3,
		BackgroundTransparency = 0.4,
		BorderSizePixel = 0,
		ZIndex = 2,
		[ReactModule.Change.AbsoluteSize] = UseCallbackResult
	}, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 6) }),
		Stroke = ReactModule.createElement("UIStroke", {
			Color = Color3.new(1, 1, 1),
			Transparency = if p1.isSelected then 0 else 0.6,
			Thickness = Thickness
		}),
		DragDetector = if GetFFlagMomentsTTSStartTimePositioningModule and p1.dragDetectorRef ~= nil then ReactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
			ref = p1.dragDetectorRef
		}) else nil,
		BarsContainer = ReactModule.createElement(View, {
			tag = "size-full-full clip",
			ZIndex = 1,
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 2),
				SortOrder = Enum.SortOrder.LayoutOrder
			},
			padding = { left = UDim.new(0, 4), right = UDim.new(0, 4) }
		}, {
			Bars = ReactModule.createElement(ReactModule.Fragment, nil, UseMemoResult1)
		})
	})
end