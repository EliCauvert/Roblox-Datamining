local CoreGui = game:GetService("CoreGui")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local TrackerPromptModule = require(CoreGui:WaitForChild("RobloxGui").Modules.Tracker.TrackerPrompt)
local Module = {}
Module.__index = Module

function Module:showPrompt(PromptType) --[[ Line: 20 ]]
	-- upvalues: RoactModule (copy), TrackerPromptModule (copy), CoreGui (copy)
	if self.trackerPrompt then
		RoactModule.update(self.trackerPrompt, RoactModule.createElement(TrackerPromptModule, { promptType = PromptType }))
		
		return
	else
		self.trackerPrompt = RoactModule.mount(RoactModule.createElement(TrackerPromptModule, { promptType = PromptType }), CoreGui, "RobloxTrackerPromptGui")
	end
end

function Module.new() --[[ Line: 39 ]]
	-- upvalues: Module (copy)
	local config = { trackerPrompt = nil }
	setmetatable(config, Module)
	
	return config
end

return Module.new()