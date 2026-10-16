local ReactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)
local ExpChatWaveformStaleWidthFix = game:DefineFastFlag("ExpChatWaveformStaleWidthFix", false)
local WaveformAudioModule = require(script.Parent.WaveformAudio)
local UseTickClockFunction = require(script.Parent.useTickClock).useTickClock
local BARWIDTH = WaveformAudioModule.BAR_WIDTH
local ITEMWIDTH = WaveformAudioModule.ITEM_WIDTH
local RENDERINTERVAL = WaveformAudioModule.RENDER_INTERVAL
local config = { itemIdx = 0, height = 0.2, age = nil }

return ReactModule.memo(function(p1) --[[ Line: 68 | Named "Waveform" ]]
	-- upvalues: ReactModule (copy), ITEMWIDTH (copy), WaveformAudioModule (copy), UseTickClockFunction (copy), RENDERINTERVAL (copy), config (copy), BARWIDTH (copy), ExpChatWaveformStaleWidthFix (copy)
	local NoNormalize = p1.normalize == nil or p1.normalize
	local BindBarStyleFunction = p1.bindBarStyle
	local OnSampleFunction = p1.onSample
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local NewCeiled: number = if p1.isActive and UseStateResult > 0 then math.ceil(UseStateResult / ITEMWIDTH) + 1 else 0
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local UseAudioAnalyzerResult = WaveformAudioModule.useAudioAnalyzer(p1.audioDeviceInput)
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef({})
	ReactModule.useEffect(function() --[[ Line: 84 ]]
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy)
		table.clear(UseRefResult1.current)
		UseRefResult.current = 0
		UseBindingResult2(0)
		UseBindingResult2_1(0)
	end, {
		p1.isActive,
		NewCeiled,
		UseBindingResult2,
		UseBindingResult2_1
	})
	UseTickClockFunction({
		intervalSec = RENDERINTERVAL,
		enabled = p1.isActive and NewCeiled > 0,
		onTick = function() --[[ Line: 94 ]]
			-- upvalues: UseBindingResult (copy), WaveformAudioModule (upval), UseAudioAnalyzerResult (copy), UseRefResult (copy), NoNormalize (copy), UseRefResult1 (copy), NewCeiled (copy), UseBindingResult2 (copy), OnSampleFunction (copy)
			local NewValue = UseBindingResult:getValue() + 1
			local NewSampleVolumeResult = 0.2 + WaveformAudioModule.sampleVolume(UseAudioAnalyzerResult.current, UseRefResult, NoNormalize) * 0.8
			local Current = UseRefResult1.current
			Current[NewValue] = { height = NewSampleVolumeResult }
			Current[NewValue - NewCeiled] = nil
			UseBindingResult2(NewValue)
			
			if OnSampleFunction then
				OnSampleFunction(NewValue, NewSampleVolumeResult)
			end
		end,
		onFrame = function(p2) --[[ Line: 110 ]]
			-- upvalues: UseBindingResult2_1 (copy)
			UseBindingResult2_1(p2)
		end
	})
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		[ReactModule.Change.AbsoluteSize] = function(Frame) --[[ Line: 167 ]]
			-- upvalues: ExpChatWaveformStaleWidthFix (upval), UseStateResult2 (copy), UseStateResult (copy)
			local X = Frame.AbsoluteSize.X
			
			if ExpChatWaveformStaleWidthFix then
				UseStateResult2(X)
				
				return
			end
			if X ~= UseStateResult then
				UseStateResult2(X)
			end
		end
	}, (ReactModule.useMemo(function() --[[ Line: 115 ]]
		-- upvalues: UseRefResult1 (copy), NewCeiled (copy), ITEMWIDTH (upval), UseBindingResult (copy), config (upval), BindBarStyleFunction (copy), ReactModule (upval), UseBindingResult1 (copy), BARWIDTH (upval)
		local Frames = {}
		local Current = UseRefResult1.current
		
		for i = 1, NewCeiled do
			local NewCeiledDelta = NewCeiled - i
			local ScaledI = (i - 1) * ITEMWIDTH
			local MapResult = UseBindingResult:map(function(p2) --[[ Line: 122 ]]
				-- upvalues: NewCeiledDelta (copy), config (upval), Current (copy)
				local ItemIdx = p2 - NewCeiledDelta
				
				if ItemIdx <= 0 then
					return config
				else
					local CurrentEntry = Current[ItemIdx]
					
					return if CurrentEntry == nil then config else {
						itemIdx = ItemIdx,
						height = CurrentEntry.height,
						age = NewCeiledDelta
					}
				end
			end)
			local BindBarStyleResult = BindBarStyleFunction(MapResult)
			Frames["Bar" .. i] = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Position = UseBindingResult1:map(function(p2): UDim2 --[[ Line: 141 ]]
					-- upvalues: ScaledI (copy), ITEMWIDTH (upval)
					return UDim2.new(0, ScaledI - p2 * ITEMWIDTH, 0.5, 0)
				end),
				AnchorPoint = Vector2.new(0, 0.5),
				Size = MapResult:map(function(p2): UDim2 --[[ Line: 145 ]]
					-- upvalues: BARWIDTH (upval)
					return UDim2.new(0, BARWIDTH, p2.height, 0)
				end),
				BackgroundColor3 = BindBarStyleResult:map(function(p2) --[[ Line: 148 ]]
					return p2.color
				end),
				BackgroundTransparency = BindBarStyleResult:map(function(p2) --[[ Line: 151 ]]
					return p2.transparency
				end)
			}, {
				Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
			})
		end
		return Frames
	end, {
		NewCeiled,
		UseBindingResult,
		UseBindingResult1,
		BindBarStyleFunction
	})))
end)