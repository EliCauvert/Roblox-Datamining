local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local TModule = require(CorePackages.Packages.t)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local OpenExternalBrowserModule = require(Modules.LuaApp.openExternalBrowser)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local AppPageModule = require(Modules.LuaApp.AppPage)
local ExperienceGuidelinesListModule = require(Modules.LuaApp.Components.ExperienceGuidelines.ExperienceGuidelinesList)
local TransitionAnimationModule = require(Modules.LuaApp.Enum.TransitionAnimation)
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ExperienceGuidelinesUrlsModule = require(Modules.LuaApp.Flags.ExperienceGuidelinesUrls)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local GetFFlagUseExternalBrowserForAgeGuidelines10ftFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagUseExternalBrowserForAgeGuidelines10ft
local FixGuidelinesExplainedClose = game:DefineFastFlag("FixGuidelinesExplainedClose", false)
local ExperienceGuidelinesExplainedModal = RoactModule.PureComponent:extend("ExperienceGuidelinesExplainedModal")
ExperienceGuidelinesExplainedModal.validateProps = TModule.strictInterface({
	ageRecommendations = TModule.optional(require(CorePackages.Workspace.Packages.GameDetailRodux).AgeRecommendations.AgeRecommendationDetails.validateModel),
	ageRecommendationHeader = TModule.optional(TModule.string),
	hideCloseButton = TModule.optional(TModule.boolean),
	universeId = TModule.string,
	localization = TModule.table,
	navigateDown = TModule.callback,
	navigateBack = TModule.callback,
	closeModal = TModule.optional(TModule.callback),
	screenSize = TModule.Vector2,
	webViewSupport = TModule.boolean,
	linking = TModule.table,
	useExternalBrowserForAgeGuidelines = TModule.optional(TModule.boolean)
})

function ExperienceGuidelinesExplainedModal.init(p1)
	-- upvalues: ExperienceGuidelinesUrlsModule (copy), OpenExternalBrowserModule (copy), AppPageModule (copy), TransitionAnimationModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), FixGuidelinesExplainedClose (copy)
	local FStringExperienceGuidelinesExplainedPageUrl = ExperienceGuidelinesUrlsModule.FStringExperienceGuidelinesExplainedPageUrl
	
	function p1.onLearnMoreActivated()
		-- upvalues: p1 (copy), OpenExternalBrowserModule (upval), FStringExperienceGuidelinesExplainedPageUrl (copy), AppPageModule (upval), TransitionAnimationModule (upval)
		if p1.props.useExternalBrowserForAgeGuidelines then
			OpenExternalBrowserModule(p1.props.linking, FStringExperienceGuidelinesExplainedPageUrl)
			
			return
		else
			local Localization = p1.props.localization
			p1.props.navigateDown({
				name = AppPageModule.GenericWebPage,
				detail = FStringExperienceGuidelinesExplainedPageUrl,
				extraProps = {
					title = if p1.props.ageRecommendationHeader then p1.props.ageRecommendationHeader else Localization:Format("Feature.GameDetails.Label.ContentMaturity"),
					transitionAnimation = TransitionAnimationModule.SlideInFromRight
				}
			})
		end
	end
	
	function p1.closeModal()
		-- upvalues: p1 (copy)
		if p1.props.closeModal then
			p1.props.closeModal()
			
			return
		else
			p1.props.navigateBack()
		end
	end
	
	p1.focusEventHandlers = {
		[FocusNavigationEventNameEnum.NavigateBack] = {
			handler = InputHandlersModule.onRelease(function(p2)
				-- upvalues: FixGuidelinesExplainedClose (upval), p1 (copy)
				if not FixGuidelinesExplainedClose then
					p1.closeModal()
					p2:cancel()
				elseif not p1.props.hideCloseButton then
					p1.closeModal()
					p2:cancel()
					
					return
				end
			end)
		}
	}
end

function ExperienceGuidelinesExplainedModal.render(p1)
	-- upvalues: RoactModule (copy), PartialPageModal (copy), ButtonType (copy), ExperienceGuidelinesListModule (copy)
	local Localization = p1.props.localization
	local AgeRecommendations = p1.props.ageRecommendations
	
	return RoactModule.createElement("ImageButton", {
		AutoButtonColor = false,
		ImageTransparency = 1,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.new(0, 0, 0),
		Selectable = p1.props.hideCloseButton
	}, {
		Content = RoactModule.createElement(PartialPageModal, {
			title = if p1.props.ageRecommendationHeader then p1.props.ageRecommendationHeader else Localization:Format("Feature.GameDetails.Label.ContentMaturity"),
			screenSize = p1.props.screenSize,
			onCloseClicked = if p1.props.hideCloseButton then nil else p1.closeModal,
			buttonStackProps = if p1.props.webViewSupport then {
				buttonHeight = 48,
				forcedFillDirection = Enum.FillDirection.Vertical,
				buttons = {
					{
						buttonType = ButtonType.Secondary,
						props = {
							isDisabled = false,
							onActivated = p1.onLearnMoreActivated,
							text = Localization:Format("Feature.GameDetails.Label.LearnMore")
						}
					}
				}
			} else nil
		}, {
			ViewFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				UIPadding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 24),
					PaddingBottom = UDim.new(0, 24)
				}),
				DescriptorList = AgeRecommendations and RoactModule.createElement(ExperienceGuidelinesListModule, { ageRecommendations = AgeRecommendations })
			})
		})
	})
end

return (RoactAppPolicy.connect(function(p1)
	-- upvalues: GetFFlagUseExternalBrowserForAgeGuidelines10ftFunction (copy)
	return {
		webViewSupport = p1.getWebViewSupport(),
		useExternalBrowserForAgeGuidelines = if GetFFlagUseExternalBrowserForAgeGuidelines10ftFunction() then p1.getUseExternalBrowserForAgeGuidelines() else nil
	}
end)((RoactServices.connect({
	localization = RoactLocalizationModule,
	linking = AppLinking
})((RoactRoduxModule.connect(function(p1, p2)
	return {
		screenSize = p1.ScreenSize,
		ageRecommendations = p1.AgeRecommendations[p2.universeId],
		ageRecommendationHeader = p1.AgeRecommendationHeaders.headerDisplayName
	}
end, function(Callback)
	-- upvalues: NavigateDownModule (copy), NavigateBackModule (copy)
	return {
		navigateDown = function(p1)
			-- upvalues: Callback (copy), NavigateDownModule (upval)
			return Callback(NavigateDownModule(p1))
		end,
		navigateBack = function()
			-- upvalues: Callback (copy), NavigateBackModule (upval)
			return Callback(NavigateBackModule())
		end
	}
end)(ExperienceGuidelinesExplainedModal))))))