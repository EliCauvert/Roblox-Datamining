local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local MemoFunction = ReactModule.memo
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local UsePreviousFunction = require(Parent.RoactUtils).Hooks.usePrevious

function ExternalNavigationHandler(p1) --[[ Line: 24 ]]
	-- upvalues: UseRefFunction (copy), UseEffectFunction (copy), UsePreviousFunction (copy)
	local function _() --[[ Line: 25 ]]
		-- upvalues: p1 (copy)
		return p1.requestId ~= p1.completedRequestId and p1.screen
	end
	
	local UseRefResult = UseRefFunction({})
	
	local function v4() --[[ Line: 31 ]]
		-- upvalues: p1 (copy), UseRefResult (copy)
		local Screen = p1.screen
		local NavigationByScreenEntry: (any) -> () = p1.navigationByScreen[Screen]
		
		if NavigationByScreenEntry then
			NavigationByScreenEntry(p1.params)
		else
			assert(UseRefResult.current, "Queue for ExternalNavigationHandler can't be nil")
			local CurrentEntry = UseRefResult.current[Screen] or {}
			table.insert(CurrentEntry, p1.params)
			UseRefResult.current[Screen] = CurrentEntry
		end
		p1.completeExternalNavigation(p1.requestId)
	end
	
	UseEffectFunction(function() --[[ Line: 49 ]]
		-- upvalues: p1 (copy), v4 (copy)
		if p1.requestId ~= p1.completedRequestId and p1.screen then
			v4()
		end
	end, { p1.requestId, p1.completedRequestId, p1.screen })
	local UsePreviousResult = UsePreviousFunction(p1.navigationByScreen)
	UseEffectFunction(function() --[[ Line: 57 ]]
		-- upvalues: UseRefResult (copy), UsePreviousResult (copy), p1 (copy)
		assert(UseRefResult.current, "Queue for ExternalNavigationHandler can't be nil")
		
		if UsePreviousResult == nil then return end
		for i, value in pairs(UseRefResult.current) do
			assert(UsePreviousResult, "")
			local NavigationByScreenEntry: (any) -> () = p1.navigationByScreen[i]
			
			if UsePreviousResult[i] ~= NavigationByScreenEntry and NavigationByScreenEntry then
				for _, value1 in ipairs(value) do
					NavigationByScreenEntry(value1)
				end
				UseRefResult.current[i] = nil
			end
		end
	end, { p1.navigationByScreen })
	
	return nil
end

return MemoFunction(ExternalNavigationHandler)