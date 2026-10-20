local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local BuildMaturityBannerModule = require(BuildExperience.Components.GameConfigurations.BuildMaturityBanner.BuildMaturityBanner)
local GameConfigurationListModule = require(BuildExperience.Components.GameConfigurations.GameConfigurationList.GameConfigurationList)
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), IconName (copy), ReactModule (copy), View (copy), GameConfigurationListModule (copy), BuildMaturityBannerModule (copy)
	local TestId = p1.testId or "game-configuration-content"
	local UseLocalizationResult = UseLocalizationFunction({
		contentBody = LocalizationStringsModule.PUBLISH_CONTENT_BODY,
		contentMaturity = LocalizationStringsModule.PUBLISH_CONTENT_MATURITY,
		contentTitle = LocalizationStringsModule.PUBLISH_CONTENT_TITLE,
		gameDetails = LocalizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS,
		gameDetailsBody = LocalizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS_BODY,
		iconAndThumbnails = LocalizationStringsModule.GAME_CONFIGURATION_ICON_AND_THUMBNAILS,
		titleAndDescription = LocalizationStringsModule.GAME_CONFIGURATION_TITLE_AND_DESCRIPTION,
		versionInformationBody = LocalizationStringsModule.PUBLISH_VERSION_INFORMATION_BODY,
		versionInformationTitle = LocalizationStringsModule.PUBLISH_VERSION_INFORMATION_TITLE,
		versionHistory = LocalizationStringsModule.VERSION_HISTORY_TITLE,
		versionTitleDescription = LocalizationStringsModule.PUBLISH_VERSION_TITLE_DESCRIPTION
	})
	local ContentBody = UseLocalizationResult.contentBody
	local ContentTitle = UseLocalizationResult.contentTitle
	local GameDetails = UseLocalizationResult.gameDetails
	local GameDetailsBody = UseLocalizationResult.gameDetailsBody
	local VersionInformationBody = UseLocalizationResult.versionInformationBody
	local VersionInformationTitle = UseLocalizationResult.versionInformationTitle
	local VersionHistory = UseLocalizationResult.versionHistory
	local Rows = {
		{
			id = "icon-thumbnails",
			title = UseLocalizationResult.iconAndThumbnails,
			onActivated = p1.onOpenIconAndThumbnails
		},
		{
			id = "title-description",
			title = UseLocalizationResult.titleAndDescription,
			onActivated = p1.onOpenTitleDescriptionPage
		}
	}
	local Rows1 = {
		{
			id = "content-rating",
			title = UseLocalizationResult.contentMaturity,
			description = p1.contentMaturityText,
			trailingIcon = IconName.ArrowUpRightFromSquare,
			onActivated = p1.onOpenContentMaturity
		}
	}
	local List = {}
	table.insert(List, {
		id = "version-title-description",
		title = UseLocalizationResult.versionTitleDescription,
		onActivated = p1.onOpenVersionTitleDescriptionPage
	})
	table.insert(List, {
		id = "version-history",
		title = VersionHistory,
		onActivated = p1.onOpenVersionHistory
	})
	
	return ReactModule.createElement(View, {
		tag = "col gap-large size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		VersionInformation = ReactModule.createElement(GameConfigurationListModule, {
			layoutOrder = 1,
			title = VersionInformationTitle,
			body = VersionInformationBody,
			rows = List,
			testId = `{TestId}-version-information`
		}),
		GameDetails = ReactModule.createElement(GameConfigurationListModule, {
			layoutOrder = 2,
			title = GameDetails,
			body = GameDetailsBody,
			rows = Rows,
			testId = `{TestId}-game-details`
		}),
		Content = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "col gap-medium size-full-0 auto-y",
			testId = `{TestId}-content-section`
		}, {
			Configuration = ReactModule.createElement(GameConfigurationListModule, {
				layoutOrder = 1,
				title = ContentTitle,
				body = ContentBody,
				rows = Rows1,
				testId = `{TestId}-content`
			}),
			BuildMaturityBanner = if p1.buildMaturityBannerText == nil then nil else ReactModule.createElement(BuildMaturityBannerModule, { text = p1.buildMaturityBannerText })
		})
	})
end