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

return function(p0)
	-- upvalues: useTokens (ref), useState (ref), useCallback (ref), useMemo (ref), getFIntMomentsTTSWaveformMinBarHeightPercentModule (ref), getFIntMomentsTTSWaveformMaxBarHeightPercentModule (ref), resampleWaveformPeaksModule (ref), reactModule (ref), view (ref)
	local var6 = useTokens()
	local var7, var8 = useState(0)
	local var9 = useCallback(function(p1)
		-- upvalues: var8 (ref)
		var8(p1.AbsoluteSize.X)
	end, {})
	local var10 = useMemo(function()
		-- upvalues: var7 (ref)
		return if var7 <= 0 then 0 else math.max(1, math.floor((var7 - 8) / 4))
	end, { var7 })
	local samples = p0.samples
	
	return if p0.videoDuration <= 0 then nil else reactModule.createElement("Frame", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.fromScale(0, 0.5),
		Size = UDim2.new(math.clamp(p0.audioDuration / p0.videoDuration, 0, 1), 0, 1, -4),
		BackgroundColor3 = var6.Color.ActionEmphasis.Background.Color3,
		BackgroundTransparency = 0.4,
		BorderSizePixel = 0,
		ZIndex = 2,
		[reactModule.Change.AbsoluteSize] = var9
	}, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 6) }),
		Stroke = reactModule.createElement("UIStroke", {
			Transparency = 0.6,
			Thickness = 1,
			Color = Color3.new(1, 1, 1)
		}),
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
			Bars = reactModule.createElement(reactModule.Fragment, nil, useMemo(function()
				-- upvalues: getFIntMomentsTTSWaveformMinBarHeightPercentModule (copy), getFIntMomentsTTSWaveformMaxBarHeightPercentModule (copy), resampleWaveformPeaksModule (copy), samples (ref), var10 (ref), reactModule (copy), var6 (ref)
				local t = {}
				
				for i, v in resampleWaveformPeaksModule(samples, var10, getFIntMomentsTTSWaveformMinBarHeightPercentModule() / 100, getFIntMomentsTTSWaveformMaxBarHeightPercentModule() / 100) do
					t["bar_" .. i] = reactModule.createElement("Frame", {
						BackgroundTransparency = 0.3,
						BorderSizePixel = 0,
						Size = UDim2.new(0, 2, v, 0),
						BackgroundColor3 = var6.Color.Content.Emphasis.Color3,
						LayoutOrder = i
					}, {
						Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 2) })
					})
				end
				return t
			end, { var10, samples, var6 }))
		})
	})
end