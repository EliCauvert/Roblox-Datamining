local PromiseModule = require(game:GetService("CorePackages").Packages.Promise)
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local TrackerMenuModule = require(RobloxGui.Modules.Tracker.TrackerMenu)
local TrackerPromptTypeModule = require(RobloxGui.Modules.Tracker.TrackerPromptType)

return function() --[[ Line: 10 ]]
	-- upvalues: TrackerMenuModule (copy), TrackerPromptTypeModule (copy), PromiseModule (copy)
	TrackerMenuModule:showPrompt(TrackerPromptTypeModule.None)
	PromiseModule.delay(0.016666666666666666):andThen(function() --[[ Line: 12 ]]
		-- upvalues: TrackerMenuModule (upval), TrackerPromptTypeModule (upval)
		TrackerMenuModule:showPrompt(TrackerPromptTypeModule.VideoNoPermission)
	end)
end