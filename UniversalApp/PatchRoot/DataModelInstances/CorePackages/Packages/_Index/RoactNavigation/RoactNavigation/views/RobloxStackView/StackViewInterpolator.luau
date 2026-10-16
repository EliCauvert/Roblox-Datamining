local Parent = script.Parent.Parent.Parent
local GetSceneIndicesForInterpolationInputRangeModule = require(Parent.utils.getSceneIndicesForInterpolationInputRange)
local LerpModule = require(Parent.utils.lerp)

local function forInitial(p1) --[[ Line: 33 ]]
	local IsNotInitialPositionValueMatch = p1.initialPositionValue ~= p1.scene.index
	local XOffset: number = if IsNotInitialPositionValueMatch then 1000000 else 0
	
	return {
		positionStep = nil,
		forceHidden = IsNotInitialPositionValueMatch,
		initialPosition = UDim2.new(0, XOffset, 0, XOffset)
	}
end

return {
	forHorizontal = function(p1) --[[ Line: 48 ]]
		-- upvalues: forInitial (copy), GetSceneIndicesForInterpolationInputRangeModule (copy), LerpModule (copy)
		local InitialPositionValue = p1.initialPositionValue
		local Layout = p1.layout
		local Scene = p1.scene
		
		if not Layout.isMeasured then
			return (forInitial(p1))
		end
		local SceneIndicesForInterpolationInputRangeModule = GetSceneIndicesForInterpolationInputRangeModule(p1)
		
		if SceneIndicesForInterpolationInputRangeModule then
			local First = SceneIndicesForInterpolationInputRangeModule.first
			local Last = SceneIndicesForInterpolationInputRangeModule.last
			local Index = Scene.index
			local InitWidth = Layout.initWidth
			
			local function _(Index1) --[[ Line: 75 | Named "calculate" ]]
				-- upvalues: First (copy), InitWidth (copy), Index (copy), LerpModule (upval), Last (copy)
				return if Index1 < First then InitWidth elseif Index1 < Index then LerpModule(InitWidth, 0, (Index1 - First) / (Index - First)) elseif Index1 == Index then 0 elseif Index1 < Last then LerpModule(0, -InitWidth, (Index1 - Index) / (Last - Index)) else -InitWidth
			end
			
			return {
				initialPosition = UDim2.new(0, if InitialPositionValue < First then InitWidth elseif InitialPositionValue < Index then LerpModule(InitWidth, 0, (InitialPositionValue - First) / (Index - First)) elseif InitialPositionValue == Index then 0 elseif InitialPositionValue < Last then LerpModule(0, -InitWidth, (InitialPositionValue - Index) / (Last - Index)) else -InitWidth, 0, 0),
				positionStep = function(p2, Index1) --[[ Line: 90 ]]
					-- upvalues: First (copy), InitWidth (copy), Index (copy), LerpModule (upval), Last (copy)
					local Current = p2.current
					
					if Current then
						local Position = Current.Position
						Current.Position = UDim2.new(Position.X.Scale, if Index1 < First then InitWidth elseif Index1 < Index then LerpModule(InitWidth, 0, (Index1 - First) / (Index - First)) elseif Index1 == Index then 0 elseif Index1 < Last then LerpModule(0, -InitWidth, (Index1 - Index) / (Last - Index)) else -InitWidth, Position.Y.Scale, Position.Y.Offset)
						
						return
					end
				end
			}
		else
			return {
				forceHidden = true,
				positionStep = nil,
				initialPosition = UDim2.new(0, 100000, 0, 100000)
			}
		end
	end,
	forVertical = function(p1) --[[ Line: 110 ]]
		-- upvalues: forInitial (copy), GetSceneIndicesForInterpolationInputRangeModule (copy), LerpModule (copy)
		local InitialPositionValue = p1.initialPositionValue
		local Layout = p1.layout
		local Scene = p1.scene
		
		if not Layout.isMeasured then
			return (forInitial(p1))
		end
		local SceneIndicesForInterpolationInputRangeModule = GetSceneIndicesForInterpolationInputRangeModule(p1)
		
		if SceneIndicesForInterpolationInputRangeModule then
			local First = SceneIndicesForInterpolationInputRangeModule.first
			local Index = Scene.index
			local InitHeight = Layout.initHeight
			
			local function calculate(InitialPositionValue) --[[ Line: 133 ]]
				-- upvalues: First (copy), InitHeight (copy), Index (copy), LerpModule (upval)
				return if InitialPositionValue < First then InitHeight elseif InitialPositionValue < Index then LerpModule(InitHeight, 0, (InitialPositionValue - First) / (Index - First)) else 0
			end
			
			return {
				initialPosition = UDim2.new(0, 0, 0, calculate(InitialPositionValue)),
				positionStep = function(p2, p3) --[[ Line: 144 ]]
					-- upvalues: calculate (copy)
					local Current = p2.current
					
					if Current then
						local Position = Current.Position
						Current.Position = UDim2.new(Position.X.Scale, Position.X.Offset, Position.Y.Scale, calculate(p3))
						
						return
					end
				end
			}
		else
			return {
				forceHidden = true,
				positionStep = nil,
				initialPosition = UDim2.new(0, 100000, 0, 100000)
			}
		end
	end,
	forFade = function(p1) --[[ Line: 165 ]]
		-- upvalues: forInitial (copy), GetSceneIndicesForInterpolationInputRangeModule (copy)
		local InitialPositionValue = p1.initialPositionValue
		local Scene = p1.scene
		
		if not p1.layout.isMeasured then
			return (forInitial(p1))
		elseif GetSceneIndicesForInterpolationInputRangeModule(p1) then
			local Index: number = Scene.index
			
			local function _(p2): boolean --[[ Line: 186 | Named "calculate" ]]
				-- upvalues: Index (copy)
				return Index - 0.5 <= p2
			end
			
			return {
				forceHidden = not (Index - 0.5 <= InitialPositionValue),
				initialPosition = UDim2.new(0, 0, 0, 0),
				positionStep = function(p2, p3) --[[ Line: 190 ]]
					-- upvalues: Index (copy)
					local Current = p2.current
					
					if Current then
						Current.Visible = Index - 0.5 <= p3
						
						return
					end
				end
			}
		else
			return {
				forceHidden = true,
				positionStep = nil,
				initialPosition = UDim2.new(0, 100000, 0, 100000)
			}
		end
	end
}