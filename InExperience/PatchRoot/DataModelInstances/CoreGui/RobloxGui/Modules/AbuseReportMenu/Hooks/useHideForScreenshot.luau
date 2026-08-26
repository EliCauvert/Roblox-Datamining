local runService = game:GetService("RunService")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local reactModule = require(corePackagesService.Packages.React)
local abuseReportMenuScreenshotReduceMotionWaitFrames = game:DefineFastInt("AbuseReportMenuScreenshotReduceMotionWaitFrames", 20)
local abuseReportMenuScreenshotWaitFrames = game:DefineFastInt("AbuseReportMenuScreenshotWaitFrames", 10)
local fFlagIEMTabFocusNav = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagIEMTabFocusNav
local userGameSettingsService = UserSettings():GetService("UserGameSettings")

local _ = function()
	-- upvalues: userGameSettingsService (ref), abuseReportMenuScreenshotReduceMotionWaitFrames (ref), abuseReportMenuScreenshotWaitFrames (ref)
	return if userGameSettingsService.ReducedMotion then abuseReportMenuScreenshotReduceMotionWaitFrames else abuseReportMenuScreenshotWaitFrames
end

local _ = function()
	-- upvalues: userGameSettingsService (ref), abuseReportMenuScreenshotReduceMotionWaitFrames (ref), abuseReportMenuScreenshotWaitFrames (ref)
	return if userGameSettingsService.ReducedMotion then abuseReportMenuScreenshotReduceMotionWaitFrames / 60 else abuseReportMenuScreenshotWaitFrames / 60
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: reactModule (ref), fFlagIEMTabFocusNav (ref), guiService (ref), runService (ref), userGameSettingsService (ref), abuseReportMenuScreenshotReduceMotionWaitFrames (ref), abuseReportMenuScreenshotWaitFrames (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = if fFlagIEMTabFocusNav then reactModule.useRef(nil) else nil
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), var1 (ref), fFlagIEMTabFocusNav (copy), var3 (ref), guiService (copy), var2 (ref), p1 (ref), p3 (ref), runService (copy), p5 (ref), userGameSettingsService (copy), abuseReportMenuScreenshotReduceMotionWaitFrames (copy), abuseReportMenuScreenshotWaitFrames (copy), p4 (ref), p6 (ref)
		if p2 then
			if var1 then
				if fFlagIEMTabFocusNav and var3.current and var3.current:IsDescendantOf(game) then
					guiService.SelectedCoreObject = var3.current
					var3.current = nil
				end
				var2(false)
				
				return
			elseif not p1 then return end
			if fFlagIEMTabFocusNav then
				var3.current = guiService.SelectedCoreObject
			end
			var2(true)
			p3()
			local heartbeatConnection = nil
			local var4 = 0
			local var5 = 0
			local heartbeatConnection_1 = nil
			local processTime = os.clock()
			heartbeatConnection = runService.Heartbeat:Connect(function()
				-- upvalues: var4 (write), p5 (copy), heartbeatConnection (write)
				if var4 == 1 then
					p5()
					heartbeatConnection:Disconnect()
					
					return
				end
				var4 += 1
			end)
			heartbeatConnection_1 = runService.Heartbeat:Connect(function()
				-- upvalues: processTime (ref), userGameSettingsService (copy), abuseReportMenuScreenshotReduceMotionWaitFrames (copy), abuseReportMenuScreenshotWaitFrames (copy), var5 (write), heartbeatConnection_1 (write), p4 (copy)
				if (if userGameSettingsService.ReducedMotion then abuseReportMenuScreenshotReduceMotionWaitFrames / 60 else abuseReportMenuScreenshotWaitFrames / 60) <= os.clock() - processTime and (if userGameSettingsService.ReducedMotion then abuseReportMenuScreenshotReduceMotionWaitFrames else abuseReportMenuScreenshotWaitFrames) <= var5 then
					heartbeatConnection_1:Disconnect()
					p4()
					
					return
				end
				var5 += 1
			end)
			
			return
		elseif not var1 then
			p6()
		end
	end, { p2 })
end