local runService = game:GetService("RunService")
local t = {}
t.__index = t

function t.new() --[[ line: 6 ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.lastInputTimeSec = -1
	tbl.subscriptions = {}
	tbl.lastProgress = -1
	
	return tbl
end

function t:getCurrentProgress() --[[ line: 15 ]]
	local var3 = os.clock() - self.lastInputTimeSec
	
	return if var3 < self.dwellTimeSec then 1 elseif var3 < self.dwellTimeSec + self.fadeDurationSec then 1 - (var3 - self.dwellTimeSec) / self.fadeDurationSec else 0
end

function t:inProgress() --[[ line: 26 ]]
	return self:getCurrentProgress() > 0
end

function t:isFading() --[[ line: 30 ]]
	local var4 = os.clock() - self.lastInputTimeSec
	
	return self.dwellTimeSec <= var4 and var4 < self.dwellTimeSec + self.fadeDurationSec
end

function t:updateLastInputTime() --[[ line: 35 ]]
	self.lastInputTimeSec = os.clock()
end

function t:skipToFade() --[[ line: 39 ]]
	if not self:isFading() then
		self.lastInputTimeSec = os.clock() - self.dwellTimeSec
	end
end

function t:zeroOut() --[[ line: 45 ]]
	self.lastInputTimeSec = -1
end

function t:subscribe(p0) --[[ line: 49 ]]
	-- upvalues: runService (ref)
	table.insert(self.subscriptions, p0)
	
	if not self.heartbeatConnection then
		self.heartbeatConnection = runService.RenderStepped:Connect(function() --[[ line: 53 ]]
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

function t:unsubscribe(p1) --[[ line: 65 ]]
	for i, v in ipairs(self.subscriptions) do
		if v == p1 then
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