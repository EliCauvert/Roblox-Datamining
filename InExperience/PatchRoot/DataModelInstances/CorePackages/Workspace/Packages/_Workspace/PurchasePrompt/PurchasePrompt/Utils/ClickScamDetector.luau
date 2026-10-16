local UserInputService = game:GetService("UserInputService")
local Cryo = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).Cryo
local ClickScamDetectorModule = {}
ClickScamDetectorModule.__index = ClickScamDetectorModule

function ClickScamDetectorModule.new(p1) --[[ Line: 25 ]]
	-- upvalues: Cryo (copy), ClickScamDetectorModule (copy), UserInputService (copy)
	local config = {
		_inputConnection = nil,
		_clickCount = 0,
		_startTime = tick(),
		_options = Cryo.Dictionary.join({
			clickSpeedThreshold = 3,
			clickTimeWindow = 1,
			initialDelay = 1,
			buttonInput = nil
		}, p1 or {})
	}
	setmetatable(config, ClickScamDetectorModule)
	config._inputConnection = UserInputService.InputBegan:Connect(function(Input) --[[ Line: 50 ]]
		-- upvalues: config (copy)
		config:_onInput(Input)
	end)
	
	return config
end

function ClickScamDetectorModule:_onInput(Input) --[[ Line: 63 ]]
	local UserInputType = Input.UserInputType
	local IsUserInputTypeMatch: boolean = UserInputType == Enum.UserInputType.MouseButton1 or UserInputType == Enum.UserInputType.Touch
	
	if self._options.buttonInput ~= nil and Input.KeyCode == self._options.buttonInput or IsUserInputTypeMatch then
		self._clickCount += 1
		delay(self._options.clickTimeWindow, function() --[[ Line: 73 ]]
			-- upvalues: self (copy)
			self._clickCount -= 1
		end)
	end
end

function ClickScamDetectorModule:isClickValid(): boolean --[[ Line: 83 ]]
	-- upvalues: UserInputService (copy)
	return UserInputService.MouseBehavior ~= Enum.MouseBehavior.LockCurrentPosition and (tick() - self._startTime >= self._options.initialDelay and self._clickCount / self._options.clickTimeWindow < self._options.clickSpeedThreshold)
end

function ClickScamDetectorModule:destroy() --[[ Line: 105 ]]
	self._inputConnection:Disconnect()
end

return ClickScamDetectorModule