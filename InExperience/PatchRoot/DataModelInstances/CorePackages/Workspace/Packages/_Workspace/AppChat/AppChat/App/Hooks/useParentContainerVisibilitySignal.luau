local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local enteredChatFromEntryPointModule = require(appChat.Actions.EnteredChatFromEntryPoint)
local setAppChatVisible = require(appChat.App.AppChatVisible).setAppChatVisible
local parentContainerContextModule = require(appChat.Contexts.ParentContainer.ParentContainerContext)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch

return function()
	-- upvalues: reactModule (ref), parentContainerContextModule (ref), useDispatch (ref), setAppChatVisible (ref), fFlagExpChatEnableFriendsTab (ref), enteredChatFromEntryPointModule (ref)
	local var1 = reactModule.useContext(parentContainerContextModule)
	local visibilitySignal = var1.visibilitySignal
	local getShouldSetAppChatVisible = var1.getShouldSetAppChatVisible
	local entryPoint = var1.entryPoint
	local var2 = useDispatch()
	reactModule.useEffect(function()
		-- upvalues: visibilitySignal (ref), getShouldSetAppChatVisible (ref), setAppChatVisible (copy), fFlagExpChatEnableFriendsTab (copy), entryPoint (ref), var2 (ref), enteredChatFromEntryPointModule (copy)
		local _ = nil
		local var3 = visibilitySignal:connect(function(p1, p2)
			-- upvalues: getShouldSetAppChatVisible (copy), setAppChatVisible (copy), fFlagExpChatEnableFriendsTab (copy), entryPoint (copy), var2 (copy), enteredChatFromEntryPointModule (copy)
			if getShouldSetAppChatVisible(p1) then
				setAppChatVisible(true)
				var2(enteredChatFromEntryPointModule(if fFlagExpChatEnableFriendsTab then p2 or entryPoint else entryPoint))
				
				return
			end
			setAppChatVisible(false)
		end)
		
		return function()
			-- upvalues: var3 (write)
			if var3 then
				var3:disconnect()
			end
		end
	end, {
		setAppChatVisible,
		var2,
		visibilitySignal,
		getShouldSetAppChatVisible,
		entryPoint
	})
end