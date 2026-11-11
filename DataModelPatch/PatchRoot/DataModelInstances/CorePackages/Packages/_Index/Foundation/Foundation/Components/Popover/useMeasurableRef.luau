local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Foundation.Components.Types)
local ReactModule = require(Parent.React)
local SignalModule = require(Parent.Signal)

local function createSignal()
	-- upvalues: SignalModule (copy)
	local Signal, Signal2 = SignalModule.createSignal()
	
	return {
		signal = {
			Connect = function(_, p1)
				-- upvalues: Signal (copy)
				local SubscribeResult = Signal:subscribe(p1)
				
				return {
					Disconnect = function()
						-- upvalues: SubscribeResult (copy)
						SubscribeResult:unsubscribe()
					end
				}
			end
		},
		fire = Signal2
	}
end

local Module = {}
Module.__index = Module

function Module.new(AbsolutePosition, AbsoluteSize)
	-- upvalues: Module (copy), createSignal (copy)
	local self = setmetatable({
		AbsolutePosition = AbsolutePosition,
		AbsoluteSize = AbsoluteSize,
		_signals = {}
	}, Module)
	self._signals.AbsolutePosition = createSignal()
	self._signals.AbsoluteSize = createSignal()
	
	return self
end

function Module:GetPropertyChangedSignal(p1)
	if self._signals[p1] then
		return self._signals[p1].signal
	else
		error(`{p1} is not a valid property name.`)
	end
end

function Module:SetPosition(AbsolutePosition)
	if self.AbsolutePosition ~= AbsolutePosition then
		self.AbsolutePosition = AbsolutePosition
		self._signals.AbsolutePosition.fire(AbsolutePosition)
	end
end

function Module:SetSize(AbsoluteSize)
	if self.AbsoluteSize ~= AbsoluteSize then
		self.AbsoluteSize = AbsoluteSize
		self._signals.AbsoluteSize.fire(AbsoluteSize)
	end
end

function useMeasurableRef(AbsolutePosition, p1)
	-- upvalues: ReactModule (copy), Module (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = Module.new(AbsolutePosition, p1 or Vector2.one)
	end
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), AbsolutePosition (copy)
		UseRefResult.current:SetPosition(AbsolutePosition)
	end, { AbsolutePosition })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), p1 (copy)
		UseRefResult.current:SetSize(p1 or Vector2.one)
	end, { p1 })
	
	return UseRefResult
end

return useMeasurableRef