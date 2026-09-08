local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local getTimeoutStatusStore = require(parent.AvatarExperienceCommon).Stores.getTimeoutStatusStore
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen

return function(p1, p2)
	-- upvalues: getTimeoutStatusStore (ref), useSignalState (ref), reactModule (ref), avatarScreen (ref)
	local var1 = getTimeoutStatusStore()
	local var2 = useSignalState(var1.getStatus)
	local var3 = useSignalState(var1.getIsTimedOut)
	local var4 = reactModule.useRef(false)
	local var5 = reactModule.useRef(false)
	local var6 = reactModule.useRef(p1)
	var6.current = p1
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var1 (ref)
		if not var5.current then
			var5.current = true
			var1.fetchStatus()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var4 (ref), var5 (ref), var6 (ref), avatarScreen (copy)
		if var2 and not var4.current and (var5.current and var2.details) then
			var4.current = true
			var6.current.navigate(avatarScreen.TimeoutStatusPrompt)
		end
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), var3 (ref)
		if p2 and var3 then
			p2()
		end
	end, { var3, p2 })
end