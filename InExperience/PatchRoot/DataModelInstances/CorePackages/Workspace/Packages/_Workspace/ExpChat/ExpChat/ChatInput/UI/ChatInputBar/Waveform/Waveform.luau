local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)
local waveformAudioModule = require(script.Parent.WaveformAudio)
local useTickClock = require(script.Parent.useTickClock).useTickClock
local BAR_WIDTH = waveformAudioModule.BAR_WIDTH
local ITEM_WIDTH = waveformAudioModule.ITEM_WIDTH
local RENDER_INTERVAL = waveformAudioModule.RENDER_INTERVAL
local t = { itemIdx = 0, height = 0.2, age = nil }

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), ITEM_WIDTH (ref), waveformAudioModule (ref), useTickClock (ref), RENDER_INTERVAL (ref), t (ref), BAR_WIDTH (ref)
	local var3 = p0.normalize == nil or p0.normalize
	local bindBarStyle = p0.bindBarStyle
	local onSample = p0.onSample
	local var4, var5 = reactModule.useState(0)
	local var6 = if p0.isActive and var4 > 0 then math.ceil(var4 / ITEM_WIDTH) + 1 else 0
	local var7, var8 = reactModule.useBinding(0)
	local var9, var10 = reactModule.useBinding(0)
	local var11 = waveformAudioModule.useAudioAnalyzer(p0.audioDeviceInput)
	local var12 = reactModule.useRef(0)
	local var13 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var12 (ref), var8 (ref), var10 (ref)
		table.clear(var13.current)
		var12.current = 0
		var8(0)
		var10(0)
	end, { p0.isActive, var6, var8, var10 })
	useTickClock({
		intervalSec = RENDER_INTERVAL,
		enabled = p0.isActive and var6 > 0,
		onTick = function()
			-- upvalues: var7 (ref), waveformAudioModule (copy), var11 (ref), var12 (ref), var3 (ref), var13 (ref), var6 (ref), var8 (ref), onSample (ref)
			local var14 = var7:getValue() + 1
			local var15 = 0.2 + waveformAudioModule.sampleVolume(var11.current, var12, var3) * 0.8
			local current = var13.current
			current[var14] = { height = var15 }
			current[var14 - var6] = nil
			var8(var14)
			
			if onSample then
				onSample(var14, var15)
			end
		end,
		onFrame = function(p1)
			-- upvalues: var10 (ref)
			var10(p1)
		end
	})
	
	return reactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		[reactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: var4 (ref), var5 (ref)
			local x = p2.AbsoluteSize.X
			
			if x ~= var4 then
				var5(x)
			end
		end
	}, reactModule.useMemo(function()
		-- upvalues: var13 (ref), var6 (ref), ITEM_WIDTH (copy), var7 (ref), t (copy), bindBarStyle (ref), reactModule (copy), var9 (ref), BAR_WIDTH (copy)
		local t_1 = {}
		local current = var13.current
		
		for i = 1, var6 do
			local var17 = var6 - i
			local var18 = (i - 1) * ITEM_WIDTH
			local var19 = var7:map(function(p3)
				-- upvalues: var17 (ref), t (copy), current (ref)
				local var21 = p3 - var17
				
				if var21 <= 0 then
					return t
				end
				local var22 = current[var21]
				
				return if var22 == nil then t else { itemIdx = var21, height = var22.height, age = var17 }
			end)
			local var20 = bindBarStyle(var19)
			t_1["Bar" .. i] = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Position = var9:map(function(p4)
					-- upvalues: var18 (ref), ITEM_WIDTH (copy)
					return UDim2.new(0, var18 - p4 * ITEM_WIDTH, 0.5, 0)
				end),
				AnchorPoint = Vector2.new(0, 0.5),
				Size = var19:map(function(p5)
					-- upvalues: BAR_WIDTH (copy)
					return UDim2.new(0, BAR_WIDTH, p5.height, 0)
				end),
				BackgroundColor3 = var20:map(function(p6)
					return p6.color
				end),
				BackgroundTransparency = var20:map(function(p7)
					return p7.transparency
				end)
			}, {
				Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
			})
		end
		return t_1
	end, { var6, var7, var9, bindBarStyle }))
end)