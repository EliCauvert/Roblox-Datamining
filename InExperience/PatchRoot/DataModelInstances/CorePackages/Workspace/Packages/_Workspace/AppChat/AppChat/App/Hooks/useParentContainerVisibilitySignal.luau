local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local enteredChatFromEntryPointModule = require(appChat.Actions.EnteredChatFromEntryPoint)
local setAppChatVisible = require(appChat.App.AppChatVisible).setAppChatVisible
local parentContainerContextModule = require(appChat.Contexts.ParentContainer.ParentContainerContext)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch

return function() --[[ line: 16 ]]
	-- upvalues: reactModule (ref), parentContainerContextModule (ref), useDispatch (ref), setAppChatVisible (ref), fFlagExpChatEnableFriendsTab (ref), enteredChatFromEntryPointModule (ref)
	local var5 = reactModule.useContext(parentContainerContextModule)
	local visibilitySignal = var5.visibilitySignal
	local getShouldSetAppChatVisible = var5.getShouldSetAppChatVisible
	local entryPoint = var5.entryPoint
	local var6 = useDispatch()
	reactModule.useEffect(function() --[[ line: 23 ]]
		-- upvalues: visibilitySignal (ref), getShouldSetAppChatVisible (ref), setAppChatVisible (copy), fFlagExpChatEnableFriendsTab (copy), entryPoint (ref), var6 (ref), enteredChatFromEntryPointModule (copy)
		local _ = nil
		local var7 = visibilitySignal:connect(function(p0, p1) --[[ line: 26 ]]
			-- upvalues: getShouldSetAppChatVisible (copy), setAppChatVisible (copy), fFlagExpChatEnableFriendsTab (copy), entryPoint (copy), var6 (copy), enteredChatFromEntryPointModule (copy)
			if getShouldSetAppChatVisible(p0) then
				setAppChatVisible(true)
				var6(enteredChatFromEntryPointModule(if fFlagExpChatEnableFriendsTab then p1 or entryPoint else entryPoint))
				
				return
			end
			setAppChatVisible(false)
		end)
		
		return function() --[[ line: 38 ]]
			-- upvalues: var7 (write)
			if var7 then
				var7:disconnect()
			end
		end
	end, {
		setAppChatVisible,
		var6,
		visibilitySignal,
		getShouldSetAppChatVisible,
		entryPoint
	})
end