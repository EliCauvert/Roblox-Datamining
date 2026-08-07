local userInputService = game:GetService("UserInputService")
local cryo = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).Cryo
local t = {}
t.__index = t

function t.new(p0) --[[ line: 25 ]]
	-- upvalues: cryo (ref), t (ref), userInputService (ref)
	local t_1 = {
		_inputConnection = nil,
		_clickCount = 0,
		_startTime = tick(),
		_options = cryo.Dictionary.join({
			clickSpeedThreshold = 3,
			clickTimeWindow = 1,
			initialDelay = 1,
			buttonInput = nil
		}, p0 or {})
	}
	setmetatable(t_1, t)
	t_1._inputConnection = userInputService.InputBegan:Connect(function(p1) --[[ line: 50 ]]
		-- upvalues: t_1 (ref)
		t_1:_onInput(p1)
	end)
	
	return t_1
end

function t:_onInput(p2) --[[ line: 63 ]]
	local userInputType = p2.UserInputType
	
	if (self._options.buttonInput ~= nil and p2.KeyCode == self._options.buttonInput) or (if userInputType ~= Enum.UserInputType.MouseButton1 then userInputType == Enum.UserInputType.Touch else true) then
		self._clickCount += 1
		delay(self._options.clickTimeWindow, function() --[[ line: 73 ]]
			-- upvalues: self (ref)
			self._clickCount -= 1
		end)
	end
end

function t:isClickValid() --[[ line: 83 ]]
	-- upvalues: userInputService (ref)
	return if userInputService.MouseBehavior == Enum.MouseBehavior.LockCurrentPosition then false elseif tick() - self._startTime < self._options.initialDelay then false else self._clickCount / self._options.clickTimeWindow < self._options.clickSpeedThreshold
end

function t:destroy() --[[ line: 105 ]]
	self._inputConnection:Disconnect()
end

return t