local PromiseModule = require(script:FindFirstAncestor("ExpChat").Parent.Promise)
local TimerModule = {}
TimerModule.__index = TimerModule

function TimerModule.new(GoalTime)
	-- upvalues: TimerModule (copy)
	return (setmetatable({ goalTime = GoalTime }, TimerModule))
end

function TimerModule:start()
	-- upvalues: PromiseModule (copy)
	self:stop()
	self.promise = PromiseModule.delay(self.goalTime)
	
	return self.promise
end

function TimerModule:stop()
	if self.promise then
		self.promise:cancel()
	end
end

return TimerModule