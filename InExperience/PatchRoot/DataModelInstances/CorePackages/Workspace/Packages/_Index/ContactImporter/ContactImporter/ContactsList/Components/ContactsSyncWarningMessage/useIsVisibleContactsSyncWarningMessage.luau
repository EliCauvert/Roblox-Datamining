local reactModule = require(script:FindFirstAncestor("ContactImporter").Parent.React)
local contactsSyncWarningCacheModule = require(script.Parent.ContactsSyncWarningCache)
local contactsSyncWarningImpressionsCountCap = game:DefineFastInt("ContactsSyncWarningImpressionsCountCap", 1)

local function isMessageHiddenInitState() --[[ line: 9 ]]
	-- upvalues: contactsSyncWarningCacheModule (ref), contactsSyncWarningImpressionsCountCap (ref)
	local var4 = contactsSyncWarningCacheModule.getValue() or 0
	
	return if var4 >= 0 then contactsSyncWarningImpressionsCountCap <= var4 else true
end

return function() --[[ line: 14 | named "useIsVisibleContactsSyncWarningMessage" ]]
	-- upvalues: reactModule (ref), isMessageHiddenInitState (ref), contactsSyncWarningCacheModule (ref)
	local var5 = reactModule.useState(isMessageHiddenInitState)
	reactModule.useEffect(function() --[[ line: 18 ]]
		-- upvalues: var5 (ref), contactsSyncWarningCacheModule (copy)
		if not var5 then
			contactsSyncWarningCacheModule.incrementValue()
		end
	end, { var5 })
	
	return not var5
end