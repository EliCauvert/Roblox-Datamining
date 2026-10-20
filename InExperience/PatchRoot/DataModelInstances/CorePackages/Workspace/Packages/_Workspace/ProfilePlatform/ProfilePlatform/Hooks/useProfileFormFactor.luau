local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FormFactor = require(Parent.FormFactor).Enums.FormFactor
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local FFlagEnableSplitPane = require(Parent.SharedFlags).FFlagEnableSplitPane
local SplitPaneStore = if FFlagEnableSplitPane then require(Parent.SplitPane).SplitPaneStore else nil
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local EnumsModule = require(ProfilePlatform.Common.Enums)

return function()
	-- upvalues: UseSelectorFunction (copy), FFlagEnableSplitPane (copy), UseSignalStateFunction (copy), SplitPaneStore (copy), UseProfileWrapperContextModule (copy), EnumsModule (copy), FFlagAXEnableProfileTab (copy), ReactModule (copy), FormFactor (copy)
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.FormFactor
	end)
	local UseSignalStateResult = if FFlagEnableSplitPane then UseSignalStateFunction(SplitPaneStore.getStore().getIsSplitPaneActive) else false
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local IsProfileTypeMatch = UseProfileWrapperContextModuleResult.profileType == EnumsModule.ProfileTypes.Community
	local IsSourceMatch = UseProfileWrapperContextModuleResult.sourceInfo.source == EnumsModule.Sources.HomepageAd
	local IsForceFullView = (if FFlagAXEnableProfileTab then UseProfileWrapperContextModuleResult.forceFullView == true else nil) or IsProfileTypeMatch and IsSourceMatch
	
	return (ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult (copy), FormFactor (upval), UseSignalStateResult (copy), EnumsModule (upval), IsForceFullView (copy)
		return if UseSelectorResult == FormFactor.WIDE or UseSignalStateResult then {
			formFactor = EnumsModule.ProfileFormFactor.Wide,
			isFullView = IsForceFullView
		} else {
			formFactor = EnumsModule.ProfileFormFactor.PeekView,
			isFullView = IsForceFullView
		}
	end, { UseSelectorResult, IsForceFullView, UseSignalStateResult }))
end