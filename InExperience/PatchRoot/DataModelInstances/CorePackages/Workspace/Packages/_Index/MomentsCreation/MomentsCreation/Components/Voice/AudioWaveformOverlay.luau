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

return function(p1)
	-- upvalues: useTokens (ref), useState (ref), useCallback (ref), useMemo (ref), getFIntMomentsTTSWaveformMinBarHeightPercentModule (ref), getFIntMomentsTTSWaveformMaxBarHeightPercentModule (ref), resampleWaveformPeaksModule (ref), reactModule (ref), view (ref)
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
	
	return if p1.videoDuration <= 0 then nil else reactModule.createElement("Frame", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.fromScale(0, 0.5),
		Size = UDim2.new(math.clamp(p1.audioDuration / p1.videoDuration, 0, 1), 0, 1, -4),
		BackgroundColor3 = var1.Color.ActionEmphasis.Background.Color3,
		BackgroundTransparency = 0.4,
		BorderSizePixel = 0,
		ZIndex = 2,
		[reactModule.Change.AbsoluteSize] = var4
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
				-- upvalues: getFIntMomentsTTSWaveformMinBarHeightPercentModule (copy), getFIntMomentsTTSWaveformMaxBarHeightPercentModule (copy), resampleWaveformPeaksModule (copy), samples (ref), var5 (ref), reactModule (copy), var1 (ref)
				local t = {}
				
				for i, v in resampleWaveformPeaksModule(samples, var5, getFIntMomentsTTSWaveformMinBarHeightPercentModule() / 100, getFIntMomentsTTSWaveformMaxBarHeightPercentModule() / 100) do
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
			end, { var5, samples, var1 }))
		})
	})
end