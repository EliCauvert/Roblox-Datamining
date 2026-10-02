local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local formFactor = require(parent.FormFactor).Enums.FormFactor
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local fFlagEnableSplitPane = require(parent.SharedFlags).FFlagEnableSplitPane
local var1 = if fFlagEnableSplitPane then require(parent.SplitPane).SplitPaneStore else nil
local useSignalState = require(parent.SignalsReact).useSignalState
local enumsModule = require(profilePlatform.Common.Enums)

return function()
	-- upvalues: useSelector (ref), fFlagEnableSplitPane (ref), useSignalState (ref), var1 (ref), useProfileWrapperContextModule (ref), enumsModule (ref), fFlagAXEnableProfileTab (ref), reactModule (ref), formFactor (ref)
	local var2
	local var3 = useSelector(function(p1)
		return p1.FormFactor
	end)
	local var4 = if fFlagEnableSplitPane then useSignalState(var1.getStore().getIsSplitPaneActive) else false
	local var5 = useProfileWrapperContextModule()
	local var6 = var5.profileType == enumsModule.ProfileTypes.Community
	local var7 = var5.sourceInfo.source == enumsModule.Sources.HomepageAd
	
	if fFlagAXEnableProfileTab then
		var2 = var5.forceFullView == true
		var2 = nil
	else
		var2 = nil
	end
	local var8 = var2 or var6 and var7
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref), formFactor (copy), var4 (ref), enumsModule (copy), var8 (ref)
		return if var3 == formFactor.WIDE or var4 then {
			formFactor = enumsModule.ProfileFormFactor.Wide,
			isFullView = var8
		} else {
			formFactor = enumsModule.ProfileFormFactor.PeekView,
			isFullView = var8
		}
	end, { var3, var8, var4 })
end