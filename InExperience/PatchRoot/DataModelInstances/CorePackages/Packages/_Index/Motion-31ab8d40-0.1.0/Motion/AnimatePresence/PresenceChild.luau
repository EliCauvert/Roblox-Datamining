local reactModule = require(script.Parent.Parent.Parent.React)
local useIdFallback = require(script.Parent.utils).useIdFallback
local presenceContextModule = require(script.Parent.PresenceContext)

local function _()
	return {}
end

return function(p0)
	-- upvalues: reactModule (ref), useIdFallback (ref), presenceContextModule (ref)
	if not p0.children or typeof(p0.children) == "string" then
		error("PresenceChild: children must be a React.Element")
	end
	if not p0.children.type then
		error("PresenceChild: children must be a React.Element")
	end
	if p0.onExitComplete and typeof(p0.onExitComplete) ~= "function" and not p0.onExitComplete._isMockFunction then
		error("PresenceChild: onExitComplete must be a function")
	end
	local children = p0.children
	local isPresent = p0.isPresent
	local onExitComplete = p0.onExitComplete
	local current = reactModule.useRef({}).current
	local t = {
		id = p0.presenceId or useIdFallback(),
		isPresent = isPresent ~= false,
		passThroughData = p0.passThroughData,
		onExitComplete = function(p1)
			-- upvalues: current (ref), onExitComplete (ref)
			current[p1] = true
			local var3 = true
			
			for i, v in pairs(current) do
				if not v then
					var3 = false
					break
				end
			end
			if var3 and onExitComplete then
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