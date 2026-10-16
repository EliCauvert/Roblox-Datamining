local ReactModule = require(script.Parent.Parent.Parent.React)
local UseIdFallbackFunction = require(script.Parent.utils).useIdFallback
local PresenceContextModule = require(script.Parent.PresenceContext)

local function _() --[[ Line: 36 | Named "newChildrenMap" ]]
	return {}
end

return function(p1) --[[ Line: 40 | Named "PresenceChild" ]]
	-- upvalues: ReactModule (copy), UseIdFallbackFunction (copy), PresenceContextModule (copy)
	if not p1.children or typeof(p1.children) == "string" then
		error("PresenceChild: children must be a React.Element")
	end
	if not p1.children.type then
		error("PresenceChild: children must be a React.Element")
	end
	if p1.onExitComplete and typeof(p1.onExitComplete) ~= "function" and not p1.onExitComplete._isMockFunction then
		error("PresenceChild: onExitComplete must be a function")
	end
	local Children = p1.children
	local IsPresent = p1.isPresent
	local OnExitCompleteFunction = p1.onExitComplete
	local Current = ReactModule.useRef({}).current
	local config = {
		id = p1.presenceId or UseIdFallbackFunction(),
		isPresent = IsPresent ~= false,
		passThroughData = p1.passThroughData,
		onExitComplete = function(Key) --[[ Line: 76 ]]
			-- upvalues: Current (copy), OnExitCompleteFunction (copy)
			Current[Key] = true
			local Flag = true
			
			for _, value in pairs(Current) do
				if not value then
					Flag = false
					break
				end
			end
			if Flag and OnExitCompleteFunction then
				OnExitCompleteFunction()
			end
		end
	}
	
	if IsPresent ~= nil then
		for i, _ in pairs(Current) do
			Current[i] = false
		end
	end
	return ReactModule.createElement(PresenceContextModule.Provider, { value = config }, Children)
end