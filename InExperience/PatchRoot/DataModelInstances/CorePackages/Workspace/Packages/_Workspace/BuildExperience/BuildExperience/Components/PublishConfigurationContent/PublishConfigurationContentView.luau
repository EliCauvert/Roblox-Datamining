local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local buildMaturityBannerModule = require(buildExperience.Components.GameConfigurations.BuildMaturityBanner.BuildMaturityBanner)
local gameConfigurationListModule = require(buildExperience.Components.GameConfigurations.GameConfigurationList.GameConfigurationList)
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), iconName (ref), reactModule (ref), view (ref), gameConfigurationListModule (ref), buildMaturityBannerModule (ref)
	local PUBLISH_CONTENT_BODY, PUBLISH_CONTENT_MATURITY, PUBLISH_CONTENT_TITLE, GAME_CONFIGURATION_GAME_DETAILS, GAME_CONFIGURATION_GAME_DETAILS_BODY, GAME_CONFIGURATION_ICON_AND_THUMBNAILS, GAME_CONFIGURATION_TITLE_AND_DESCRIPTION, PUBLISH_VERSION_INFORMATION_BODY, PUBLISH_VERSION_INFORMATION_TITLE, VERSION_HISTORY_TITLE, PUBLISH_VERSION_TITLE_DESCRIPTION
	local testId = p1.testId or "game-configuration-content"
	local var1 = if fFlagBuildLocalization then useLocalization({
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
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		PUBLISH_CONTENT_BODY = var1.contentBody
		PUBLISH_CONTENT_MATURITY = var1.contentMaturity
		PUBLISH_CONTENT_TITLE = var1.contentTitle
		GAME_CONFIGURATION_GAME_DETAILS = var1.gameDetails
		GAME_CONFIGURATION_GAME_DETAILS_BODY = var1.gameDetailsBody
		GAME_CONFIGURATION_ICON_AND_THUMBNAILS = var1.iconAndThumbnails
		GAME_CONFIGURATION_TITLE_AND_DESCRIPTION = var1.titleAndDescription
		PUBLISH_VERSION_INFORMATION_BODY = var1.versionInformationBody
		PUBLISH_VERSION_INFORMATION_TITLE = var1.versionInformationTitle
		VERSION_HISTORY_TITLE = var1.versionHistory
		PUBLISH_VERSION_TITLE_DESCRIPTION = var1.versionTitleDescription
	else
		PUBLISH_CONTENT_BODY = localizationStringsModule.PUBLISH_CONTENT_BODY
		PUBLISH_CONTENT_MATURITY = localizationStringsModule.PUBLISH_CONTENT_MATURITY
		PUBLISH_CONTENT_TITLE = localizationStringsModule.PUBLISH_CONTENT_TITLE
		GAME_CONFIGURATION_GAME_DETAILS = localizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS
		GAME_CONFIGURATION_GAME_DETAILS_BODY = localizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS_BODY
		GAME_CONFIGURATION_ICON_AND_THUMBNAILS = localizationStringsModule.GAME_CONFIGURATION_ICON_AND_THUMBNAILS
		GAME_CONFIGURATION_TITLE_AND_DESCRIPTION = localizationStringsModule.GAME_CONFIGURATION_TITLE_AND_DESCRIPTION
		PUBLISH_VERSION_INFORMATION_BODY = localizationStringsModule.PUBLISH_VERSION_INFORMATION_BODY
		PUBLISH_VERSION_INFORMATION_TITLE = localizationStringsModule.PUBLISH_VERSION_INFORMATION_TITLE
		VERSION_HISTORY_TITLE = localizationStringsModule.VERSION_HISTORY_TITLE
		PUBLISH_VERSION_TITLE_DESCRIPTION = localizationStringsModule.PUBLISH_VERSION_TITLE_DESCRIPTION
	end
	local list = {
		{
			id = "icon-thumbnails",
			title = GAME_CONFIGURATION_ICON_AND_THUMBNAILS,
			onActivated = p1.onOpenIconAndThumbnails
		},
		{
			id = "title-description",
			title = GAME_CONFIGURATION_TITLE_AND_DESCRIPTION,
			onActivated = p1.onOpenTitleDescriptionPage
		}
	}
	local list_1 = {
		{
			id = "content-rating",
			title = PUBLISH_CONTENT_MATURITY,
			description = p1.contentMaturityText,
			trailingIcon = iconName.ArrowUpRightFromSquare,
			onActivated = p1.onOpenContentMaturity
		}
	}
	local t = {}
	
	if p1.showVersionTitleDescription then
		table.insert(t, {
			id = "version-title-description",
			title = PUBLISH_VERSION_TITLE_DESCRIPTION,
			onActivated = p1.onOpenVersionTitleDescriptionPage
		})
	end
	table.insert(t, {
		id = "version-history",
		title = VERSION_HISTORY_TITLE,
		onActivated = p1.onOpenVersionHistory
	})
	
	return reactModule.createElement(view, {
		tag = "col gap-large size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		VersionInformation = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 1,
			title = PUBLISH_VERSION_INFORMATION_TITLE,
			body = PUBLISH_VERSION_INFORMATION_BODY,
			rows = t,
			testId = `{testId}-version-information`
		}),
		GameDetails = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 2,
			title = GAME_CONFIGURATION_GAME_DETAILS,
			body = GAME_CONFIGURATION_GAME_DETAILS_BODY,
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
				title = PUBLISH_CONTENT_TITLE,
				body = PUBLISH_CONTENT_BODY,
				rows = list_1,
				testId = `{testId}-content`
			}),
			BuildMaturityBanner = if p1.buildMaturityBannerText ~= nil then nil else reactModule.createElement(buildMaturityBannerModule, { text = p1.buildMaturityBannerText })
		})
	})
end