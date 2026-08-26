local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local configModule = require(expChat.Config)
local parentModule = require(script.Parent)

return function()
	-- upvalues: parentModule (ref), signalsReactModule (ref), reactModule (ref), configModule (ref)
	local var1 = parentModule(false)
	local var2 = signalsReactModule.useSignalState(var1.getIsFocused or var1.getIsTextBoxFocused)
	local var3 = signalsReactModule.useSignalState(var1.getLastActivity)
	local var4, var5 = reactModule.useState(true)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var5 (ref), configModule (copy), var3 (ref)
		if var2 then
			var5(true)
			
			return nil
		end
		local var6 = configModule.ChatWindowBackgroundFadeOutTime - (os.clock() - var3)
		
		if var6 <= 0 then
			var5(false)
			
			return nil
		end
		var5(true)
		local delayedThread = task.delay(var6, function()
			-- upvalues: var5 (copy)
			var5(false)
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			pcall(task.cancel, delayedThread)
		end
	end, { var3, var2 })
	
	return var4
end