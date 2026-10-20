local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local InputModeModule = require(Foundation.Utility.Input.InputMode)
local GetInputModeModule = require(Foundation.Utility.Input.getInputMode)
local UserInputService = require(Foundation.Utility.Wrappers.Services).UserInputService
local CalculateSliderFractionModule = require(Foundation.Components.Slider.calculateSliderFraction)
local GetGuiInputPositionModule = require(Foundation.Components.Slider.getGuiInputPosition)
local _ = require(script.Parent.useSliderThumbs)

local function getNearestThumbIndex(p1, Entry): number
	local v1 = 1
	local Magnitude = math.abs(Entry[1] - p1)
	
	for i = 2, #Entry do
		local Magnitude1 = math.abs(Entry[i] - p1)
		local IsEntryBelow: boolean = Entry[i] == Entry[v1] and p1 > Entry[i]
		
		if Magnitude1 < Magnitude or IsEntryBelow then
			v1 = i
			Magnitude = Magnitude1
		end
	end
	return v1
end

return function(p2)
	-- upvalues: ReactModule (copy), CalculateSliderFractionModule (copy), GetGuiInputPositionModule (copy), GetInputModeModule (copy), UserInputService (copy), InputModeModule (copy), getNearestThumbIndex (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p3)
		-- upvalues: UseStateResult2 (copy), p2 (copy)
		UseStateResult2(p3)
		p2.setActiveIndex(p3)
		
		if p2.onDragStarted then
			p2.onDragStarted()
		end
	end, { p2.setActiveIndex, p2.onDragStarted })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), p2 (copy)
		UseStateResult2(nil)
		
		if p2.onDragEnded then
			p2.onDragEnded()
		end
	end, { p2.onDragEnded })
	local UseResult2 = ReactModule.useCallback(function(p3)
		-- upvalues: p2 (copy), CalculateSliderFractionModule (upval), GetGuiInputPositionModule (upval)
		local Current = p2.rootRef.current
		
		return if Current then CalculateSliderFractionModule(GetGuiInputPositionModule(p3, Current), Current, p2.isVertical) else nil
	end, { p2.isVertical, p2.rootRef })
	
	return {
		draggedIndex = UseStateResult,
		onThumbDragStarted = UseResult,
		onThumbDragEnded = UseResult1,
		onTrackDragStarted = ReactModule.useCallback(function(_, p3)
			-- upvalues: UseResult2 (copy), GetInputModeModule (upval), UserInputService (upval), InputModeModule (upval), p2 (copy), getNearestThumbIndex (upval), UseRefResult (copy), UseResult (copy)
			local UseResultResult = UseResult2(p3)
			
			if GetInputModeModule(UserInputService:GetLastInputType()) == InputModeModule.Directional or UseResultResult == nil then return end
			local Fractions = {}
			
			for i, thumb in p2.thumbs do
				Fractions[i] = p2.toFraction(thumb.value:getValue())
			end
			local NearestThumbIndex = getNearestThumbIndex(UseResultResult, Fractions)
			UseRefResult.current = NearestThumbIndex
			UseResult(NearestThumbIndex)
			p2.seekThumb(NearestThumbIndex, UseResultResult)
		end, {
			UseResult2,
			p2.thumbs,
			p2.toFraction,
			UseResult,
			p2.seekThumb
		}),
		onTrackDrag = ReactModule.useCallback(function(_, p4)
			-- upvalues: UseRefResult (copy), UseResult2 (copy), p2 (copy)
			local Current = UseRefResult.current
			local UseResultResult = UseResult2(p4)
			
			if Current ~= nil and UseResultResult ~= nil then
				p2.seekThumb(Current, UseResultResult)
				
				return
			end
		end, { UseResult2, p2.seekThumb }),
		onTrackDragEnded = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), UseResult1 (copy)
			if UseRefResult.current ~= nil then
				UseRefResult.current = nil
				UseResult1()
				
				return
			end
		end, { UseResult1 })
	}
end