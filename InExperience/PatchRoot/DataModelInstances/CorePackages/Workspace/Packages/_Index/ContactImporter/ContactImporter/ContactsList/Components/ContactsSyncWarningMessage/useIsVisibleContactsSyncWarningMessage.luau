local reactModule = require(script:FindFirstAncestor("ContactImporter").Parent.React)
local contactsSyncWarningCacheModule = require(script.Parent.ContactsSyncWarningCache)
local contactsSyncWarningImpressionsCountCap = game:DefineFastInt("ContactsSyncWarningImpressionsCountCap", 1)

local function isMessageHiddenInitState()
	-- upvalues: contactsSyncWarningCacheModule (ref), contactsSyncWarningImpressionsCountCap (ref)
	local var1 = contactsSyncWarningCacheModule.getValue() or 0
	
	return if var1 >= 0 then contactsSyncWarningImpressionsCountCap <= var1 else true
end

return function()
	-- upvalues: reactModule (ref), isMessageHiddenInitState (ref), contactsSyncWarningCacheModule (ref)
	local var1 = reactModule.useState(isMessageHiddenInitState)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), contactsSyncWarningCacheModule (copy)
		if not var1 then
			contactsSyncWarningCacheModule.incrementValue()
		end
	end, { var1 })
	
	return not var1
end