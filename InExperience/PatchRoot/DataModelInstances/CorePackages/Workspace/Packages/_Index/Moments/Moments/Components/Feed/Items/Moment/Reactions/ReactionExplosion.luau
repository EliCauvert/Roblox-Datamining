local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local momentsCommonModule = require(parent.MomentsCommon)
local reaction = momentsCommonModule.Components.Reaction
local reactionSize = momentsCommonModule.Enums.ReactionSize
local reactionExplosionTickerModule = require(script.Parent.reactionExplosionTicker)
local reactionExplosionMathModule = require(script.Parent.reactionExplosionMath)
local medium = reactionSize.Medium
local color3 = Color3.new(1, 1, 1)
local var5 = reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), reactionExplosionMathModule (ref), color3 (ref), reaction (ref), medium (ref)
	local var6 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), reactionExplosionMathModule (copy), color3 (copy)
		local var7 = p0.progress:map(function(p1)
			-- upvalues: reactionExplosionMathModule (copy), p0 (copy)
			return reactionExplosionMathModule.solveParticle(p1, p0.particle)
		end)
		
		return {
			position = var7:map(function(p2)
				return UDim2.fromOffset(p2.x, p2.y)
			end),
			rotation = var7:map(function(p3)
				return p3.rotation
			end),
			scale = var7:map(function(p4)
				return p4.scale
			end),
			imageStyle = var7:map(function(p5)
				-- upvalues: color3 (copy)
				return { Color3 = color3, Transparency = p5.transparency }
			end)
		}
	end, { p0.progress, p0.particle })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = var6.position,
		Rotation = var6.rotation,
		Size = UDim2.fromOffset(32, 32)
	}, {
		Glyph = reactModule.createElement(reaction, {
			reactionType = p0.reactionType,
			size = medium,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			scale = var6.scale,
			imageStyle = var6.imageStyle
		})
	})
end)

return reactModule.memo(function(p6)
	-- upvalues: reactionExplosionTickerModule (ref), reactModule (ref), reactionExplosionMathModule (ref), var5 (ref)
	local ticker = p6.ticker or reactionExplosionTickerModule.shared
	local var9 = reactModule.useMemo(function()
		-- upvalues: p6 (ref), reactionExplosionMathModule (copy)
		return p6.particleCount or math.random(reactionExplosionMathModule.MIN_PARTICLES, reactionExplosionMathModule.MAX_PARTICLES)
	end, { p6.particleCount })
	local var10 = reactModule.useMemo(function()
		-- upvalues: var9 (ref), reactionExplosionMathModule (copy)
		local t = {}
		
		for i = 1, var9 do
			t[i] = {
				angle = (i - 1) * (6.28318530718 / var9) + (math.random() - 0.5) * reactionExplosionMathModule.ANGLE_JITTER,
				reach = reactionExplosionMathModule.MAX_REACH * (reactionExplosionMathModule.REACH_MIN_FACTOR + math.random() * reactionExplosionMathModule.REACH_RANGE),
				spin = (reactionExplosionMathModule.SPIN_MIN + math.random() * reactionExplosionMathModule.SPIN_RANGE) * (if math.random() < 0.5 then -1 else 1),
				sizeScale = reactionExplosionMathModule.SIZE_MIN + math.random() * reactionExplosionMathModule.SIZE_RANGE
			}
		end
		return t
	end, { var9 })
	local var11, var12 = reactModule.useBinding(0)
	local var13 = reactModule.useRef(p6.onComplete)
	var13.current = p6.onComplete
	reactModule.useLayoutEffect(function()
		-- upvalues: ticker (ref), reactionExplosionMathModule (copy), var12 (ref), var13 (ref)
		local var16 = nil
		local var17 = false
		local var18 = nil
		
		return ticker.add(function(p7)
			-- upvalues: var16 (write), reactionExplosionMathModule (copy), var12 (copy), var17 (write), var18 (write), var13 (copy)
			if var16 == nil then
				var16 = p7
			end
			local clampedValue = math.clamp((p7 - var16) / reactionExplosionMathModule.DURATION, 0, 1)
			var12(clampedValue)
			
			if clampedValue >= 1 and not var17 then
				var17 = true
				var18()
				local current = var13.current
				
				if current ~= nil then
					current()
				end
			end
		end)
	end, { ticker })
	local t = {}
	
	for i, v in var10 do
		t[`particle_{i}`] = reactModule.createElement(var5, {
			reactionType = p6.reactionType,
			progress = var11,
			particle = v
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = p6.position,
		Size = UDim2.fromOffset(0, 0)
	}, t)
end)