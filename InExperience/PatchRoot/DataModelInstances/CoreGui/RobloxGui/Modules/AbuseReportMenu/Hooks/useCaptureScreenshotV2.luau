local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local reactModule = require(game:GetService("CorePackages").Packages.React)
local constantsModule = require(abuseReportMenu.Components.Constants)
local _ = require(abuseReportMenu.Components.Types)
local tnSIXPWrapperModule = require(abuseReportMenu.IXP.TnSIXPWrapper)
local runScreenshotCaptureSequenceModule = require(script.Parent.runScreenshotCaptureSequence)

local function _() --[[ line: 29 | named "emptySnapshot" ]]
	-- upvalues: constantsModule (ref)
	return {
		screenshotId = "",
		identificationResults = constantsModule.InitialIdentificationResults
	}
end

return function() --[[ line: 54 | named "useCaptureScreenshotV2" ]]
	-- upvalues: reactModule (ref), constantsModule (ref), tnSIXPWrapperModule (ref), runScreenshotCaptureSequenceModule (ref)
	local var5 = reactModule.useRef({
		screenshotId = "",
		identificationResults = constantsModule.InitialIdentificationResults
	})
	local var6, var7 = reactModule.useState(false)
	local idle = reactModule.useRef("idle")
	local var9 = tnSIXPWrapperModule.getReportAnythingAvatarEnabled() or tnSIXPWrapperModule.getReportAnythingExperienceEnabled()
	local var10 = reactModule.useRef(var9)
	var10.current = var9
	
	return {
		captureIfApplicable = reactModule.useCallback(function(p0) --[[ line: 81 ]]
			-- upvalues: var10 (ref), idle (ref), runScreenshotCaptureSequenceModule (copy), var7 (ref), var5 (ref)
			if var10.current and idle.current == "idle" then
				idle.current = "capturing"
				runScreenshotCaptureSequenceModule({
					hide = p0.hide,
					show = p0.show,
					onScreenshotTaken = function() --[[ line: 91 ]]
						-- upvalues: var7 (copy)
						var7(true)
					end,
					onScreenshotUploaded = function(p1) --[[ line: 94 ]]
						-- upvalues: var5 (copy)
						var5.current = {
							screenshotId = p1,
							identificationResults = var5.current.identificationResults
						}
					end,
					onIdentificationCompleted = function(p2) --[[ line: 100 ]]
						-- upvalues: var5 (copy)
						var5.current = {
							screenshotId = var5.current.screenshotId,
							identificationResults = p2
						}
					end,
					onCaptureEnd = function() --[[ line: 106 ]]
						-- upvalues: idle (copy)
						idle.current = "done"
					end
				})
				
				return
			end
		end, {}),
		reset = reactModule.useCallback(function() --[[ line: 71 ]]
			-- upvalues: var5 (ref), constantsModule (copy), idle (ref), var7 (ref)
			var5.current = {
				screenshotId = "",
				identificationResults = constantsModule.InitialIdentificationResults
			}
			idle.current = "idle"
			var7(false)
		end, {}),
		getIsCapturing = reactModule.useCallback(function() --[[ line: 77 ]]
			-- upvalues: idle (ref)
			return idle.current == "capturing"
		end, {}),
		isCaptureApplicable = var9,
		isScreenshotTaken = var6,
		snapshotRef = var5
	}
end