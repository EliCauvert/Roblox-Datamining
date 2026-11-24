local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local UseBuildPageLayoutModule = require(BuildExperience.utils.useBuildPageLayout)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName

return function()
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseBuildPageLayoutModule (copy), ReactModule (copy), FullscreenPageWithSafeArea (copy), View (copy), Icon (copy), IconName (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		description = LocalizationStringsModule.BUILD_COMING_SOON_DESCRIPTION,
		title = LocalizationStringsModule.BUILD_COMING_SOON_TITLE
	})
	local UseBuildPageLayoutModuleResult = UseBuildPageLayoutModule()
	local Tokens = UseBuildPageLayoutModuleResult.tokens
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = Tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = Tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = UseBuildPageLayoutModuleResult.shouldIncludeBottomBar
	}, {
		Page = ReactModule.createElement(View, {
			tag = "composition-content-body col align-x-center align-y-center size-full",
			testId = "BuildComingSoon"
		}, {
			Badge = ReactModule.createElement(View, { LayoutOrder = 1, tag = "size-3000-3000" }, {
				Tile = ReactModule.createElement(View, {
					Rotation = -15,
					tag = "position-center-center anchor-center-center size-2500-2500 stroke-thick stroke-emphasis radius-small"
				}),
				Nebula = ReactModule.createElement(Icon, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					name = IconName.Nebula,
					size = Tokens.Size.Size_1800,
					style = Tokens.Color.Content.Emphasis
				})
			}),
			Headings = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "col align-x-center gap-xxsmall size-full-0 auto-y margin-top-large"
			}, {
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-heading-medium text-wrap text-align-x-center content-emphasis",
					Text = UseLocalizationResult.title
				}),
				Description = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-center content-default",
					Text = UseLocalizationResult.description
				})
			})
		})
	})
end