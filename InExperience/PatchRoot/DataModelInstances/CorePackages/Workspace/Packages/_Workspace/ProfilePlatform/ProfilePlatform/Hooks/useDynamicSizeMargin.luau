local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local GetPageMarginFunction = require(Parent.UIBlox).App.Container.getPageMargin
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local UseIsMeTabModule = require(ProfilePlatform.Hooks.useIsMeTab)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab

return function() --[[ Line: 16 ]]
	-- upvalues: FFlagAXEnableProfileTab (copy), UseTokensFunction (copy), UseIsMeTabModule (copy), UseProfileFormFactorModule (copy), EnumsModule (copy), ReactModule (copy), GetPageMarginFunction (copy)
	local UseTokensResult = if FFlagAXEnableProfileTab then UseTokensFunction() else nil
	local UseIsMeTabModuleResult = if FFlagAXEnableProfileTab then UseIsMeTabModule() else nil
	local IsFormFactorMatch = if FFlagAXEnableProfileTab then UseProfileFormFactorModule().formFactor == EnumsModule.ProfileFormFactor.Wide else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(24)
	local Large = if FFlagAXEnableProfileTab then if IsFormFactorMatch then UseTokensResult.Margin.Large else UseTokensResult.Padding.Large else nil
	
	return if FFlagAXEnableProfileTab and UseIsMeTabModuleResult then Large else UseStateResult, (ReactModule.useCallback(function(Frame) --[[ Line: 25 ]]
		-- upvalues: GetPageMarginFunction (upval), UseStateResult2 (copy)
		UseStateResult2((GetPageMarginFunction(Frame.AbsoluteSize.X)))
	end, {}))
end