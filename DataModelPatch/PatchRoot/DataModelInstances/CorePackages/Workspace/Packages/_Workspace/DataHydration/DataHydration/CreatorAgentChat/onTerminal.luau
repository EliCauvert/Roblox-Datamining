local CreateEffectFunction = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createEffect
local _ = require(script.Parent.types)
local t = {}

return function(Callback, Callback1: (any) -> (), Callback2: (any, any) -> ())
	-- upvalues: t (copy), CreateEffectFunction (copy)
	local t1 = {}
	local Flag = false
	local Flag1 = false
	
	local function _()
		-- upvalues: Flag1 (ref), t (upval), t1 (copy)
		if Flag1 then return end
		Flag1 = true
		local Entry: () -> () = t[t1]
		t[t1] = nil
		
		if Entry ~= nil then
			Entry()
		end
	end
	
	local _ = function(p1)
		-- upvalues: Flag (ref), Flag1 (ref), t (upval), t1 (copy), Callback1 (copy), Callback2 (copy)
		if Flag then return end
		Flag = true
		
		if not Flag1 then
			Flag1 = true
			local Entry: () -> () = t[t1]
			t[t1] = nil
			
			if Entry ~= nil then
				Entry()
			end
		end
		if p1.status == "succeeded" and Callback1 then
			Callback1(p1.result)
			
			return
		end
		if p1.status == "failed" and Callback2 then
			Callback2(p1.error or "request failed", p1.errorCode)
		end
	end
	
	local CallbackResult = Callback(false)
	
	if CallbackResult.status == "pending" then
		local Effect: () -> () = CreateEffectFunction(function(p1)
			-- upvalues: Callback (copy), Flag (ref), Flag1 (ref), t (upval), t1 (copy), Callback1 (copy), Callback2 (copy)
			local CallbackResult = Callback(p1)
			
			if CallbackResult.status == "pending" then return end
			if Flag then return end
			Flag = true
			
			if not Flag1 then
				Flag1 = true
				local Entry: () -> () = t[t1]
				t[t1] = nil
				
				if Entry ~= nil then
					Entry()
				end
			end
			if CallbackResult.status == "succeeded" and Callback1 then
				Callback1(CallbackResult.result)
				
				return
			end
			if CallbackResult.status == "failed" and Callback2 then
				Callback2(CallbackResult.error or "request failed", CallbackResult.errorCode)
			end
		end)
		
		if Flag1 then
			Effect()
		else
			t[t1] = Effect
		end
		return
	else
		if not Flag then
			Flag = true
			
			if not Flag1 then
				Flag1 = true
				local Entry: () -> () = t[t1]
				t[t1] = nil
				
				if Entry ~= nil then
					Entry()
				end
			end
			if CallbackResult.status == "succeeded" and Callback1 then
				Callback1(CallbackResult.result)
			elseif CallbackResult.status == "failed" and Callback2 then
				Callback2(CallbackResult.error or "request failed", CallbackResult.errorCode)
			end
		end
	end
end