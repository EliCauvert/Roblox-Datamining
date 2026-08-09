local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local enteredChatFromEntryPointModule = require(appChat.Actions.EnteredChatFromEntryPoint)
local setAppChatVisible = require(appChat.App.AppChatVisible).setAppChatVisible
local parentContainerContextModule = require(appChat.Contexts.ParentContainer.ParentContainerContext)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch

return function() --[[ line: 13 ]]
	-- upvalues: reactModule (ref), parentContainerContextModule (ref), useDispatch (ref), setAppChatVisible (ref), enteredChatFromEntryPointModule (ref)
	local var5 = reactModule.useContext(parentContainerContextModule)
	local visibilitySignal = var5.visibilitySignal
	local getShouldSetAppChatVisible = var5.getShouldSetAppChatVisible
	local entryPoint = var5.entryPoint
	local var6 = useDispatch()
	reactModule.useEffect(function() --[[ line: 20 ]]
		-- upvalues: visibilitySignal (ref), getShouldSetAppChatVisible (ref), setAppChatVisible (copy), var6 (ref), enteredChatFromEntryPointModule (copy), entryPoint (ref)
		local _ = nil
		local var7 = visibilitySignal:connect(function(...) --[[ line: 23 ]]
			-- upvalues: getShouldSetAppChatVisible (copy), setAppChatVisible (copy), var6 (copy), enteredChatFromEntryPointModule (copy), entryPoint (copy)
			if getShouldSetAppChatVisible(...) then
				setAppChatVisible(true)
				var6(enteredChatFromEntryPointModule(entryPoint))
				
				return
			end
			setAppChatVisible(false)
		end)
		
		return function() --[[ line: 32 ]]
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