local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactServices = require(game:GetService("CorePackages").Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsAppRouterModule = require(Modules.LuaApp.Services.RoactAnalyticsAppRouter)
local list = { 2, 10 }
local PageHeartbeatTimer = require(Modules.Common.Roact).PureComponent:extend("PageHeartbeatTimer")

function PageHeartbeatTimer.init(p1)
	-- upvalues: list (copy)
	p1.tasks = {}
	
	function p1.createDelayedTask(p2, p3, CurrentPageGoal, Callback)
		-- upvalues: p1 (copy)
		local Flag = false;
		(p1.props.mockTaskDelay and p1.props.mockTaskDelay or task.delay)(p2, function()
			-- upvalues: Flag (ref), Callback (copy), p3 (copy), CurrentPageGoal (copy)
			if not Flag then
				Callback(p3, CurrentPageGoal)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end
	
	function p1.cancelTasks()
		-- upvalues: p1 (copy)
		for _, _task in ipairs(p1.tasks) do
			if _task ~= nil then
				_task()
			end
		end
		p1.tasks = {}
	end
	
	function p1.onPageChanged()
		-- upvalues: p1 (copy), list (upval)
		local Analytics = p1.props.analytics
		local CurrentPageGoal = p1.props.currentPageGoal
		p1.cancelTasks()
		
		for i, value in ipairs(list) do
			p1.tasks[i] = p1.createDelayedTask(value, i, CurrentPageGoal, function(p2, CurrentPageGoal)
				-- upvalues: p1 (upval), Analytics (copy)
				if p1.props.currentPageGoal == CurrentPageGoal then
					Analytics.reportPageHeartbeat(p2, CurrentPageGoal)
				end
			end)
		end
	end
end

function PageHeartbeatTimer:render() end

function PageHeartbeatTimer.didUpdate(p2)
	p2.onPageChanged()
end

function PageHeartbeatTimer.didMount(p2)
	p2.onPageChanged()
end

function PageHeartbeatTimer.willUnmount(p2)
	p2.cancelTasks()
end

return RoactServices.connect({ analytics = RoactAnalyticsAppRouterModule })(PageHeartbeatTimer)