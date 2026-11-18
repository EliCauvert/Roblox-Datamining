local Parent = script:FindFirstAncestor("RecycledInlineLayout").Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local SignalsModule = require(Parent.Signals)

return {
	isBinding = function(p1)
		-- upvalues: ReactIsModule (copy)
		return ReactIsModule.isBinding(p1)
	end,
	isSignal = function(Callback): boolean
		return type(Callback) == "function"
	end,
	peek = function(Callback)
		-- upvalues: ReactIsModule (copy)
		return if ReactIsModule.isBinding(Callback) then Callback:getValue() elseif type(Callback) == "function" then Callback(false) else Callback
	end,
	kindOf = function(Callback)
		-- upvalues: ReactIsModule (copy)
		return if ReactIsModule.isBinding(Callback) then "binding" elseif type(Callback) == "function" then "signal" else nil
	end,
	combine = function(p1, p2, Callback)
		-- upvalues: ReactModule (copy), SignalsModule (copy)
		return if p1 == "binding" then ReactModule.joinBindings(p2):map(Callback) else SignalsModule.createComputed(function(p3)
			-- upvalues: p2 (copy), Callback (copy)
			local t = {}
			
			for i, value in p2 do
				t[i] = value(p3)
			end
			return Callback(t)
		end)
	end
}