local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local getPageMargin = require(parent.UIBlox).App.Container.getPageMargin
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local useIsMeTabModule = require(profilePlatform.Hooks.useIsMeTab)
local enumsModule = require(profilePlatform.Common.Enums)
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab

return function()
	-- upvalues: fFlagAXEnableProfileTab (ref), useTokens (ref), useIsMeTabModule (ref), useProfileFormFactorModule (ref), enumsModule (ref), reactModule (ref), getPageMargin (ref)
	local var7
	local var5 = if fFlagAXEnableProfileTab then useTokens() else nil
	local var6 = if fFlagAXEnableProfileTab then useIsMeTabModule() else nil
	
	if fFlagAXEnableProfileTab then
		var7 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
		var7 = nil
	else
		var7 = nil
	end
	local var8, var9 = reactModule.useState(24)
	
	return if fFlagAXEnableProfileTab and var6 then if fFlagAXEnableProfileTab then if var7 then var5.Margin.Large else var5.Padding.Large else nil else var8, reactModule.useCallback(function(p0)
		-- upvalues: getPageMargin (copy), var9 (ref)
		var9(getPageMargin(p0.AbsoluteSize.X))
	end, {})
end