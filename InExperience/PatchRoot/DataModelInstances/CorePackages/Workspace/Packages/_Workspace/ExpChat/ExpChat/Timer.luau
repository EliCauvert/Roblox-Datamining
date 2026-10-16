local PromiseModule = require(script:FindFirstAncestor("ExpChat").Parent.Promise)
local TimerModule = {}
TimerModule.__index = TimerModule

function TimerModule.new(GoalTime) --[[ Line: 7 ]]
	-- upvalues: TimerModule (copy)
	return (setmetatable({ goalTime = GoalTime }, TimerModule))
end

function TimerModule:start() --[[ Line: 15 ]]
	-- upvalues: PromiseModule (copy)
	self:stop()
	self.promise = PromiseModule.delay(self.goalTime)
	
	return self.promise
end

function TimerModule:stop() --[[ Line: 24 ]]
	if self.promise then
		self.promise:cancel()
	end
end

return TimerModule