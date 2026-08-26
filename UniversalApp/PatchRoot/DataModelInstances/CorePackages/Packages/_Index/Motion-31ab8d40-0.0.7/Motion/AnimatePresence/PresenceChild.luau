local reactModule = require(script.Parent.Parent.Parent.React)
local useIdFallback = require(script.Parent.utils).useIdFallback
local presenceContextModule = require(script.Parent.PresenceContext)

local function _()
	return {}
end

return function(p1)
	-- upvalues: reactModule (ref), useIdFallback (ref), presenceContextModule (ref)
	if not p1.children or typeof(p1.children) == "string" then
		error("PresenceChild: children must be a React.Element")
	end
	if not p1.children.type then
		error("PresenceChild: children must be a React.Element")
	end
	if p1.onExitComplete and typeof(p1.onExitComplete) ~= "function" and not p1.onExitComplete._isMockFunction then
		error("PresenceChild: onExitComplete must be a function")
	end
	local children = p1.children
	local isPresent = p1.isPresent
	local onExitComplete = p1.onExitComplete
	local current = reactModule.useRef({}).current
	local t = {
		id = p1.presenceId or useIdFallback(),
		isPresent = isPresent ~= false,
		passThroughData = p1.passThroughData,
		onExitComplete = function(p2)
			-- upvalues: current (ref), onExitComplete (ref)
			current[p2] = true
			local var1 = true
			
			for i, v in pairs(current) do
				if not v then
					var1 = false
					break
				end
			end
			if var1 and onExitComplete then
				onExitComplete()
			end
		end
	}
	
	if isPresent ~= nil then
		for i, v in pairs(current) do
			current[i] = false
		end
	end
	return reactModule.createElement(presenceContextModule.Provider, { value = t }, children)
end