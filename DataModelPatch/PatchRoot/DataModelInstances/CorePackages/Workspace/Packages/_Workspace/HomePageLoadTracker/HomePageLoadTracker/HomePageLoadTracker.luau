local Default = require(script:FindFirstAncestor("HomePageLoadTracker").Parent.LoggingProtocol).default
local Flag = false
local Flag1 = false
local Flag2 = false
local Flag3 = false
local Launch_type = nil

return {
	beginVisit = function()
		-- upvalues: Flag (ref), Launch_type (ref), Flag1 (ref), Flag2 (ref), Flag3 (ref), Default (copy)
		local Warm: string = if Flag then "warm" else "cold"
		Flag = true
		Launch_type = Warm
		Flag1 = false
		Flag2 = false
		Flag3 = false
		Default:logEvent("home_page_load_begin", { launch_type = Warm })
	end,
	logRenderStarted = function()
		-- upvalues: Flag1 (ref), Default (copy), Launch_type (ref)
		if not Flag1 then
			Flag1 = true
			Default:logEvent("home_page_render_started", { launch_type = Launch_type })
			
			return
		end
	end,
	logSurfaceMounted = function()
		-- upvalues: Flag2 (ref), Default (copy), Launch_type (ref)
		if not Flag2 then
			Flag2 = true
			Default:logEvent("home_page_surface_mounted", { launch_type = Launch_type })
			
			return
		end
	end,
	logFunctionallyReadyAndEnd = function()
		-- upvalues: Flag3 (ref), Default (copy), Launch_type (ref)
		if not Flag3 then
			Flag3 = true
			Default:logEvent("home_page_functionally_ready", { launch_type = Launch_type })
			Default:logEvent("home_page_load_end", { launch_type = Launch_type })
			
			return
		end
	end,
	isWarmVisit = function(): boolean
		-- upvalues: Launch_type (ref)
		return Launch_type == "warm"
	end
}