local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseProfileScrollContextModule = require(ProfilePlatform.Contexts.ProfileScrollContext.useProfileScrollContext)
local GetPeekViewOpenHeightByProfileTypeModule = require(ProfilePlatform.Utils.getPeekViewOpenHeightByProfileType)
local FFlagProfilePlatformEnableImpressions = require(Parent.SharedFlags).FFlagProfilePlatformEnableImpressions

return function(p1) --[[ Line: 23 | Named "ProfilePlatformPage" ]]
	-- upvalues: UseProfileWrapperContextModule (copy), UseProfileScrollContextModule (copy), UseProfileFormFactorModule (copy), EnumsModule (copy), UseStyleFunction (copy), FFlagProfilePlatformEnableImpressions (copy), UseProfileAnalyticsContextModule (copy), CryoModule (copy), ReactModule (copy), GetPeekViewOpenHeightByProfileTypeModule (copy)
	local ProfileType = UseProfileWrapperContextModule().profileType
	local UseProfileScrollContextModuleResult = UseProfileScrollContextModule()
	local UseProfileFormFactorModuleResult = UseProfileFormFactorModule()
	local IsFormFactorMatch = UseProfileFormFactorModuleResult.formFactor == EnumsModule.ProfileFormFactor.Wide
	local IsFullView = UseProfileFormFactorModuleResult.isFullView
	local Theme = UseStyleFunction().Theme
	local UseProfileAnalyticsContextModuleResult = if FFlagProfilePlatformEnableImpressions then UseProfileAnalyticsContextModule() else nil
	local ScrollViewPositionChangedSignal = if FFlagProfilePlatformEnableImpressions then UseProfileAnalyticsContextModuleResult.scrollViewPositionChangedSignal else nil
	
	return ReactModule.createElement("Frame", {
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 0, GetPeekViewOpenHeightByProfileTypeModule(ProfileType)),
		AutomaticSize = Enum.AutomaticSize.Y,
		BorderSizePixel = 0,
		BackgroundTransparency = if ProfileType == EnumsModule.ProfileTypes.Community and not IsFormFactorMatch and not IsFullView then Theme.BackgroundContrast.Transparency else Theme.BackgroundDefault.Transparency,
		BackgroundColor3 = if ProfileType == EnumsModule.ProfileTypes.Community and not IsFormFactorMatch and not IsFullView then Theme.BackgroundContrast.Color else Theme.BackgroundDefault.Color,
		[ReactModule.Change.AbsolutePosition] = function(Frame) --[[ Line: 65 ]]
			-- upvalues: UseProfileScrollContextModuleResult (copy), ScrollViewPositionChangedSignal (copy)
			UseProfileScrollContextModuleResult.setAbsoluteYPosition(Frame.AbsolutePosition.Y)
			ScrollViewPositionChangedSignal:fire()
		end
	}, (CryoModule.Dictionary.join({
		bottomPadding = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 99999,
			Size = UDim2.fromOffset(0, 8)
		})
	}, p1.children)))
end