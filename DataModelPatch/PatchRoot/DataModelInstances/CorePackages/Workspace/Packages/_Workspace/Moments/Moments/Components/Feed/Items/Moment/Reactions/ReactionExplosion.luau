local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local MomentsCommonModule = require(Parent.MomentsCommon)
local Reaction = MomentsCommonModule.Components.Reaction
local ReactionExplosionTickerModule = require(script.Parent.reactionExplosionTicker)
local ReactionExplosionMathModule = require(script.Parent.reactionExplosionMath)
local Medium = MomentsCommonModule.Enums.ReactionSize.Medium
local _Color3 = Color3.new(1, 1, 1)
local MemoResult = ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), ReactionExplosionMathModule (copy), _Color3 (copy), Reaction (copy), Medium (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ReactionExplosionMathModule (upval), _Color3 (upval)
		local MapResult = p1.progress:map(function(p2)
			-- upvalues: ReactionExplosionMathModule (upval), p1 (upval)
			return ReactionExplosionMathModule.solveParticle(p2, p1.particle)
		end)
		
		return {
			position = MapResult:map(function(Vector): UDim2
				return UDim2.fromOffset(Vector.x, Vector.y)
			end),
			rotation = MapResult:map(function(p2)
				return p2.rotation
			end),
			scale = MapResult:map(function(p2)
				return p2.scale
			end),
			imageStyle = MapResult:map(function(p2)
				-- upvalues: _Color3 (upval)
				return { Color3 = _Color3, Transparency = p2.transparency }
			end)
		}
	end, { p1.progress, p1.particle })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UseMemoResult.position,
		Rotation = UseMemoResult.rotation,
		Size = UDim2.fromOffset(32, 32)
	}, {
		Glyph = ReactModule.createElement(Reaction, {
			reactionType = p1.reactionType,
			size = Medium,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			scale = UseMemoResult.scale,
			imageStyle = UseMemoResult.imageStyle
		})
	})
end)

return ReactModule.memo(function(p1)
	-- upvalues: ReactionExplosionTickerModule (copy), ReactModule (copy), ReactionExplosionMathModule (copy), MemoResult (copy)
	local Ticker = p1.ticker or ReactionExplosionTickerModule.shared
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ReactionExplosionMathModule (upval)
		return p1.particleCount or math.random(ReactionExplosionMathModule.MIN_PARTICLES, ReactionExplosionMathModule.MAX_PARTICLES)
	end, { p1.particleCount })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), ReactionExplosionMathModule (upval)
		local t = {}
		
		for i = 1, UseMemoResult do
			t[i] = {
				angle = (i - 1) * (6.283185307179586 / UseMemoResult) + (math.random() - 0.5) * ReactionExplosionMathModule.ANGLE_JITTER,
				reach = ReactionExplosionMathModule.MAX_REACH * (ReactionExplosionMathModule.REACH_MIN_FACTOR + math.random() * ReactionExplosionMathModule.REACH_RANGE),
				spin = (ReactionExplosionMathModule.SPIN_MIN + math.random() * ReactionExplosionMathModule.SPIN_RANGE) * (if math.random() < 0.5 then -1 else 1),
				sizeScale = ReactionExplosionMathModule.SIZE_MIN + math.random() * ReactionExplosionMathModule.SIZE_RANGE
			}
		end
		return t
	end, { UseMemoResult })
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseRefResult = ReactModule.useRef(p1.onComplete)
	UseRefResult.current = p1.onComplete
	ReactModule.useLayoutEffect(function()
		-- upvalues: Ticker (copy), ReactionExplosionMathModule (upval), UseBindingResult2 (copy), UseRefResult (copy)
		local v1 = nil
		local Flag = false
		local Callback = nil
		Callback = Ticker.add(function(p2)
			-- upvalues: v1 (ref), ReactionExplosionMathModule (upval), UseBindingResult2 (upval), Flag (ref), Callback (ref), UseRefResult (upval)
			if v1 == nil then
				v1 = p2
			end
			local ClampedValue = math.clamp((p2 - v1) / ReactionExplosionMathModule.DURATION, 0, 1)
			UseBindingResult2(ClampedValue)
			
			if ClampedValue >= 1 and not Flag then
				Flag = true
				Callback()
				local CurrentFunction: () -> () = UseRefResult.current
				
				if CurrentFunction ~= nil then
					CurrentFunction()
				end
			end
		end)
		
		return Callback
	end, { Ticker })
	local Elements = {}
	
	for i, Particle in UseMemoResult1 do
		Elements[`particle_{i}`] = ReactModule.createElement(MemoResult, {
			reactionType = p1.reactionType,
			progress = UseBindingResult,
			particle = Particle
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = p1.position,
		Size = UDim2.fromOffset(0, 0)
	}, Elements)
end)