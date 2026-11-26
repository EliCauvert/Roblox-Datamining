local CreateFakeSignalModule = require(script.Parent.createFakeSignal)
local FakeFaceAnimatorService = {}
FakeFaceAnimatorService.__index = FakeFaceAnimatorService

function FakeFaceAnimatorService.new()
	-- upvalues: FakeFaceAnimatorService (copy)
	return (setmetatable({
		VideoAnimationEnabled = false,
		AudioAnimationEnabled = false,
		_signals = {}
	}, FakeFaceAnimatorService))
end

function FakeFaceAnimatorService:GetPropertyChangedSignal(p1)
	-- upvalues: CreateFakeSignalModule (copy)
	if not self._signals[p1] then
		self._signals[p1] = CreateFakeSignalModule()
	end
	return self._signals[p1]
end

function FakeFaceAnimatorService:set(Key, p1)
	if self[Key] == p1 then return end
	self[Key] = p1
	local Signal = self._signals[Key]
	
	if Signal then
		Signal:Fire()
	end
end

function FakeFaceAnimatorService:getListenerCount(p1)
	local Signal = self._signals[p1]
	
	return if Signal then Signal:getListenerCount() else 0
end

return FakeFaceAnimatorService