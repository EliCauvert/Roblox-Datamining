local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local configModule = require(expChat.Config)
local parentModule = require(script.Parent)

return function() --[[ line: 12 | named "useIsChatBackgroundVisible" ]]
	-- upvalues: parentModule (ref), signalsReactModule (ref), reactModule (ref), configModule (ref)
	local var5 = parentModule(false)
	local var6 = signalsReactModule.useSignalState(var5.getIsFocused or var5.getIsTextBoxFocused)
	local var7 = signalsReactModule.useSignalState(var5.getLastActivity)
	local var8, var9 = reactModule.useState(true)
	reactModule.useEffect(function() --[[ line: 20 ]]
		-- upvalues: var6 (ref), var9 (ref), configModule (copy), var7 (ref)
		if var6 then
			var9(true)
			
			return nil
		end
		local var10 = configModule.ChatWindowBackgroundFadeOutTime - (os.clock() - var7)
		
		if var10 <= 0 then
			var9(false)
			
			return nil
		end
		var9(true)
		local delayedThread = task.delay(var10, function() --[[ line: 32 ]]
			-- upvalues: var9 (copy)
			var9(false)
		end)
		
		return function() --[[ line: 35 ]]
			-- upvalues: delayedThread (ref)
			pcall(task.cancel, delayedThread)
		end
	end, { var7, var6 })
	
	return var8
end