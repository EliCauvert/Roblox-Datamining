local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local _ = require(AbuseReportMenu.Components.Types)
local TnSIXPWrapperModule = require(AbuseReportMenu.IXP.TnSIXPWrapper)
local RunScreenshotCaptureSequenceModule = require(script.Parent.runScreenshotCaptureSequence)

local function _() --[[ Line: 29 | Named "emptySnapshot" ]]
	-- upvalues: ConstantsModule (copy)
	return {
		screenshotId = "",
		identificationResults = ConstantsModule.InitialIdentificationResults
	}
end

return function() --[[ Line: 54 | Named "useCaptureScreenshotV2" ]]
	-- upvalues: ReactModule (copy), ConstantsModule (copy), TnSIXPWrapperModule (copy), RunScreenshotCaptureSequenceModule (copy)
	local UseRefResult = ReactModule.useRef({
		screenshotId = "",
		identificationResults = ConstantsModule.InitialIdentificationResults
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local Idle = ReactModule.useRef("idle")
	local ReportAnythingAvatarEnabled = TnSIXPWrapperModule.getReportAnythingAvatarEnabled() or TnSIXPWrapperModule.getReportAnythingExperienceEnabled()
	local UseRefResult1 = ReactModule.useRef(ReportAnythingAvatarEnabled)
	UseRefResult1.current = ReportAnythingAvatarEnabled
	
	return {
		captureIfApplicable = ReactModule.useCallback(function(p1) --[[ Line: 81 ]]
			-- upvalues: UseRefResult1 (copy), Idle (copy), RunScreenshotCaptureSequenceModule (upval), UseStateResult2 (copy), UseRefResult (copy)
			if UseRefResult1.current and Idle.current == "idle" then
				Idle.current = "capturing"
				RunScreenshotCaptureSequenceModule({
					hide = p1.hide,
					show = p1.show,
					onScreenshotTaken = function() --[[ Line: 91 ]]
						-- upvalues: UseStateResult2 (upval)
						UseStateResult2(true)
					end,
					onScreenshotUploaded = function(ScreenshotId) --[[ Line: 94 ]]
						-- upvalues: UseRefResult (upval)
						UseRefResult.current = {
							screenshotId = ScreenshotId,
							identificationResults = UseRefResult.current.identificationResults
						}
					end,
					onIdentificationCompleted = function(IdentificationResults) --[[ Line: 100 ]]
						-- upvalues: UseRefResult (upval)
						UseRefResult.current = {
							screenshotId = UseRefResult.current.screenshotId,
							identificationResults = IdentificationResults
						}
					end,
					onCaptureEnd = function() --[[ Line: 106 ]]
						-- upvalues: Idle (upval)
						Idle.current = "done"
					end
				})
				
				return
			end
		end, {}),
		reset = ReactModule.useCallback(function() --[[ Line: 71 ]]
			-- upvalues: UseRefResult (copy), ConstantsModule (upval), Idle (copy), UseStateResult2 (copy)
			UseRefResult.current = {
				screenshotId = "",
				identificationResults = ConstantsModule.InitialIdentificationResults
			}
			Idle.current = "idle"
			UseStateResult2(false)
		end, {}),
		getIsCapturing = ReactModule.useCallback(function(): boolean --[[ Line: 77 ]]
			-- upvalues: Idle (copy)
			return Idle.current == "capturing"
		end, {}),
		isCaptureApplicable = ReportAnythingAvatarEnabled,
		isScreenshotTaken = UseStateResult,
		snapshotRef = UseRefResult
	}
end