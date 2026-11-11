local _ = game:GetService("CoreGui")
local SafetyService = nil
local RunService = game:GetService("RunService")
local Parent = script.Parent.Parent
local HideModule = require(Parent.Actions.Hide)
local ShowModule = require(Parent.Actions.Show)
local SetIdentifiedAvatarsModule = require(Parent.Actions.SetIdentifiedAvatars)
local ScreenshotHookManagerModule = require(Parent.Utility.ScreenshotHookManager)
local GetVisibleAvatarsFunction = require(game:GetService("CorePackages").Workspace.Packages.TnSAvatarIdentification).AvatarIdentification.getVisibleAvatars

if game:GetEngineFeature("ReportAnythingScreenshot") then
	SafetyService = game:GetService("SafetyService")
end
return function()
	-- upvalues: SafetyService (ref), ScreenshotHookManagerModule (copy), HideModule (copy), GetVisibleAvatarsFunction (copy), RunService (copy), ShowModule (copy), SetIdentifiedAvatarsModule (copy)
	return function(p1)
		-- upvalues: SafetyService (upval), ScreenshotHookManagerModule (upval), HideModule (upval), GetVisibleAvatarsFunction (upval), RunService (upval), ShowModule (upval), SetIdentifiedAvatarsModule (upval)
		if SafetyService ~= nil then
			coroutine.wrap(function()
				-- upvalues: ScreenshotHookManagerModule (upval), p1 (copy), HideModule (upval), SafetyService (upval), GetVisibleAvatarsFunction (upval), RunService (upval), ShowModule (upval), SetIdentifiedAvatarsModule (upval)
				ScreenshotHookManagerModule.doPreScreenshot()
				p1:dispatch(HideModule())
				local _ = SafetyService:TakeScreenshot({ registerContent = 1 })
				local VisibleAvatars, _ = GetVisibleAvatarsFunction()
				
				for _ = 1, 61 do
					RunService.RenderStepped:Wait()
				end
				p1:dispatch(ShowModule())
				ScreenshotHookManagerModule.doPostScreenshot()
				p1:dispatch(SetIdentifiedAvatarsModule(VisibleAvatars))
			end)()
			
			return
		end
	end
end