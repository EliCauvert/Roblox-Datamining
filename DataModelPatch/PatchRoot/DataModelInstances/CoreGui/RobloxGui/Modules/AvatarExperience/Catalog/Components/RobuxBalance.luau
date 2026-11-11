local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local RobuxBalance = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.RobuxBalance
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local Images = UIBloxModule.App.ImageSet.Images
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local Interactable = UIBloxModule.Core.Control.Interactable
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local ApiFetchEconomyCurrencyModule = require(Modules.LuaApp.Thunks.ApiFetchEconomyCurrency)
local OpenPurchaseRobuxPageModule = require(Modules.LuaApp.Thunks.Economy.OpenPurchaseRobuxPage)
local RobuxCounterBorderHover = game:DefineFastFlag("RobuxCounterBorderHover", false)
local AXNewRobuxBalanceButton2 = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)() and game:DefineFastFlag("AXNewRobuxBalanceButton2", false)
local ComponentAssetsCircle17 = Images["component_assets/circle_17"]
local ComponentAssetsCircle17Stroke1 = Images["component_assets/circle_17_stroke_1"]
local IconsCommonGoldrobux = Images["icons/common/goldrobux"]
local RobuxBalance1 = RoactModule.PureComponent:extend("RobuxBalance")
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ConstantsModule = require(Modules.LuaApp.Constants)
local Interactable1 = if RobuxCounterBorderHover then Interactable else ImageSetButton
RobuxBalance1.defaultProps = { LayoutOrder = 1 }

function RobuxBalance1.init(p1)
	-- upvalues: RobuxCounterBorderHover (copy)
	if RobuxCounterBorderHover then
		p1.state = { hovered = false }
	end
	function p1.fetchRobuxBalance()
		-- upvalues: p1 (copy)
		local LocalUserId = p1.props.localUserId
		local Networking = p1.props.networking
		
		if typeof(LocalUserId) == "string" and LocalUserId ~= "" then
			p1.props.requestRobuxInfo(Networking, LocalUserId)
		end
	end
	
	function p1.openPurchaseRobuxPage()
		-- upvalues: p1 (copy)
		p1.props.openPurchaseRobuxPage(p1.props.navigation, p1.props.disableIAPEntryPoint, p1.props.networking)
	end
end

function RobuxBalance1.didMount(p1)
	p1.fetchRobuxBalance()
end

local function _(p1): boolean
	-- upvalues: AvatarScreen (copy)
	return p1.avatarRoute.opaque.name == AvatarScreen.Catalog
end

function RobuxBalance1.didUpdate(p1, p2, _)
	-- upvalues: AvatarScreen (copy)
	if p2.localUserId ~= p1.props.localUserId then
		p1.fetchRobuxBalance()
		
		return
	end
	local IsNameMatch = p1.props.avatarRoute.opaque.name == AvatarScreen.Catalog
	
	if p2.avatarRoute.opaque.name ~= AvatarScreen.Catalog and IsNameMatch then
		p1.fetchRobuxBalance()
	end
end

