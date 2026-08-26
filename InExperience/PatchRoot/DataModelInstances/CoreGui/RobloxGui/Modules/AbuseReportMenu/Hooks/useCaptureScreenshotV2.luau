local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local reactModule = require(game:GetService("CorePackages").Packages.React)
local constantsModule = require(abuseReportMenu.Components.Constants)
local _ = require(abuseReportMenu.Components.Types)
local tnSIXPWrapperModule = require(abuseReportMenu.IXP.TnSIXPWrapper)
local runScreenshotCaptureSequenceModule = require(script.Parent.runScreenshotCaptureSequence)

local function _()
	-- upvalues: constantsModule (ref)
	return {
		screenshotId = "",
		identificationResults = constantsModule.InitialIdentificationResults
	}
end

return function()
	-- upvalues: reactModule (ref), constantsModule (ref), tnSIXPWrapperModule (ref), runScreenshotCaptureSequenceModule (ref)
	local var1 = reactModule.useRef({
		screenshotId = "",
		identificationResults = constantsModule.InitialIdentificationResults
	})
	local var2, var3 = reactModule.useState(false)
	local idle = reactModule.useRef("idle")
	local var4 = tnSIXPWrapperModule.getReportAnythingAvatarEnabled() or tnSIXPWrapperModule.getReportAnythingExperienceEnabled()
	local var5 = reactModule.useRef(var4)
	var5.current = var4
	
	return {
		captureIfApplicable = reactModule.useCallback(function(p1)
			-- upvalues: var5 (ref), idle (ref), runScreenshotCaptureSequenceModule (copy), var3 (ref), var1 (ref)
			if var5.current and idle.current == "idle" then
				idle.current = "capturing"
				runScreenshotCaptureSequenceModule({
					hide = p1.hide,
					show = p1.show,
					onScreenshotTaken = function()
						-- upvalues: var3 (copy)
						var3(true)
					end,
					onScreenshotUploaded = function(p2)
						-- upvalues: var1 (copy)
						var1.current = {
							screenshotId = p2,
							identificationResults = var1.current.identificationResults
						}
					end,
					onIdentificationCompleted = function(p2)
						-- upvalues: var1 (copy)
						var1.current = {
							screenshotId = var1.current.screenshotId,
							identificationResults = p2
						}
					end,
					onCaptureEnd = function()
						-- upvalues: idle (copy)
						idle.current = "done"
					end
				})
				
				return
			end
		end, {}),
		reset = reactModule.useCallback(function()
			-- upvalues: var1 (ref), constantsModule (copy), idle (ref), var3 (ref)
			var1.current = {
				screenshotId = "",
				identificationResults = constantsModule.InitialIdentificationResults
			}
			idle.current = "idle"
			var3(false)
		end, {}),
		getIsCapturing = reactModule.useCallback(function()
			-- upvalues: idle (ref)
			return idle.current == "capturing"
		end, {}),
		isCaptureApplicable = var4,
		isScreenshotTaken = var2,
		snapshotRef = var1
	}
end