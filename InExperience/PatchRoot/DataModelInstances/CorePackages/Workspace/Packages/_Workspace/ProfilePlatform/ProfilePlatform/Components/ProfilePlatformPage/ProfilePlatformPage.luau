local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useProfileScrollContextModule = require(profilePlatform.Contexts.ProfileScrollContext.useProfileScrollContext)
local getPeekViewOpenHeightByProfileTypeModule = require(profilePlatform.Utils.getPeekViewOpenHeightByProfileType)
local fFlagProfilePlatformEnableImpressions = require(parent.SharedFlags).FFlagProfilePlatformEnableImpressions

return function(p0)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileScrollContextModule (ref), useProfileFormFactorModule (ref), enumsModule (ref), useStyle (ref), fFlagProfilePlatformEnableImpressions (ref), useProfileAnalyticsContextModule (ref), cryoModule (ref), reactModule (ref), getPeekViewOpenHeightByProfileTypeModule (ref)
	local profileType = useProfileWrapperContextModule().profileType
	local var9 = useProfileScrollContextModule()
	local var10 = useProfileFormFactorModule()
	local var11 = var10.formFactor == enumsModule.ProfileFormFactor.Wide
	local isFullView = var10.isFullView
	local theme = useStyle().Theme
	local var12 = if fFlagProfilePlatformEnableImpressions then (if fFlagProfilePlatformEnableImpressions then useProfileAnalyticsContextModule() else nil).scrollViewPositionChangedSignal else nil
	
	return reactModule.createElement("Frame", {
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 0, getPeekViewOpenHeightByProfileTypeModule(profileType)),
		AutomaticSize = Enum.AutomaticSize.Y,
		BorderSizePixel = 0,
		BackgroundTransparency = if profileType == enumsModule.ProfileTypes.Community and not var11 and not isFullView then theme.BackgroundContrast.Transparency else theme.BackgroundDefault.Transparency,
		BackgroundColor3 = if profileType == enumsModule.ProfileTypes.Community and not var11 and not isFullView then theme.BackgroundContrast.Color else theme.BackgroundDefault.Color,
		[reactModule.Change.AbsolutePosition] = function(p1)
			-- upvalues: var9 (ref), var12 (ref)
			var9.setAbsoluteYPosition(p1.AbsolutePosition.Y)
			var12:fire()
		end
	}, cryoModule.Dictionary.join({
		bottomPadding = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 99999,
			Size = UDim2.fromOffset(0, 8)
		})
	}, p0.children))
end