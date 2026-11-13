local Parent = script:FindFirstAncestor("HomePageLoadTracker").Parent
local Default = require(Parent.LoggingProtocol).default
local SharedFlagsModule = require(Parent.SharedFlags)
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local Milestone = TimeToInteractiveTracker.Milestone
local FFlagLuaAppHomePagePLTDualLog = SharedFlagsModule.FFlagLuaAppHomePagePLTDualLog
local FIntHomePagePLTSampleRate = SharedFlagsModule.FIntHomePagePLTSampleRate
local Flag = false
local Flag1 = false
local Flag2 = false
local Flag3 = false
local Launch_type = nil

return {
	beginVisit = function()
		-- upvalues: Flag (ref), Launch_type (ref), Flag1 (ref), Flag2 (ref), Flag3 (ref), Default (copy), FFlagLuaAppHomePagePLTDualLog (copy), TimeToInteractiveTracker (copy)
		local Warm: string = if Flag then "warm" else "cold"
		Flag = true
		Launch_type = Warm
		Flag1 = false
		Flag2 = false
		Flag3 = false
		Default:logEvent("home_page_load_begin", { launch_type = Warm })
		
		if FFlagLuaAppHomePagePLTDualLog then
			TimeToInteractiveTracker.trackStart("HomePage_PLT")
			TimeToInteractiveTracker.updateMetadata("HomePage_PLT", { page = "Home", coldStart = Warm == "cold" })
		end
	end,
	logRenderStarted = function()
		-- upvalues: Flag1 (ref), Default (copy), Launch_type (ref), FFlagLuaAppHomePagePLTDualLog (copy), TimeToInteractiveTracker (copy), Milestone (copy)
		if Flag1 then return end
		Flag1 = true
		Default:logEvent("home_page_render_started", { launch_type = Launch_type })
		
		if FFlagLuaAppHomePagePLTDualLog then
			TimeToInteractiveTracker.trackMilestone("HomePage_PLT", Milestone.RenderStarted)
		end
	end,
	logSurfaceMounted = function()
		-- upvalues: Flag2 (ref), Default (copy), Launch_type (ref), FFlagLuaAppHomePagePLTDualLog (copy), TimeToInteractiveTracker (copy), Milestone (copy)
		if Flag2 then return end
		Flag2 = true
		Default:logEvent("home_page_surface_mounted", { launch_type = Launch_type })
		
		if FFlagLuaAppHomePagePLTDualLog then
			TimeToInteractiveTracker.trackMilestone("HomePage_PLT", Milestone.SurfaceMounted)
		end
	end,
	logFunctionallyReadyAndEnd = function()
		-- upvalues: Flag3 (ref), Default (copy), Launch_type (ref), FFlagLuaAppHomePagePLTDualLog (copy), TimeToInteractiveTracker (copy), Milestone (copy), FIntHomePagePLTSampleRate (copy)
		if Flag3 then return end
		Flag3 = true
		Default:logEvent("home_page_functionally_ready", { launch_type = Launch_type })
		Default:logEvent("home_page_load_end", { launch_type = Launch_type })
		
		if FFlagLuaAppHomePagePLTDualLog then
			TimeToInteractiveTracker.trackMilestone("HomePage_PLT", Milestone.FunctionallyReady)
			TimeToInteractiveTracker.trackEnd("HomePage_PLT", { samplingRateOverride = FIntHomePagePLTSampleRate })
		end
	end,
	isWarmVisit = function(): boolean
		-- upvalues: Launch_type (ref)
		return Launch_type == "warm"
	end
}