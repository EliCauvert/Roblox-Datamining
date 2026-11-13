local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local MotionModule = require("./motion")

return function(p1)
	-- upvalues: MotionModule (copy)
	local Host = p1.Host
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	
	return {
		body = function(Callback)
			return if type(Callback) == "function" then Callback() else Callback
		end,
		empty = function(p2, p3, Name)
			-- upvalues: Host (copy), p1 (copy), TypesUDim2 (copy)
			return Host.Frame(p1.props(p2, p3, {
				BackgroundTransparency = 1,
				Name = Name,
				Size = TypesUDim2.fromOffset(0, 0)
			}))
		end,
		revealMotion = function(p2)
			-- upvalues: MotionModule (upval), p1 (copy), Runtime (copy), ReadFunction (copy)
			local LevelResult = MotionModule.level(p1)
			local Reveal = p1.motionTiming("reveal")
			local Fade = p1.motionEase("fade")
			
			local function motion(Callback, Ease, p3)
				-- upvalues: Runtime (upval), p2 (copy), LevelResult (copy), p1 (upval), Reveal (copy), ReadFunction (upval)
				local TweenResult = Runtime.tween(function(Callback): number
					-- upvalues: p2 (upval)
					return if Callback(p2) then 1 else 0
				end, {
					seconds = function(p4)
						-- upvalues: p3 (copy), LevelResult (upval), p1 (upval), Callback (copy), p2 (upval), Reveal (upval)
						return if p3 and LevelResult() == "limited" then p1.metric("motion.reducedFade", p4) else Callback(p4) * (if p2:peek() then Reveal.enter else Reveal.exit)
					end,
					ease = Ease
				})
				
				return function(p4)
					-- upvalues: LevelResult (upval), p3 (copy), ReadFunction (upval), p2 (upval), p1 (upval), TweenResult (copy)
					local LevelResultResult = LevelResult(p4)
					
					return if LevelResultResult == "none" or LevelResultResult == "limited" and not p3 then if ReadFunction(p2, p4) then 1 else 0 else p1.readSource(TweenResult, p4)
				end
			end
			
			local Callback1 = motion(function(): number
				return 1
			end, p1.motionEase("present"), false)
			local Callback = motion(function(p3)
				-- upvalues: p1 (upval)
				return p1.metric("motion.revealFadeShare", p3)
			end, function(p3)
				-- upvalues: LevelResult (copy), Fade (copy)
				return if LevelResult() == "limited" then Fade(p3) else p3
			end, true)
			
			return Callback1, p1.Compose.formula(function(p3): boolean
				-- upvalues: Callback1 (copy)
				return Callback1(p3) <= 0
			end), function(p3): number
				-- upvalues: Callback (copy)
				return 1 - Callback(p3)
			end
		end,
		unroll = function(Callback, p2)
			-- upvalues: TypesEnum (copy)
			return function(p3)
				-- upvalues: Callback (copy), TypesEnum (upval)
				return if Callback(p3) >= 1 then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.None
			end, function(Callback1)
				-- upvalues: Callback (copy), p2 (copy)
				local CallbackResult: number = Callback(Callback1)
				
				return if CallbackResult >= 1 then nil else math.floor(Callback1(p2).Y * CallbackResult + 0.5)
			end
		end
	}
end