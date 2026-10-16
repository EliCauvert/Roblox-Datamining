local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local ConfigModule = require(ExpChat.Config)
local ParentModule = require(script.Parent)

return function() --[[ Line: 12 | Named "useIsChatBackgroundVisible" ]]
	-- upvalues: ParentModule (copy), SignalsReactModule (copy), ReactModule (copy), ConfigModule (copy)
	local ParentModuleResult = ParentModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(ParentModuleResult.getIsFocused or ParentModuleResult.getIsTextBoxFocused)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(ParentModuleResult.getLastActivity)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	ReactModule.useEffect(function() --[[ Line: 20 ]]
		-- upvalues: UseSignalStateResult (copy), UseStateResult2 (copy), ConfigModule (upval), UseSignalStateResult1 (copy)
		if UseSignalStateResult then
			UseStateResult2(true)
			
			return nil
		end
		local ChatWindowBackgroundFadeOutTimeDelta = ConfigModule.ChatWindowBackgroundFadeOutTime - (os.clock() - UseSignalStateResult1)
		
		if ChatWindowBackgroundFadeOutTimeDelta <= 0 then
			UseStateResult2(false)
			
			return nil
		else
			UseStateResult2(true)
			local DelayedThread = task.delay(ChatWindowBackgroundFadeOutTimeDelta, function() --[[ Line: 32 ]]
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(false)
			end)
			
			return function() --[[ Line: 35 ]]
				-- upvalues: DelayedThread (copy)
				pcall(task.cancel, DelayedThread)
			end
		end
	end, { UseSignalStateResult1, UseSignalStateResult })
	
	return UseStateResult
end