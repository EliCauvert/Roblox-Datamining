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

return function(p1)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileScrollContextModule (ref), useProfileFormFactorModule (ref), enumsModule (ref), useStyle (ref), fFlagProfilePlatformEnableImpressions (ref), useProfileAnalyticsContextModule (ref), cryoModule (ref), reactModule (ref), getPeekViewOpenHeightByProfileTypeModule (ref)
	local profileType = useProfileWrapperContextModule().profileType
	local var1 = useProfileScrollContextModule()
	local var2 = useProfileFormFactorModule()
	local var3 = var2.formFactor == enumsModule.ProfileFormFactor.Wide
	local isFullView = var2.isFullView
	local theme = useStyle().Theme
	local var4 = if fFlagProfilePlatformEnableImpressions then (if fFlagProfilePlatformEnableImpressions then useProfileAnalyticsContextModule() else nil).scrollViewPositionChangedSignal else nil
	
	return reactModule.createElement("Frame", {
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 0, getPeekViewOpenHeightByProfileTypeModule(profileType)),
		AutomaticSize = Enum.AutomaticSize.Y,
		BorderSizePixel = 0,
		BackgroundTransparency = if profileType == enumsModule.ProfileTypes.Community and not var3 and not isFullView then theme.BackgroundContrast.Transparency else theme.BackgroundDefault.Transparency,
		BackgroundColor3 = if profileType == enumsModule.ProfileTypes.Community and not var3 and not isFullView then theme.BackgroundContrast.Color else theme.BackgroundDefault.Color,
		[reactModule.Change.AbsolutePosition] = function(p2)
			-- upvalues: var1 (ref), var4 (ref)
			var1.setAbsoluteYPosition(p2.AbsolutePosition.Y)
			var4:fire()
		end
	}, cryoModule.Dictionary.join({
		bottomPadding = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 99999,
			Size = UDim2.fromOffset(0, 8)
		})
	}, p1.children))
end