local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppUseTokenHeightForPlayButton = SharedFlagsModule.FFlagLuaAppUseTokenHeightForPlayButton
local FFlagLuaAppMediaGalleryGamepadSupport = SharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
local FFlagEnableGameJoinEarlyAccess = SharedFlagsModule.FFlagEnableGameJoinEarlyAccess
local ButtonHeightSizeKeyByInputSizeModule = require(script.Parent.ButtonHeightSizeKeyByInputSize)
local PlayButtonViewModule = require(script.Parent.PlayButtonView)

local function v11() --[[ Line: 21 ]] end

local function makePlayButtonProps(Frame, PlayButtonState, OnPlayButtonActivated, PlayButtonCaptureRef, LoadingCaptureRef, Fill, LayoutOrder, TestId, Tag, ShowEarlyAccessTooltip) --[[ Line: 29 ]]
	-- upvalues: FFlagEnableGameJoinEarlyAccess (copy)
	return {
		tag = Tag,
		showEarlyAccessTooltip = if FFlagEnableGameJoinEarlyAccess then ShowEarlyAccessTooltip else nil,
		playButtonState = PlayButtonState,
		gameProductInfo = Frame.gameProductInfo,
		localized = Frame.localized,
		tokens = Frame.tokens,
		hasJoinTextPlayableButtonIxp = Frame.hasJoinTextPlayableButtonIxp,
		hasIconPlayButtonIxp = Frame.hasIconPlayButtonIxp,
		hasPlayButtonLoadingSkeletonIxp = Frame.hasPlayButtonLoadingSkeletonIxp,
		onPlayButtonActivated = OnPlayButtonActivated,
		onPlaySquadButtonActivated = Frame.onPlaySquadButtonActivated,
		playButtonCaptureRef = PlayButtonCaptureRef,
		loadingCaptureRef = LoadingCaptureRef,
		shouldLaunchWhenLoading = Frame.shouldLaunchWhenLoading,
		shouldLaunchOnReleaseAfterUnmount = Frame.shouldLaunchOnReleaseAfterUnmount,
		squadButtonMenuDirection = Frame.squadButtonMenuDirection,
		playableText = Frame.playableText,
		fiatText = Frame.fiatText,
		earlyAccessCaption = if FFlagEnableGameJoinEarlyAccess then Frame.earlyAccessCaption else nil,
		earlyAccessPending = if FFlagEnableGameJoinEarlyAccess then Frame.earlyAccessPending else nil,
		hidePlayableIcon = Frame.hidePlayableIcon,
		hideOptionalText = Frame.hideOptionalText,
		buttonSize = Frame.buttonSize,
		fillBehavior = Fill,
		useUIBloxButton = Frame.useUIBloxButton,
		hideIfUnplayable = Frame.hideIfUnplayable,
		hideIfLoading = Frame.hideIfLoading,
		LayoutOrder = LayoutOrder,
		testId = TestId
	}
end

return ReactModule.memo(function(Frame) --[[ Line: 74 | Named "PlayButtonGroupView" ]]
	-- upvalues: InputSize (copy), FFlagLuaAppUseTokenHeightForPlayButton (copy), ButtonHeightSizeKeyByInputSizeModule (copy), FillBehavior (copy), ReactModule (copy), FFlagLuaAppMediaGalleryGamepadSupport (copy), PlayButtonViewModule (copy), makePlayButtonProps (copy), FFlagEnableGameJoinEarlyAccess (copy), SharedFlagsModule (copy), v11 (copy)
	local Tokens = Frame.tokens
	local ButtonSize = Frame.buttonSize or InputSize.Medium
	local Offset = 0
	
	if FFlagLuaAppUseTokenHeightForPlayButton then
		local ButtonHeightSizeKeyByInputSizeModuleEntry = ButtonHeightSizeKeyByInputSizeModule[ButtonSize] or "Size_1000"
		Offset = if Tokens and Tokens.Size[ButtonHeightSizeKeyByInputSizeModuleEntry] then Tokens.Size[ButtonHeightSizeKeyByInputSizeModuleEntry] else 40
	end
	local Small = if Tokens then Tokens.Gap.Small else 8
	local Width = Frame.width
	
	if Frame.expandWidthForSecondaryPlayButton and Frame.secondaryPlayButtonState ~= nil and Width ~= nil then
		Width = UDim.new(Width.Scale * 2, Width.Offset * 2 + Small)
	end
	local Fill = if Width then FillBehavior.Fill else Frame.fillBehavior
	local Fill1 = if Frame.secondaryPlayButtonState == nil and Width == nil then Fill elseif Fill == "Fill" then FillBehavior.Fill else FillBehavior.Fit
	local SecondaryName = if Frame.testId then `{Frame.testId}--secondary` else nil
	
	return ReactModule.createElement("Frame", {
		LayoutOrder = Frame.LayoutOrder,
		Position = Frame.Position,
		Size = if FFlagLuaAppUseTokenHeightForPlayButton then UDim2.new(if Width then Width elseif Fill == "Fill" then UDim.new(1, 0) else UDim.new(0, 0), UDim.new(0, Offset)) elseif Width then UDim2.new(Width, UDim.new(0, 0)) elseif Fill == "Fill" then UDim2.new(1, 0, 1, 0) else nil,
		AutomaticSize = if FFlagLuaAppUseTokenHeightForPlayButton then if Fill == "Fill" then nil else Enum.AutomaticSize.X elseif Fill == "Fill" then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[ReactModule.Tag] = if FFlagLuaAppMediaGalleryGamepadSupport then nil else Frame.tag
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalFlex = if Fill == "Fill" then Enum.UIFlexAlignment.Fill else Enum.UIFlexAlignment.None,
			Padding = UDim.new(0, Small),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		PlayButton = ReactModule.createElement(PlayButtonViewModule, (makePlayButtonProps(Frame, Frame.playButtonState, Frame.onPlayButtonActivated, Frame.playButtonCaptureRef, Frame.loadingCaptureRef, Fill1, 1, Frame.testId, if FFlagLuaAppMediaGalleryGamepadSupport then Frame.tag else nil, if FFlagEnableGameJoinEarlyAccess then Frame.showEarlyAccessTooltip else nil))),
		PopForcePicker = if SharedFlagsModule.FFlagDebugEnablePopForcePicker then ReactModule.createElement(require(script.Parent.PopForcePicker), { LayoutOrder = 3 }) else nil,
		SecondaryPlayButton = if Frame.secondaryPlayButtonState then ReactModule.createElement(PlayButtonViewModule, (makePlayButtonProps(Frame, Frame.secondaryPlayButtonState, Frame.onSecondaryPlayButtonActivated or v11, nil, nil, Fill1, 2, SecondaryName))) else nil
	})
end)