local MusicTestingUtils = script:FindFirstAncestor("MusicTestingUtils")
local LocalizationService = game:GetService("LocalizationService")
local CryoModule = require(MusicTestingUtils.Parent.Cryo)
local ReactModule = require(MusicTestingUtils.Parent.React)
local ReactUtilsModule = require(MusicTestingUtils.Parent.ReactUtils)
local StyleModule = require(MusicTestingUtils.Parent.Style)
local FoundationModule = require(MusicTestingUtils.Parent.Foundation)
local ReactSceneUnderstandingModule = require(MusicTestingUtils.Parent.ReactSceneUnderstanding)
local Localization = require(MusicTestingUtils.Parent.RobloxAppLocales).Localization
local LocalizationProvider = require(MusicTestingUtils.Parent.Localization).LocalizationProvider
local ResponsiveModule = require(MusicTestingUtils.Parent.Responsive)
local RoactRoduxModule = require(MusicTestingUtils.Parent.RoactRodux)
local RoduxModule = require(MusicTestingUtils.Parent.Rodux)
local SongbirdModule = require(MusicTestingUtils.Parent.Songbird)
local config = {
	isReportAudioPopupVisible = true,
	theme = FoundationModule.Enums.Theme.Dark
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), FoundationModule (copy), RoactRoduxModule (copy), RoduxModule (copy), StyleModule (copy), ReactUtilsModule (copy), ReactSceneUnderstandingModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), SongbirdModule (copy), ResponsiveModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	
	return ReactModule.createElement(FoundationModule.FoundationProvider, {
		theme = JoinResult.theme,
		overlayGui = JoinResult.overlayGui,
		preferences = { reducedMotion = true }
	}, {
		StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, {
			store = RoduxModule.Store.new(function()
				return {}
			end)
		}, {
			AppStyleProvider = ReactModule.createElement(StyleModule.AppStyleProvider, {
				style = {
					themeName = JoinResult.theme,
					fontName = Enum.Font.BuilderSans.Name
				}
			}, {
				ContextStack = ReactModule.createElement(ReactUtilsModule.ContextStack, {
					providers = {
						ReactModule.createElement(ReactSceneUnderstandingModule.SceneAnalysisProvider),
						ReactModule.createElement(LocalizationProvider, {
							localization = Localization.new(LocalizationService.RobloxLocaleId)
						}),
						ReactModule.createElement(SongbirdModule.ReportAudioPopupContext.Provider, {
							value = {
								isVisible = JoinResult.isReportAudioPopupVisible,
								hasThumbnail = JoinResult.isReportAudioPopupHasThumbnail
							}
						}),
						ReactModule.createElement(ResponsiveModule.ContainerRef.Provider, { value = ReactModule.useRef(p1.host) })
					}
				}, JoinResult.children)
			})
		})
	})
end