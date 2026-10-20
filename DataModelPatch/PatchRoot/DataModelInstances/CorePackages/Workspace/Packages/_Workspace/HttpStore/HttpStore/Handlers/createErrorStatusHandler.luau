local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local SignalsModule = require(Parent1.Signals)
local _ = require(Parent1.InternalHttpStore)
local _ = require(Parent.Types)

return function(p1)
	-- upvalues: SignalsModule (copy)
	return function(Callback)
		-- upvalues: SignalsModule (upval), p1 (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: Callback (copy), p1 (upval)
			local CallbackResult = Callback(p2)
			
			if CallbackResult.status == "Success" then
				local StatusCode = CallbackResult.response.StatusCode
				
				if p1[StatusCode] ~= nil then
					p1[StatusCode](CallbackResult)
				end
			end
			return CallbackResult
		end)
	end
end