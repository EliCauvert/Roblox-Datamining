local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)

return function(Callback, Callback1) --[[ Line: 28 | Named "useMessagesMap" ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy)
	return ReactModule.useMemo(function() --[[ Line: 32 ]]
		-- upvalues: SignalsModule (upval), Callback (copy), Callback1 (copy)
		return SignalsModule.createComputed(function(p1) --[[ Line: 33 ]]
			-- upvalues: Callback (upval), Callback1 (upval)
			local t = {}
			
			for _, value in Callback(p1) do
				t[if Callback1 then Callback1(value) else value.messageId] = value
			end
			return t
		end)
	end, { Callback, Callback1 })
end