local ReactModule = require(script:FindFirstAncestor("ContactImporter").Parent.React)
local ContactsSyncWarningCacheModule = require(script.Parent.ContactsSyncWarningCache)
local ContactsSyncWarningImpressionsCountCap = game:DefineFastInt("ContactsSyncWarningImpressionsCountCap", 1)

local function isMessageHiddenInitState(): boolean
	-- upvalues: ContactsSyncWarningCacheModule (copy), ContactsSyncWarningImpressionsCountCap (copy)
	local Value = ContactsSyncWarningCacheModule.getValue() or 0
	
	return Value < 0 or ContactsSyncWarningImpressionsCountCap <= Value
end

return function(): boolean
	-- upvalues: ReactModule (copy), isMessageHiddenInitState (copy), ContactsSyncWarningCacheModule (copy)
	local UseStateResult = ReactModule.useState(isMessageHiddenInitState)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), ContactsSyncWarningCacheModule (upval)
		if not UseStateResult then
			ContactsSyncWarningCacheModule.incrementValue()
		end
	end, { UseStateResult })
	
	return not UseStateResult
end