local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ReactOtterModule = require(Parent1.ReactOtter)
local UseAnimatedBindingFunction = ReactOtterModule.useAnimatedBinding
local UseCallbackFunction = ReactModule.useCallback
local UseDeviceInsetsFunction = require(Parent1.Responsive).useDeviceInsets
local UseEffectFunction = ReactModule.useEffect
local UseGuiInsetFunction = require(Parent1.CapturesCommon).Hooks.useGuiInset
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local CaptureControlsConfigurationModule = require(Parent.Utils.CaptureControlsConfiguration)
local SnapDirectionModule = require(Parent.Enums.SnapDirection)
local UIDragDetectorFixEventPositionEnabledEngineFeature = game:GetEngineFeature("UIDragDetectorFixEventPositionEnabled")
local config = { x = 0.5, y = 0.5 }
local config1 = { xOffset = -100, yOffset = -100 }
local _Vector2 = Vector2.new(1, 0.5)
local Right = SnapDirectionModule.Right
local config2 = { duration = 0.4, easingStyle = { 0.19, 1, 0.22, 1 } }

local function validateRefs(List): boolean --[[ Line: 31 ]]
	for _, value in List do
		if value.current == nil then
			return false
		elseif value.current.AbsoluteSize.X <= 0 or value.current.AbsoluteSize.Y <= 0 then
			return false
		end
	end
	return true
end

local function clampItemPosition(AbsolutePosition, Vector, AbsolutePosition1, Vector1, Current): Vector2 --[[ Line: 45 ]]
	local AbsolutePositionDelta = AbsolutePosition - AbsolutePosition1
	local MinValue = 50
	local Y1: number = Current.Y
	local X = 50
	local Y: number = Y1
	
	if Vector.X < Vector1.X - 50 then
		X = math.clamp(AbsolutePositionDelta.X, MinValue, Vector1.X - Vector.X - 50)
	end
	if Vector.Y < Vector1.Y - Y1 then
		Y = math.clamp(AbsolutePositionDelta.Y, Y1, Vector1.Y - Vector.Y)
	end
	return Vector2.new(X, Y)
end

local function getSnapPosition(AbsoluteSize, AnchorPoint, AbsolutePosition, AbsoluteSize1, Vector, Current) --[[ Line: 67 ]]
	-- upvalues: clampItemPosition (copy)
	return (clampItemPosition(Vector2.new(AbsoluteSize1.X * Vector.X, AbsoluteSize1.Y * Vector.Y) - Vector2.new(AbsoluteSize.X * AnchorPoint.X, AbsoluteSize.Y * AnchorPoint.Y) + AbsolutePosition, AbsoluteSize, AbsolutePosition, AbsoluteSize1, Current))
end

local function getSnapAnchorPoint(p1, AbsolutePosition, AbsoluteSize, Current) --[[ Line: 94 ]]
	local Vector = p1 - AbsolutePosition
	local List = {
		Vector2.new(0, (math.max(Vector.Y, Current.Y))),
		Vector2.new(AbsoluteSize.X, Vector.Y),
		Vector2.new(math.max(Vector.X, Current.X), 0),
		Vector2.new(Vector.X, AbsoluteSize.Y)
	}
	table.sort(List, function(A, B): boolean --[[ Line: 109 ]]
		-- upvalues: Vector (copy)
		return (A - Vector).Magnitude < (B - Vector).Magnitude
	end)
	local Entry = List[1]
	
	return Entry / AbsoluteSize, (Entry - Vector).Magnitude
end

local function _(Vector) --[[ Line: 118 | Named "getSnapDirectionFromAnchorPoint" ]]
	-- upvalues: SnapDirectionModule (copy)
	return if Vector.X == 0 then SnapDirectionModule.Left elseif Vector.X == 1 then SnapDirectionModule.Right elseif Vector.Y == 0 then SnapDirectionModule.Top else SnapDirectionModule.Bottom
end

local _ = function(p1, Vector): boolean --[[ Line: 130 | Named "getShouldRotate" ]]
	local IsXMatch: boolean = Vector.X == 0 or Vector.X == 1
	local IsYMatch: boolean = Vector.Y == 0 or Vector.Y == 1
	local Flag = false
	
	if IsXMatch and IsYMatch then
		Flag = false
		
		return Flag
	end
	if IsYMatch and not p1 then
		Flag = true
		
		return Flag
	end
	if IsXMatch and p1 then
		Flag = true
	end
	return Flag
