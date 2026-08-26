local coreGuiService = game:GetService("CoreGui")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local trackerPromptModule = require(coreGuiService:WaitForChild("RobloxGui").Modules.Tracker.TrackerPrompt)
local t = {}
t.__index = t

function t:showPrompt(p1)
	-- upvalues: roactModule (ref), trackerPromptModule (ref), coreGuiService (ref)
	if self.trackerPrompt then
		roactModule.update(self.trackerPrompt, roactModule.createElement(trackerPromptModule, { promptType = p1 }))
		
		return
	end
	self.trackerPrompt = roactModule.mount(roactModule.createElement(trackerPromptModule, { promptType = p1 }), coreGuiService, "RobloxTrackerPromptGui")
end

function t.new()
	-- upvalues: t (ref)
	local t_1 = { trackerPrompt = nil }
	setmetatable(t_1, t)
	
	return t_1
end

return t.new()