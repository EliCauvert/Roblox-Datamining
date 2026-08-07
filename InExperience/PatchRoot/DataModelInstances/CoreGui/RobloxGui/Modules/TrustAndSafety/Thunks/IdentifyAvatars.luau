local _ = game:GetService("CoreGui")
local safetyService = nil
local avatarIdentification = require(game:GetService("CorePackages").Workspace.Packages.TnSAvatarIdentification).AvatarIdentification
local runService = game:GetService("RunService")
local parent = script.Parent.Parent
local hideModule = require(parent.Actions.Hide)
local showModule = require(parent.Actions.Show)
local setIdentifiedAvatarsModule = require(parent.Actions.SetIdentifiedAvatars)
local screenshotHookManagerModule = require(parent.Utility.ScreenshotHookManager)
local getVisibleAvatars = avatarIdentification.getVisibleAvatars

if game:GetEngineFeature("ReportAnythingScreenshot") then
	safetyService = game:GetService("SafetyService")
end
return function() --[[ line: 22 ]]
	-- upvalues: safetyService (write), screenshotHookManagerModule (ref), hideModule (ref), getVisibleAvatars (ref), runService (ref), showModule (ref), setIdentifiedAvatarsModule (ref)
	return function(p0) --[[ line: 23 ]]
		-- upvalues: safetyService (copy), screenshotHookManagerModule (copy), hideModule (copy), getVisibleAvatars (copy), runService (copy), showModule (copy), setIdentifiedAvatarsModule (copy)
		if safetyService == nil then
			return
		end
		coroutine.wrap(function() --[[ line: 29 ]]
			-- upvalues: screenshotHookManagerModule (copy), p0 (ref), hideModule (copy), safetyService (copy), getVisibleAvatars (copy), runService (copy), showModule (copy), setIdentifiedAvatarsModule (copy)
			screenshotHookManagerModule.doPreScreenshot()
			p0:dispatch(hideModule())
			local _ = safetyService:TakeScreenshot({ registerContent = 1 })
			local var6, _ = getVisibleAvatars()
			
			for _ = 1, 61 do
				runService.RenderStepped:Wait()
			end
			p0:dispatch(showModule())
			screenshotHookManagerModule.doPostScreenshot()
			p0:dispatch(setIdentifiedAvatarsModule(var6))
		end)()
	end
end