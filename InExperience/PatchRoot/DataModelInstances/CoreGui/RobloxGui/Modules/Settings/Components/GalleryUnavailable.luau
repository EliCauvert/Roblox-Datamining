local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetCloudClientServiceFunction = require(CorePackages.Workspace.Packages.InExperienceCloudPlay).getCloudClientService
local FFlagLuaAppCloudClientRobloxRealityNameParamModule = require(CorePackages.Workspace.Packages.InExperienceCloudPlay.FFlagLuaAppCloudClientRobloxRealityNameParam)
local FStringLuaAppCloudClientRobloxRealityNameModule = require(CorePackages.Workspace.Packages.InExperienceCloudPlay.FStringLuaAppCloudClientRobloxRealityName)
local config = {
	title = "Feature.CloudClient.Heading.GalleryUnavailableCloudPlay",
	body = "Feature.CloudClient.Description.GalleryUnavailableCloudPlay"
}
local Config = if FFlagLuaAppCloudClientRobloxRealityNameParamModule then {
	title = {
		"Feature.CloudClient.Heading.GalleryUnavailableRobloxRealityV2",
		productName = FStringLuaAppCloudClientRobloxRealityNameModule
	},
	body = {
		"Feature.CloudClient.Description.GalleryUnavailableRobloxRealityV2",
		productName = FStringLuaAppCloudClientRobloxRealityNameModule
	}
} else {
	title = "Feature.CloudClient.Heading.GalleryUnavailableRobloxReality",
	body = "Feature.CloudClient.Description.GalleryUnavailableRobloxReality"
}

return function()
	-- upvalues: UseTokensFunction (copy), GetCloudClientServiceFunction (copy), Config (copy), config (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Icon (copy), IconName (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local CloudClientService = GetCloudClientServiceFunction()
	local Config1 = if CloudClientService and CloudClientService.IsRobloxRealityEnvironment then Config else config
	local UseLocalizationResult = UseLocalizationFunction({ title = Config1.title, body = Config1.body })
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-center size-full",
		testId = "gallery-unavailable",
		padding = { bottom = UDim.new(0, UseTokensResult.Margin.Large) }
	}, {
		IconFrame = ReactModule.createElement(View, {
			tag = "col align-x-center align-y-center size-2400-2400",
			LayoutOrder = 1
		}, {
			Icon = ReactModule.createElement(Icon, {
				name = IconName.TriangleExclamation,
				size = UseTokensResult.Size.Size_1800
			})
		}),
		Message = ReactModule.createElement(View, {
			tag = "col gap-xsmall size-full-0 auto-y",
			LayoutOrder = 2
		}, {
			Title = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-label-large text-wrap content-emphasis",
				testId = "gallery-unavailable-title",
				LayoutOrder = 1,
				Text = UseLocalizationResult.title
			}),
			Body = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-body-medium text-wrap content-default",
				testId = "gallery-unavailable-body",
				LayoutOrder = 2,
				Text = UseLocalizationResult.body
			})
		})
	})
end