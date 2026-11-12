local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local ControlState = require(Parent.Foundation).Enums.ControlState
local SubmitFreeTrialTopBarChipModule = require(InExperienceShop.submitFreeTrialTopBarChip)
local GetChipDismissInputModule = require(script.Parent.getChipDismissInput)
local IsDismissSwipeModule = require(script.Parent.isDismissSwipe)

return function(p1)
	-- upvalues: ReactModule (copy), GetChipDismissInputModule (copy), ControlState (copy), SubmitFreeTrialTopBarChipModule (copy), IsDismissSwipeModule (copy)
	local IsVisible = p1.isVisible
	local IsSettled = p1.isSettled
	local RevealLayer = p1.revealLayer
	local ChipRef = p1.chipRef
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	local ChipDismissInputModule, ChipDismissInputModule2 = GetChipDismissInputModule()
	
	local function _()
		-- upvalues: UseRefResult1 (copy)
		local Current = UseRefResult1.current
		
		if Current ~= nil then
			task.cancel(Current)
			UseRefResult1.current = nil
		end
	end
	
	local _ = function()
		-- upvalues: UseRefResult1 (copy), UseStateResult2 (copy)
		local Current = UseRefResult1.current
		
		if Current ~= nil then
			task.cancel(Current)
			UseRefResult1.current = nil
		end
		UseStateResult2(true)
	end
	
	local _ = function()
		-- upvalues: UseRefResult1 (copy), UseStateResult2 (copy)
		local Current = UseRefResult1.current
		
		if Current ~= nil then
			task.cancel(Current)
			UseRefResult1.current = nil
		end
		UseRefResult1.current = task.delay(0.15, function()
			-- upvalues: UseRefResult1 (upval), UseStateResult2 (upval)
			UseRefResult1.current = nil
			UseStateResult2(false)
		end)
	end
	
	local function onChipStateChanged(Default)
		-- upvalues: ControlState (upval), UseRefResult1 (copy), UseStateResult2 (copy)
		if Default == ControlState.Hover or Default == ControlState.Selected then
			local Current = UseRefResult1.current
			
			if Current ~= nil then
				task.cancel(Current)
				UseRefResult1.current = nil
			end
			UseStateResult2(true)
			
			return
		else
			if Default == ControlState.Default or Default == ControlState.Initialize then
				local Current = UseRefResult1.current
				
				if Current ~= nil then
					task.cancel(Current)
					UseRefResult1.current = nil
				end
				UseRefResult1.current = task.delay(0.15, function()
					-- upvalues: UseRefResult1 (upval), UseStateResult2 (upval)
					UseRefResult1.current = nil
					UseStateResult2(false)
				end)
			end
		end
	end
	
	local function onCloseActivated()
		-- upvalues: SubmitFreeTrialTopBarChipModule (upval)
		SubmitFreeTrialTopBarChipModule.dismiss()
	end
	
	local function onCloseStateChanged(Hover)
		-- upvalues: ControlState (upval), UseRefResult1 (copy), UseStateResult2 (copy)
		if Hover == ControlState.Hover or Hover == ControlState.Pressed then
			local Current = UseRefResult1.current
			
			if Current ~= nil then
				task.cancel(Current)
				UseRefResult1.current = nil
			end
			UseStateResult2(true)
		end
	end
	
	local function consumeSuppressedActivation(): boolean
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current = false
			
			return true
		else
			return false
		end
	end
	
	local UseRefResult2 = ReactModule.useRef(function(_) end)
	local UseRefResult3 = ReactModule.useRef(function(_) end)
	ReactModule.useLayoutEffect(function()
		-- upvalues: ChipRef (copy), IsVisible (copy), ChipDismissInputModule (copy), UseRefResult1 (copy), UseStateResult2 (copy), ChipDismissInputModule2 (copy), IsDismissSwipeModule (upval), UseRefResult (copy), SubmitFreeTrialTopBarChipModule (upval), UseRefResult2 (copy), UseRefResult3 (copy)
		local Current = ChipRef.current
		
		if Current == nil or not IsVisible then return end
		local List = {}
		
		if ChipDismissInputModule then
			table.insert(List, Current.MouseEnter:Connect(function()
				-- upvalues: UseRefResult1 (upval), UseStateResult2 (upval)
				local Current = UseRefResult1.current
				
				if Current ~= nil then
					task.cancel(Current)
					UseRefResult1.current = nil
				end
				UseStateResult2(true)
			end))
			table.insert(List, Current.MouseLeave:Connect(function()
				-- upvalues: UseRefResult1 (upval), UseStateResult2 (upval)
				local Current = UseRefResult1.current
				
				if Current ~= nil then
					task.cancel(Current)
					UseRefResult1.current = nil
				end
				UseRefResult1.current = task.delay(0.15, function()
					-- upvalues: UseRefResult1 (upval), UseStateResult2 (upval)
					UseRefResult1.current = nil
					UseStateResult2(false)
				end)
			end))
		end
		if ChipDismissInputModule2 then
			local Position = nil
			
			local function onTouchBegan(Input)
				-- upvalues: Position (ref)
				if Input.UserInputType == Enum.UserInputType.Touch then
					Position = Input.Position
				end
			end
			
			local function onTouchEnded(Input)
				-- upvalues: Position (ref), IsDismissSwipeModule (upval), UseRefResult (upval), SubmitFreeTrialTopBarChipModule (upval)
				if Input.UserInputType ~= Enum.UserInputType.Touch or Position == nil then return end
				local PositionDelta = Input.Position - Position
				Position = nil
				
				if IsDismissSwipeModule(PositionDelta.X, PositionDelta.Y) then
					UseRefResult.current = true
					SubmitFreeTrialTopBarChipModule.dismiss()
				end
			end
			
			UseRefResult2.current = onTouchBegan
			UseRefResult3.current = onTouchEnded
			table.insert(List, Current.InputBegan:Connect(onTouchBegan))
			table.insert(List, Current.InputEnded:Connect(onTouchEnded))
		end
		return function()
			-- upvalues: UseRefResult2 (upval), UseRefResult3 (upval), List (copy), UseRefResult1 (upval)
			function UseRefResult2:current() end
			
			function UseRefResult3:current() end
			
			for _, Connection in List do
				Connection:Disconnect()
			end
			local Current = UseRefResult1.current
			
			if Current ~= nil then
				task.cancel(Current)
				UseRefResult1.current = nil
			end
		end
	end, {
		IsVisible,
		IsSettled,
		RevealLayer,
		ChipDismissInputModule,
		ChipDismissInputModule2
	})
	
	return {
		hovered = UseStateResult,
		pointerDismiss = ChipDismissInputModule,
		onChipStateChanged = onChipStateChanged,
		onCloseActivated = onCloseActivated,
		onCloseStateChanged = onCloseStateChanged,
		onTouchBegan = function(p2)
			-- upvalues: UseRefResult2 (copy)
			UseRefResult2.current(p2)
		end,
		onTouchEnded = function(p2)
			-- upvalues: UseRefResult3 (copy)
			UseRefResult3.current(p2)
		end,
		consumeSuppressedActivation = consumeSuppressedActivation
	}
end