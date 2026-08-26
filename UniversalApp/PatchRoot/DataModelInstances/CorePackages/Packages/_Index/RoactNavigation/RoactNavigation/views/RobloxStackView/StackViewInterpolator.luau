local parent = script.Parent.Parent.Parent
local getSceneIndicesForInterpolationInputRangeModule = require(parent.utils.getSceneIndicesForInterpolationInputRange)
local lerpModule = require(parent.utils.lerp)

local function forInitial(p1)
	local var1 = p1.initialPositionValue ~= p1.scene.index
	local var2 = if var1 then 1000000 else 0
	
	return {
		positionStep = nil,
		forceHidden = var1,
		initialPosition = UDim2.new(0, var2, 0, var2)
	}
end

return {
	forHorizontal = function(p1)
		-- upvalues: forInitial (ref), getSceneIndicesForInterpolationInputRangeModule (ref), lerpModule (ref)
		local initialPositionValue = p1.initialPositionValue
		local layout = p1.layout
		local scene = p1.scene
		
		if not layout.isMeasured then
			return forInitial(p1)
		end
		local var1 = getSceneIndicesForInterpolationInputRangeModule(p1)
		
		if var1 then
			local first = var1.first
			local last = var1.last
			local index = scene.index
			local initWidth = layout.initWidth
			
			local function _(p2)
				-- upvalues: first (ref), initWidth (ref), index (ref), lerpModule (copy), last (ref)
				return if p2 < first then initWidth elseif p2 < index then lerpModule(initWidth, 0, (p2 - first) / (index - first)) elseif p2 == index then 0 elseif p2 < last then lerpModule(0, -initWidth, (p2 - index) / (last - index)) else -initWidth
			end
			
			return {
				initialPosition = UDim2.new(0, if initialPositionValue < first then initWidth elseif initialPositionValue < index then lerpModule(initWidth, 0, (initialPositionValue - first) / (index - first)) elseif initialPositionValue == index then 0 elseif initialPositionValue < last then lerpModule(0, -initWidth, (initialPositionValue - index) / (last - index)) else -initWidth, 0, 0),
				positionStep = function(p2, p3)
					-- upvalues: first (ref), initWidth (ref), index (ref), lerpModule (copy), last (ref)
					local current = p2.current
					
					if current then
						local position = current.Position
						current.Position = UDim2.new(position.X.Scale, if p3 < first then initWidth elseif p3 < index then lerpModule(initWidth, 0, (p3 - first) / (index - first)) elseif p3 == index then 0 elseif p3 < last then lerpModule(0, -initWidth, (p3 - index) / (last - index)) else -initWidth, position.Y.Scale, position.Y.Offset)
						
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
	forVertical = function(p1)
		-- upvalues: forInitial (ref), getSceneIndicesForInterpolationInputRangeModule (ref), lerpModule (ref)
		local initialPositionValue = p1.initialPositionValue
		local layout = p1.layout
		local scene = p1.scene
		
		if not layout.isMeasured then
			return forInitial(p1)
		end
		local var1 = getSceneIndicesForInterpolationInputRangeModule(p1)
		
		if var1 then
			local first = var1.first
			local index = scene.index
			local initHeight = layout.initHeight
			
			local function calculate(p2)
				-- upvalues: first (ref), initHeight (ref), index (ref), lerpModule (copy)
				return if p2 < first then initHeight elseif p2 < index then lerpModule(initHeight, 0, (p2 - first) / (index - first)) else 0
			end
			
			return {
				initialPosition = UDim2.new(0, 0, 0, calculate(initialPositionValue)),
				positionStep = function(p2, p3)
					-- upvalues: calculate (ref)
					local current = p2.current
					
					if current then
						local position = current.Position
						current.Position = UDim2.new(position.X.Scale, position.X.Offset, position.Y.Scale, calculate(p3))
						
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
	forFade = function(p1)
		-- upvalues: forInitial (ref), getSceneIndicesForInterpolationInputRangeModule (ref)
		local initialPositionValue = p1.initialPositionValue
		local scene = p1.scene
		
		if not p1.layout.isMeasured then
			return forInitial(p1)
		elseif getSceneIndicesForInterpolationInputRangeModule(p1) then
			local index = scene.index
			
			local function _(p2)
				-- upvalues: index (ref)
				return index - 0.5 <= p2
			end
			
			return {
				forceHidden = not (index - 0.5 <= initialPositionValue),
				initialPosition = UDim2.new(0, 0, 0, 0),
				positionStep = function(p2, p3)
					-- upvalues: index (ref)
					local current = p2.current
					
					if current then
						current.Visible = index - 0.5 <= p3
						
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