function RobuxBalance1.render(p1)
	-- upvalues: NumberLocalization (copy), AXNewRobuxBalanceButton2 (copy), RoactModule (copy), Focusable (copy), RobuxBalance (copy), WithStyleFunction (copy), TextService (copy), WithSelectionCursorProviderFunction (copy), Interactable1 (copy), ComponentAssetsCircle17 (copy), RobuxCounterBorderHover (copy), ControlState (copy), CursorKind (copy), ImageSetLabel (copy), ComponentAssetsCircle17Stroke1 (copy), IconsCommonGoldrobux (copy)
	local UserRobuxBalance = p1.props.userRobuxBalance
	local Localization = p1.props.localization
	local AbbreviateResult = UserRobuxBalance and NumberLocalization.abbreviate(UserRobuxBalance, Localization:GetLocale()) or "-"
	
	return if AXNewRobuxBalanceButton2 then RoactModule.createElement(Focusable[RobuxBalance], {
		text = AbbreviateResult,
		onActivated = p1.openPurchaseRobuxPage,
		ref = p1.props.forwardRef,
		NextSelectionLeft = p1.props.NextSelectionLeft
	}) else WithStyleFunction(function(p2)
		-- upvalues: TextService (upval), AbbreviateResult (copy), WithSelectionCursorProviderFunction (upval), p1 (copy), RoactModule (upval), Focusable (upval), Interactable1 (upval), ComponentAssetsCircle17 (upval), RobuxCounterBorderHover (upval), ControlState (upval), CursorKind (upval), ImageSetLabel (upval), ComponentAssetsCircle17Stroke1 (upval), IconsCommonGoldrobux (upval)
		local _Font = p2.Font
		local Theme = p2.Theme
		local CaptionHeaderFont = _Font.CaptionHeader.Font
		local ScaledBaseSize = _Font.BaseSize * _Font.CaptionHeader.RelativeSize
		local NewX = 40 + TextService:GetTextSize(AbbreviateResult, ScaledBaseSize, CaptionHeaderFont, Vector2.new(1e999, ScaledBaseSize)).X + 8
		
		return WithSelectionCursorProviderFunction(function(Callback)
			-- upvalues: p1 (upval), RoactModule (upval), Focusable (upval), Interactable1 (upval), ComponentAssetsCircle17 (upval), Theme (copy), NewX (copy), RobuxCounterBorderHover (upval), ControlState (upval), CursorKind (upval), ImageSetLabel (upval), ComponentAssetsCircle17Stroke1 (upval), IconsCommonGoldrobux (upval), AbbreviateResult (upval), CaptionHeaderFont (copy), ScaledBaseSize (copy)
			return RoactModule.createElement(Focusable[Interactable1], {
				BackgroundTransparency = 1,
				Image = ComponentAssetsCircle17,
				ImageColor3 = Theme.BackgroundUIDefault.Color,
				ImageTransparency = Theme.BackgroundUIDefault.Transparency,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 9, 9),
				Size = UDim2.new(0, NewX, 0, 40),
				[RoactModule.Event.Activated] = p1.openPurchaseRobuxPage,
				[RoactModule.Ref] = p1.props.forwardRef,
				onStateChanged = if RobuxCounterBorderHover then function(_, Hover)
					-- upvalues: p1 (upval), ControlState (upval)
					p1:setState({ hovered = Hover == ControlState.Hover })
				end else nil,
				NextSelectionLeft = p1.props.NextSelectionLeft,
				SelectionImageObject = Callback(CursorKind.RoundedRectNoInset)
			}, {
				Border = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = ComponentAssetsCircle17Stroke1,
					ImageColor3 = if RobuxCounterBorderHover and p1.state.hovered then Theme.SecondaryOnHover.Color else Theme.Divider.Color,
					ImageTransparency = if RobuxCounterBorderHover and p1.state.hovered then Theme.SecondaryOnHover.Transparency else Theme.Divider.Transparency,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 9, 9),
					Size = UDim2.new(1, 0, 1, 0)
				}),
				Content = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
					UIListLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 4)
					}),
					RobuxIcon = RoactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(0, 28, 0, 28),
						Image = IconsCommonGoldrobux
					}),
					RobuxInfo = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						AutomaticSize = Enum.AutomaticSize.XY,
						Text = AbbreviateResult,
						Font = CaptionHeaderFont,
						TextSize = ScaledBaseSize,
						TextColor3 = Theme.TextEmphasis.Color,
						TextTransparency = Theme.TextEmphasis.Transparency
					})
				})
			})
		end)
	end)
end

local WithAvatarRouteModuleResult = WithAvatarRouteModule((WithNavigationFunction((RoactRoduxModule.connect(function(p1, _)
	local LocalUserId = p1.LocalUserId
	
	return {
		localUserId = LocalUserId,
		userRobuxBalance = p1.UserRobux[LocalUserId]
	}
end, function(Callback, _)
	-- upvalues: SetCurrentToastMessageModule (copy), ConstantsModule (copy), OpenPurchaseRobuxPageModule (copy), ApiFetchEconomyCurrencyModule (copy)
	return {
		openPurchaseRobuxPage = function(_, p1, p2)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval), ConstantsModule (upval), OpenPurchaseRobuxPageModule (upval)
			if p1 then
				Callback(SetCurrentToastMessageModule(ConstantsModule.WEBVIEWS_UNAVAILABLE_TOAST))
				
				return
			else
				return Callback(OpenPurchaseRobuxPageModule(nil, p2))
			end
		end,
		requestRobuxInfo = function(p1, p2)
			-- upvalues: Callback (copy), ApiFetchEconomyCurrencyModule (upval)
			return Callback(ApiFetchEconomyCurrencyModule(p1, p2, false))
		end
	}
end)((RoactAppPolicy.connect(function(p1)
	return { disableIAPEntryPoint = p1.getDisableIAPEntryPoint() }
end)((RoactServices.connect({
	localization = RoactLocalizationModule,
	networking = RoactNetworkingModule
})(RobuxBalance1)))))))))

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), WithAvatarRouteModuleResult (ref), CryoModule (copy)
	return RoactModule.createElement(WithAvatarRouteModuleResult, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)