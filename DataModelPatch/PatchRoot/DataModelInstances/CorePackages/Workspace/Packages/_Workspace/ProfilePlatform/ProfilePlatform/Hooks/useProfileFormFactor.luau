local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FormFactor = require(Parent.FormFactor).Enums.FormFactor
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local EnumsModule = require(ProfilePlatform.Common.Enums)

return function()
	-- upvalues: UseSelectorFunction (copy), UseProfileWrapperContextModule (copy), EnumsModule (copy), FFlagAXEnableProfileTab (copy), ReactModule (copy), FormFactor (copy)
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.FormFactor
	end)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local IsProfileTypeMatch = UseProfileWrapperContextModuleResult.profileType == EnumsModule.ProfileTypes.Community
	local IsSourceMatch = UseProfileWrapperContextModuleResult.sourceInfo.source == EnumsModule.Sources.HomepageAd
	local IsForceFullView = (if FFlagAXEnableProfileTab then UseProfileWrapperContextModuleResult.forceFullView == true else nil) or IsProfileTypeMatch and IsSourceMatch
	
	return (ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult (copy), FormFactor (upval), EnumsModule (upval), IsForceFullView (copy)
		return if UseSelectorResult == FormFactor.WIDE then {
			formFactor = EnumsModule.ProfileFormFactor.Wide,
			isFullView = IsForceFullView
		} else {
			formFactor = EnumsModule.ProfileFormFactor.PeekView,
			isFullView = IsForceFullView
		}
	end, { UseSelectorResult, IsForceFullView }))
end