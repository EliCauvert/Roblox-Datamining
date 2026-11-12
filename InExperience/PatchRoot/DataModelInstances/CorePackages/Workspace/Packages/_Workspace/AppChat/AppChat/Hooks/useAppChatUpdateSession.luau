local SessionService = game:GetService("SessionService")
local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local ChatSessionRefCountModule = require(script.Parent.ChatSessionRefCount)

return function(p1, p2)
	-- upvalues: SessionService (copy), UseRefFunction (copy), ChatSessionRefCountModule (copy), UseEffectFunction (copy)
	local v1 = p1 == nil or p1
	local P1 = p2 or SessionService
	local UseRefResult = UseRefFunction(false)
	
	if v1 then
		if not UseRefResult.current then
			ChatSessionRefCountModule.acquire(P1)
			UseRefResult.current = true
		end
	elseif UseRefResult.current then
		ChatSessionRefCountModule.release(P1)
		UseRefResult.current = false
	end
	UseEffectFunction(function()
		-- upvalues: UseRefResult (copy), ChatSessionRefCountModule (upval), P1 (copy)
		return function()
			-- upvalues: UseRefResult (upval), ChatSessionRefCountModule (upval), P1 (upval)
			if UseRefResult.current then
				ChatSessionRefCountModule.release(P1)
				UseRefResult.current = false
			end
		end
	end, {})
end