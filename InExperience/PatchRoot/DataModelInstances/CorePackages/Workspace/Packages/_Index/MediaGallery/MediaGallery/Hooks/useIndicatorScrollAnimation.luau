local MediaGallery = script:FindFirstAncestor("MediaGallery")
local Parent = MediaGallery.Parent
local OtterModule = require(Parent.Otter)
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactOtter)
local _ = require(Parent.AppCommonLib)
local MAXVISIBLEINDICATORS = require(MediaGallery.MediaGalleryConstants).MAX_VISIBLE_INDICATORS

local function _(p1: number, p2: number, p3): number
	-- upvalues: MAXVISIBLEINDICATORS (copy)
	return if p1 <= MAXVISIBLEINDICATORS then 1 elseif p3 == "Right" then math.max(1, math.min(p2, p1 - 2) - MAXVISIBLEINDICATORS + 2 + 1) else math.min(p1 - MAXVISIBLEINDICATORS + 1, math.max(p2, 3) - 2)
end

return function(p1)
	-- upvalues: ReactModule (copy), MAXVISIBLEINDICATORS (copy), OtterModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.startIndex)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(p1.startIndex)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(1)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new(0, 0))
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local UseResult = ReactModule.useCallback(function(p2: number): Vector2
		-- upvalues: p1 (copy)
		return Vector2.new((p2 - 1) * (p1.indicatorSize + p1.indicatorPadding), 0)
	end, { p1.indicatorSize, p1.indicatorPadding })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), MAXVISIBLEINDICATORS (upval), UseBindingResult2 (copy), UseResult (copy), UseStateResult2_2 (copy), UseBindingResult2_1 (copy), UseStateResult2_1 (copy), UseStateResult2 (copy)
		local NumberOfItems: number = p1.numberOfItems
		local StartIndex: number = p1.startIndex
		local Largest: number = if NumberOfItems <= MAXVISIBLEINDICATORS then 1 else math.max(1, math.min(StartIndex, NumberOfItems - 2) - MAXVISIBLEINDICATORS + 2 + 1)
		UseBindingResult2(UseResult(Largest))
		UseStateResult2_2(Largest)
		UseBindingResult2_1(1)
		UseStateResult2_1(p1.startIndex)
		UseStateResult2(p1.startIndex)
	end, { p1.numberOfItems, p1.startIndex, UseResult })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), MAXVISIBLEINDICATORS (upval), UseStateResult2_3 (copy)
		local ScrolledSignalConnection = p1.scrolledSignal:connect(function(p2)
			-- upvalues: UseStateResult2 (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval), p1 (upval), MAXVISIBLEINDICATORS (upval), UseStateResult2_3 (upval)
			UseStateResult2(function(p3): number
				-- upvalues: p2 (copy), UseStateResult2_1 (upval), UseStateResult2_2 (upval), p1 (upval), MAXVISIBLEINDICATORS (upval), UseStateResult2_3 (upval)
				local Right: string = if p3 < p2 then "Right" else "Left"
				UseStateResult2_1(p3)
				local NumberOfItems: number = p1.numberOfItems
				UseStateResult2_2(if NumberOfItems <= MAXVISIBLEINDICATORS then 1 elseif Right == "Right" then math.max(1, math.min(p2, NumberOfItems - 2) - MAXVISIBLEINDICATORS + 2 + 1) else math.min(NumberOfItems - MAXVISIBLEINDICATORS + 1, math.max(p2, 3) - 2))
				UseStateResult2_3(true)
				
				return p2
			end)
		end)
		
		return function()
			-- upvalues: ScrolledSignalConnection (ref)
			if ScrolledSignalConnection ~= nil then
				ScrolledSignalConnection:disconnect()
				ScrolledSignalConnection = nil
			end
		end
	end, { p1.numberOfItems, p1.scrolledSignal })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult4 (copy), OtterModule (upval), p1 (copy), UseBindingResult (copy), UseResult (copy), UseStateResult3 (copy), UseBindingResult2_1 (copy), UseBindingResult2 (copy), UseStateResult2_3 (copy)
		if not UseStateResult4 then return end
		local SingleMotor = OtterModule.createSingleMotor(0)
		SingleMotor:setGoal(if p1.useSpring then OtterModule.spring(1, p1.springConfig) else OtterModule.instant(1))
		local Value = UseBindingResult:getValue()
		local UseResultResult = UseResult(UseStateResult3)
		SingleMotor:onStep(function(Alpha)
			-- upvalues: UseBindingResult2_1 (upval), UseBindingResult2 (upval), Value (copy), UseResultResult (copy)
			UseBindingResult2_1(Alpha)
			UseBindingResult2(Value:Lerp(UseResultResult, Alpha))
		end)
		SingleMotor:onComplete(function()
			-- upvalues: UseStateResult2_3 (upval)
			UseStateResult2_3(false)
		end)
		
		return function()
			-- upvalues: SingleMotor (copy)
			SingleMotor:destroy()
		end
	end, {
		p1.useSpring,
		p1.springConfig,
		UseStateResult4,
		UseStateResult3,
		UseResult
	})
	
	return {
		currentItemIndex = UseStateResult,
		previousItemIndex = UseStateResult1,
		firstVisibleIndex = UseStateResult3,
		animationProgressBinding = UseBindingResult1,
		canvasPositionBinding = UseBindingResult
	}
end