local Parent = script:FindFirstAncestor("HttpClient").Parent
local PromiseModule = require(Parent.Promise)
local SignalsModule = require(Parent.Signals)
local _ = require(script.Parent.types)
local Effects = {}

return function(p1)
	-- upvalues: PromiseModule (copy), Effects (copy), SignalsModule (copy)
	local t = {}
	
	return PromiseModule.new(function(Callback1, Callback2, Callback: (any) -> ())
		-- upvalues: Effects (upval), t (copy), p1 (copy), SignalsModule (upval)
		local Flag = false
		local Flag1 = false
		
		local function _()
			-- upvalues: Flag1 (ref), Effects (upval), t (upval)
			if Flag1 then return end
			Flag1 = true
			local Effect: () -> () = Effects[t]
			Effects[t] = nil
			
			if Effect ~= nil then
				Effect()
			end
		end
		
		local function settle(StateResult)
			-- upvalues: Flag (ref), Flag1 (ref), Effects (upval), t (upval), Callback1 (copy), Callback2 (copy)
			if Flag then return end
			Flag = true
			
			if not Flag1 then
				Flag1 = true
				local Effect: () -> () = Effects[t]
				Effects[t] = nil
				
				if Effect ~= nil then
					Effect()
				end
			end
			if StateResult.status == "succeeded" then
				Callback1(StateResult.result)
				
				return
			else
				Callback2({
					responseCode = StateResult.errorCode,
					errorMessage = StateResult.error
				})
			end
		end
		
		local StateResult = p1.state(false)
		
		if StateResult.status ~= "pending" then
			settle(StateResult)
			
			return
		end
		local Effect: () -> () = SignalsModule.createEffect(function(p2)
			-- upvalues: p1 (upval), settle (copy)
			local StateResult = p1.state(p2)
			
			if StateResult.status ~= "pending" then
				settle(StateResult)
				
				return
			end
		end)
		
		if Flag1 then
			Effect()
		else
			Effects[t] = Effect
		end
		Callback(function()
			-- upvalues: Flag (ref), Flag1 (ref), Effects (upval), t (upval)
			if Flag then return end
			Flag = true
			
			if Flag1 then return end
			Flag1 = true
			local Effect: () -> () = Effects[t]
			Effects[t] = nil
			
			if Effect ~= nil then
				Effect()
			end
		end)
	end)
end