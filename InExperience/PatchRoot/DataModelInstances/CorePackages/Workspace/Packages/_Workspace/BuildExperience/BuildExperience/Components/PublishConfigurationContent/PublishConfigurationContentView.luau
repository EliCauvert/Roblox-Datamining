local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local buildMaturityBannerModule = require(buildExperience.Components.GameConfigurations.BuildMaturityBanner.BuildMaturityBanner)
local gameConfigurationListModule = require(buildExperience.Components.GameConfigurations.GameConfigurationList.GameConfigurationList)
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), iconName (ref), reactModule (ref), view (ref), gameConfigurationListModule (ref), buildMaturityBannerModule (ref)
	local testId = p1.testId or "game-configuration-content"
	local var1 = useLocalization({
		contentBody = localizationStringsModule.PUBLISH_CONTENT_BODY,
		contentMaturity = localizationStringsModule.PUBLISH_CONTENT_MATURITY,
		contentTitle = localizationStringsModule.PUBLISH_CONTENT_TITLE,
		gameDetails = localizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS,
		gameDetailsBody = localizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS_BODY,
		iconAndThumbnails = localizationStringsModule.GAME_CONFIGURATION_ICON_AND_THUMBNAILS,
		titleAndDescription = localizationStringsModule.GAME_CONFIGURATION_TITLE_AND_DESCRIPTION,
		versionInformationBody = localizationStringsModule.PUBLISH_VERSION_INFORMATION_BODY,
		versionInformationTitle = localizationStringsModule.PUBLISH_VERSION_INFORMATION_TITLE,
		versionHistory = localizationStringsModule.VERSION_HISTORY_TITLE,
		versionTitleDescription = localizationStringsModule.PUBLISH_VERSION_TITLE_DESCRIPTION
	})
	local contentBody = var1.contentBody
	local contentMaturity = var1.contentMaturity
	local contentTitle = var1.contentTitle
	local gameDetails = var1.gameDetails
	local gameDetailsBody = var1.gameDetailsBody
	local iconAndThumbnails = var1.iconAndThumbnails
	local titleAndDescription = var1.titleAndDescription
	local versionInformationBody = var1.versionInformationBody
	local versionInformationTitle = var1.versionInformationTitle
	local versionHistory = var1.versionHistory
	local versionTitleDescription = var1.versionTitleDescription
	local list = {
		{
			id = "icon-thumbnails",
			title = iconAndThumbnails,
			onActivated = p1.onOpenIconAndThumbnails
		},
		{
			id = "title-description",
			title = titleAndDescription,
			onActivated = p1.onOpenTitleDescriptionPage
		}
	}
	local list_1 = {
		{
			id = "content-rating",
			title = contentMaturity,
			description = p1.contentMaturityText,
			trailingIcon = iconName.ArrowUpRightFromSquare,
			onActivated = p1.onOpenContentMaturity
		}
	}
	local t = {}
	table.insert(t, {
		id = "version-title-description",
		title = versionTitleDescription,
		onActivated = p1.onOpenVersionTitleDescriptionPage
	})
	table.insert(t, {
		id = "version-history",
		title = versionHistory,
		onActivated = p1.onOpenVersionHistory
	})
	
	return reactModule.createElement(view, {
		tag = "col gap-large size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		VersionInformation = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 1,
			title = versionInformationTitle,
			body = versionInformationBody,
			rows = t,
			testId = `{testId}-version-information`
		}),
		GameDetails = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 2,
			title = gameDetails,
			body = gameDetailsBody,
			rows = list,
			testId = `{testId}-game-details`
		}),
		Content = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "col gap-medium size-full-0 auto-y",
			testId = `{testId}-content-section`
		}, {
			Configuration = reactModule.createElement(gameConfigurationListModule, {
				layoutOrder = 1,
				title = contentTitle,
				body = contentBody,
				rows = list_1,
				testId = `{testId}-content`
			}),
			BuildMaturityBanner = if p1.buildMaturityBannerText ~= nil then nil else reactModule.createElement(buildMaturityBannerModule, { text = p1.buildMaturityBannerText })
		})
	})
end