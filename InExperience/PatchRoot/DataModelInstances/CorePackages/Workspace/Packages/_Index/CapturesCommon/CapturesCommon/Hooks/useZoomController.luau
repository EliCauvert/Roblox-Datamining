local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent1.React)
local ReactOtterModule = require(Parent1.ReactOtter)
local IsPointWithinBoundsModule = require(Parent.Utils.isPointWithinBounds)
local UseMotorFunction = ReactOtterModule.useMotor
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseEventConnectionFunction = require(Parent1.ReactUtils).useEventConnection
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local config = { dampingRatio = 1, frequency = 4 }

return function(p1)
	-- upvalues: UseStateFunction (copy), UseRefFunction (copy), UseCallbackFunction (copy), UseMotorFunction (copy), UseEffectFunction (copy), ReactOtterModule (copy), config (copy), IsPointWithinBoundsModule (copy), UseEventConnectionFunction (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseRefResult = UseRefFunction(nil)
	local UseRefResult1 = UseRefFunction(nil)
	local UseRefResult2 = UseRefFunction(nil)
	local UseMotorResult = UseMotorFunction({
		scale = 1,
		xAnchor = 0.5,
		yAnchor = 0.5,
		xPos = 0.5,
		yPos = 0.5
	}, (UseCallbackFunction(function(p2)
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current.AnchorPoint = Vector2.new(p2.xAnchor, p2.yAnchor)
			UseRefResult.current.Position = UDim2.fromScale(p2.xPos, p2.yPos)
			UseRefResult.current.Size = UDim2.fromScale(p2.scale, p2.scale)
			
			return
		end
	end, {})))
	UseEffectFunction(function()
		-- upvalues: UseRefResult (copy), p1 (copy), UseRefResult1 (copy), UseRefResult2 (copy)
		if not UseRefResult.current then return end
		if p1 then
			UseRefResult1.current = UseRefResult.current.AbsolutePosition
			UseRefResult2.current = UseRefResult.current.AbsoluteSize
			
			return
		else
			UseRefResult1.current = nil
			UseRefResult2.current = nil
			UseRefResult.current.AnchorPoint = Vector2.new(0.5, 0.5)
			UseRefResult.current.Position = UDim2.fromScale(0.5, 0.5)
			UseRefResult.current.Size = UDim2.fromScale(1, 1)
		end
	end, { p1 })
	UseEventConnectionFunction(UserInputService.TouchPinch, (UseCallbackFunction(function(Entry, Value: number, _, UserInputState, _)
		-- upvalues: p1 (copy), UseRefResult (copy), UseStateResult (copy), UseMotorResult (copy), ReactOtterModule (upval), config (upval), UseRefResult1 (copy), UseRefResult2 (copy), UseStateResult2 (copy), IsPointWithinBoundsModule (upval)
		if not p1 or not UseRefResult.current then return end
		if UserInputState == Enum.UserInputState.End and UseStateResult or #Entry < 2 then
			UseMotorResult({
				scale = ReactOtterModule.spring(1, config),
				xPos = ReactOtterModule.spring(UseRefResult.current.AnchorPoint.X, config),
				yPos = ReactOtterModule.spring(UseRefResult.current.AnchorPoint.Y, config)
			})
			UseRefResult1.current = nil
			UseRefResult2.current = nil
			UseStateResult2(false)
			
			return
		end
		if UserInputState == Enum.UserInputState.Begin then
			local Entry1 = Entry[1]
			local Entry2 = Entry[2]
			local AbsolutePosition = UseRefResult.current.AbsolutePosition
			local AbsoluteSize: number = UseRefResult.current.AbsoluteSize
			
			if not IsPointWithinBoundsModule(Entry1, AbsolutePosition, AbsoluteSize) or not IsPointWithinBoundsModule(Entry2, AbsolutePosition, AbsoluteSize) then return end
			UseRefResult1.current = AbsolutePosition
			UseRefResult2.current = AbsoluteSize
			local EntryDelta = (Entry1 + Entry2) / 2 - (AbsolutePosition + AbsoluteSize / 2)
			local NewX = EntryDelta.X / AbsoluteSize.X + 0.5
			local NewY = EntryDelta.Y / AbsoluteSize.Y + 0.5
			UseMotorResult({
				xAnchor = ReactOtterModule.instant(NewX),
				yAnchor = ReactOtterModule.instant(NewY),
				xPos = ReactOtterModule.instant(NewX),
				yPos = ReactOtterModule.instant(NewY)
			})
			UseStateResult2(true)
		end
		if not UseStateResult then return end
		if UseRefResult1.current and UseRefResult2.current then
			local EntryDelta = (Entry[1] + Entry[2]) / 2 - (UseRefResult1.current + UseRefResult2.current / 2)
			UseMotorResult({
				scale = ReactOtterModule.instant((math.clamp(Value, 0.5, 3))),
				xPos = ReactOtterModule.instant(EntryDelta.X / UseRefResult2.current.X + 0.5),
				yPos = ReactOtterModule.instant(EntryDelta.Y / UseRefResult2.current.Y + 0.5)
			})
			
			return
		end
	end, { p1, UseStateResult, UseMotorResult })))
	
	return UseStateResult, UseRefResult
end