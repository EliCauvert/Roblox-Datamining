local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local buildMaturityBannerModule = require(buildExperience.Components.GameConfigurations.BuildMaturityBanner.BuildMaturityBanner)
local gameConfigurationListModule = require(buildExperience.Components.GameConfigurations.GameConfigurationList.GameConfigurationList)
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName

return function(p0) --[[ line: 30 | named "PublishConfigurationContentView" ]]
	-- upvalues: localizationStringsModule (ref), iconName (ref), reactModule (ref), view (ref), gameConfigurationListModule (ref), buildMaturityBannerModule (ref)
	local testId = p0.testId or "game-configuration-content"
	local list = {
		{
			id = "icon-thumbnails",
			title = localizationStringsModule.GAME_CONFIGURATION_ICON_AND_THUMBNAILS,
			onActivated = p0.onOpenIconAndThumbnails
		},
		{
			id = "title-description",
			title = localizationStringsModule.GAME_CONFIGURATION_TITLE_AND_DESCRIPTION,
			onActivated = p0.onOpenTitleDescriptionPage
		}
	}
	local list_1 = {
		{
			id = "content-rating",
			title = localizationStringsModule.PUBLISH_CONTENT_MATURITY,
			description = p0.contentMaturityText,
			trailingIcon = iconName.ArrowUpRightFromSquare,
			onActivated = p0.onOpenContentMaturity
		}
	}
	local t = {}
	
	if p0.showVersionTitleDescription then
		table.insert(t, {
			id = "version-title-description",
			title = localizationStringsModule.PUBLISH_VERSION_TITLE_DESCRIPTION,
			onActivated = p0.onOpenVersionTitleDescriptionPage
		})
	end
	table.insert(t, {
		id = "version-history",
		title = localizationStringsModule.VERSION_HISTORY_TITLE,
		onActivated = p0.onOpenVersionHistory
	})
	
	return reactModule.createElement(view, {
		tag = "col gap-large size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder,
		testId = testId
	}, {
		VersionInformation = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 1,
			title = localizationStringsModule.PUBLISH_VERSION_INFORMATION_TITLE,
			body = localizationStringsModule.PUBLISH_VERSION_INFORMATION_BODY,
			rows = t,
			testId = `{testId}-version-information`
		}),
		GameDetails = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 2,
			title = localizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS,
			body = localizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS_BODY,
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
				title = localizationStringsModule.PUBLISH_CONTENT_TITLE,
				body = localizationStringsModule.PUBLISH_CONTENT_BODY,
				rows = list_1,
				testId = `{testId}-content`
			}),
			BuildMaturityBanner = if p0.buildMaturityBannerText ~= nil then nil else reactModule.createElement(buildMaturityBannerModule, { text = p0.buildMaturityBannerText })
		})
	})
end