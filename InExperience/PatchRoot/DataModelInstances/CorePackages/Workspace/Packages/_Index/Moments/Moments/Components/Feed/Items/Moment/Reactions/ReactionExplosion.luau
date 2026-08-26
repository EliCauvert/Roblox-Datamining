local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local momentsCommonModule = require(parent.MomentsCommon)
local reaction = momentsCommonModule.Components.Reaction
local reactionSize = momentsCommonModule.Enums.ReactionSize
local reactionExplosionTickerModule = require(script.Parent.reactionExplosionTicker)
local reactionExplosionMathModule = require(script.Parent.reactionExplosionMath)
local medium = reactionSize.Medium
local color3 = Color3.new(1, 1, 1)
local var1 = reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), reactionExplosionMathModule (ref), color3 (ref), reaction (ref), medium (ref)
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactionExplosionMathModule (copy), color3 (copy)
		local var3 = p1.progress:map(function(p2)
			-- upvalues: reactionExplosionMathModule (copy), p1 (copy)
			return reactionExplosionMathModule.solveParticle(p2, p1.particle)
		end)
		
		return {
			position = var3:map(function(p2)
				return UDim2.fromOffset(p2.x, p2.y)
			end),
			rotation = var3:map(function(p2)
				return p2.rotation
			end),
			scale = var3:map(function(p2)
				return p2.scale
			end),
			imageStyle = var3:map(function(p2)
				-- upvalues: color3 (copy)
				return { Color3 = color3, Transparency = p2.transparency }
			end)
		}
	end, { p1.progress, p1.particle })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = var2.position,
		Rotation = var2.rotation,
		Size = UDim2.fromOffset(32, 32)
	}, {
		Glyph = reactModule.createElement(reaction, {
			reactionType = p1.reactionType,
			size = medium,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			scale = var2.scale,
			imageStyle = var2.imageStyle
		})
	})
end)

return reactModule.memo(function(p1)
	-- upvalues: reactionExplosionTickerModule (ref), reactModule (ref), reactionExplosionMathModule (ref), var1 (ref)
	local ticker = p1.ticker or reactionExplosionTickerModule.shared
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactionExplosionMathModule (copy)
		return p1.particleCount or math.random(reactionExplosionMathModule.MIN_PARTICLES, reactionExplosionMathModule.MAX_PARTICLES)
	end, { p1.particleCount })
	local var3 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), reactionExplosionMathModule (copy)
		local t = {}
		
		for i = 1, var2 do
			t[i] = {
				angle = (i - 1) * (6.28318530718 / var2) + (math.random() - 0.5) * reactionExplosionMathModule.ANGLE_JITTER,
				reach = reactionExplosionMathModule.MAX_REACH * (reactionExplosionMathModule.REACH_MIN_FACTOR + math.random() * reactionExplosionMathModule.REACH_RANGE),
				spin = (reactionExplosionMathModule.SPIN_MIN + math.random() * reactionExplosionMathModule.SPIN_RANGE) * (if math.random() < 0.5 then -1 else 1),
				sizeScale = reactionExplosionMathModule.SIZE_MIN + math.random() * reactionExplosionMathModule.SIZE_RANGE
			}
		end
		return t
	end, { var2 })
	local var4, var5 = reactModule.useBinding(0)
	local var6 = reactModule.useRef(p1.onComplete)
	var6.current = p1.onComplete
	reactModule.useLayoutEffect(function()
		-- upvalues: ticker (ref), reactionExplosionMathModule (copy), var5 (ref), var6 (ref)
		local var7 = nil
		local var8 = false
		local var9 = nil
		
		return ticker.add(function(p2)
			-- upvalues: var7 (write), reactionExplosionMathModule (copy), var5 (copy), var8 (write), var9 (write), var6 (copy)
			if var7 == nil then
				var7 = p2
			end
			local clampedValue = math.clamp((p2 - var7) / reactionExplosionMathModule.DURATION, 0, 1)
			var5(clampedValue)
			
			if clampedValue >= 1 and not var8 then
				var8 = true
				var9()
				local current = var6.current
				
				if current ~= nil then
					current()
				end
			end
		end)
	end, { ticker })
	local t = {}
	
	for i, v in var3 do
		t[`particle_{i}`] = reactModule.createElement(var1, {
			reactionType = p1.reactionType,
			progress = var4,
			particle = v
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = p1.position,
		Size = UDim2.fromOffset(0, 0)
	}, t)
end)