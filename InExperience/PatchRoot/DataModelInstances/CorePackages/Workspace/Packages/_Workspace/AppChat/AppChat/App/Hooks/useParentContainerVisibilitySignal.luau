local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local enteredChatFromEntryPointModule = require(appChat.Actions.EnteredChatFromEntryPoint)
local setAppChatVisible = require(appChat.App.AppChatVisible).setAppChatVisible
local parentContainerContextModule = require(appChat.Contexts.ParentContainer.ParentContainerContext)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local fFlagAppChatDistinctUnibarEntryPoint = sharedFlagsModule.FFlagAppChatDistinctUnibarEntryPoint
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch

return function()
	-- upvalues: reactModule (ref), parentContainerContextModule (ref), useDispatch (ref), setAppChatVisible (ref), fFlagExpChatEnableFriendsTab (ref), fFlagAppChatDistinctUnibarEntryPoint (ref), enteredChatFromEntryPointModule (ref)
	local var1 = reactModule.useContext(parentContainerContextModule)
	local visibilitySignal = var1.visibilitySignal
	local getShouldSetAppChatVisible = var1.getShouldSetAppChatVisible
	local entryPoint = var1.entryPoint
	local var2 = useDispatch()
	reactModule.useEffect(function()
		-- upvalues: visibilitySignal (ref), getShouldSetAppChatVisible (ref), setAppChatVisible (copy), fFlagExpChatEnableFriendsTab (copy), fFlagAppChatDistinctUnibarEntryPoint (copy), entryPoint (ref), var2 (ref), enteredChatFromEntryPointModule (copy)
		local _ = nil
		local var3 = visibilitySignal:connect(function(p1, p2)
			-- upvalues: getShouldSetAppChatVisible (copy), setAppChatVisible (copy), fFlagExpChatEnableFriendsTab (copy), fFlagAppChatDistinctUnibarEntryPoint (copy), entryPoint (copy), var2 (copy), enteredChatFromEntryPointModule (copy)
			if not getShouldSetAppChatVisible(p1) then
				setAppChatVisible(false)
				
				return
			end
			setAppChatVisible(true)
			var2(enteredChatFromEntryPointModule(if fFlagExpChatEnableFriendsTab or fFlagAppChatDistinctUnibarEntryPoint then p2 or entryPoint else entryPoint))
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