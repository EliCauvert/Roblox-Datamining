local RunService = game:GetService("RunService")
local FadeController = {}
FadeController.__index = FadeController

function FadeController.new() --[[ Line: 6 ]]
	-- upvalues: FadeController (copy)
	local self = setmetatable({}, FadeController)
	self.lastInputTimeSec = -1
	self.subscriptions = {}
	self.lastProgress = -1
	
	return self
end

function FadeController:getCurrentProgress(): number --[[ Line: 15 ]]
	local Elapsed = os.clock() - self.lastInputTimeSec
	
	return if Elapsed < self.dwellTimeSec then 1 elseif Elapsed < self.dwellTimeSec + self.fadeDurationSec then 1 - (Elapsed - self.dwellTimeSec) / self.fadeDurationSec else 0
end

function FadeController:inProgress(): boolean --[[ Line: 26 ]]
	return self:getCurrentProgress() > 0
end

function FadeController:isFading(): boolean --[[ Line: 30 ]]
	local Elapsed = os.clock() - self.lastInputTimeSec
	
	return self.dwellTimeSec <= Elapsed and Elapsed < self.dwellTimeSec + self.fadeDurationSec
end

function FadeController:updateLastInputTime() --[[ Line: 35 ]]
	self.lastInputTimeSec = os.clock()
end

function FadeController:skipToFade() --[[ Line: 39 ]]
	if not self:isFading() then
		self.lastInputTimeSec = os.clock() - self.dwellTimeSec
	end
end

function FadeController:zeroOut() --[[ Line: 45 ]]
	self.lastInputTimeSec = -1
end

function FadeController:subscribe(p1) --[[ Line: 49 ]]
	-- upvalues: RunService (copy)
	table.insert(self.subscriptions, p1)
	
	if not self.heartbeatConnection then
		self.heartbeatConnection = RunService.RenderStepped:Connect(function() --[[ Line: 53 ]]
			-- upvalues: self (copy)
			local CurrentProgress = self:getCurrentProgress()
			
			if CurrentProgress ~= self.lastProgress then
				self.lastProgress = CurrentProgress
				
				for _, subscription in ipairs(self.subscriptions) do
					subscription(CurrentProgress)
				end
			end
		end)
	end
end

function FadeController:unsubscribe(p2) --[[ Line: 65 ]]
	for i, subscription in ipairs(self.subscriptions) do
		if subscription == p2 then
			table.remove(self.subscriptions, i)
			break
		end
	end
	if #self.subscriptions == 0 and self.heartbeatConnection then
		self.heartbeatConnection:Disconnect()
		self.heartbeatConnection = nil
	end
end

FadeController.fadeDurationSec = 1
FadeController.dwellTimeSec = 1

return FadeController