local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local useState = reactModule.useState
local useMemo = reactModule.useMemo
local useCallback = reactModule.useCallback
local resampleWaveformPeaksModule = require(momentsCreation.Utils.resampleWaveformPeaks)
local getFIntMomentsTTSWaveformMinBarHeightPercentModule = require(momentsCreation.Flags.GetFIntMomentsTTSWaveformMinBarHeightPercent)
local getFIntMomentsTTSWaveformMaxBarHeightPercentModule = require(momentsCreation.Flags.GetFIntMomentsTTSWaveformMaxBarHeightPercent)
local getFFlagMomentsTTSStartTimePositioningModule = require(momentsCreation.Flags.GetFFlagMomentsTTSStartTimePositioning)

return function(p1)
	-- upvalues: useTokens (ref), useState (ref), useCallback (ref), useMemo (ref), getFFlagMomentsTTSStartTimePositioningModule (ref), getFIntMomentsTTSWaveformMinBarHeightPercentModule (ref), getFIntMomentsTTSWaveformMaxBarHeightPercentModule (ref), resampleWaveformPeaksModule (ref), reactModule (ref), view (ref)
	local var1 = useTokens()
	local var2, var3 = useState(0)
	local var4 = useCallback(function(p2)
		-- upvalues: var3 (ref)
		var3(p2.AbsoluteSize.X)
	end, {})
	local var5 = useMemo(function()
		-- upvalues: var2 (ref)
		return if var2 <= 0 then 0 else math.max(1, math.floor((var2 - 8) / 4))
	end, { var2 })
	local samples = p1.samples
	local var6 = if getFFlagMomentsTTSStartTimePositioningModule and p1.audioDuration > 0 and p1.videoDuration > 0 then math.floor(#samples * math.clamp((p1.videoDuration - (p1.startTime or 0)) / p1.audioDuration, 0, 1) + 0.5) else #samples
	local var7 = useMemo(function()
		-- upvalues: getFIntMomentsTTSWaveformMinBarHeightPercentModule (copy), getFIntMomentsTTSWaveformMaxBarHeightPercentModule (copy), var6 (write), samples (ref), resampleWaveformPeaksModule (copy), var5 (ref), reactModule (copy), var1 (ref)
		local t = {}
		
		for i, v in resampleWaveformPeaksModule(if #samples <= var6 then samples else table.move(samples, 1, var6, 1, {}), var5, getFIntMomentsTTSWaveformMinBarHeightPercentModule() / 100, getFIntMomentsTTSWaveformMaxBarHeightPercentModule() / 100) do
			t["bar_" .. i] = reactModule.createElement("Frame", {
				BackgroundTransparency = 0.3,
				BorderSizePixel = 0,
				Size = UDim2.new(0, 2, v, 0),
				BackgroundColor3 = var1.Color.Content.Emphasis.Color3,
				LayoutOrder = i
			}, {
				Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 2) })
			})
		end
		return t
	end, { var5, samples, var6, var1 })
	
	if p1.videoDuration <= 0 then
		return nil
	end
	local var8 = 0
	local clampedValue = math.clamp(p1.audioDuration / p1.videoDuration, 0, 1)
	local var9 = 1
	
	if getFFlagMomentsTTSStartTimePositioningModule then
		var8 = math.clamp((p1.startTime or 0) / p1.videoDuration, 0, 1)
		clampedValue = math.clamp(p1.audioDuration / p1.videoDuration, 0, 1 - var8)
		var9 = 2
	end
	return reactModule.createElement("Frame", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.fromScale(var8, 0.5),
		Size = UDim2.new(clampedValue, 0, 1, 0),
		BackgroundColor3 = var1.Color.ActionEmphasis.Background.Color3,
		BackgroundTransparency = 0.4,
		BorderSizePixel = 0,
		ZIndex = 2,
		[reactModule.Change.AbsoluteSize] = var4
	}, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 6) }),
		Stroke = reactModule.createElement("UIStroke", {
			Color = Color3.new(1, 1, 1),
			Transparency = if p1.isSelected then 0 else 0.6,
			Thickness = var9
		}),
		DragDetector = if getFFlagMomentsTTSStartTimePositioningModule and p1.dragDetectorRef ~= nil then reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
			ref = p1.dragDetectorRef
		}) else nil,
		BarsContainer = reactModule.createElement(view, {
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
			Bars = reactModule.createElement(reactModule.Fragment, nil, var7)
		})
	})
end