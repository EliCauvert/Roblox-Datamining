-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:03 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local getSceneIndicesForInterpolationInputRangeModule = require(parent.utils.getSceneIndicesForInterpolationInputRange)
local lerpModule = require(parent.utils.lerp)

local function forInitial(p0) --[[ line: 33 ]]
	local var3 = p0.initialPositionValue ~= p0.scene.index
	local var4 = if var3 then 1000000 else 0
	
	return {
		positionStep = nil,
		forceHidden = var3,
		initialPosition = UDim2.new(0, var4, 0, var4)
	}
end

return {
	forHorizontal = function(p1) --[[ line: 48 ]]
		-- upvalues: forInitial (ref), getSceneIndicesForInterpolationInputRangeModule (ref), lerpModule (ref)
		local initialPositionValue = p1.initialPositionValue
		local layout = p1.layout
		local scene = p1.scene
		
		if not layout.isMeasured then
			return forInitial(p1)
		end
		local var5 = getSceneIndicesForInterpolationInputRangeModule(p1)
		
		if var5 then
			local first = var5.first
			local last = var5.last
			local index = scene.index
			local initWidth = layout.initWidth
			
			local function _(p2) --[[ line: 75 | named "calculate" ]]
				-- upvalues: first (ref), initWidth (ref), index (ref), lerpModule (copy), last (ref)
				return if p2 < first then initWidth elseif p2 < index then lerpModule(initWidth, 0, (p2 - first) / (index - first)) elseif p2 == index then 0 elseif p2 < last then lerpModule(0, -initWidth, (p2 - index) / (last - index)) else -initWidth
			end
			
			return {
				initialPosition = UDim2.new(0, if initialPositionValue < first then initWidth elseif initialPositionValue < index then lerpModule(initWidth, 0, (initialPositionValue - first) / (index - first)) elseif initialPositionValue == index then 0 elseif initialPositionValue < last then lerpModule(0, -initWidth, (initialPositionValue - index) / (last - index)) else -initWidth, 0, 0),
				positionStep = function(p3, p4) --[[ line: 90 ]]
					-- upvalues: first (ref), initWidth (ref), index (ref), lerpModule (copy), last (ref)
					local current = p3.current
					
					if current then
						local position = current.Position
						current.Position = UDim2.new(position.X.Scale, if p4 < first then initWidth elseif p4 < index then lerpModule(initWidth, 0, (p4 - first) / (index - first)) elseif p4 == index then 0 elseif p4 < last then lerpModule(0, -initWidth, (p4 - index) / (last - index)) else -initWidth, position.Y.Scale, position.Y.Offset)
						
						return
					end
				end
			}
		end
		return {
			forceHidden = true,
			positionStep = nil,
			initialPosition = UDim2.new(0, 100000, 0, 100000)
		}
	end,
	forVertical = function(p5) --[[ line: 110 ]]
		-- upvalues: forInitial (ref), getSceneIndicesForInterpolationInputRangeModule (ref), lerpModule (ref)
		local initialPositionValue = p5.initialPositionValue
		local layout = p5.layout
		local scene = p5.scene
		
		if not layout.isMeasured then
			return forInitial(p5)
		end
		local var6 = getSceneIndicesForInterpolationInputRangeModule(p5)
		
		if var6 then
			local first = var6.first
			local index = scene.index
			local initHeight = layout.initHeight
			
			local function calculate(p6) --[[ line: 133 ]]
				-- upvalues: first (ref), initHeight (ref), index (ref), lerpModule (copy)
				return if p6 < first then initHeight elseif p6 < index then lerpModule(initHeight, 0, (p6 - first) / (index - first)) else 0
			end
			
			return {
				initialPosition = UDim2.new(0, 0, 0, calculate(initialPositionValue)),
				positionStep = function(p7, p8) --[[ line: 144 ]]
					-- upvalues: calculate (ref)
					local current = p7.current
					
					if current then
						local position = current.Position
						current.Position = UDim2.new(position.X.Scale, position.X.Offset, position.Y.Scale, calculate(p8))
						
						return
					end
				end
			}
		end
		return {
			forceHidden = true,
			positionStep = nil,
			initialPosition = UDim2.new(0, 100000, 0, 100000)
		}
	end,
	forFade = function(p9) --[[ line: 165 ]]
		-- upvalues: forInitial (ref), getSceneIndicesForInterpolationInputRangeModule (ref)
		local initialPositionValue = p9.initialPositionValue
		local scene = p9.scene
		
		if not p9.layout.isMeasured then
			return forInitial(p9)
		elseif getSceneIndicesForInterpolationInputRangeModule(p9) then
			local index = scene.index
			
			local function _(p10) --[[ line: 186 | named "calculate" ]]
				-- upvalues: index (ref)
				return index - 0.5 <= p10
			end
			
			return {
				forceHidden = not (index - 0.5 <= initialPositionValue),
				initialPosition = UDim2.new(0, 0, 0, 0),
				positionStep = function(p11, p12) --[[ line: 190 ]]
					-- upvalues: index (ref)
					local current = p11.current
					
					if current then
						current.Visible = index - 0.5 <= p12
						
						return
					end
				end
			}
		end
		return {
			forceHidden = true,
			positionStep = nil,
			initialPosition = UDim2.new(0, 100000, 0, 100000)
		}
	end
}