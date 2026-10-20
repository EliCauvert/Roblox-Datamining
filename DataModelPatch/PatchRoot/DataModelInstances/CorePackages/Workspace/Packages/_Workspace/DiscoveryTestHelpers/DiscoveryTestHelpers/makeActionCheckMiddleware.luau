local PromiseModule = require(script:FindFirstAncestor("DiscoveryTestHelpers").Parent.Promise)

local function checkAction(Callback1, Callback: (any) -> ())
	if not Callback1 then return end
	if typeof(Callback1) == "function" then
		Callback(Callback1())
		
		return
	end
	if typeof(Callback1) ~= "table" then
		Callback(Callback1)
		
		return
	end
	if Callback1.tap and typeof(Callback1.tap) == "function" then
		Callback1:tap(Callback)
		
		return
	else
		Callback(Callback1)
	end
end

return function(p1, p2)
	-- upvalues: PromiseModule (copy), checkAction (copy)
	return function(Callback, p3)
		-- upvalues: p2 (copy), PromiseModule (upval), checkAction (upval), p1 (copy)
		return function(Callback1)
			-- upvalues: p2 (upval), PromiseModule (upval), p3 (copy), checkAction (upval), p1 (upval), Callback (copy)
			if typeof(Callback1) ~= "function" then
				checkAction(Callback1, p1)
				
				return Callback(Callback1)
			elseif p2 then
				return PromiseModule.resolve()
			else
				local CallbackResult = Callback1(p3)
				checkAction(CallbackResult, p1)
				
				return CallbackResult
			end
		end
	end
end