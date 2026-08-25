local promiseModule = require(game:GetService("CorePackages").Packages.Promise)
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local trackerMenuModule = require(robloxGui.Modules.Tracker.TrackerMenu)
local trackerPromptTypeModule = require(robloxGui.Modules.Tracker.TrackerPromptType)

return function()
	-- upvalues: trackerMenuModule (ref), trackerPromptTypeModule (ref), promiseModule (ref)
	trackerMenuModule:showPrompt(trackerPromptTypeModule.None)
	promiseModule.delay(0.016666666667):andThen(function()
		-- upvalues: trackerMenuModule (copy), trackerPromptTypeModule (copy)
		trackerMenuModule:showPrompt(trackerPromptTypeModule.VideoNoPermission)
	end)
end