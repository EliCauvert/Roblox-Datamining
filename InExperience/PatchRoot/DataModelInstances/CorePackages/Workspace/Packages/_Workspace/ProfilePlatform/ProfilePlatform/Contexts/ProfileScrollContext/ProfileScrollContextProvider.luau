local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseTopBarHeightFunction = require(Parent.RobloxAppHooks).useTopBarHeight
local PeekViewState = require(Parent.PeekView).PeekViewState
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local FFlagFixCommunityProfileWideCoverLayoutModule = require(ProfilePlatform.Flags.FFlagFixCommunityProfileWideCoverLayout)
local FFlagProfileInspectAvatarSlideIn = require(Parent.SharedFlags).FFlagProfileInspectAvatarSlideIn
local FFlagProfileInspectAvatarShopChip = require(Parent.SharedFlags).FFlagProfileInspectAvatarShopChip
local FFlagProfilePlatformSeededPymk = require(Parent.SharedFlags).FFlagProfilePlatformSeededPymk
local ProfileScrollContextModule = require(script.Parent.ProfileScrollContext)

return function(p1)
	-- upvalues: UseProfileFormFactorModule (copy), ReactModule (copy), EnumsModule (copy), FFlagProfileInspectAvatarSlideIn (copy), FFlagProfileInspectAvatarShopChip (copy), FFlagProfilePlatformSeededPymk (copy), PeekViewState (copy), UseTopBarHeightFunction (copy), FFlagFixCommunityProfileWideCoverLayoutModule (copy), ProfileScrollContextModule (copy)
	local UseProfileFormFactorModuleResult = UseProfileFormFactorModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(if UseProfileFormFactorModuleResult.formFactor == EnumsModule.ProfileFormFactor.PeekView then 0 else 1)
	local IsNotFormFactorMatch = nil
	local v1 = nil
	
	if FFlagProfileInspectAvatarSlideIn or FFlagProfileInspectAvatarShopChip then
		local UseStateResult1
		UseStateResult1, v15 = ReactModule.useState(false)
		IsNotFormFactorMatch = UseProfileFormFactorModuleResult.formFactor ~= EnumsModule.ProfileFormFactor.PeekView or (UseProfileFormFactorModuleResult.isFullView or UseStateResult1)
	end
	local v2 = nil
	local Callback = nil
	local UseResult = nil
	
	if FFlagProfilePlatformSeededPymk then
		v2, Callback = ReactModule.useState(nil)
		UseResult = ReactModule.useCallback(function()
			-- upvalues: Callback (ref), PeekViewState (upval)
			Callback(function(Brief)
				-- upvalues: PeekViewState (upval)
				return if Brief == PeekViewState.Brief then PeekViewState.Full else Brief
			end)
		end, {})
	end
	local UseStateResult3, UseStateResult2_1 = ReactModule.useState(0)
	local UseTopBarHeightResult = UseTopBarHeightFunction()
	local UseMemoResult = ReactModule.useMemo(function(): number
		-- upvalues: FFlagFixCommunityProfileWideCoverLayoutModule (upval), UseProfileFormFactorModuleResult (copy), EnumsModule (upval), UseTopBarHeightResult (copy), UseStateResult3 (copy)
		local UseTopBarHeightResult1 = if FFlagFixCommunityProfileWideCoverLayoutModule then if UseProfileFormFactorModuleResult.isFullView or UseProfileFormFactorModuleResult.formFactor == EnumsModule.ProfileFormFactor.Wide then 0 else UseTopBarHeightResult elseif UseProfileFormFactorModuleResult.isFullView then 0 else UseTopBarHeightResult
		
		if UseProfileFormFactorModuleResult.formFactor == EnumsModule.ProfileFormFactor.PeekView and not UseProfileFormFactorModuleResult.isFullView then
			UseTopBarHeightResult1 += 25
		end
		return (math.max(UseTopBarHeightResult1 - UseStateResult3, 0))
	end, {
		UseTopBarHeightResult,
		UseStateResult3,
		UseProfileFormFactorModuleResult
	})
	
	return ReactModule.createElement(ProfileScrollContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult (copy), UseStateResult2_1 (copy), UseStateResult (copy), UseStateResult2 (copy), FFlagProfileInspectAvatarSlideIn (upval), FFlagProfileInspectAvatarShopChip (upval), IsNotFormFactorMatch (ref), v1 (ref), FFlagProfilePlatformSeededPymk (upval), v2 (ref), Callback (ref), UseResult (ref)
			return {
				scrollY = UseMemoResult,
				setAbsoluteYPosition = UseStateResult2_1,
				peekViewOpenPercent = UseStateResult,
				setPeekViewOpenPercent = UseStateResult2,
				isPeekViewFullyOpen = if FFlagProfileInspectAvatarSlideIn or FFlagProfileInspectAvatarShopChip then IsNotFormFactorMatch else nil,
				setIsPeekViewFullyOpen = if FFlagProfileInspectAvatarSlideIn or FFlagProfileInspectAvatarShopChip then v1 else nil,
				peekViewState = if FFlagProfilePlatformSeededPymk then v2 else nil,
				setPeekViewState = if FFlagProfilePlatformSeededPymk then Callback else nil,
				requestFullView = if FFlagProfilePlatformSeededPymk then UseResult else nil
			}
		end, {
			UseMemoResult, UseStateResult2_1, UseStateResult, UseStateResult2,
			IsNotFormFactorMatch, v1, if FFlagProfilePlatformSeededPymk then v2 else nil,
			if FFlagProfilePlatformSeededPymk then Callback else nil,
			if FFlagProfilePlatformSeededPymk then UseResult else nil
		})
	}, p1.children)
end