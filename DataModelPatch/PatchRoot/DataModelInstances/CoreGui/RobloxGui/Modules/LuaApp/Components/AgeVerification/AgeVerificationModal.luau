local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local TModule = require(CorePackages.Packages.t)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ExperienceDetailsExperimentationModule = require(script.Parent.Parent.ExperienceDetails.ExperienceDetailsExperimentation)
local CryoModule = require(CorePackages.Packages.Cryo)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local FetchGameDetailsPageDataModule = require(Modules.LuaApp.Thunks.Games.FetchGameDetailsPageData)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local AppPageModule = require(Modules.LuaApp.AppPage)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local GetCurrentPageModule = require(Modules.LuaApp.getCurrentPage)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local UseAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagSignalsNavP3hMisc = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3hMisc
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local AgeVerificationModal = RoactModule.PureComponent:extend("AgeVerificationModal")
AgeVerificationModal.validateProps = TModule.strictInterface({
	universeId = TModule.string,
	pageName = TModule.string,
	screenSize = TModule.Vector2,
	navigateDown = TModule.callback,
	navigateBack = TModule.callback,
	dispatchFetchGameDetailsPageData = TModule.callback,
	eventIngest = TModule.table,
	networking = TModule.callback,
	areWebviewsSupported = TModule.boolean,
	shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then TModule.optional(TModule.boolean) else nil
})

function AgeVerificationModal.init(p1)
	p1.isMounted = false
	
	function p1.trackDeeplinkClick(PageName, UniverseId)
		-- upvalues: p1 (copy)
		p1.props.eventIngest:setRBXEventStream(PageName, "ageVerificationUpsellClick", { universeId = UniverseId })
	end
end

function AgeVerificationModal.didMount(p1)
	p1.isMounted = true
end

function AgeVerificationModal.willUnmount(p1)
	-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
	local Networking = p1.props.networking
	local UniverseId = p1.props.universeId
	
	if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then
		p1.props.dispatchFetchGameDetailsPageData(Networking, UniverseId, nil, p1.props.shouldHydrateLegacyIxp)
	else
		p1.props.dispatchFetchGameDetailsPageData(Networking, UniverseId)
	end
	p1.isMounted = false
end

function AgeVerificationModal.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy), ButtonType (copy), AppPageModule (copy), UrlBuilderModule (copy), RoactModule (copy), PartialPageModal (copy), StyledTextLabel (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), ButtonType (upval), p1 (copy), AppPageModule (upval), UrlBuilderModule (upval), RoactModule (upval), PartialPageModal (upval), StyledTextLabel (upval)
		return WithLocalizationFunction({
			title = "Feature.AgeVerificationUpsell.Modal.Title",
			message = "Feature.AgeVerificationUpsell.Modal.ContentText",
			buttonCancel = "Feature.AgeVerificationUpsell.Button.Cancel",
			buttonSettings = "Feature.AgeVerificationUpsell.Button.Settings"
		})(function(p3)
			-- upvalues: ButtonType (upval), p1 (upval), AppPageModule (upval), UrlBuilderModule (upval), RoactModule (upval), PartialPageModal (upval), StyledTextLabel (upval), p2 (copy)
			local Buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = {
						isDisabled = false,
						onActivated = p1.props.navigateBack,
						text = p3.buttonCancel
					}
				}
			}
			
			if p1.props.areWebviewsSupported then
				table.insert(Buttons, {
					buttonType = ButtonType.PrimarySystem,
					props = {
						isDisabled = false,
						onActivated = function()
							-- upvalues: p1 (upval), AppPageModule (upval), UrlBuilderModule (upval), p3 (copy)
							if p1.isMounted then
								p1.trackDeeplinkClick(p1.props.pageName, p1.props.universeId)
								p1.props.navigateDown({
									name = AppPageModule.GenericWebPage,
									detail = UrlBuilderModule.static.settings.account(),
									extraProps = { title = p3.buttonSettings }
								})
							end
						end,
						text = p3.buttonSettings
					}
				})
			end
			return RoactModule.createElement("ImageButton", {
				AutoButtonColor = false,
				ImageTransparency = 1,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = Color3.new(0, 0, 0)
			}, {
				Overlay = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					Content = RoactModule.createElement(PartialPageModal, {
						title = p3.title,
						screenSize = p1.props.screenSize,
						buttonStackProps = {
							buttonHeight = 48,
							forcedFillDirection = Enum.FillDirection.Horizontal,
							buttons = Buttons
						}
					}, {
						ViewFrame = RoactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							AutomaticSize = Enum.AutomaticSize.XY
						}, {
							UIPadding = RoactModule.createElement("UIPadding", {
								PaddingTop = UDim.new(0, 24),
								PaddingBottom = UDim.new(0, 24)
							}),
							Text = RoactModule.createElement(StyledTextLabel, {
								fluidSizing = false,
								fontStyle = p2.Font.Body,
								colorStyle = p2.Theme.TextEmphasis,
								size = UDim2.new(1, 0, 0, 0),
								textXAlignment = Enum.TextXAlignment.Left,
								textYAlignment = Enum.TextYAlignment.Center,
								automaticSize = Enum.AutomaticSize.Y,
								text = p3.message
							})
						})
					})
				})
			})
		end)
	end)
