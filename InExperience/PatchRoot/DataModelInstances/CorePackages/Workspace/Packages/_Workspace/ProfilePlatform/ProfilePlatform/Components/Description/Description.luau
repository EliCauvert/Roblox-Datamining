local TextService = game:GetService("TextService")
local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local FFlagProfilePlatformNewProfileHeader = require(Parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseDynamicSizeMarginModule = require(ProfilePlatform.Hooks.useDynamicSizeMargin)
local UseAboutSectionHeightModule = require(ProfilePlatform.Hooks.useAboutSectionHeight)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ResponsiveModule = require(Parent.Responsive)
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local HorizontalPageMargin = UIBloxModule.App.Container.HorizontalPageMargin
local ExpandableTextArea = UIBloxModule.App.Text.ExpandableTextArea
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local View = FoundationModule.View

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseScreenSizeFunction (copy), UseDynamicSizeMarginModule (copy), UseProfileWrapperContextModule (copy), ReactModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UseIsSpatialFunction (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), UseAboutSectionHeightModule (copy), FFlagProfilePlatformNewProfileHeader (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TextService (copy), EnumsModule (copy), View (copy), Text (copy), HorizontalPageMargin (copy), ExpandableTextArea (copy)
	local UseTokensResult = UseTokensFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseDynamicSizeMarginModuleResult, UseDynamicSizeMarginModuleResult2 = UseDynamicSizeMarginModule()
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local BodyMedium = UseTokensResult.Typography.BodyMedium
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseScreenSizeResult.X)
	local ProfileType = UseProfileWrapperContextModuleResult.profileType
	local UseLocalizationResult = UseLocalizationFunction({
		moreText = TextKeysModule.More,
		noBioYet = TextKeysModule.NoBioYet
	})
	local Description = p1.description
	local UseIsSpatialResult = UseIsSpatialFunction()
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	local UseIsSpatialResult1 = UseIsSpatialResult or IsUsePreferredInputResultMatch
	local UseAboutSectionHeightModuleResult, UseAboutSectionHeightModuleResult2 = UseAboutSectionHeightModule(Description, UseStateResult, UseDynamicSizeMarginModuleResult)
	local UseAboutSectionHeightModuleResult1 = if FFlagProfilePlatformNewProfileHeader then UseAboutSectionHeightModuleResult2 else ReactModule.useMemo(function()
		-- upvalues: Description (ref), FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), BodyMedium (copy), TextService (upval), UseIsSpatialResult1 (copy)
		local Replaced = string.gsub(Description or "", "[\r\n]+", " ")
		
		return (if FoundationFontFaceMigration then GetTextSizeFunction(Replaced, BodyMedium.FontSize, BodyMedium.Font, Vector2.new(1e999, 1e999), { addTemporaryPadding = false }).Y else TextService:GetTextSize(Replaced, BodyMedium.FontSize, BodyMedium.Font, Vector2.new(1e999, 1e999)).Y) * (if UseIsSpatialResult1 then 2.6 else 2)
	end, {
		Description,
		BodyMedium.FontSize,
		BodyMedium.Font,
		UseIsSpatialResult1
	})
	local IsUseAboutSectionHeightModuleResultBelow = if FFlagProfilePlatformNewProfileHeader then UseAboutSectionHeightModuleResult2 < UseAboutSectionHeightModuleResult else nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), UseDynamicSizeMarginModuleResult (copy), ReactModule (upval), UseAboutSectionHeightModuleResult1 (copy)
		return (ReactModule.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(UseStateResult - UseDynamicSizeMarginModuleResult * 2, UseAboutSectionHeightModuleResult1)
		}))
	end, {
		UseAboutSectionHeightModuleResult1,
		UseStateResult,
		UseDynamicSizeMarginModuleResult
	})
	
	if Description == nil or Description == "" then
		if FFlagProfilePlatformNewProfileHeader then
			return nil
		end
		Description = UseLocalizationResult.noBioYet
	end
	return if ProfileType == EnumsModule.ProfileTypes.User or ProfileType == EnumsModule.ProfileTypes.Contact then ReactModule.createElement("Frame", {
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		[ReactModule.Change.AbsoluteSize] = function(Frame)
			-- upvalues: UseDynamicSizeMarginModuleResult2 (copy), UseStateResult2 (copy)
			UseDynamicSizeMarginModuleResult2(Frame)
			UseStateResult2(Frame.AbsoluteSize.X)
		end
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, UseDynamicSizeMarginModuleResult),
			PaddingRight = UDim.new(0, UseDynamicSizeMarginModuleResult)
		}),
		DescriptionContainer = ReactModule.createElement(View, { tag = "size-full col gap-xsmall" }, {
			Description = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-wrap text-align-x-left text-align-y-top text-truncate-split",
				Text = Description,
				fontStyle = BodyMedium
			}, { UISizeConstraint = UseMemoResult }),
			MoreButton = if FFlagProfilePlatformNewProfileHeader then if IsUseAboutSectionHeightModuleResultBelow then ReactModule.createElement(Text, {
				LayoutOrder = 2,
				RichText = true,
				tag = "auto-xy text-wrap text-align-x-left text-align-y-top text-truncate-split",
				Text = `<u>{UseLocalizationResult.moreText}</u>`,
				fontStyle = UseTokensResult.Typography.TitleMedium,
				onActivated = p1.onActivateMoreButton
			}) else nil else ReactModule.createElement(Text, {
				LayoutOrder = 2,
				RichText = true,
				tag = "auto-xy text-wrap text-align-x-left text-align-y-top text-truncate-split",
				Text = `<u>{UseLocalizationResult.moreText}</u>`,
				fontStyle = UseTokensResult.Typography.TitleMedium,
				onActivated = p1.onActivateMoreButton
			})
		})
	}) else ReactModule.createElement(HorizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		layoutOrder = p1.layoutOrder,
		size = UDim2.new(1, 0, 0, 0)
	}, {
		Description = ReactModule.createElement(ExpandableTextArea, {
			compactNumberOfLines = 3,
			Text = p1.description,
			padding = Vector2.new(0, 0)
		})
	})
end