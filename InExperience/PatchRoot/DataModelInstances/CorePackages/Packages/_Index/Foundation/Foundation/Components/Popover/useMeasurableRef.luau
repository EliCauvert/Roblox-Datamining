local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(foundation.Components.Types)
local reactModule = require(parent.React)
local signalModule = require(parent.Signal)

local function createSignal()
	-- upvalues: signalModule (ref)
	local var1, var2 = signalModule.createSignal()
	
	return {
		signal = {
			Connect = function(_, p1)
				-- upvalues: var1 (ref)
				local var3 = var1:subscribe(p1)
				
				return {
					Disconnect = function()
						-- upvalues: var3 (ref)
						var3:unsubscribe()
					end
				}
			end
		},
		fire = var2
	}
end

local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: t (ref), createSignal (ref)
	local tbl = setmetatable({ AbsolutePosition = p1, AbsoluteSize = p2, _signals = {} }, t)
	tbl._signals.AbsolutePosition = createSignal()
	tbl._signals.AbsoluteSize = createSignal()
	
	return tbl
end

function t:GetPropertyChangedSignal(p1)
	if self._signals[p1] then
		return self._signals[p1].signal
	end
	error(`{p1} is not a valid property name.`)
end

function t:SetPosition(p1)
	if self.AbsolutePosition ~= p1 then
		self.AbsolutePosition = p1
		self._signals.AbsolutePosition.fire(p1)
	end
end

function t:SetSize(p1)
	if self.AbsoluteSize ~= p1 then
		self.AbsoluteSize = p1
		self._signals.AbsoluteSize.fire(p1)
	end
end

function useMeasurableRef(p1, p2)
	-- upvalues: reactModule (ref), t (ref)
	local var1 = reactModule.useRef(nil)
	
	if var1.current == nil then
		var1.current = t.new(p1, p2 or Vector2.one)
	end
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p1 (ref)
		var1.current:SetPosition(p1)
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p2 (ref)
		var1.current:SetSize(p2 or Vector2.one)
	end, { p2 })
	
	return var1
end

return useMeasurableRef