end

local v1 = if FFlagSignalsNavP3hMisc then if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then function(p1)
	-- upvalues: ExperienceDetailsExperimentationModule (copy), ReactModule (copy), IXPService (copy), AppUserLayers (copy), RoactModule (copy), v1 (copy), CryoModule (copy)
	local ShouldHydrateLegacy = ExperienceDetailsExperimentationModule.getShouldHydrateLegacy()
	ReactModule.useEffect(function()
		-- upvalues: IXPService (upval), AppUserLayers (upval)
		IXPService:LogUserLayerExposure(AppUserLayers.ExperienceDetailsPageExposureLayer)
	end, {})
	
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, { shouldHydrateLegacyIxp = ShouldHydrateLegacy }))
end else function(p1)
	-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), RoactModule (copy), v1 (copy), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, {
		pageName = UseSignalState(GetLegacyNavigationStore(false).getCurrentPage).name
	}))
end elseif FFlagLuaAppEdpBackendV2HydrateLegacyIxp then function(p1)
	-- upvalues: ExperienceDetailsExperimentationModule (copy), ReactModule (copy), IXPService (copy), AppUserLayers (copy), RoactModule (copy), v1 (copy), CryoModule (copy)
	local ShouldHydrateLegacy = ExperienceDetailsExperimentationModule.getShouldHydrateLegacy()
	ReactModule.useEffect(function()
		-- upvalues: IXPService (upval), AppUserLayers (upval)
		IXPService:LogUserLayerExposure(AppUserLayers.ExperienceDetailsPageExposureLayer)
	end, {})
	
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, { shouldHydrateLegacyIxp = ShouldHydrateLegacy }))
end else RoactRoduxModule.connect(function(p1, _)
	-- upvalues: FFlagSignalsNavP3hMisc (copy), GetCurrentPageModule (copy)
	return {
		screenSize = p1.ScreenSize,
		pageName = if FFlagSignalsNavP3hMisc then nil else GetCurrentPageModule(p1)
	}
end, function(Callback)
	-- upvalues: NavigateDownModule (copy), NavigateBackModule (copy), FetchGameDetailsPageDataModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
	return {
		navigateDown = function(p1)
			-- upvalues: Callback (copy), NavigateDownModule (upval)
			return Callback(NavigateDownModule(p1))
		end,
		navigateBack = function()
			-- upvalues: Callback (copy), NavigateBackModule (upval)
			return Callback(NavigateBackModule())
		end,
		dispatchFetchGameDetailsPageData = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), FetchGameDetailsPageDataModule (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval)
			return Callback(FetchGameDetailsPageDataModule(p1, p2, p3, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p4 else nil))
		end
	}
end)((RoactServices.connect({
	eventIngest = AppEventIngestServiceModule,
	networking = RoactNetworkingModule
})(AgeVerificationModal)))

return function(p1)
	-- upvalues: UseAppPolicy (copy), CryoModule (copy), RoactModule (copy), v1 (copy)
	return RoactModule.createElement(v1, (CryoModule.Dictionary.join(p1, {
		areWebviewsSupported = UseAppPolicy(function(p2)
			return p2.getWebViewSupport()
		end)
	})))
end