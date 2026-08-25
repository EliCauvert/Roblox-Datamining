local promiseModule = require(script:FindFirstAncestor("ExpChat").Parent.Promise)
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref)
	return setmetatable({ goalTime = p0 }, t)
end

function t:start()
	-- upvalues: promiseModule (ref)
	self:stop()
	self.promise = promiseModule.delay(self.goalTime)
	
	return self.promise
end

function t:stop()
	if self.promise then
		self.promise:cancel()
	end
end

return t