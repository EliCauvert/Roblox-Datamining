local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(foundation.Components.Types)
local reactModule = require(parent.React)
local signalModule = require(parent.Signal)

local function createSignal() --[[ line: 34 ]]
	-- upvalues: signalModule (ref)
	local var5, var6 = signalModule.createSignal()
	
	return {
		signal = {
			Connect = function(_, p0) --[[ line: 39 ]]
				-- upvalues: var5 (ref)
				local var7 = var5:subscribe(p0)
				
				return {
					Disconnect = function() --[[ line: 43 ]]
						-- upvalues: var7 (ref)
						var7:unsubscribe()
					end
				}
			end
		},
		fire = var6
	}
end

local t = {}
t.__index = t

function t.new(p1, p2) --[[ line: 57 ]]
	-- upvalues: t (ref), createSignal (ref)
	local tbl = setmetatable({ AbsolutePosition = p1, AbsoluteSize = p2, _signals = {} }, t)
	tbl._signals.AbsolutePosition = createSignal()
	tbl._signals.AbsoluteSize = createSignal()
	
	return tbl
end

function t:GetPropertyChangedSignal(p3) --[[ line: 70 ]]
	if self._signals[p3] then
		return self._signals[p3].signal
	end
	error(`{p3} is not a valid property name.`)
end

function t:SetPosition(p4) --[[ line: 77 ]]
	if self.AbsolutePosition ~= p4 then
		self.AbsolutePosition = p4
		self._signals.AbsolutePosition.fire(p4)
	end
end

function t:SetSize(p5) --[[ line: 84 ]]
	if self.AbsoluteSize ~= p5 then
		self.AbsoluteSize = p5
		self._signals.AbsoluteSize.fire(p5)
	end
end

function useMeasurableRef(p6, p7) --[[ line: 91 ]]
	-- upvalues: reactModule (ref), t (ref)
	local var9 = reactModule.useRef(nil)
	
	if var9.current == nil then
		var9.current = t.new(p6, p7 or Vector2.one)
	end
	reactModule.useEffect(function() --[[ line: 97 ]]
		-- upvalues: var9 (ref), p6 (ref)
		var9.current:SetPosition(p6)
	end, { p6 })
	reactModule.useEffect(function() --[[ line: 101 ]]
		-- upvalues: var9 (ref), p7 (ref)
		var9.current:SetSize(p7 or Vector2.one)
	end, { p7 })
	
	return var9
end

return useMeasurableRef