end

return function(p1, Current) --[[ Line: 146 | Named "useCaptureControlsController" ]]
	-- upvalues: UseRefFunction (copy), CaptureControlsConfigurationModule (copy), UseStateFunction (copy), _Vector2 (copy), Right (copy), UseGuiInsetFunction (copy), UseDeviceInsetsFunction (copy), UseCallbackFunction (copy), UseAnimatedBindingFunction (copy), config (copy), config1 (copy), UseEffectFunction (copy), validateRefs (copy), SnapDirectionModule (copy), ReactOtterModule (copy), config2 (copy), getSnapPosition (copy), clampItemPosition (copy), UIDragDetectorFixEventPositionEnabledEngineFeature (copy), getSnapAnchorPoint (copy)
	local UseRefResult = UseRefFunction(Current)
	local UseRefResult1 = UseRefFunction(nil)
	local UseRefResult2 = UseRefFunction(nil)
	local UseRefResult3 = UseRefFunction(nil)
	local UseRefResult4 = UseRefFunction(false)
	local UseRefResult5 = UseRefFunction(nil)
	local UseRefResult6 = UseRefFunction(CaptureControlsConfigurationModule.getStoredSnapAnchorPoint())
	local UseStateResult, UseStateResult2 = UseStateFunction(_Vector2)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(false)
	local UseStateResult4, UseStateResult2_3 = UseStateFunction(Right)
	local UseGuiInsetResult = UseGuiInsetFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseCallbackResult = UseCallbackFunction(function() --[[ Line: 163 ]]
		-- upvalues: UseRefResult4 (copy)
		UseRefResult4.current = false
	end, {})
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(config)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = UseAnimatedBindingFunction(config1, UseCallbackResult)
	UseEffectFunction(function() --[[ Line: 174 ]]
		-- upvalues: p1 (copy), validateRefs (upval), UseRefResult3 (copy), UseRefResult1 (copy), UseRefResult (copy), Current (copy), UseRefResult6 (copy), UseStateResult2 (copy), UseStateResult2_3 (copy), SnapDirectionModule (upval), UseStateResult3 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config2 (upval), UseStateResult2_2 (copy), getSnapPosition (upval), UseAnimatedBindingResult2_1 (copy)
		if not p1 or not validateRefs({ UseRefResult3, UseRefResult1 }) then return end
		assert(UseRefResult3.current ~= nil, "dragItemRef is nil")
		assert(UseRefResult1.current ~= nil, "dragContainerRef is nil")
		UseRefResult.current = Current
		local Current1 = UseRefResult6.current
		UseStateResult2(Current1)
		UseStateResult2_3(if Current1.X == 0 then SnapDirectionModule.Left elseif Current1.X == 1 then SnapDirectionModule.Right elseif Current1.Y == 0 then SnapDirectionModule.Top else SnapDirectionModule.Bottom)
		local AbsoluteSize = UseRefResult3.current.AbsoluteSize
		local AnchorPoint = UseRefResult3.current.AnchorPoint
		local IsXMatch: boolean = Current1.X == 0 or Current1.X == 1
		local IsYMatch: boolean = Current1.Y == 0 or Current1.Y == 1
		local Flag = false
		
		if IsXMatch and IsYMatch then
			Flag = false
		elseif IsYMatch and not UseStateResult3 then
			Flag = true
		elseif IsXMatch and UseStateResult3 then
			Flag = true
		end
		if Flag then
			AbsoluteSize = Vector2.new(AbsoluteSize.Y, AbsoluteSize.X)
			AnchorPoint = Vector2.new(AnchorPoint.Y, AnchorPoint.X)
			UseAnimatedBindingResult2({
				x = ReactOtterModule.ease(AnchorPoint.X, config2),
				y = ReactOtterModule.ease(AnchorPoint.Y, config2)
			})
			UseStateResult2_2(not UseStateResult3)
		end
		local SnapPosition = getSnapPosition(AbsoluteSize, AnchorPoint, UseRefResult1.current.AbsolutePosition, UseRefResult1.current.AbsoluteSize, Current1, Current)
		local _Vector2 = Vector2.new(AbsoluteSize.X * AnchorPoint.X, AbsoluteSize.Y * AnchorPoint.Y)
		UseAnimatedBindingResult2_1({
			xOffset = ReactOtterModule.instant(SnapPosition.X + _Vector2.X),
			yOffset = ReactOtterModule.instant(SnapPosition.Y + _Vector2.Y)
		})
	end, {
		p1,
		Current,
		UseAnimatedBindingResult2,
		UseAnimatedBindingResult2_1
	})
	local UseCallbackResult1 = UseCallbackFunction(function() --[[ Line: 230 ]]
		-- upvalues: p1 (copy), UseRefResult4 (copy), validateRefs (upval), UseRefResult3 (copy), UseRefResult1 (copy), getSnapPosition (upval), UseStateResult (copy), Current (copy), UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval)
		if p1 and not UseRefResult4.current and validateRefs({ UseRefResult3, UseRefResult1 }) then
			assert(UseRefResult3.current ~= nil, "dragItemRef is nil")
			assert(UseRefResult1.current ~= nil, "dragContainerRef is nil")
			local AbsoluteSize = UseRefResult3.current.AbsoluteSize
			local AnchorPoint = UseRefResult3.current.AnchorPoint
			local SnapPosition = getSnapPosition(AbsoluteSize, AnchorPoint, UseRefResult1.current.AbsolutePosition, UseRefResult1.current.AbsoluteSize, UseStateResult, Current)
			local _Vector2 = Vector2.new(AbsoluteSize.X * AnchorPoint.X, AbsoluteSize.Y * AnchorPoint.Y)
			UseAnimatedBindingResult2_1({
				xOffset = ReactOtterModule.instant(SnapPosition.X + _Vector2.X),
				yOffset = ReactOtterModule.instant(SnapPosition.Y + _Vector2.Y)
			})
			
			return
		end
	end, {
		p1,
		Current,
		UseStateResult,
		UseStateResult1,
		UseAnimatedBindingResult2_1
	})
	local UseCallbackResult11 = UseCallbackFunction(function(p2) --[[ Line: 268 ]]
		-- upvalues: p1 (copy), UseStateResult1 (copy), validateRefs (upval), UseRefResult1 (copy), UseRefResult3 (copy), UseGuiInsetResult (copy), UseDeviceInsetsResult (copy), UseStateResult2_1 (copy), clampItemPosition (upval), Current (copy), UseStateResult3 (copy), UIDragDetectorFixEventPositionEnabledEngineFeature (upval), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseAnimatedBindingResult2_1 (copy)
		if p1 and not UseStateResult1 and validateRefs({ UseRefResult1, UseRefResult3 }) then
			assert(UseRefResult3.current ~= nil, "dragItemRef is nil")
			assert(UseRefResult1.current ~= nil, "dragContainerRef is nil")
			local v1 = p2 - Vector2.new(UseGuiInsetResult.left + UseDeviceInsetsResult.left, UseGuiInsetResult.top + UseDeviceInsetsResult.top)
			UseStateResult2_1(true)
			local AbsoluteSize = UseRefResult3.current.AbsoluteSize
			local AbsolutePosition = UseRefResult3.current.AbsolutePosition
			local _ = UseRefResult3.current.AnchorPoint
			local ClampItemPositionResult = clampItemPosition(AbsolutePosition, AbsoluteSize, UseRefResult1.current.AbsolutePosition, UseRefResult1.current.AbsoluteSize, Current)
			local _Vector2 = Vector2.new(if UseStateResult3 then ((if UIDragDetectorFixEventPositionEnabledEngineFeature then p2 else v1).X - AbsolutePosition.X) / AbsoluteSize.X else 0.5, if UseStateResult3 then 0.5 else ((if UIDragDetectorFixEventPositionEnabledEngineFeature then p2 else v1).Y - AbsolutePosition.Y) / AbsoluteSize.Y)
			UseAnimatedBindingResult2({
				x = ReactOtterModule.instant(_Vector2.X),
				y = ReactOtterModule.instant(_Vector2.Y)
			})
			local _Vector2_1 = Vector2.new(AbsoluteSize.X * _Vector2.X, AbsoluteSize.Y * _Vector2.Y)
			UseAnimatedBindingResult2_1({
				xOffset = ReactOtterModule.instant(ClampItemPositionResult.X + _Vector2_1.X),
				yOffset = ReactOtterModule.instant(ClampItemPositionResult.Y + _Vector2_1.Y)
			})
			
			return
		end
	end, {
		p1, Current, clampItemPosition,
		if UIDragDetectorFixEventPositionEnabledEngineFeature then nil else UseDeviceInsetsResult,
		if UIDragDetectorFixEventPositionEnabledEngineFeature then nil else UseGuiInsetResult,
		UseStateResult1, UseStateResult3, UseAnimatedBindingResult2_1,
		UseAnimatedBindingResult2
	})
	local UseCallbackResult2 = UseCallbackFunction(function(p2, p3) --[[ Line: 334 ]]
		-- upvalues: validateRefs (upval), UseRefResult3 (copy), UseRefResult1 (copy), UseGuiInsetResult (copy), UseDeviceInsetsResult (copy), getSnapAnchorPoint (upval), UIDragDetectorFixEventPositionEnabledEngineFeature (upval), Current (copy), UseStateResult3 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseStateResult2_2 (copy), getSnapPosition (upval), clampItemPosition (upval), UseAnimatedBindingResult2_1 (copy), UseRefResult4 (copy), config2 (upval), UseStateResult2 (copy), UseStateResult2_3 (copy), SnapDirectionModule (upval), CaptureControlsConfigurationModule (upval), UseRefResult6 (copy)
		if not validateRefs({ UseRefResult3, UseRefResult1 }) then return end
		assert(UseRefResult3.current ~= nil, "dragItemRef is nil")
		assert(UseRefResult1.current ~= nil, "dragContainerRef is nil")
		local v1 = p2 - Vector2.new(UseGuiInsetResult.left + UseDeviceInsetsResult.left, UseGuiInsetResult.top + UseDeviceInsetsResult.top)
		local AbsolutePosition = UseRefResult1.current.AbsolutePosition
		local AbsoluteSize = UseRefResult1.current.AbsoluteSize
		local SnapAnchorPoint, SnapAnchorPoint2 = getSnapAnchorPoint(if UIDragDetectorFixEventPositionEnabledEngineFeature then p2 else v1, AbsolutePosition, AbsoluteSize, Current)
		local IsSnapAnchorPointBelow: boolean = SnapAnchorPoint2 < 70 or not p3
		local AbsoluteSize1 = UseRefResult3.current.AbsoluteSize
		local AnchorPoint = UseRefResult3.current.AnchorPoint
		local IsXMatch: boolean = SnapAnchorPoint.X == 0 or SnapAnchorPoint.X == 1
		local IsYMatch: boolean = SnapAnchorPoint.Y == 0 or SnapAnchorPoint.Y == 1
		local Flag = false
		
		if IsXMatch and IsYMatch then
			Flag = false
		elseif IsYMatch and not UseStateResult3 then
			Flag = true
		elseif IsXMatch and UseStateResult3 then
			Flag = true
		end
		if IsSnapAnchorPointBelow and Flag then
			AbsoluteSize1 = Vector2.new(AbsoluteSize1.Y, AbsoluteSize1.X)
			AnchorPoint = Vector2.new(AnchorPoint.Y, AnchorPoint.X)
			UseAnimatedBindingResult2({
				x = ReactOtterModule.instant(AnchorPoint.X),
				y = ReactOtterModule.instant(AnchorPoint.Y)
			})
			UseStateResult2_2(not UseStateResult3)
		end
		local _Vector2 = Vector2.new(AbsoluteSize1.X * AnchorPoint.X, AbsoluteSize1.Y * AnchorPoint.Y)
		local SnapPosition = if IsSnapAnchorPointBelow then getSnapPosition(AbsoluteSize1, AnchorPoint, AbsolutePosition, AbsoluteSize, SnapAnchorPoint, Current) else clampItemPosition((if UIDragDetectorFixEventPositionEnabledEngineFeature then p2 else v1) - _Vector2, AbsoluteSize1, AbsolutePosition, AbsoluteSize, Current)
		
		if p3 then
			UseAnimatedBindingResult2_1({
				xOffset = ReactOtterModule.instant(SnapPosition.X + _Vector2.X),
				yOffset = ReactOtterModule.instant(SnapPosition.Y + _Vector2.Y)
			})
			
			return
		else
			UseRefResult4.current = true
			UseAnimatedBindingResult2_1({
				xOffset = ReactOtterModule.ease(SnapPosition.X + _Vector2.X, config2),
				yOffset = ReactOtterModule.ease(SnapPosition.Y + _Vector2.Y, config2)
			})
			UseStateResult2(SnapAnchorPoint)
			UseStateResult2_3(if SnapAnchorPoint.X == 0 then SnapDirectionModule.Left elseif SnapAnchorPoint.X == 1 then SnapDirectionModule.Right elseif SnapAnchorPoint.Y == 0 then SnapDirectionModule.Top else SnapDirectionModule.Bottom)
			CaptureControlsConfigurationModule.setStoredSnapAnchorPoint(SnapAnchorPoint)
			UseRefResult6.current = SnapAnchorPoint
		end
	end, {
		Current,
		if UIDragDetectorFixEventPositionEnabledEngineFeature then nil else UseDeviceInsetsResult,
		if UIDragDetectorFixEventPositionEnabledEngineFeature then nil else UseGuiInsetResult,
		UseStateResult3, UseAnimatedBindingResult2_1, UseAnimatedBindingResult2
	})
	local UseCallbackResult3 = UseCallbackFunction(function(p2) --[[ Line: 425 ]]
		-- upvalues: p1 (copy), UseStateResult1 (copy), UseCallbackResult2 (copy)
		if p1 and UseStateResult1 then
			UseCallbackResult2(p2, true)
			
			return
		end
	end, { p1, UseCallbackResult2, UseStateResult1 })
	local UseCallbackResult4 = UseCallbackFunction(function(p2) --[[ Line: 433 ]]
		-- upvalues: p1 (copy), UseStateResult1 (copy), UseCallbackResult2 (copy), UseStateResult2_1 (copy)
		if p1 and UseStateResult1 then
			UseCallbackResult2(p2, false)
			UseStateResult2_1(false)
			
			return
		end
	end, { p1, UseCallbackResult2, UseStateResult1 })
	UseEffectFunction(function() --[[ Line: 442 ]]
		-- upvalues: p1 (copy), UseRefResult (copy), Current (copy), UseCallbackResult1 (copy)
		if not p1 then return end
		if UseRefResult.current ~= Current then
			UseRefResult.current = Current
			UseCallbackResult1()
		end
	end, { p1, Current, UseCallbackResult1 })
	UseEffectFunction(function() --[[ Line: 453 ]]
		-- upvalues: p1 (copy), UseRefResult2 (copy), UseCallbackResult11 (copy), UseCallbackResult3 (copy), UseCallbackResult4 (copy), UseRefResult1 (copy), UseCallbackResult1 (copy), UseRefResult3 (copy)
		if not p1 then return end
		local List = {}
		
		if UseRefResult2.current ~= nil then
			table.insert(List, UseRefResult2.current.DragStart:Connect(UseCallbackResult11))
			table.insert(List, UseRefResult2.current.DragContinue:Connect(UseCallbackResult3))
			table.insert(List, UseRefResult2.current.DragEnd:Connect(UseCallbackResult4))
		end
		if UseRefResult1.current ~= nil then
			table.insert(List, UseRefResult1.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(UseCallbackResult1))
		end
		if UseRefResult3.current ~= nil then
			table.insert(List, UseRefResult3.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(UseCallbackResult1))
		end
		return function() --[[ Line: 479 ]]
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, {
		p1,
		UseCallbackResult11,
		UseCallbackResult3,
		UseCallbackResult4,
		UseCallbackResult1
	})
	
	return {
		dragContainerRef = UseRefResult1,
		dragDetectorRef = UseRefResult2,
		dragItemAnchorPointBinding = UseAnimatedBindingResult,
		dragItemPositionBinding = UseAnimatedBindingResult1,
		dragItemRef = UseRefResult3,
		isItemHorizontal = UseStateResult3,
		screenshotButtonRef = UseRefResult5,
		snapDirection = UseStateResult4
	}
end