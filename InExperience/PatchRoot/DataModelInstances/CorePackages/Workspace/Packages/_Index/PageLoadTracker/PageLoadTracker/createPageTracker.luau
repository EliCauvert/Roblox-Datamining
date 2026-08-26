local recordMilestoneModule = require(script.Parent.recordMilestone)
local pageLoadConfigModule = require(script.Parent.PageLoadConfig)
local _ = require(script.Parent.PageLoadTypes)
local signal = require(script.Parent.Parent.AppCommonLib).Signal
local sharedFlagsModule = require(script.Parent.Parent.SharedFlags)
local isElementContentfulModule = require(script.Parent.isElementContentful)
local IDLE_TIMEOUT_SECONDS = pageLoadConfigModule.IDLE_TIMEOUT_SECONDS

local function _(p1)
	return p1.AbsoluteSize.X * p1.AbsoluteSize.Y
end

return function()
	-- upvalues: signal (ref), sharedFlagsModule (ref), IDLE_TIMEOUT_SECONDS (ref), recordMilestoneModule (ref), isElementContentfulModule (ref)
	return {
		pageName = "",
		startTime = 0,
		lastActivityTime = 0,
		timeoutThread = nil,
		isActive = false,
		numLoads = 0,
		onCompleteSignal = signal.new(),
		sentMilestones = {},
		start = function(p1, p2)
			-- upvalues: sharedFlagsModule (copy), IDLE_TIMEOUT_SECONDS (copy)
			if p1.isActive then return end
			p1.pageName = p2 or "UnknownPage"
			p1.startTime = os.clock()
			p1.lastActivityTime = p1.startTime
			p1.isActive = true
			p1.numLoads += 1
			p1.sentMilestones = {}
			
			if sharedFlagsModule.FFlagLuaAppEnableContentfulPaintTracking then
				if sharedFlagsModule.FFlagLuaAppLCPTimingFix then
					p1.LCPCandidate = { guiArea = 0, timestamp = p1.startTime }
				else
					p1.LCPCandidate = { guiArea = 0, timestamp = 0 }
				end
			end
			p1.timeoutThread = task.delay(IDLE_TIMEOUT_SECONDS, function()
				-- upvalues: p1 (ref)
				p1:complete()
			end)
		end,
		logMilestone = function(p1)
			-- upvalues: IDLE_TIMEOUT_SECONDS (copy)
			if not p1.isActive then return end
			p1.lastActivityTime = os.clock()
			
			if p1.timeoutThread then
				task.cancel(p1.timeoutThread)
			end
			p1.timeoutThread = task.delay(IDLE_TIMEOUT_SECONDS, function()
				-- upvalues: p1 (ref)
				p1:complete()
			end)
		end,
		sendMilestone = function(p1, p2, p3)
			-- upvalues: sharedFlagsModule (copy), recordMilestoneModule (copy)
			local var1 = if sharedFlagsModule.FFlagLuaAppEnableContentfulPaintTracking then ((p3 or os.clock()) - p1.startTime) * 1000 else (os.clock() - p1.startTime) * 1000
			
			if sharedFlagsModule.FFlagLuaAppEnableMilestoneDeduplication then
				if p1.sentMilestones[p2] then return end
				p1.sentMilestones[p2] = true
			end
			recordMilestoneModule({
				app_page_name = p1.pageName,
				milestone_name = p2,
				time_from_start = var1,
				first_load = p1.numLoads == 1
			})
		end,
		onComponentAdded = function(p1, p2)
			-- upvalues: sharedFlagsModule (copy), isElementContentfulModule (copy)
			if not p1.isActive then return end
			if sharedFlagsModule.FFlagLuaAppEnableContentfulPaintTracking and isElementContentfulModule(p2) then
				local var1 = p2.AbsoluteSize.X * p2.AbsoluteSize.Y
				
				if p1.LCPCandidate.guiArea < var1 then
					p1:sendMilestone("first_contentful_paint")
					p1.LCPCandidate = { guiArea = var1, timestamp = os.clock() }
				end
			end
			p1:logMilestone()
		end,
		stop = function(p1)
			-- upvalues: sharedFlagsModule (copy)
			if not p1.isActive then return end
			if p1.timeoutThread then
				task.cancel(p1.timeoutThread)
				p1.timeoutThread = nil
			end
			p1.isActive = false
			
			if sharedFlagsModule.FFlagPageLoadAllowImprovedDisconnectTiming then
				p1.onCompleteSignal:fire()
			end
		end,
		complete = function(p1)
			-- upvalues: sharedFlagsModule (copy), recordMilestoneModule (copy)
			if not p1.isActive then return end
			if not sharedFlagsModule.FFlagLuaAppEnableContentfulPaintTracking then
				p1.isActive = false
			end
			p1.timeoutThread = nil
			
			if sharedFlagsModule.FFlagLuaAppEnableContentfulPaintTracking then
				p1:sendMilestone("initial_viewport_loaded", p1.lastActivityTime)
				
				if not sharedFlagsModule.FFlagLuaAppLCPTimingFix then
					p1:sendMilestone("largest_contentful_paint", p1.LCPCandidate.timestamp)
				elseif p1.LCPCandidate.guiArea > 0 then
					p1:sendMilestone("largest_contentful_paint", p1.LCPCandidate.timestamp)
				end
			else
				recordMilestoneModule({
					milestone_name = "initial_viewport_loaded",
					app_page_name = p1.pageName,
					time_from_start = (p1.lastActivityTime - p1.startTime) * 1000,
					first_load = p1.numLoads == 1
				})
			end
			if sharedFlagsModule.FFlagPageLoadAllowImprovedDisconnectTiming then
				p1.onCompleteSignal:fire()
			end
		end
	}
end