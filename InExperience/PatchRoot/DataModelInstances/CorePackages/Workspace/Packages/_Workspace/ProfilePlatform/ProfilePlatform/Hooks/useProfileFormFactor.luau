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
	local var1
	local var2 = useSelector(function(p1)
		return p1.FormFactor
	end)
	local var3 = useProfileWrapperContextModule()
	local var4 = var3.profileType == enumsModule.ProfileTypes.Community
	local var5 = var3.sourceInfo.source == enumsModule.Sources.HomepageAd
	
	if fFlagAXEnableProfileTab then
		var1 = var3.forceFullView == true
		var1 = nil
	else
		var1 = nil
	end
	local var6 = var1 or var4 and var5
	
	return reactModule.useMemo(function()
		-- upvalues: var2 (ref), formFactor (copy), enumsModule (copy), var6 (ref)
		return if var2 == formFactor.WIDE then {
			formFactor = enumsModule.ProfileFormFactor.Wide,
			isFullView = var6
		} else {
			formFactor = enumsModule.ProfileFormFactor.PeekView,
			isFullView = var6
		}
	end, { var2, var6 })
end