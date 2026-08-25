local parent = script:FindFirstAncestor("GamePlayButton").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppUseTokenHeightForPlayButton = sharedFlagsModule.FFlagLuaAppUseTokenHeightForPlayButton
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local buttonHeightSizeKeyByInputSizeModule = require(script.Parent.ButtonHeightSizeKeyByInputSize)
local playButtonViewModule = require(script.Parent.PlayButtonView)

local var5 = function() end

local function makePlayButtonProps(p0, p1, p2, p3, p4, p5, p6, p7)
	return {
		playButtonState = p1,
		gameProductInfo = p0.gameProductInfo,
		localized = p0.localized,
		tokens = p0.tokens,
		hasJoinTextPlayableButtonIxp = p0.hasJoinTextPlayableButtonIxp,
		hasIconPlayButtonIxp = p0.hasIconPlayButtonIxp,
		hasPlayButtonLoadingSkeletonIxp = p0.hasPlayButtonLoadingSkeletonIxp,
		onPlayButtonActivated = p2,
		onPlaySquadButtonActivated = p0.onPlaySquadButtonActivated,
		playButtonCaptureRef = p3,
		loadingCaptureRef = p4,
		shouldLaunchWhenLoading = p0.shouldLaunchWhenLoading,
		shouldLaunchOnReleaseAfterUnmount = p0.shouldLaunchOnReleaseAfterUnmount,
		squadButtonMenuDirection = p0.squadButtonMenuDirection,
		playableText = p0.playableText,
		fiatText = p0.fiatText,
		hidePlayableIcon = p0.hidePlayableIcon,
		hideOptionalText = p0.hideOptionalText,
		buttonSize = p0.buttonSize,
		fillBehavior = p5,
		useUIBloxButton = p0.useUIBloxButton,
		hideIfUnplayable = p0.hideIfUnplayable,
		hideIfLoading = p0.hideIfLoading,
		LayoutOrder = p6,
		testId = p7
	}
end

return reactModule.memo(function(p8)
	-- upvalues: inputSize (ref), fFlagLuaAppUseTokenHeightForPlayButton (ref), buttonHeightSizeKeyByInputSizeModule (ref), fillBehavior (ref), reactModule (ref), fFlagSduiExperienceDetailsSupport (ref), playButtonViewModule (ref), makePlayButtonProps (ref), var5 (ref)
	local tokens = p8.tokens
	local buttonSize = p8.buttonSize or inputSize.Medium
	local var8 = 0
	
	if fFlagLuaAppUseTokenHeightForPlayButton then
		local var9 = buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"
		var8 = if tokens and tokens.Size[var9] then tokens.Size[var9] else 40
	end
	local var10 = if tokens then tokens.Gap.Small else 8
	local width = p8.width
	
	if p8.expandWidthForSecondaryPlayButton and p8.secondaryPlayButtonState ~= nil and width ~= nil then
		width = UDim.new(width.Scale * 2, width.Offset * 2 + var10)
	end
	local var17
	local var11 = if width then fillBehavior.Fill else p8.fillBehavior
	local var12 = if p8.secondaryPlayButtonState == nil and width == nil then var11 elseif var11 == "Fill" then fillBehavior.Fill else fillBehavior.Fit
	local var13 = if p8.testId then `{p8.testId}--secondary` else nil
	local createElement = reactModule.createElement
	local var14 = "Frame"
	local t = {
		LayoutOrder = p8.LayoutOrder,
		Position = p8.Position,
		Size = if fFlagLuaAppUseTokenHeightForPlayButton then UDim2.new(width or (if var11 == "Fill" then UDim.new(1, 0) else UDim.new(0, 0)), UDim.new(0, var8)) elseif width then UDim2.new(width, UDim.new(0, 0)) elseif var11 == "Fill" then UDim2.new(1, 0, 1, 0) else nil,
		AutomaticSize = if fFlagLuaAppUseTokenHeightForPlayButton then if var11 == "Fill" then nil else Enum.AutomaticSize.X elseif var11 == "Fill" then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Tag] = if fFlagSduiExperienceDetailsSupport then p8.tag else nil
	}
	local t_1 = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalFlex = if var11 == "Fill" then Enum.UIFlexAlignment.Fill else Enum.UIFlexAlignment.None,
			Padding = UDim.new(0, var10),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		PlayButton = reactModule.createElement(playButtonViewModule, makePlayButtonProps(p8, p8.playButtonState, p8.onPlayButtonActivated, p8.playButtonCaptureRef, p8.loadingCaptureRef, var12, 1, p8.testId))
	}
	
	if p8.secondaryPlayButtonState then
		var17 = reactModule.createElement
		var17 = var17(playButtonViewModule, makePlayButtonProps(p8, p8.secondaryPlayButtonState, p8.onSecondaryPlayButtonActivated or var5, nil, nil, var12, 2, var13))
	else
		var17 = nil
	end
	t_1.SecondaryPlayButton = var17
	
	return createElement(var14, t, t_1)
end)