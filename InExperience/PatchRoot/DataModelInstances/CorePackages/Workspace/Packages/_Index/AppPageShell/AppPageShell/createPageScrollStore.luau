local AppPageShell = script:FindFirstAncestor("AppPageShell")
local Parent = AppPageShell.Parent
local SignalsModule = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local IntervalPerformanceTrackerModule = require(Parent.IntervalPerformanceTracker)
local IsEndReachedModule = require(AppPageShell.isEndReached)
local FFlagSduiFeedScrollBarFixes = require(Parent.SharedFlags).FFlagSduiFeedScrollBarFixes
local FFlagAppPageShellScrollTelemetry = require(Parent.SharedFlags).FFlagAppPageShellScrollTelemetry

return function(DebugName)
	-- upvalues: SignalsModule (copy), IsEndReachedModule (copy), IntervalPerformanceTrackerModule (copy), FFlagAppPageShellScrollTelemetry (copy), SignalsExperimentalModule (copy), FFlagSduiFeedScrollBarFixes (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	local Signal3, Signal2_2 = SignalsModule.createSignal(0)
	local Signal4, Signal2_3 = SignalsModule.createSignal(0)
	local Signal5, Signal2_4 = SignalsModule.createSignal(nil)
	local ScrollIntervalPerformanceTracker = nil
	
	local function rebindTracker(ScrollFrame)
		-- upvalues: ScrollIntervalPerformanceTracker (ref), DebugName (copy), IntervalPerformanceTrackerModule (upval)
		if ScrollIntervalPerformanceTracker then
			ScrollIntervalPerformanceTracker.cleanup()
			ScrollIntervalPerformanceTracker = nil
		end
		if DebugName and ScrollFrame then
			ScrollIntervalPerformanceTracker = IntervalPerformanceTrackerModule.createScrollIntervalPerformanceTracker(DebugName, ScrollFrame, nil, { scrollOptions = { debugName = DebugName } })
		end
	end
	
	local function _(ScrollFrame)
		-- upvalues: Signal2_2 (copy), Signal2_3 (copy)
		Signal2_2(ScrollFrame.AbsoluteWindowSize.Y)
		Signal2_3(ScrollFrame.AbsoluteCanvasSize.Y)
	end
	
	return {
		getScrollingFrame = Signal,
		setScrollingFrame = function(ScrollFrame)
			-- upvalues: FFlagAppPageShellScrollTelemetry (upval), Signal (copy), rebindTracker (copy), Signal2 (copy), FFlagSduiFeedScrollBarFixes (upval), SignalsExperimentalModule (upval), Signal2_1 (copy), ScrollIntervalPerformanceTracker (ref), Signal2_2 (copy), Signal2_3 (copy)
			if FFlagAppPageShellScrollTelemetry and ScrollFrame ~= Signal(false) then
				rebindTracker(ScrollFrame)
			end
			Signal2(ScrollFrame)
			
			if FFlagSduiFeedScrollBarFixes and ScrollFrame ~= nil then
				SignalsExperimentalModule.batch(function()
					-- upvalues: ScrollFrame (copy), Signal2_1 (upval), FFlagAppPageShellScrollTelemetry (upval), ScrollIntervalPerformanceTracker (upval), Signal2_2 (upval), Signal2_3 (upval)
					Signal2_1(ScrollFrame.CanvasPosition.Y)
					
					if FFlagAppPageShellScrollTelemetry and ScrollIntervalPerformanceTracker then
						ScrollIntervalPerformanceTracker.onScrollTick()
					end
					Signal2_2(ScrollFrame.AbsoluteWindowSize.Y)
					Signal2_3(ScrollFrame.AbsoluteCanvasSize.Y)
				end)
			end
		end,
		getCanvasPosition = Signal1,
		getViewportHeight = Signal3,
		getContentHeight = Signal4,
		setCanvasPosition = function(p1)
			-- upvalues: Signal2_1 (copy), FFlagAppPageShellScrollTelemetry (upval), ScrollIntervalPerformanceTracker (ref)
			Signal2_1(p1)
			
			if FFlagAppPageShellScrollTelemetry and ScrollIntervalPerformanceTracker then
				ScrollIntervalPerformanceTracker.onScrollTick()
			end
		end,
		setViewportHeight = Signal2_2,
		setContentHeight = Signal2_3,
		setCanvasPositionFromScrollingFrame = function(ScrollFrame)
			-- upvalues: Signal2_1 (copy), FFlagAppPageShellScrollTelemetry (upval), ScrollIntervalPerformanceTracker (ref)
			Signal2_1(ScrollFrame.CanvasPosition.Y)
			
			if FFlagAppPageShellScrollTelemetry and ScrollIntervalPerformanceTracker then
				ScrollIntervalPerformanceTracker.onScrollTick()
			end
		end,
		setViewportHeightFromScrollingFrame = function(p1)
			-- upvalues: Signal2_2 (copy)
			Signal2_2(p1.AbsoluteWindowSize.Y)
		end,
		setContentHeightFromScrollingFrame = function(ScrollFrame)
			-- upvalues: Signal2_3 (copy)
			Signal2_3(ScrollFrame.AbsoluteCanvasSize.Y)
		end,
		setExtentsFromScrollingFrame = function(ScrollFrame)
			-- upvalues: SignalsExperimentalModule (upval), Signal2_2 (copy), Signal2_3 (copy)
			SignalsExperimentalModule.batch(function()
				-- upvalues: ScrollFrame (copy), Signal2_2 (upval), Signal2_3 (upval)
				Signal2_2(ScrollFrame.AbsoluteWindowSize.Y)
				Signal2_3(ScrollFrame.AbsoluteCanvasSize.Y)
			end)
		end,
		getIsEndReached = SignalsModule.createComputed(function(p1)
			-- upvalues: IsEndReachedModule (upval), Signal1 (copy), Signal3 (copy), Signal4 (copy), Signal5 (copy)
			return IsEndReachedModule(Signal1(p1), Signal3(p1), Signal4(p1), Signal5(p1))
		end),
		setEndReachedThreshold = Signal2_4
	}
end