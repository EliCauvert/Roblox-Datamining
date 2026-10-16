local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local ReactModule = require(CorePackages.Packages.React)
local AbuseReportMenuScreenshotReduceMotionWaitFrames = game:DefineFastInt("AbuseReportMenuScreenshotReduceMotionWaitFrames", 20)
local AbuseReportMenuScreenshotWaitFrames = game:DefineFastInt("AbuseReportMenuScreenshotWaitFrames", 10)
local FFlagIEMTabFocusNav = require(CorePackages.Workspace.Packages.SharedFlags).FFlagIEMTabFocusNav
local UserGameSettings = UserSettings():GetService("UserGameSettings")

local function _() --[[ Line: 14 ]]
	-- upvalues: UserGameSettings (copy), AbuseReportMenuScreenshotReduceMotionWaitFrames (copy), AbuseReportMenuScreenshotWaitFrames (copy)
	return if UserGameSettings.ReducedMotion then AbuseReportMenuScreenshotReduceMotionWaitFrames else AbuseReportMenuScreenshotWaitFrames
end

local _ = function(): number --[[ Line: 21 ]]
	-- upvalues: UserGameSettings (copy), AbuseReportMenuScreenshotReduceMotionWaitFrames (copy), AbuseReportMenuScreenshotWaitFrames (copy)
	return if UserGameSettings.ReducedMotion then AbuseReportMenuScreenshotReduceMotionWaitFrames / 60 else AbuseReportMenuScreenshotWaitFrames / 60
end

return function(p1, p2, Callback, Callback2, Callback1, p3) --[[ Line: 28 ]]
	-- upvalues: ReactModule (copy), FFlagIEMTabFocusNav (copy), GuiService (copy), RunService (copy), UserGameSettings (copy), AbuseReportMenuScreenshotReduceMotionWaitFrames (copy), AbuseReportMenuScreenshotWaitFrames (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = if FFlagIEMTabFocusNav then ReactModule.useRef(nil) else nil
	ReactModule.useEffect(function() --[[ Line: 38 ]]
		-- upvalues: p2 (copy), UseStateResult (copy), FFlagIEMTabFocusNav (upval), UseRefResult (copy), GuiService (upval), UseStateResult2 (copy), p1 (copy), Callback (copy), RunService (upval), Callback1 (copy), UserGameSettings (upval), AbuseReportMenuScreenshotReduceMotionWaitFrames (upval), AbuseReportMenuScreenshotWaitFrames (upval), Callback2 (copy), p3 (copy)
		if p2 then
			if UseStateResult then
				if FFlagIEMTabFocusNav and UseRefResult.current and UseRefResult.current:IsDescendantOf(game) then
					GuiService.SelectedCoreObject = UseRefResult.current
					UseRefResult.current = nil
				end
				UseStateResult2(false)
				
				return
			else
				if p1 then
					if FFlagIEMTabFocusNav then
						UseRefResult.current = GuiService.SelectedCoreObject
					end
					UseStateResult2(true)
					Callback()
					local Connection = nil
					local Count = 0
					local Count1 = 0
					local Connection1 = nil
					local ClockTime = os.clock()
					Connection = RunService.Heartbeat:Connect(function() --[[ Line: 60 ]]
						-- upvalues: Count (ref), Callback1 (upval), Connection (ref)
						if Count == 1 then
							Callback1()
							Connection:Disconnect()
							
							return
						else
							Count += 1
						end
					end)
					Connection1 = RunService.Heartbeat:Connect(function() --[[ Line: 71 ]]
						-- upvalues: ClockTime (copy), UserGameSettings (upval), AbuseReportMenuScreenshotReduceMotionWaitFrames (upval), AbuseReportMenuScreenshotWaitFrames (upval), Count1 (ref), Connection1 (ref), Callback2 (upval)
						if (if UserGameSettings.ReducedMotion then AbuseReportMenuScreenshotReduceMotionWaitFrames / 60 else AbuseReportMenuScreenshotWaitFrames / 60) <= os.clock() - ClockTime and (if UserGameSettings.ReducedMotion then AbuseReportMenuScreenshotReduceMotionWaitFrames else AbuseReportMenuScreenshotWaitFrames) <= Count1 then
							Connection1:Disconnect()
							Callback2()
							
							return
						else
							Count1 += 1
						end
					end)
					
					return
				end
			end
		else
			local Connection = UseStateResult
			
			if not Connection then
				Connection = p3
				Connection()
			end
		end
	end, { p2 })
end