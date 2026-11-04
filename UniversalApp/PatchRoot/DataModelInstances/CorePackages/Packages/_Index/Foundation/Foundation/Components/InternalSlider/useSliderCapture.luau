local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ServicesModule = require(Foundation.Utility.Wrappers.Services)
local GuiService = ServicesModule.GuiService
local RunService = ServicesModule.RunService
local ControlStateModule = require(Foundation.Enums.ControlState)
local InputModeModule = require(Foundation.Utility.Input.InputMode)
local GetSelectionEntryDirectionModule = require(Foundation.Components.Slider.getSelectionEntryDirection)
local UseSliderCaptureKeysModule = require(Foundation.Components.Slider.useSliderCaptureKeys)
local UseSliderDirectionalInputModule = require(script.Parent.useSliderDirectionalInput)
local _ = require(script.Parent.useSliderThumbs)

return function(p1)
	-- upvalues: ReactModule (copy), ControlStateModule (copy), UseSliderCaptureKeysModule (copy), GuiService (copy), InputModeModule (copy), RunService (copy), UseSliderDirectionalInputModule (copy), GetSelectionEntryDirectionModule (copy)
	local CountThumbs = #p1.thumbs
	local UseStateResult, UseStateResult2 = ReactModule.useState(ControlStateModule.Initialize)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(1)
	local Smallest = math.min(UseStateResult3, CountThumbs)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = ReactModule.useRef(false)
	local UseRefResult4 = ReactModule.useRef(p1.lastInputMode)
	local UseStateResult1_1 = UseStateResult1 or (UseStateResult == ControlStateModule.Selected or UseStateResult == ControlStateModule.SelectedPressed)
	UseSliderCaptureKeysModule(UseStateResult1_1 and not p1.isDisabled, (ReactModule.useCallback(function()
		-- upvalues: UseStateResult1 (copy), UseStateResult2_1 (copy), CountThumbs (copy), UseStateResult2_2 (copy), Smallest (copy)
		if not UseStateResult1 then
			UseStateResult2_1(true)
			
			return
		end
		if CountThumbs > 1 then
			UseStateResult2_2(Smallest % CountThumbs + 1)
		end
	end, { UseStateResult1, CountThumbs, Smallest })))
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), GuiService (upval), UseRefResult (copy)
		UseStateResult2_1(false)
		GuiService.SelectedObject = UseRefResult.current
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2_1 (copy)
		if p1.isDisabled then
			UseStateResult2_1(false)
		end
	end, { p1.isDisabled })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult4 (copy), UseStateResult1 (copy), InputModeModule (upval), UseStateResult2_1 (copy)
		local IsNotLastInputModeMatch = p1.lastInputMode ~= UseRefResult4.current
		UseRefResult4.current = p1.lastInputMode
		
		if UseStateResult1 and IsNotLastInputModeMatch and p1.lastInputMode ~= nil and p1.lastInputMode ~= InputModeModule.Directional then
			UseStateResult2_1(false)
		end
	end, { UseStateResult1, p1.lastInputMode })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy), UseRefResult3 (copy), p1 (copy)
		if UseStateResult1 == UseRefResult3.current then return end
		UseRefResult3.current = UseStateResult1
		
		if UseStateResult1 then
			if p1.onCaptureStarted then
				p1.onCaptureStarted()
				
				return
			end
		elseif p1.onCaptureEnded then
			p1.onCaptureEnded()
		end
	end, { UseStateResult1, p1.onCaptureStarted, p1.onCaptureEnded })
	local UseRefResult5 = ReactModule.useRef(p1.onCaptureEnded)
	UseRefResult5.current = p1.onCaptureEnded
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult3 (copy), UseRefResult5 (copy)
		return function()
			-- upvalues: UseRefResult3 (upval), UseRefResult5 (upval)
			if UseRefResult3.current and UseRefResult5.current then
				UseRefResult5.current()
			end
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: GuiService (upval), p1 (copy), UseRefResult (copy), UseRefResult1 (copy)
		local function redirectDragSelection()
			-- upvalues: GuiService (upval), p1 (upval), UseRefResult (upval), UseRefResult1 (upval)
			local SelectedObject = GuiService.SelectedObject
			
			if SelectedObject == p1.rootRef.current or SelectedObject ~= nil and (p1.rootRef.current ~= nil and (SelectedObject:IsDescendantOf(p1.rootRef.current) and (SelectedObject ~= UseRefResult.current and SelectedObject ~= UseRefResult1.current))) then
				GuiService.SelectedObject = UseRefResult.current
			end
		end
		
		local SelectedObject = GuiService.SelectedObject
		
		if SelectedObject == p1.rootRef.current or SelectedObject ~= nil and (p1.rootRef.current ~= nil and (SelectedObject:IsDescendantOf(p1.rootRef.current) and (SelectedObject ~= UseRefResult.current and SelectedObject ~= UseRefResult1.current))) then
			GuiService.SelectedObject = UseRefResult.current
		end
		local Connection = GuiService:GetPropertyChangedSignal("SelectedObject"):Connect(redirectDragSelection)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { p1.rootRef })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy), UseRefResult1 (copy), GuiService (upval), RunService (upval), UseStateResult2_1 (copy), UseRefResult (copy)
		if not UseStateResult1 then return end
		local Current = UseRefResult1.current
		GuiService.SelectedObject = Current
		local Connection = nil
		
		if GuiService.SelectedObject ~= Current then
			local Count = 0
			Connection = RunService.Heartbeat:Connect(function()
				-- upvalues: Count (ref), GuiService (upval), Current (copy), Connection (ref)
				Count += 1
				GuiService.SelectedObject = Current
				
				if (GuiService.SelectedObject == Current or Count >= 10) and Connection then
					Connection:Disconnect()
					Connection = nil
				end
			end)
		end
		local Connection1 = GuiService:GetPropertyChangedSignal("SelectedObject"):Connect(function()
			-- upvalues: GuiService (upval), UseRefResult1 (upval), Connection (ref), UseStateResult2_1 (upval)
			if GuiService.SelectedObject ~= UseRefResult1.current and Connection == nil then
				UseStateResult2_1(false)
			end
		end)
		
		return function()
			-- upvalues: Connection1 (copy), Connection (ref), Current (copy), GuiService (upval), UseRefResult (upval)
			Connection1:Disconnect()
			
			if Connection then
				Connection:Disconnect()
			end
			if Current ~= nil and GuiService.SelectedObject == Current then
				GuiService.SelectedObject = UseRefResult.current
			end
		end
	end, { UseStateResult1 })
	UseSliderDirectionalInputModule(UseStateResult1 and not p1.isDisabled, p1.step, p1.range, p1.isVertical, (ReactModule.useMemo(function()
		-- upvalues: p1 (copy), Smallest (copy), UseResult (copy)
		return {
			getValue = function()
				-- upvalues: p1 (upval), Smallest (upval)
				return p1.thumbs[Smallest].value:getValue()
			end,
			onStep = function(p2)
				-- upvalues: p1 (upval), Smallest (upval)
				p1.updateThumbValue(Smallest, p1.clampToNeighbors(Smallest, p2))
			end,
			onExit = UseResult
		}
	end, {
		p1.thumbs,
		Smallest,
		p1.updateThumbValue,
		p1.clampToNeighbors,
		UseResult
	})))
	
	return {
		controlState = UseStateResult,
		isCaptured = UseStateResult1,
		isSelected = UseStateResult1_1,
		activeThumbIndex = Smallest,
		setActiveIndex = UseStateResult2_2,
		onStateChanged = ReactModule.useCallback(function(SelectedPressed)
			-- upvalues: UseStateResult2 (copy), ControlStateModule (upval), CountThumbs (copy), UseRefResult2 (copy), UseStateResult2_2 (copy), GetSelectionEntryDirectionModule (upval), p1 (copy)
			UseStateResult2(SelectedPressed)
			local IsSelectedPressedMatch: boolean = SelectedPressed == ControlStateModule.Selected or SelectedPressed == ControlStateModule.SelectedPressed
			
			if CountThumbs > 1 and IsSelectedPressedMatch and not UseRefResult2.current then
				UseStateResult2_2(if GetSelectionEntryDirectionModule(p1.isVertical) < 0 then CountThumbs else 1)
			end
			UseRefResult2.current = IsSelectedPressedMatch
		end, { CountThumbs, p1.isVertical }),
		focusTargetRef = UseRefResult,
		captureTargetRef = UseRefResult1
	}
end