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
	local var1
	local var2 = if fFlagAXEnableProfileTab then useTokens() else nil
	local var3 = if fFlagAXEnableProfileTab then useIsMeTabModule() else nil
	
	if fFlagAXEnableProfileTab then
		var1 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
		var1 = nil
	else
		var1 = nil
	end
	local var4, var5 = reactModule.useState(24)
	
	return if fFlagAXEnableProfileTab and var3 then if fFlagAXEnableProfileTab then if var1 then var2.Margin.Large else var2.Padding.Large else nil else var4, reactModule.useCallback(function(p1)
		-- upvalues: getPageMargin (copy), var5 (ref)
		var5(getPageMargin(p1.AbsoluteSize.X))
	end, {})
end