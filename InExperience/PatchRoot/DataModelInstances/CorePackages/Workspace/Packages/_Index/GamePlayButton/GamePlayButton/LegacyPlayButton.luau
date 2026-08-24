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
local fFlagLuaAppDemoModePlayButton = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButton
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

function playButton.renderWithLocalization(p0, p1)
	-- upvalues: fFlagLuaAppEnablePlaySquadButton (ref), playButtonStatesModule (ref), fFlagLuaAppPlayButtonLoadingPrimary (ref), buttonType (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppIconTextPlayButton (ref), fFlagLuaAppUpdatePlayButtonText (ref), play (ref), getFFlagIsSquadEnabled (ref), robux (ref), fFlagLuaAppDemoModePlayButton (ref), unavailable (ref), roactModule (ref), comboButton (ref), truncationCollapse (ref), button (ref), fFlagLuaAppPlayLoadingClickTelemetryMobile (ref), reactModule (ref), getFFlagUIBloxUseFoundationButton (ref), fFlagLuaAppPlayButtonOptOutFoundationButton (ref)
	local size = p0.props.Size
	local layoutOrder = p0.props.LayoutOrder
	local price = p0.props.price
	local playButtonState = p0.props.playButtonState
	local onPlayButtonActivated = p0.props.onPlayButtonActivated
	local onPlaySquadButtonActivated = p0.props.onPlaySquadButtonActivated
	local var6 = false
	local var7 = false
	local var8 = if fFlagLuaAppEnablePlaySquadButton then false else nil
	local var9 = if fFlagLuaAppEnablePlaySquadButton then false else nil
	local secondary = nil
	local var10 = nil
	local unavailable_1 = nil
	
	if playButtonState == playButtonStatesModule.Loading then
		secondary = if fFlagLuaAppPlayButtonLoadingPrimary then buttonType.PrimaryContextual else buttonType.Secondary
		var6 = true
	elseif playButtonState == playButtonStatesModule.Playable then
		secondary = buttonType.PrimaryContextual
		
		if fFlagLuaAppTextOnlyPlayButton or fFlagLuaAppIconTextPlayButton then
			unavailable_1 = if fFlagLuaAppUpdatePlayButtonText then p1.play else p1.join
		end
		if not fFlagLuaAppTextOnlyPlayButton then
			var10 = play
		end
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.PlayableWithParty then
		var10 = play
		unavailable_1 = p1.joinWithParty
		var8 = true
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.WaitingForParty then
		var10 = play
		unavailable_1 = p1.waitingForParty
		var7 = true
		var9 = true
		var8 = true
	elseif playButtonState == playButtonStatesModule.PaidAccess then
		secondary = buttonType.PrimaryContextual
		var10 = robux
		unavailable_1 = tostring(price)
	elseif playButtonState == playButtonStatesModule.FiatPaidAccess then
		secondary = buttonType.PrimaryContextual
		unavailable_1 = p0.props.localizedFiatPrice
	elseif fFlagLuaAppDemoModePlayButton and playButtonState == playButtonStatesModule.DemoMode then
		secondary = buttonType.PrimarySystem
		unavailable_1 = p1.playDemo
	elseif playButtonState == playButtonStatesModule.ActionNeeded then
		secondary = buttonType.PrimaryContextual
		unavailable_1 = p1.unlock
	elseif playButtonState == playButtonStatesModule.UnplayableOther then
		secondary = buttonType.Secondary
		var10 = unavailable
		unavailable_1 = p1.unavailable
		var7 = true
	else
		error("invalid play button state!")
	end
	if fFlagLuaAppEnablePlaySquadButton and var8 then
		return roactModule.createElement(comboButton, {
			layoutOrder = layoutOrder,
			size = size,
			button = {
				icon = var10,
				text = unavailable_1,
				isDisabled = var7,
				onActivated = if not var7 then onPlayButtonActivated else function() end
			},
			overflow = {
				icon = truncationCollapse,
				isDisabled = var9,
				onActivated = if not var9 then onPlaySquadButtonActivated else function() end
			},
			testId = p0.props.testId
		})
	end
	local createElement = roactModule.createElement
	createElement = createElement(button, {
		size = if fFlagLuaAppPlayLoadingClickTelemetryMobile then UDim2.fromScale(1, 1) else size,
		layoutOrder = layoutOrder,
		isLoading = var6,
		icon = var10,
		text = unavailable_1,
		buttonType = secondary,
		userInteractionEnabled = not var7,
		isDisabled = var7,
		onActivated = if not var7 then onPlayButtonActivated else function() end,
		[reactModule.Tag] = if p0.props.testId then `data-testid={p0.props.testId}` else nil,
		DO_NOT_USE_useUIBloxButton = if getFFlagUIBloxUseFoundationButton() or fFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
	})
	
	return if fFlagLuaAppPlayLoadingClickTelemetryMobile then roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = size,
		LayoutOrder = layoutOrder
	}, {
		PlayButton = createElement,
		LoadingTelemetryClickCatcher = if var6 then roactModule.createElement("TextButton", {
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

function playButton.render(p2)
	-- upvalues: withLocalization (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppIconTextPlayButton (ref), fFlagLuaAppUpdatePlayButtonText (ref), fFlagLuaAppDemoModePlayButton (ref)
	return withLocalization({
		join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		unlock = "Feature.ExperienceDetails.PlayButtonText.Unlock",
		joinWithParty = "Feature.Squads.Action.JoinWithParty",
		unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		waitingForParty = "Feature.Squads.Action.WaitingForParty",
		play = if (fFlagLuaAppTextOnlyPlayButton or fFlagLuaAppIconTextPlayButton) and fFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else nil,
		playDemo = if fFlagLuaAppDemoModePlayButton then "Feature.ExperienceDetails.PlayButtonText.PlayDemo" else nil
	})(function(p3)
		-- upvalues: p2 (ref)
		return p2:renderWithLocalization(p3)
	end)
end

return playButton