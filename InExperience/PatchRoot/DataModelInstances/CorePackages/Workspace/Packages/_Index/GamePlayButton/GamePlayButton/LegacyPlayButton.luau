local parent = script:FindFirstAncestor("GamePlayButton").Parent
local roactModule = require(parent.Roact)
local reactModule = require(parent.React)
local tModule = require(parent.t)
local playButtonStatesModule = require(script.Parent.PlayButtonStates)
local UIBloxModule = require(parent.UIBlox)
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local comboButton = UIBloxModule.App.Button.ComboButton
local withLocalization = require(parent.Localization).withLocalization
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagLuaAppPlayButtonLoadingPrimary = require(parent.SharedFlags).FFlagLuaAppPlayButtonLoadingPrimary
local fFlagLuaAppEnablePlaySquadButton = require(parent.SharedFlags).FFlagLuaAppEnablePlaySquadButton
local getFFlagUIBloxUseFoundationButton = require(parent.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton
local fFlagLuaAppPlayButtonOptOutFoundationButton = require(parent.SharedFlags).FFlagLuaAppPlayButtonOptOutFoundationButton
local fFlagLuaAppPlayLoadingClickTelemetryMobile = require(parent.SharedFlags).FFlagLuaAppPlayLoadingClickTelemetryMobile
local fFlagLuaAppTextOnlyPlayButton = require(parent.SharedFlags).FFlagLuaAppTextOnlyPlayButton
local fFlagLuaAppIconTextPlayButton = require(parent.SharedFlags).FFlagLuaAppIconTextPlayButton
local fFlagLuaAppUpdatePlayButtonText = require(parent.SharedFlags).FFlagLuaAppUpdatePlayButtonText
local images = UIBloxModule.App.ImageSet.Images
local play = images["icons/common/play"]
local unavailable = images["icons/status/unavailable"]
local robux = images["icons/common/robux"]
local truncationCollapse = images["icons/actions/truncationCollapse"]
local playButton = roactModule.PureComponent:extend("PlayButton")
playButton.validateProps = tModule.strictInterface({
	price = tModule.number,
	localizedFiatPrice = tModule.string,
	playButtonState = tModule.string,
	onPlayButtonActivated = tModule.callback,
	onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then tModule.callback else nil,
	Size = tModule.optional(tModule.UDim2),
	LayoutOrder = tModule.optional(tModule.number),
	testId = tModule.optional(tModule.string)
})

function playButton.renderWithLocalization(p1, p2)
	-- upvalues: fFlagLuaAppEnablePlaySquadButton (ref), playButtonStatesModule (ref), fFlagLuaAppPlayButtonLoadingPrimary (ref), buttonType (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppIconTextPlayButton (ref), fFlagLuaAppUpdatePlayButtonText (ref), play (ref), getFFlagIsSquadEnabled (ref), robux (ref), unavailable (ref), roactModule (ref), comboButton (ref), truncationCollapse (ref), button (ref), fFlagLuaAppPlayLoadingClickTelemetryMobile (ref), reactModule (ref), getFFlagUIBloxUseFoundationButton (ref), fFlagLuaAppPlayButtonOptOutFoundationButton (ref)
	local size = p1.props.Size
	local layoutOrder = p1.props.LayoutOrder
	local price = p1.props.price
	local playButtonState = p1.props.playButtonState
	local onPlayButtonActivated = p1.props.onPlayButtonActivated
	local onPlaySquadButtonActivated = p1.props.onPlaySquadButtonActivated
	local var1 = false
	local var2 = false
	local var3 = if fFlagLuaAppEnablePlaySquadButton then false else nil
	local var4 = if fFlagLuaAppEnablePlaySquadButton then false else nil
	local secondary = nil
	local var5 = nil
	local unavailable_1 = nil
	
	if playButtonState == playButtonStatesModule.Loading then
		secondary = if fFlagLuaAppPlayButtonLoadingPrimary then buttonType.PrimaryContextual else buttonType.Secondary
		var1 = true
	elseif playButtonState == playButtonStatesModule.Playable then
		secondary = buttonType.PrimaryContextual
		
		if fFlagLuaAppTextOnlyPlayButton or fFlagLuaAppIconTextPlayButton then
			unavailable_1 = if fFlagLuaAppUpdatePlayButtonText then p2.play else p2.join
		end
		if not fFlagLuaAppTextOnlyPlayButton then
			var5 = play
		end
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.PlayableWithParty then
		var5 = play
		unavailable_1 = p2.joinWithParty
		var3 = true
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.WaitingForParty then
		var5 = play
		unavailable_1 = p2.waitingForParty
		var2 = true
		var4 = true
		var3 = true
	elseif playButtonState == playButtonStatesModule.PaidAccess then
		secondary = buttonType.PrimaryContextual
		var5 = robux
		unavailable_1 = tostring(price)
	elseif playButtonState == playButtonStatesModule.FiatPaidAccess then
		secondary = buttonType.PrimaryContextual
		unavailable_1 = p1.props.localizedFiatPrice
	elseif playButtonState == playButtonStatesModule.DemoMode then
		secondary = buttonType.PrimarySystem
		unavailable_1 = p2.playDemo
	elseif playButtonState == playButtonStatesModule.ActionNeeded then
		secondary = buttonType.PrimaryContextual
		unavailable_1 = p2.unlock
	elseif playButtonState == playButtonStatesModule.UnplayableOther then
		secondary = buttonType.Secondary
		var5 = unavailable
		unavailable_1 = p2.unavailable
		var2 = true
	else
		error("invalid play button state!")
	end
	if fFlagLuaAppEnablePlaySquadButton and var3 then
		return roactModule.createElement(comboButton, {
			layoutOrder = layoutOrder,
			size = size,
			button = {
				icon = var5,
				text = unavailable_1,
				isDisabled = var2,
				onActivated = if not var2 then onPlayButtonActivated else function() end
			},
			overflow = {
				icon = truncationCollapse,
				isDisabled = var4,
				onActivated = if not var4 then onPlaySquadButtonActivated else function() end
			},
			testId = p1.props.testId
		})
	end
	local createElement = roactModule.createElement
	createElement = createElement(button, {
		size = if fFlagLuaAppPlayLoadingClickTelemetryMobile then UDim2.fromScale(1, 1) else size,
		layoutOrder = layoutOrder,
		isLoading = var1,
		icon = var5,
		text = unavailable_1,
		buttonType = secondary,
		userInteractionEnabled = not var2,
		isDisabled = var2,
		onActivated = if not var2 then onPlayButtonActivated else function() end,
		[reactModule.Tag] = if p1.props.testId then `data-testid={p1.props.testId}` else nil,
		DO_NOT_USE_useUIBloxButton = if getFFlagUIBloxUseFoundationButton() or fFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
	})
	
	return if fFlagLuaAppPlayLoadingClickTelemetryMobile then roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = size,
		LayoutOrder = layoutOrder
	}, {
		PlayButton = createElement,
		LoadingTelemetryClickCatcher = if var1 then roactModule.createElement("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 2,
			[roactModule.Event.Activated] = onPlayButtonActivated
		}) else nil
	}) else createElement
end

function playButton.render(p1)
	-- upvalues: withLocalization (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppIconTextPlayButton (ref), fFlagLuaAppUpdatePlayButtonText (ref)
	return withLocalization({
		join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		unlock = "Feature.ExperienceDetails.PlayButtonText.Unlock",
		joinWithParty = "Feature.Squads.Action.JoinWithParty",
		unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		waitingForParty = "Feature.Squads.Action.WaitingForParty",
		playDemo = "Feature.ExperienceDetails.PlayButtonText.PlayDemo",
		play = if (fFlagLuaAppTextOnlyPlayButton or fFlagLuaAppIconTextPlayButton) and fFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else nil
	})(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithLocalization(p2)
	end)
end

return playButton