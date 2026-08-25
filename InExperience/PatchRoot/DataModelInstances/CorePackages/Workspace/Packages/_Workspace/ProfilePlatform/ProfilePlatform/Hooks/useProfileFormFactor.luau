local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local formFactor = require(parent.FormFactor).Enums.FormFactor
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local enumsModule = require(profilePlatform.Common.Enums)

return function()
	-- upvalues: useSelector (ref), useProfileWrapperContextModule (ref), enumsModule (ref), fFlagAXEnableProfileTab (ref), reactModule (ref), formFactor (ref)
	local var8
	local var4 = useSelector(function(p0)
		return p0.FormFactor
	end)
	local var5 = useProfileWrapperContextModule()
	local var6 = var5.profileType == enumsModule.ProfileTypes.Community
	local var7 = var5.sourceInfo.source == enumsModule.Sources.HomepageAd
	
	if fFlagAXEnableProfileTab then
		var8 = var5.forceFullView == true
		var8 = nil
	else
		var8 = nil
	end
	local var8_1 = var8 or var6 and var7
	
	return reactModule.useMemo(function()
		-- upvalues: var4 (ref), formFactor (copy), enumsModule (copy), var8_1 (ref)
		return if var4 == formFactor.WIDE then {
			formFactor = enumsModule.ProfileFormFactor.Wide,
			isFullView = var8_1
		} else {
			formFactor = enumsModule.ProfileFormFactor.PeekView,
			isFullView = var8_1
		}
	end, { var4, var8_1 })
end