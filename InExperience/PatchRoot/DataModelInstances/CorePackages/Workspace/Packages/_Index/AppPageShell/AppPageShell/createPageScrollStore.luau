local AppPageShell = script:FindFirstAncestor("AppPageShell")
local Parent = AppPageShell.Parent
local SignalsModule = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local IsEndReachedModule = require(AppPageShell.isEndReached)
local FFlagSduiFeedScrollBarFixes = require(Parent.SharedFlags).FFlagSduiFeedScrollBarFixes

return function() --[[ Line: 39 | Named "createPageScrollStore" ]]
	-- upvalues: SignalsModule (copy), IsEndReachedModule (copy), SignalsExperimentalModule (copy), FFlagSduiFeedScrollBarFixes (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	local Signal3, Signal2_2 = SignalsModule.createSignal(0)
	local Signal4, Signal2_3 = SignalsModule.createSignal(0)
	local Signal5, Signal2_4 = SignalsModule.createSignal(nil)
	
	local function _(ScrollFrame) --[[ Line: 67 | Named "writeExtents" ]]
		-- upvalues: Signal2_2 (copy), Signal2_3 (copy)
		Signal2_2(ScrollFrame.AbsoluteWindowSize.Y)
		Signal2_3(ScrollFrame.AbsoluteCanvasSize.Y)
	end
	
	return {
		getScrollingFrame = Signal,
		setScrollingFrame = function(ScrollFrame) --[[ Line: 79 ]]
			-- upvalues: Signal2 (copy), FFlagSduiFeedScrollBarFixes (upval), SignalsExperimentalModule (upval), Signal2_1 (copy), Signal2_2 (copy), Signal2_3 (copy)
			Signal2(ScrollFrame)
			
			if FFlagSduiFeedScrollBarFixes and ScrollFrame ~= nil then
				SignalsExperimentalModule.batch(function() --[[ Line: 83 ]]
					-- upvalues: ScrollFrame (copy), Signal2_1 (upval), Signal2_2 (upval), Signal2_3 (upval)
					Signal2_1(ScrollFrame.CanvasPosition.Y)
					Signal2_2(ScrollFrame.AbsoluteWindowSize.Y)
					Signal2_3(ScrollFrame.AbsoluteCanvasSize.Y)
				end)
			end
		end,
		getCanvasPosition = Signal1,
		getViewportHeight = Signal3,
		getContentHeight = Signal4,
		setCanvasPosition = Signal2_1,
		setViewportHeight = Signal2_2,
		setContentHeight = Signal2_3,
		setCanvasPositionFromScrollingFrame = function(ScrollFrame) --[[ Line: 57 ]]
			-- upvalues: Signal2_1 (copy)
			Signal2_1(ScrollFrame.CanvasPosition.Y)
		end,
		setViewportHeightFromScrollingFrame = function(p1) --[[ Line: 60 ]]
			-- upvalues: Signal2_2 (copy)
			Signal2_2(p1.AbsoluteWindowSize.Y)
		end,
		setContentHeightFromScrollingFrame = function(ScrollFrame) --[[ Line: 63 ]]
			-- upvalues: Signal2_3 (copy)
			Signal2_3(ScrollFrame.AbsoluteCanvasSize.Y)
		end,
		setExtentsFromScrollingFrame = function(ScrollFrame) --[[ Line: 71 ]]
			-- upvalues: SignalsExperimentalModule (upval), Signal2_2 (copy), Signal2_3 (copy)
			SignalsExperimentalModule.batch(function() --[[ Line: 72 ]]
				-- upvalues: ScrollFrame (copy), Signal2_2 (upval), Signal2_3 (upval)
				Signal2_2(ScrollFrame.AbsoluteWindowSize.Y)
				Signal2_3(ScrollFrame.AbsoluteCanvasSize.Y)
			end)
		end,
		getIsEndReached = SignalsModule.createComputed(function(p1) --[[ Line: 48 ]]
			-- upvalues: IsEndReachedModule (upval), Signal1 (copy), Signal3 (copy), Signal4 (copy), Signal5 (copy)
			return IsEndReachedModule(Signal1(p1), Signal3(p1), Signal4(p1), Signal5(p1))
		end),
		setEndReachedThreshold = Signal2_4
	}
end