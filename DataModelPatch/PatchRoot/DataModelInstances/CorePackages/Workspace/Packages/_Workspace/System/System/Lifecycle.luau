local SignalsModule = require(script:FindFirstAncestor("System").Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateEffectFunction = SignalsModule.createEffect
local LifecycleModule = {}
LifecycleModule.__index = LifecycleModule

function LifecycleModule.new(p1)
	-- upvalues: LifecycleModule (copy), CreateSignalFunction (copy), CreateEffectFunction (copy)
	local self = setmetatable({}, LifecycleModule)
	local DefaultVisible = false
	local DefaultEnabled = false
	
	if p1 then
		DefaultVisible = p1.defaultVisible
		DefaultEnabled = p1.defaultEnabled
	end
	local Signal, Signal2 = CreateSignalFunction(DefaultVisible)
	local Signal1, Signal2_1 = CreateSignalFunction(DefaultEnabled)
	self.getVisible = Signal
	self.setVisible = Signal2
	self.getEnabled = Signal1
	self.setEnabled = Signal2_1
	local List = {}
	local List1 = {}
	local Effect = CreateEffectFunction(function(p2)
		-- upvalues: Signal (copy), self (copy), List (copy), Signal2 (copy)
		local SignalResult = Signal(p2)
		
		if self.getEnabled(false) then
			local v1 = nil
			for _, value in List do
				v1 = value(SignalResult)
				
				if type(v1) == "boolean" and v1 ~= SignalResult then
					Signal2(v1)
					break
				end
			end
		end
	end)
	local Effect1 = CreateEffectFunction(function(p3)
		-- upvalues: Signal1 (copy), List1 (copy)
		local SignalResult = Signal1(p3)
		
		for _, value in List1 do
			value(SignalResult)
		end
	end)
	
	function self:dispose()
		-- upvalues: Effect (copy), Effect1 (copy)
		Effect()
		Effect1()
	end
	
	function self:onVisibilityChanged(Value)
		-- upvalues: List (copy)
		table.insert(List, Value)
		
		return function()
			-- upvalues: List (upval), Value (copy)
			local FoundIndex: number? = table.find(List, Value)
			
			if FoundIndex then
				table.remove(List, FoundIndex)
			end
		end
	end
	
	function self:onEnabledChanged(Callback: (any) -> ())
		-- upvalues: List1 (copy), Signal1 (copy)
		table.insert(List1, Callback)
		Callback(Signal1(false))
		
		return function()
			-- upvalues: List1 (upval), Callback (copy)
			local FoundIndex: number? = table.find(List1, Callback)
			
			if FoundIndex then
				table.remove(List1, FoundIndex)
			end
		end
	end
	
	return self
end

return LifecycleModule