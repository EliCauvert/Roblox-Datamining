local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local TModule = require(Parent.t)
local PlayButtonStatesModule = require(script.Parent.PlayButtonStates)
local UIBloxModule = require(Parent.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ComboButton = UIBloxModule.App.Button.ComboButton
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagLuaAppPlayButtonLoadingPrimary = require(Parent.SharedFlags).FFlagLuaAppPlayButtonLoadingPrimary
local GetFFlagUIBloxUseFoundationButtonFunction = require(Parent.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton
local FFlagLuaAppPlayButtonOptOutFoundationButton = require(Parent.SharedFlags).FFlagLuaAppPlayButtonOptOutFoundationButton
local FFlagLuaAppPlayLoadingClickTelemetryMobile = require(Parent.SharedFlags).FFlagLuaAppPlayLoadingClickTelemetryMobile
local FFlagLuaAppTextOnlyPlayButton = require(Parent.SharedFlags).FFlagLuaAppTextOnlyPlayButton
local FFlagLuaAppIconTextPlayButton = require(Parent.SharedFlags).FFlagLuaAppIconTextPlayButton
local FFlagLuaAppUpdatePlayButtonText = require(Parent.SharedFlags).FFlagLuaAppUpdatePlayButtonText
local FFlagLuaAppPlayButtonPrivatePT = require(Parent.SharedFlags).FFlagLuaAppPlayButtonPrivatePT
local FFlagEnableGameJoinEarlyAccess = require(Parent.SharedFlags).FFlagEnableGameJoinEarlyAccess
local Images = UIBloxModule.App.ImageSet.Images
local IconsCommonPlay = Images["icons/common/play"]
local IconsStatusUnavailable = Images["icons/status/unavailable"]
local IconsCommonRobux = Images["icons/common/robux"]
local IconsActionsTruncationCollapse = Images["icons/actions/truncationCollapse"]
local PlayButton = RoactModule.PureComponent:extend("PlayButton")
PlayButton.validateProps = TModule.strictInterface({
	price = TModule.number,
	localizedFiatPrice = TModule.string,
	playButtonState = TModule.string,
	onPlayButtonActivated = TModule.callback,
	onPlaySquadButtonActivated = if GetFFlagIsSquadEnabledFunction() then TModule.callback else nil,
	Size = TModule.optional(TModule.UDim2),
	LayoutOrder = TModule.optional(TModule.number),
	testId = TModule.optional(TModule.string)
})

function PlayButton.renderWithLocalization(p1, p2) --[[ Line: 47 ]]
	-- upvalues: GetFFlagIsSquadEnabledFunction (copy), PlayButtonStatesModule (copy), FFlagLuaAppPlayButtonLoadingPrimary (copy), ButtonType (copy), FFlagLuaAppTextOnlyPlayButton (copy), FFlagLuaAppIconTextPlayButton (copy), FFlagLuaAppUpdatePlayButtonText (copy), IconsCommonPlay (copy), IconsCommonRobux (copy), FFlagLuaAppPlayButtonPrivatePT (copy), IconsStatusUnavailable (copy), FFlagEnableGameJoinEarlyAccess (copy), RoactModule (copy), ComboButton (copy), IconsActionsTruncationCollapse (copy), Button (copy), FFlagLuaAppPlayLoadingClickTelemetryMobile (copy), ReactModule (copy), GetFFlagUIBloxUseFoundationButtonFunction (copy), FFlagLuaAppPlayButtonOptOutFoundationButton (copy)
	local Size = p1.props.Size
	local LayoutOrder = p1.props.LayoutOrder
	local Price = p1.props.price
	local PlayButtonState = p1.props.playButtonState
	local OnPlayButtonActivated = p1.props.onPlayButtonActivated
	local OnPlaySquadButtonActivated = p1.props.onPlaySquadButtonActivated
	local IsLoading = false
	local IsDisabled = false
	local Flag = not GetFFlagIsSquadEnabledFunction() and nil
	local IsDisabled1 = not GetFFlagIsSquadEnabledFunction() and nil
	local PrimaryContextual = nil
	local Icon = nil
	local Unavailable = nil
	
	if PlayButtonState == PlayButtonStatesModule.Loading then
		PrimaryContextual = if FFlagLuaAppPlayButtonLoadingPrimary then ButtonType.PrimaryContextual else ButtonType.Secondary
		IsLoading = true
	elseif PlayButtonState == PlayButtonStatesModule.Playable then
		PrimaryContextual = ButtonType.PrimaryContextual
		
		if FFlagLuaAppTextOnlyPlayButton or FFlagLuaAppIconTextPlayButton then
			Unavailable = if FFlagLuaAppUpdatePlayButtonText then p2.play else p2.join
		end
		if not FFlagLuaAppTextOnlyPlayButton then
			Icon = IconsCommonPlay
		end
	elseif GetFFlagIsSquadEnabledFunction() and PlayButtonState == PlayButtonStatesModule.PlayableWithParty then
		Icon = IconsCommonPlay
		Unavailable = p2.joinWithParty
		Flag = true
	elseif GetFFlagIsSquadEnabledFunction() and PlayButtonState == PlayButtonStatesModule.WaitingForParty then
		Icon = IconsCommonPlay
		Unavailable = p2.waitingForParty
		IsDisabled = true
		IsDisabled1 = true
		Flag = true
	elseif PlayButtonState == PlayButtonStatesModule.PaidAccess then
		PrimaryContextual = ButtonType.PrimaryContextual
		Icon = IconsCommonRobux
		Unavailable = tostring(Price)
	elseif PlayButtonState == PlayButtonStatesModule.FiatPaidAccess then
		PrimaryContextual = ButtonType.PrimaryContextual
		Unavailable = p1.props.localizedFiatPrice
	elseif PlayButtonState == PlayButtonStatesModule.DemoMode then
		PrimaryContextual = ButtonType.PrimarySystem
		Unavailable = p2.playDemo
	elseif FFlagLuaAppPlayButtonPrivatePT and PlayButtonState == PlayButtonStatesModule.Playtest then
		PrimaryContextual = ButtonType.PrimarySystem
		Unavailable = p2.playtest
	elseif PlayButtonState == PlayButtonStatesModule.ActionNeeded then
		PrimaryContextual = ButtonType.PrimaryContextual
		Unavailable = p2.unlock
	elseif PlayButtonState == PlayButtonStatesModule.UnplayableOther then
		PrimaryContextual = ButtonType.Secondary
		Icon = IconsStatusUnavailable
		Unavailable = p2.unavailable
		IsDisabled = true
	elseif FFlagEnableGameJoinEarlyAccess and PlayButtonState == PlayButtonStatesModule.EarlyAccessLocked then
		PrimaryContextual = ButtonType.Secondary
		Unavailable = p2.unavailable
		IsDisabled = true
	else
		error("invalid play button state!")
	end
	if GetFFlagIsSquadEnabledFunction() and Flag then
		return RoactModule.createElement(ComboButton, {
			layoutOrder = LayoutOrder,
			size = Size,
			button = {
				icon = Icon,
				text = Unavailable,
				isDisabled = IsDisabled,
				onActivated = if IsDisabled then function() --[[ Line: 120 ]] end else OnPlayButtonActivated
			},
			overflow = {
				icon = IconsActionsTruncationCollapse,
				isDisabled = IsDisabled1,
				onActivated = if IsDisabled1 then function() --[[ Line: 125 ]] end else OnPlaySquadButtonActivated
			},
			testId = p1.props.testId
		})
	else
		local Element = RoactModule.createElement(Button, {
			size = if FFlagLuaAppPlayLoadingClickTelemetryMobile then UDim2.fromScale(1, 1) else Size,
			layoutOrder = LayoutOrder,
			isLoading = IsLoading,
			icon = Icon,
			text = Unavailable,
			buttonType = PrimaryContextual,
			userInteractionEnabled = not IsDisabled,
			isDisabled = IsDisabled,
			onActivated = if IsDisabled then function() --[[ Line: 139 ]] end else OnPlayButtonActivated,
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

function PlayButton.render(p1) --[[ Line: 173 ]]
	-- upvalues: WithLocalizationFunction (copy), FFlagLuaAppTextOnlyPlayButton (copy), FFlagLuaAppIconTextPlayButton (copy), FFlagLuaAppUpdatePlayButtonText (copy), FFlagLuaAppPlayButtonPrivatePT (copy)
	return WithLocalizationFunction({
		join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		unlock = "Feature.ExperienceDetails.PlayButtonText.Unlock",
		joinWithParty = "Feature.Squads.Action.JoinWithParty",
		unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		waitingForParty = "Feature.Squads.Action.WaitingForParty",
		playDemo = "Feature.ExperienceDetails.PlayButtonText.PlayDemo",
		play = if (FFlagLuaAppTextOnlyPlayButton or FFlagLuaAppIconTextPlayButton) and FFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else nil,
		playtest = if FFlagLuaAppPlayButtonPrivatePT then "Feature.ExperienceDetails.PlayButtonText.Playtest" else nil
	})(function(p2) --[[ Line: 186 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithLocalization(p2)
	end)
end

return PlayButton