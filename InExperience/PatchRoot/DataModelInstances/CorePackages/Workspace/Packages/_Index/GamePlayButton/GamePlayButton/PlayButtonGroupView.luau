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

local var1 = function() end

local function makePlayButtonProps(p1, p2, p3, p4, p5, p6, p7, p8)
	return {
		playButtonState = p2,
		gameProductInfo = p1.gameProductInfo,
		localized = p1.localized,
		tokens = p1.tokens,
		hasJoinTextPlayableButtonIxp = p1.hasJoinTextPlayableButtonIxp,
		hasIconPlayButtonIxp = p1.hasIconPlayButtonIxp,
		hasPlayButtonLoadingSkeletonIxp = p1.hasPlayButtonLoadingSkeletonIxp,
		onPlayButtonActivated = p3,
		onPlaySquadButtonActivated = p1.onPlaySquadButtonActivated,
		playButtonCaptureRef = p4,
		loadingCaptureRef = p5,
		shouldLaunchWhenLoading = p1.shouldLaunchWhenLoading,
		shouldLaunchOnReleaseAfterUnmount = p1.shouldLaunchOnReleaseAfterUnmount,
		squadButtonMenuDirection = p1.squadButtonMenuDirection,
		playableText = p1.playableText,
		fiatText = p1.fiatText,
		hidePlayableIcon = p1.hidePlayableIcon,
		hideOptionalText = p1.hideOptionalText,
		buttonSize = p1.buttonSize,
		fillBehavior = p6,
		useUIBloxButton = p1.useUIBloxButton,
		hideIfUnplayable = p1.hideIfUnplayable,
		hideIfLoading = p1.hideIfLoading,
		LayoutOrder = p7,
		testId = p8
	}
end

return reactModule.memo(function(p1)
	-- upvalues: inputSize (ref), fFlagLuaAppUseTokenHeightForPlayButton (ref), buttonHeightSizeKeyByInputSizeModule (ref), fillBehavior (ref), reactModule (ref), fFlagSduiExperienceDetailsSupport (ref), playButtonViewModule (ref), makePlayButtonProps (ref), var1 (ref)
	local tokens = p1.tokens
	local buttonSize = p1.buttonSize or inputSize.Medium
	local var2 = 0
	
	if fFlagLuaAppUseTokenHeightForPlayButton then
		local var3 = buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"
		var2 = if tokens and tokens.Size[var3] then tokens.Size[var3] else 40
	end
	local var4 = if tokens then tokens.Gap.Small else 8
	local width = p1.width
	
	if p1.expandWidthForSecondaryPlayButton and p1.secondaryPlayButtonState ~= nil and width ~= nil then
		width = UDim.new(width.Scale * 2, width.Offset * 2 + var4)
	end
	local var5
	local var6 = if width then fillBehavior.Fill else p1.fillBehavior
	local var7 = if p1.secondaryPlayButtonState == nil and width == nil then var6 elseif var6 == "Fill" then fillBehavior.Fill else fillBehavior.Fit
	local var8 = if p1.testId then `{p1.testId}--secondary` else nil
	local createElement = reactModule.createElement
	local var9 = "Frame"
	local t = {
		LayoutOrder = p1.LayoutOrder,
		Position = p1.Position,
		Size = if fFlagLuaAppUseTokenHeightForPlayButton then UDim2.new(width or (if var6 == "Fill" then UDim.new(1, 0) else UDim.new(0, 0)), UDim.new(0, var2)) elseif width then UDim2.new(width, UDim.new(0, 0)) elseif var6 == "Fill" then UDim2.new(1, 0, 1, 0) else nil,
		AutomaticSize = if fFlagLuaAppUseTokenHeightForPlayButton then if var6 == "Fill" then nil else Enum.AutomaticSize.X elseif var6 == "Fill" then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Tag] = if fFlagSduiExperienceDetailsSupport then p1.tag else nil
	}
	local t_1 = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalFlex = if var6 == "Fill" then Enum.UIFlexAlignment.Fill else Enum.UIFlexAlignment.None,
			Padding = UDim.new(0, var4),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		PlayButton = reactModule.createElement(playButtonViewModule, makePlayButtonProps(p1, p1.playButtonState, p1.onPlayButtonActivated, p1.playButtonCaptureRef, p1.loadingCaptureRef, var7, 1, p1.testId))
	}
	
	if p1.secondaryPlayButtonState then
		var5 = reactModule.createElement
		var5 = var5(playButtonViewModule, makePlayButtonProps(p1, p1.secondaryPlayButtonState, p1.onSecondaryPlayButtonActivated or var1, nil, nil, var7, 2, var8))
	else
		var5 = nil
	end
	t_1.SecondaryPlayButton = var5
	
	return createElement(var9, t, t_1)
end)