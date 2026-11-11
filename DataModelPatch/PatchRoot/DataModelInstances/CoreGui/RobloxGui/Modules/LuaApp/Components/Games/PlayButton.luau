local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local TModule = require(CorePackages.Packages.t)
local PlayButtonStates = require(CorePackages.Workspace.Packages.GamePlayButton).PlayButtonStates
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ComboButton = UIBloxModule.App.Button.ComboButton
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local GetFFlagIsSquadEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local FFlagLuaAppPlayButtonLoadingPrimary = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonLoadingPrimary
local FFlagLuaAppEnablePlaySquadButton = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnablePlaySquadButton
local FFlagUpdateActionNeededPlayButtonUi = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUpdateActionNeededPlayButtonUi
local GetFFlagUIBloxUseFoundationButtonFunction = require(CorePackages.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton
local FFlagLuaAppPlayButtonOptOutFoundationButton = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonOptOutFoundationButton
local FFlagLuaAppPlayLoadingClickTelemetryMobile = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppPlayLoadingClickTelemetryMobile
local FFlagLuaAppTextOnlyPlayButton = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppTextOnlyPlayButton
local FFlagLuaAppIconTextPlayButton = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppIconTextPlayButton
local FFlagLuaAppUpdatePlayButtonText = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUpdatePlayButtonText
local Images = UIBloxModule.App.ImageSet.Images
local IconsCommonPlay = Images["icons/common/play"]
local IconsStatusPrivate = Images["icons/status/private"]
local IconsStatusUnavailable = Images["icons/status/unavailable"]
local IconsCommonRobux = Images["icons/common/robux"]
local IconsActionsTruncationCollapse = Images["icons/actions/truncationCollapse"]
local PlayButton = RoactModule.PureComponent:extend("PlayButton")
PlayButton.validateProps = TModule.strictInterface({
	price = TModule.number,
	localizedFiatPrice = TModule.string,
	playButtonState = TModule.string,
	onPlayButtonActivated = TModule.callback,
	onPlaySquadButtonActivated = if FFlagLuaAppEnablePlaySquadButton then TModule.callback else nil,
	Size = TModule.optional(TModule.UDim2),
	LayoutOrder = TModule.optional(TModule.number),
	testId = TModule.optional(TModule.string)
})

function PlayButton.renderWithLocalization(p1, p2)
	-- upvalues: FFlagLuaAppEnablePlaySquadButton (copy), PlayButtonStates (copy), FFlagLuaAppPlayButtonLoadingPrimary (copy), ButtonType (copy), FFlagLuaAppTextOnlyPlayButton (copy), FFlagLuaAppIconTextPlayButton (copy), FFlagLuaAppUpdatePlayButtonText (copy), IconsCommonPlay (copy), GetFFlagIsSquadEnabledFunction (copy), IconsCommonRobux (copy), FFlagUpdateActionNeededPlayButtonUi (copy), IconsStatusPrivate (copy), IconsStatusUnavailable (copy), RoactModule (copy), ComboButton (copy), IconsActionsTruncationCollapse (copy), Button (copy), FFlagLuaAppPlayLoadingClickTelemetryMobile (copy), ReactModule (copy), GetFFlagUIBloxUseFoundationButtonFunction (copy), FFlagLuaAppPlayButtonOptOutFoundationButton (copy)
	local Size = p1.props.Size
	local LayoutOrder = p1.props.LayoutOrder
	local Price = p1.props.price
	local PlayButtonState = p1.props.playButtonState
	local OnPlayButtonActivated = p1.props.onPlayButtonActivated
	local OnPlaySquadButtonActivated = p1.props.onPlaySquadButtonActivated
	local IsLoading = false
	local IsDisabled = false
	local Flag = not FFlagLuaAppEnablePlaySquadButton and nil
	local IsDisabled1 = not FFlagLuaAppEnablePlaySquadButton and nil
	local PrimaryContextual = nil
	local Icon = nil
	local Text = nil
	
	if PlayButtonState == PlayButtonStates.Loading then
		PrimaryContextual = if FFlagLuaAppPlayButtonLoadingPrimary then ButtonType.PrimaryContextual else ButtonType.Secondary
		IsLoading = true
	elseif PlayButtonState == PlayButtonStates.Playable then
		PrimaryContextual = ButtonType.PrimaryContextual
		
		if FFlagLuaAppTextOnlyPlayButton or FFlagLuaAppIconTextPlayButton then
			Text = if FFlagLuaAppUpdatePlayButtonText then p2.play else p2.join
		end
		if not FFlagLuaAppTextOnlyPlayButton then
			Icon = IconsCommonPlay
		end
	elseif GetFFlagIsSquadEnabledFunction() and PlayButtonState == PlayButtonStates.PlayableWithParty then
		Icon = IconsCommonPlay
		Text = p2.joinWithParty
		Flag = true
	elseif GetFFlagIsSquadEnabledFunction() and PlayButtonState == PlayButtonStates.WaitingForParty then
		Icon = IconsCommonPlay
		Text = p2.waitingForParty
		IsDisabled = true
		IsDisabled1 = true
		Flag = true
	elseif PlayButtonState == PlayButtonStates.PaidAccess then
		PrimaryContextual = ButtonType.PrimaryContextual
		Icon = IconsCommonRobux
		Text = tostring(Price)
	elseif PlayButtonState == PlayButtonStates.FiatPaidAccess then
		PrimaryContextual = ButtonType.PrimaryContextual
		Text = p1.props.localizedFiatPrice
	elseif PlayButtonState == PlayButtonStates.ActionNeeded then
		if FFlagUpdateActionNeededPlayButtonUi then
			PrimaryContextual = ButtonType.PrimaryContextual
			Text = p2.unlock
		else
			PrimaryContextual = ButtonType.PrimarySystem
			Icon = IconsStatusPrivate
			Text = p2.join
		end
	elseif PlayButtonState == PlayButtonStates.UnplayableOther then
		PrimaryContextual = ButtonType.Secondary
		Icon = IconsStatusUnavailable
		Text = p2.unavailable
		IsDisabled = true
	else
		error("invalid play button state!")
	end
	if FFlagLuaAppEnablePlaySquadButton and Flag then
		return RoactModule.createElement(ComboButton, {
			layoutOrder = LayoutOrder,
			size = Size,
			button = {
				icon = Icon,
				text = Text,
				isDisabled = IsDisabled,
				onActivated = if IsDisabled then function() end else OnPlayButtonActivated
			},
			overflow = {
				icon = IconsActionsTruncationCollapse,
				isDisabled = IsDisabled1,
				onActivated = if IsDisabled1 then function() end else OnPlaySquadButtonActivated
			},
			testId = p1.props.testId
		})
	else
		local Element = RoactModule.createElement(Button, {
			size = if FFlagLuaAppPlayLoadingClickTelemetryMobile then UDim2.fromScale(1, 1) else Size,
			layoutOrder = LayoutOrder,
			isLoading = IsLoading,
			icon = Icon,
			text = Text,
			buttonType = PrimaryContextual,
			userInteractionEnabled = not IsDisabled,
			isDisabled = IsDisabled,
			onActivated = if IsDisabled then function() end else OnPlayButtonActivated,
			[ReactModule.Tag] = if p1.props.testId then `data-testid={p1.props.testId}` else nil,
			DO_NOT_USE_useUIBloxButton = if GetFFlagUIBloxUseFoundationButtonFunction() or FFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
		})
		
		return if FFlagLuaAppPlayLoadingClickTelemetryMobile then RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = Size,
			LayoutOrder = LayoutOrder
		}, {
			PlayButton = Element,
			LoadingTelemetryClickCatcher = if IsLoading then RoactModule.createElement("TextButton", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 2,
				[RoactModule.Event.Activated] = OnPlayButtonActivated
			}) else nil
		}) else Element
	end
end

function PlayButton.render(p1)
	-- upvalues: WithLocalizationFunction (copy), FFlagLuaAppTextOnlyPlayButton (copy), FFlagLuaAppIconTextPlayButton (copy), FFlagLuaAppUpdatePlayButtonText (copy), FFlagUpdateActionNeededPlayButtonUi (copy)
	return WithLocalizationFunction({
		join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		joinWithParty = "Feature.Squads.Action.JoinWithParty",
		unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		waitingForParty = "Feature.Squads.Action.WaitingForParty",
		play = if (FFlagLuaAppTextOnlyPlayButton or FFlagLuaAppIconTextPlayButton) and FFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else nil,
		unlock = if FFlagUpdateActionNeededPlayButtonUi then "Feature.ExperienceDetails.PlayButtonText.Unlock" else nil
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithLocalization(p2)
	end)
end

return PlayButton