local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Services.RoactAnalytics)
local EventStreamUpdateComponent = require(CorePackages.Packages.Roact).Component:extend("EventStreamUpdateComponent")

function EventStreamUpdateComponent:render()
	return nil
end

function EventStreamUpdateComponent.didMount(p1)
	-- upvalues: RunService (copy)
	local Analytics = p1.props.analytics
	local ReleasePeriod = p1.props.releasePeriod
	
	local function _()
		-- upvalues: Analytics (copy)
		Analytics.EventStream:releaseRBXEventStream()
	end
	
	p1.releaseEvents = true
	spawn(function()
		-- upvalues: ReleasePeriod (copy), p1 (copy), Analytics (copy)
		wait(ReleasePeriod)
		while p1.releaseEvents do
			Analytics.EventStream:releaseRBXEventStream()
			wait(ReleasePeriod)
		end
	end)
	
	if not RunService:IsStudio() then
		game:BindToClose(function()
			-- upvalues: p1 (copy), Analytics (copy)
			p1.releaseEvents = false
			Analytics.EventStream:releaseRBXEventStream()
		end)
	end
end

return RoactServices.connect({ analytics = RoactAnalyticsModule })(EventStreamUpdateComponent)