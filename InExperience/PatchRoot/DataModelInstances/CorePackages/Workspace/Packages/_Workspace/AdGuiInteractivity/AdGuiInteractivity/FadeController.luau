local runService = game:GetService("RunService")
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.lastInputTimeSec = -1
	tbl.subscriptions = {}
	tbl.lastProgress = -1
	
	return tbl
end

function t:getCurrentProgress()
	local var1 = os.clock() - self.lastInputTimeSec
	
	return if var1 < self.dwellTimeSec then 1 elseif var1 < self.dwellTimeSec + self.fadeDurationSec then 1 - (var1 - self.dwellTimeSec) / self.fadeDurationSec else 0
end

function t:inProgress()
	return self:getCurrentProgress() > 0
end

function t:isFading()
	local var1 = os.clock() - self.lastInputTimeSec
	
	return self.dwellTimeSec <= var1 and var1 < self.dwellTimeSec + self.fadeDurationSec
end

function t:updateLastInputTime()
	self.lastInputTimeSec = os.clock()
end

function t:skipToFade()
	if not self:isFading() then
		self.lastInputTimeSec = os.clock() - self.dwellTimeSec
	end
end

function t:zeroOut()
	self.lastInputTimeSec = -1
end

function t:subscribe(p1)
	-- upvalues: runService (ref)
	table.insert(self.subscriptions, p1)
	
	if not self.heartbeatConnection then
		self.heartbeatConnection = runService.RenderStepped:Connect(function()
			-- upvalues: self (ref)
			local currentProgress = self:getCurrentProgress()
			
			if currentProgress ~= self.lastProgress then
				self.lastProgress = currentProgress
				
				for i, v in ipairs(self.subscriptions) do
					v(currentProgress)
				end
			end
		end)
	end
end

function t:unsubscribe(p2)
	for i, v in ipairs(self.subscriptions) do
		if v == p2 then
			table.remove(self.subscriptions, i)
			break
		end
	end
	if #self.subscriptions == 0 and self.heartbeatConnection then
		self.heartbeatConnection:Disconnect()
		self.heartbeatConnection = nil
	end
end

t.fadeDurationSec = 1
t.dwellTimeSec = 1

return t