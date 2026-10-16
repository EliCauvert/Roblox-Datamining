local Motion = script:FindFirstAncestor("Motion")
local ReactModule = require(Motion.Parent.React)
local PresenceContextModule = require(Motion.AnimatePresence.PresenceContext)
local UseIdFallbackFunction = require(Motion.AnimatePresence.utils).useIdFallback

return function(p1) --[[ Line: 30 | Named "PresenceProvider" ]]
	-- upvalues: UseIdFallbackFunction (copy), ReactModule (copy), PresenceContextModule (copy)
	if p1 == nil then
		error("PresenceProvider: props cannot be nil")
	end
	local Children = p1.children
	local IsPresent = p1.isPresent
	
	if IsPresent == nil then
		IsPresent = true
	end
	local PassThroughData = p1.passThroughData
	local Id: string? = nil
	local Success, Result = pcall(function() --[[ Line: 53 ]]
		-- upvalues: Id (ref), UseIdFallbackFunction (upval)
		Id = UseIdFallbackFunction()
	end)
	
	if not Success then
		warn("PresenceProvider: Error generating ID:", Result)
		Id = "presence-" .. UseIdFallbackFunction()
	end
	local UseRefResult = nil
	local Success1, Result1 = pcall(function() --[[ Line: 64 ]]
		-- upvalues: UseRefResult (ref), ReactModule (upval)
		UseRefResult = ReactModule.useRef({})
	end)
	
	if not Success1 then
		warn("PresenceProvider: Error creating childrenPresence ref:", Result1)
		UseRefResult = { current = {} }
	end
	local config = {
		id = Id,
		isPresent = IsPresent,
		register = function(p2) --[[ Line: 95 ]]
			-- upvalues: UseRefResult (ref)
			UseRefResult.current[p2] = false
			
			return function() --[[ Line: 99 ]]
				-- upvalues: UseRefResult (upval), p2 (copy)
				UseRefResult.current[p2] = nil
			end
		end,
		onExitComplete = function(p2) --[[ Line: 74 ]]
			-- upvalues: UseRefResult (ref), p1 (copy)
			if UseRefResult.current then
				UseRefResult.current[p2] = true
			end
			local Flag = true
			
			for _, value in pairs(UseRefResult.current) do
				if not value then
					Flag = false
					break
				end
			end
			if Flag and p1.onExitComplete then
				p1.onExitComplete()
			end
		end,
		passThroughData = PassThroughData
	}
	local Element = nil
	local Success2, Result2 = pcall(function() --[[ Line: 114 ]]
		-- upvalues: Element (ref), ReactModule (upval), PresenceContextModule (upval), config (copy), Children (copy)
		Element = ReactModule.createElement(PresenceContextModule.Provider, { value = config }, Children)
	end)
	
	if not Success2 then
		warn("PresenceProvider: Error creating PresenceContext.Provider:", Result2)
	end
	return Element or ReactModule.createElement(ReactModule.Fragment, {}, Children)
end