local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)
local waveformAudioModule = require(script.Parent.WaveformAudio)
local useTickClock = require(script.Parent.useTickClock).useTickClock
local BAR_WIDTH = waveformAudioModule.BAR_WIDTH
local ITEM_WIDTH = waveformAudioModule.ITEM_WIDTH
local RENDER_INTERVAL = waveformAudioModule.RENDER_INTERVAL
local t = { itemIdx = 0, height = 0.2, age = nil }

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), ITEM_WIDTH (ref), waveformAudioModule (ref), useTickClock (ref), RENDER_INTERVAL (ref), t (ref), BAR_WIDTH (ref)
	local var1 = p1.normalize == nil or p1.normalize
	local bindBarStyle = p1.bindBarStyle
	local onSample = p1.onSample
	local var2, var3 = reactModule.useState(0)
	local var4 = if p1.isActive and var2 > 0 then math.ceil(var2 / ITEM_WIDTH) + 1 else 0
	local var5, var6 = reactModule.useBinding(0)
	local var7, var8 = reactModule.useBinding(0)
	local var9 = waveformAudioModule.useAudioAnalyzer(p1.audioDeviceInput)
	local var10 = reactModule.useRef(0)
	local var11 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var10 (ref), var6 (ref), var8 (ref)
		table.clear(var11.current)
		var10.current = 0
		var6(0)
		var8(0)
	end, { p1.isActive, var4, var6, var8 })
	useTickClock({
		intervalSec = RENDER_INTERVAL,
		enabled = p1.isActive and var4 > 0,
		onTick = function()
			-- upvalues: var5 (ref), waveformAudioModule (copy), var9 (ref), var10 (ref), var1 (ref), var11 (ref), var4 (ref), var6 (ref), onSample (ref)
			local var12 = var5:getValue() + 1
			local var13 = 0.2 + waveformAudioModule.sampleVolume(var9.current, var10, var1) * 0.8
			local current = var11.current
			current[var12] = { height = var13 }
			current[var12 - var4] = nil
			var6(var12)
			
			if onSample then
				onSample(var12, var13)
			end
		end,
		onFrame = function(p2)
			-- upvalues: var8 (ref)
			var8(p2)
		end
	})
	
	return reactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		[reactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: var2 (ref), var3 (ref)
			local x = p2.AbsoluteSize.X
			
			if x ~= var2 then
				var3(x)
			end
		end
	}, reactModule.useMemo(function()
		-- upvalues: var11 (ref), var4 (ref), ITEM_WIDTH (copy), var5 (ref), t (copy), bindBarStyle (ref), reactModule (copy), var7 (ref), BAR_WIDTH (copy)
		local t_1 = {}
		local current = var11.current
		
		for i = 1, var4 do
			local var12 = var4 - i
			local var13 = (i - 1) * ITEM_WIDTH
			local var14 = var5:map(function(p2)
				-- upvalues: var12 (ref), t (copy), current (ref)
				local var15 = p2 - var12
				
				if var15 <= 0 then
					return t
				end
				local var16 = current[var15]
				
				return if var16 == nil then t else { itemIdx = var15, height = var16.height, age = var12 }
			end)
			local var15 = bindBarStyle(var14)
			t_1["Bar" .. i] = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Position = var7:map(function(p2)
					-- upvalues: var13 (ref), ITEM_WIDTH (copy)
					return UDim2.new(0, var13 - p2 * ITEM_WIDTH, 0.5, 0)
				end),
				AnchorPoint = Vector2.new(0, 0.5),
				Size = var14:map(function(p2)
					-- upvalues: BAR_WIDTH (copy)
					return UDim2.new(0, BAR_WIDTH, p2.height, 0)
				end),
				BackgroundColor3 = var15:map(function(p2)
					return p2.color
				end),
				BackgroundTransparency = var15:map(function(p2)
					return p2.transparency
				end)
			}, {
				Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
			})
		end
		return t_1
	end, { var4, var5, var7, bindBarStyle }))
end)