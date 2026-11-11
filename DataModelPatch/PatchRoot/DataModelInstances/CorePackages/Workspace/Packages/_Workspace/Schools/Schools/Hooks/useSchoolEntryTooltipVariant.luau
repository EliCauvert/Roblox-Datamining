local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local ConstantsModule = require(Schools.Common.Constants)
local SchoolEntryStatusModule = require(Schools.Store.SchoolEntryStatus)
local SchoolEntryTooltipStorageModule = require(Schools.Common.SchoolEntryTooltipStorage)
local SchoolEntryTooltipVariant = require(Schools.Common.Enums).SchoolEntryTooltipVariant
local IsShownFunction = SchoolEntryTooltipStorageModule.isShown
local MarkShownFunction = SchoolEntryTooltipStorageModule.markShown

return function()
	-- upvalues: UseSignalStateFunction (copy), SchoolEntryStatusModule (copy), ReactModule (copy), IsShownFunction (copy), ConstantsModule (copy), SchoolEntryTooltipVariant (copy), MarkShownFunction (copy)
	local UseSignalStateResult = UseSignalStateFunction(SchoolEntryStatusModule.getVerifiedSignal())
	local UseSignalStateResult1 = UseSignalStateFunction(SchoolEntryStatusModule.getIsLiveSignal())
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: IsShownFunction (upval), ConstantsModule (upval)
		return IsShownFunction(ConstantsModule.FeatureAvailable.APP_STORAGE_KEY)
	end)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(function()
		-- upvalues: IsShownFunction (upval), ConstantsModule (upval)
		return IsShownFunction(ConstantsModule.SchoolIsLive.APP_STORAGE_KEY)
	end)
	local SchoolIsLive = if UseSignalStateResult and UseSignalStateResult1 and not UseStateResult1 then SchoolEntryTooltipVariant.SchoolIsLive elseif UseSignalStateResult or UseStateResult then nil else SchoolEntryTooltipVariant.FeatureAvailable
	local UseRefResult = ReactModule.useRef(SchoolIsLive)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), SchoolIsLive (copy)
		UseRefResult.current = SchoolIsLive
	end, { SchoolIsLive })
	
	return SchoolIsLive, (ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), SchoolEntryTooltipVariant (upval), UseStateResult2 (copy), MarkShownFunction (upval), ConstantsModule (upval), UseStateResult2_1 (copy)
		local Current = UseRefResult.current
		
		if Current == SchoolEntryTooltipVariant.FeatureAvailable then
			UseStateResult2(true)
			MarkShownFunction(ConstantsModule.FeatureAvailable.APP_STORAGE_KEY)
			
			return
		end
		if Current == SchoolEntryTooltipVariant.SchoolIsLive then
			UseStateResult2_1(true)
			MarkShownFunction(ConstantsModule.SchoolIsLive.APP_STORAGE_KEY)
		end
	end, {}))
end