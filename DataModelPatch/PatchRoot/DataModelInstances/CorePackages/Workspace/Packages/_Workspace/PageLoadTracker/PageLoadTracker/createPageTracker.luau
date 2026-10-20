local RecordMilestoneModule = require(script.Parent.recordMilestone)
local _ = require(script.Parent.PageLoadTypes)
local Signal = require(script.Parent.Parent.AppCommonLib).Signal
local SharedFlagsModule = require(script.Parent.Parent.SharedFlags)
local IsElementContentfulModule = require(script.Parent.isElementContentful)
local IDLETIMEOUTSECONDS = require(script.Parent.PageLoadConfig).IDLE_TIMEOUT_SECONDS

local function _(Frame: Frame)
	return Frame.AbsoluteSize.X * Frame.AbsoluteSize.Y
end

return function()
	-- upvalues: Signal (copy), SharedFlagsModule (copy), IDLETIMEOUTSECONDS (copy), RecordMilestoneModule (copy), IsElementContentfulModule (copy)
	return {
		pageName = "",
		startTime = 0,
		lastActivityTime = 0,
		timeoutThread = nil,
		isActive = false,
		numLoads = 0,
		onCompleteSignal = Signal.new(),
		sentMilestones = {},
		start = function(p1, p2)
			-- upvalues: SharedFlagsModule (upval), IDLETIMEOUTSECONDS (upval)
			if p1.isActive then return end
			p1.pageName = p2 or "UnknownPage"
			p1.startTime = os.clock()
			p1.lastActivityTime = p1.startTime
			p1.isActive = true
			p1.numLoads += 1
			p1.sentMilestones = {}
			
			if SharedFlagsModule.FFlagLuaAppEnableContentfulPaintTracking then
				if SharedFlagsModule.FFlagLuaAppLCPTimingFix then
					p1.LCPCandidate = { guiArea = 0, timestamp = p1.startTime }
				else
					p1.LCPCandidate = { guiArea = 0, timestamp = 0 }
				end
			end
			p1.timeoutThread = task.delay(IDLETIMEOUTSECONDS, function()
				-- upvalues: p1 (copy)
				p1:complete()
			end)
		end,
		logMilestone = function(p1)
			-- upvalues: IDLETIMEOUTSECONDS (upval)
			if not p1.isActive then return end
			p1.lastActivityTime = os.clock()
			
			if p1.timeoutThread then
				task.cancel(p1.timeoutThread)
			end
			p1.timeoutThread = task.delay(IDLETIMEOUTSECONDS, function()
				-- upvalues: p1 (copy)
				p1:complete()
			end)
		end,
		sendMilestone = function(p1, Milestone_name, Timestamp)
			-- upvalues: SharedFlagsModule (upval), RecordMilestoneModule (upval)
			local ScaledStartTime = if SharedFlagsModule.FFlagLuaAppEnableContentfulPaintTracking then ((Timestamp or os.clock()) - p1.startTime) * 1000 else (os.clock() - p1.startTime) * 1000
			
			if SharedFlagsModule.FFlagLuaAppEnableMilestoneDeduplication then
				if p1.sentMilestones[Milestone_name] then return end
				p1.sentMilestones[Milestone_name] = true
			end
			RecordMilestoneModule({
				app_page_name = p1.pageName,
				milestone_name = Milestone_name,
				time_from_start = ScaledStartTime,
				first_load = p1.numLoads == 1
			})
		end,
		onComponentAdded = function(p1, Frame: Frame)
			-- upvalues: SharedFlagsModule (upval), IsElementContentfulModule (upval)
			if not p1.isActive then return end
			if SharedFlagsModule.FFlagLuaAppEnableContentfulPaintTracking and IsElementContentfulModule(Frame) then
				local ScaledX = Frame.AbsoluteSize.X * Frame.AbsoluteSize.Y
				
				if p1.LCPCandidate.guiArea < ScaledX then
					p1:sendMilestone("first_contentful_paint")
					p1.LCPCandidate = { guiArea = ScaledX, timestamp = os.clock() }
				end
			end
			p1:logMilestone()
		end,
		stop = function(p1)
			-- upvalues: SharedFlagsModule (upval)
			if not p1.isActive then return end
			if p1.timeoutThread then
				task.cancel(p1.timeoutThread)
				p1.timeoutThread = nil
			end
			p1.isActive = false
			
			if SharedFlagsModule.FFlagPageLoadAllowImprovedDisconnectTiming then
				p1.onCompleteSignal:fire()
			end
		end,
		complete = function(p1)
			-- upvalues: SharedFlagsModule (upval), RecordMilestoneModule (upval)
			if not p1.isActive then return end
			if not SharedFlagsModule.FFlagLuaAppEnableContentfulPaintTracking then
				p1.isActive = false
			end
			p1.timeoutThread = nil
			
			if SharedFlagsModule.FFlagLuaAppEnableContentfulPaintTracking then
				p1:sendMilestone("initial_viewport_loaded", p1.lastActivityTime)
				
				if SharedFlagsModule.FFlagLuaAppLCPTimingFix then
					if p1.LCPCandidate.guiArea > 0 then
						p1:sendMilestone("largest_contentful_paint", p1.LCPCandidate.timestamp)
					end
				else
					p1:sendMilestone("largest_contentful_paint", p1.LCPCandidate.timestamp)
				end
			else
				RecordMilestoneModule({
					milestone_name = "initial_viewport_loaded",
					app_page_name = p1.pageName,
					time_from_start = (p1.lastActivityTime - p1.startTime) * 1000,
					first_load = p1.numLoads == 1
				})
			end
			if SharedFlagsModule.FFlagPageLoadAllowImprovedDisconnectTiming then
				p1.onCompleteSignal:fire()
			end
		end
	}
end