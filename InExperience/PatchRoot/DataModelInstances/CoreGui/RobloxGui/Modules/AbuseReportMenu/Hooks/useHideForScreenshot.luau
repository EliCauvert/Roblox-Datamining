local runService = game:GetService("RunService")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local reactModule = require(corePackagesService.Packages.React)
local abuseReportMenuScreenshotReduceMotionWaitFrames = game:DefineFastInt("AbuseReportMenuScreenshotReduceMotionWaitFrames", 20)
local abuseReportMenuScreenshotWaitFrames = game:DefineFastInt("AbuseReportMenuScreenshotWaitFrames", 10)
local fFlagIEMTabFocusNav = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagIEMTabFocusNav
local userGameSettingsService = UserSettings():GetService("UserGameSettings")

local _ = function() --[[ line: 14 ]]
	-- upvalues: userGameSettingsService (ref), abuseReportMenuScreenshotReduceMotionWaitFrames (ref), abuseReportMenuScreenshotWaitFrames (ref)
	return if userGameSettingsService.ReducedMotion then abuseReportMenuScreenshotReduceMotionWaitFrames else abuseReportMenuScreenshotWaitFrames
end

local _ = function() --[[ line: 21 ]]
	-- upvalues: userGameSettingsService (ref), abuseReportMenuScreenshotReduceMotionWaitFrames (ref), abuseReportMenuScreenshotWaitFrames (ref)
	return if userGameSettingsService.ReducedMotion then abuseReportMenuScreenshotReduceMotionWaitFrames / 60 else abuseReportMenuScreenshotWaitFrames / 60
end

return function(p0, p1, p2, p3, p4, p5) --[[ line: 28 ]]
	-- upvalues: reactModule (ref), fFlagIEMTabFocusNav (ref), guiService (ref), runService (ref), userGameSettingsService (ref), abuseReportMenuScreenshotReduceMotionWaitFrames (ref), abuseReportMenuScreenshotWaitFrames (ref)
	local var7, var8 = reactModule.useState(false)
	local var9 = if fFlagIEMTabFocusNav then reactModule.useRef(nil) else nil
	reactModule.useEffect(function() --[[ line: 38 ]]
		-- upvalues: p1 (ref), var7 (ref), fFlagIEMTabFocusNav (copy), var9 (ref), guiService (copy), var8 (ref), p0 (ref), p2 (ref), runService (copy), p4 (ref), userGameSettingsService (copy), abuseReportMenuScreenshotReduceMotionWaitFrames (copy), abuseReportMenuScreenshotWaitFrames (copy), p3 (ref), p5 (ref)
		if p1 then
			if var7 then
				if fFlagIEMTabFocusNav and var9.current and var9.current:IsDescendantOf(game) then
					guiService.SelectedCoreObject = var9.current
					var9.current = nil
				end
				var8(false)
				
				return
			elseif not p0 then return end
			if fFlagIEMTabFocusNav then
				var9.current = guiService.SelectedCoreObject
			end
			var8(true)
			p2()
			local heartbeatConnection = nil
			local var11 = 0
			local var12 = 0
			local heartbeatConnection_1 = nil
			local processTime = os.clock()
			heartbeatConnection = runService.Heartbeat:Connect(function() --[[ line: 60 ]]
				-- upvalues: var11 (write), p4 (copy), heartbeatConnection (write)
				if var11 == 1 then
					p4()
					heartbeatConnection:Disconnect()
					
					return
				end
				var11 += 1
			end)
			heartbeatConnection_1 = runService.Heartbeat:Connect(function() --[[ line: 71 ]]
				-- upvalues: processTime (ref), userGameSettingsService (copy), abuseReportMenuScreenshotReduceMotionWaitFrames (copy), abuseReportMenuScreenshotWaitFrames (copy), var12 (write), heartbeatConnection_1 (write), p3 (copy)
				if (if userGameSettingsService.ReducedMotion then abuseReportMenuScreenshotReduceMotionWaitFrames / 60 else abuseReportMenuScreenshotWaitFrames / 60) <= os.clock() - processTime and (if userGameSettingsService.ReducedMotion then abuseReportMenuScreenshotReduceMotionWaitFrames else abuseReportMenuScreenshotWaitFrames) <= var12 then
					heartbeatConnection_1:Disconnect()
					p3()
					
					return
				end
				var12 += 1
			end)
			
			return
		elseif not var7 then
			p5()
		end
	end, { p1 })
end