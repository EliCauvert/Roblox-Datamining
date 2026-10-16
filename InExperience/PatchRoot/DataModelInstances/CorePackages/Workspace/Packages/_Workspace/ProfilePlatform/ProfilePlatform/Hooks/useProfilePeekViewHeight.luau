local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseAboutSectionHeightModule = require(ProfilePlatform.Hooks.useAboutSectionHeight)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseDynamicSizeMarginModule = require(ProfilePlatform.Hooks.useDynamicSizeMargin)
local UseCurrentlyPlayingSectionHeightModule = require(ProfilePlatform.Hooks.useCurrentlyPlayingSectionHeight)
local FFlagProfilePlatformAddCurrentlyPlayingModule = require(ProfilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)

return function(p1, p2) --[[ Line: 19 ]]
	-- upvalues: UseTokensFunction (copy), UseDynamicSizeMarginModule (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), ReactModule (copy), UseAboutSectionHeightModule (copy), FFlagProfilePlatformAddCurrentlyPlayingModule (copy), UseCurrentlyPlayingSectionHeightModule (copy), ConstantsModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDynamicSizeMarginModuleResult, _ = UseDynamicSizeMarginModule()
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.About)
	local UseAboutSectionHeightModuleResult, _ = UseAboutSectionHeightModule(ReactModule.useMemo(function() --[[ Line: 25 ]]
		-- upvalues: UseProfileJsonComponentModuleResult (copy)
		return UseProfileJsonComponentModuleResult.description
	end, {
		UseProfileJsonComponentModuleResult,
		UseProfileJsonComponentModuleResult.description
	}), p1, UseDynamicSizeMarginModuleResult)
	local UseCurrentlyPlayingSectionHeightModuleResult = if FFlagProfilePlatformAddCurrentlyPlayingModule then UseCurrentlyPlayingSectionHeightModule((UseProfileJsonComponentModule(EnumsModule.Components.CurrentlyPlaying))) else nil
	
	return (ReactModule.useMemo(function(): number --[[ Line: 40 ]]
		-- upvalues: ConstantsModule (upval), UseTokensResult (copy), p2 (copy), UseAboutSectionHeightModuleResult (copy), FFlagProfilePlatformAddCurrentlyPlayingModule (upval), UseCurrentlyPlayingSectionHeightModuleResult (ref), p1 (copy)
		local NewAVATARHEADSHOTHEIGHT = ConstantsModule.AVATAR_HEADSHOT_HEIGHT / 2 + UseTokensResult.Gap.Large
		local NewCONTEXTUALINFORMATIONHEIGHT = if p2 then ConstantsModule.CONTEXTUAL_INFORMATION_HEIGHT + UseTokensResult.Gap.XXLarge else 0
		local SOCIALROWHEIGHT = ConstantsModule.SOCIAL_ROW_HEIGHT
		local CTABUTTONHEIGHT = ConstantsModule.CTA_BUTTON_HEIGHT
		local Total = (if UseAboutSectionHeightModuleResult == 0 then 0 else UseTokensResult.Gap.XXLarge) + 10
		
		if FFlagProfilePlatformAddCurrentlyPlayingModule then
			Total += if UseCurrentlyPlayingSectionHeightModuleResult == 0 then 0 else UseTokensResult.Gap.XXLarge
		end
		return p1 * 0.75 + NewAVATARHEADSHOTHEIGHT + NewCONTEXTUALINFORMATIONHEIGHT + SOCIALROWHEIGHT + UseAboutSectionHeightModuleResult + CTABUTTONHEIGHT + Total + (if FFlagProfilePlatformAddCurrentlyPlayingModule then UseCurrentlyPlayingSectionHeightModuleResult else 0)
	end, {
		p1,
		p2,
		UseAboutSectionHeightModuleResult,
		UseCurrentlyPlayingSectionHeightModuleResult or 0
	}))
end