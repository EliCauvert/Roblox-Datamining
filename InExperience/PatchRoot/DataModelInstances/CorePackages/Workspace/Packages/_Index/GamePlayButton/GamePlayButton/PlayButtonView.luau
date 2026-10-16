local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local CollectionService = game:GetService("CollectionService")
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ComboButton = UIBloxModule.App.Button.ComboButton
local Images = UIBloxModule.App.ImageSet.Images
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local FoundationModule = require(Parent.Foundation)
local Button1 = FoundationModule.Button
local IconButton = FoundationModule.IconButton
local Skeleton = FoundationModule.Skeleton
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local Radius = FoundationModule.Enums.Radius
local _ = require(Parent.GameProductInfoRodux)
local PlayButtonStatesModule = require(script.Parent.PlayButtonStates)
local EarlyAccessPlusTooltipModule = require(script.Parent.EarlyAccess.EarlyAccessPlusTooltip)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppPlayButtonPrivatePT = SharedFlagsModule.FFlagLuaAppPlayButtonPrivatePT
local GetFFlagIsSquadEnabledFunction = SharedFlagsModule.GetFFlagIsSquadEnabled
local FFlagLuaAppUnifyPlayButtonAllSurfacesIxp = SharedFlagsModule.FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local FFlagLuaAppJoinTextPlayableButton = SharedFlagsModule.FFlagLuaAppJoinTextPlayableButton
local FFlagLuaAppIconPlayButton = SharedFlagsModule.FFlagLuaAppIconPlayButton
local FFlagLuaAppPlayButtonLoadingSkeleton = SharedFlagsModule.FFlagLuaAppPlayButtonLoadingSkeleton
local FFlagLuaAppUnifiedPlayButtonSquadMenuDirection = SharedFlagsModule.FFlagLuaAppUnifiedPlayButtonSquadMenuDirection
local GetFFlagUIBloxUseFoundationButtonFunction = SharedFlagsModule.UIBlox.GetFFlagUIBloxUseFoundationButton
local FFlagLuaAppPlayButtonOptOutFoundationButton = SharedFlagsModule.FFlagLuaAppPlayButtonOptOutFoundationButton
local FFlagLuaAppMediaGalleryGamepadSupport = SharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
local FFlagLuaAppTextOnlyPlayButton = SharedFlagsModule.FFlagLuaAppTextOnlyPlayButton
local FFlagLuaAppIconTextPlayButton = SharedFlagsModule.FFlagLuaAppIconTextPlayButton
local FFlagLuaAppUpdatePlayButtonText = SharedFlagsModule.FFlagLuaAppUpdatePlayButtonText
local FFlagLuaAppUseTokenHeightForPlayButton = SharedFlagsModule.FFlagLuaAppUseTokenHeightForPlayButton
local FFlagEnableGameJoinEarlyAccess = SharedFlagsModule.FFlagEnableGameJoinEarlyAccess
local PlayXlarge = if FFlagLuaAppIconPlayButton then "play-xlarge" else nil
local IconsCommonPlay = Images["icons/common/play"]
local IconsActionsTruncationCollapse = Images["icons/actions/truncationCollapse"]
local IconsActionsTruncationExpand = Images["icons/actions/truncationExpand"]

local function v38() --[[ Line: 58 ]] end

local ButtonHeightSizeKeyByInputSizeModule = require(script.Parent.ButtonHeightSizeKeyByInputSize)

return ReactModule.memo(function(Frame) --[[ Line: 112 | Named "PlayButtonView" ]]
	-- upvalues: FFlagEnableGameJoinEarlyAccess (copy), ReactModule (copy), EarlyAccessPlusTooltipModule (copy), FFlagLuaAppMediaGalleryGamepadSupport (copy), CollectionService (copy), InputSize (copy), FFlagLuaAppUseTokenHeightForPlayButton (copy), ButtonHeightSizeKeyByInputSizeModule (copy), FillBehavior (copy), PlayButtonStatesModule (copy), FFlagLuaAppPlayButtonLoadingSkeleton (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), Skeleton (copy), Radius (copy), ButtonVariant (copy), FFlagLuaAppIconTextPlayButton (copy), FFlagLuaAppTextOnlyPlayButton (copy), FFlagLuaAppJoinTextPlayableButton (copy), FFlagLuaAppUpdatePlayButtonText (copy), PlayXlarge (copy), FFlagLuaAppIconPlayButton (copy), GetFFlagIsSquadEnabledFunction (copy), IconsCommonPlay (copy), FFlagLuaAppPlayButtonPrivatePT (copy), ComboButton (copy), FFlagLuaAppUnifiedPlayButtonSquadMenuDirection (copy), MenuDirection (copy), IconsActionsTruncationExpand (copy), IconsActionsTruncationCollapse (copy), ButtonType (copy), Images (copy), Button (copy), v38 (copy), GetFFlagUIBloxUseFoundationButtonFunction (copy), FFlagLuaAppPlayButtonOptOutFoundationButton (copy), IconButton (copy), Button1 (copy)
	local Tokens = Frame.tokens
	local PlayButtonState = Frame.playButtonState
	local Localized = Frame.localized
	local IsShowEarlyAccessTooltip = false
	local Element = nil
	local v1 = nil
	local OnPlayButtonActivated: () -> () = Frame.onPlayButtonActivated
	
	if FFlagEnableGameJoinEarlyAccess then
		IsShowEarlyAccessTooltip = Frame.showEarlyAccessTooltip == true
		local UseStateResult, UseStateResult2 = ReactModule.useState(IsShowEarlyAccessTooltip)
		local UseRefResult = ReactModule.useRef(nil)
		v1 = UseRefResult
		
		if IsShowEarlyAccessTooltip then
			OnPlayButtonActivated = function() --[[ Line: 128 ]]
				-- upvalues: UseStateResult2 (copy), Frame (copy)
				UseStateResult2(false)
				Frame.onPlayButtonActivated()
			end
			
			Element = ReactModule.createElement(EarlyAccessPlusTooltipModule, {
				isOpen = UseStateResult,
				onRequestClose = function() --[[ Line: 134 ]]
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(false)
				end,
				anchorRef = UseRefResult
			})
		end
	end
	local UseResult = nil
	
	if FFlagLuaAppMediaGalleryGamepadSupport then
		local Tag = Frame.tag
		local PlayButtonCaptureRefFunction = Frame.playButtonCaptureRef
		local UseRefResult = ReactModule.useRef(nil)
		UseResult = ReactModule.useCallback(function(Current) --[[ Line: 148 ]]
			-- upvalues: UseRefResult (copy), Tag (copy), CollectionService (upval), PlayButtonCaptureRefFunction (copy)
			local Current1 = UseRefResult.current
			
			if Current1 ~= nil and Current1 ~= Current and Tag ~= nil then
				CollectionService:RemoveTag(Current1, Tag)
			end
			UseRefResult.current = Current
			
			if Tag ~= nil and Current ~= nil then
				CollectionService:AddTag(Current, Tag)
			end
			if type(PlayButtonCaptureRefFunction) == "function" then
				PlayButtonCaptureRefFunction(Current)
				
				return
			end
			if PlayButtonCaptureRefFunction ~= nil then
				PlayButtonCaptureRefFunction.current = Current
			end
		end, { Tag, PlayButtonCaptureRefFunction })
	end
	local Flag = false
	local IsDisabled = false
	local IsDisabled1 = false
	local ButtonSize = Frame.buttonSize or InputSize.Medium
	local Offset1 = nil
	
	if FFlagLuaAppUseTokenHeightForPlayButton then
		local ButtonHeightSizeKeyByInputSizeModuleEntry = ButtonHeightSizeKeyByInputSizeModule[ButtonSize] or "Size_1000"
		Offset1 = if Tokens and Tokens.Size[ButtonHeightSizeKeyByInputSizeModuleEntry] then Tokens.Size[ButtonHeightSizeKeyByInputSizeModuleEntry] else 40
	end
	local Fill = if Frame.width then FillBehavior.Fill else Frame.fillBehavior
	local Emphasis = nil
	local Icon = nil
	local Text = nil
	local TextButton = nil
	local XScale: UDim? = nil
	local IsEarlyAccessPending: boolean = FFlagEnableGameJoinEarlyAccess and (PlayButtonState == PlayButtonStatesModule.EarlyAccessLocked and Frame.earlyAccessPending == true)
	
	if PlayButtonState == PlayButtonStatesModule.Loading then
		if Frame.hideIfLoading then
			return nil
		end
		if FFlagLuaAppPlayButtonLoadingSkeleton and (not Frame.useUIBloxButton and (not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or Frame.hasPlayButtonLoadingSkeletonIxp)) then
			local Offset = nil
			if FFlagLuaAppUseTokenHeightForPlayButton then
				Offset = Offset1
			else
				local ButtonHeightSizeKeyByInputSizeModuleEntry = ButtonHeightSizeKeyByInputSizeModule[ButtonSize] or "Size_1000"
				Offset = Tokens and Tokens.Size[ButtonHeightSizeKeyByInputSizeModuleEntry]
			end
			XScale = if Fill == "Fill" then UDim.new(1, 0) else UDim.new(0, Offset)
			local _UDim2 = UDim2.new(XScale, UDim.new(0, Offset))
			local FFlagLuaAppUnifyPlayButtonAllSurfacesIxp1 = FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or (Frame.shouldLaunchWhenLoading or Frame.shouldLaunchOnReleaseAfterUnmount)
			local Element1 = ReactModule.createElement(Skeleton, {
				ZIndex = 2,
				Size = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp1 then UDim2.fromScale(1, 1) else _UDim2,
				radius = Radius.Medium
			})
			TextButton = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp1 then ReactModule.createElement("TextButton", {
				Size = _UDim2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 2,
				ref = Frame.loadingCaptureRef,
				[ReactModule.Event.Activated] = Frame.onPlayButtonActivated
			}, { Skeleton = Element1 }) else Element1
			IsDisabled1 = true
		end
		Emphasis = ButtonVariant.Emphasis
	elseif PlayButtonState == PlayButtonStatesModule.Playable then
		Emphasis = ButtonVariant.Emphasis
		
		if FFlagLuaAppIconTextPlayButton or (FFlagLuaAppTextOnlyPlayButton or FFlagLuaAppJoinTextPlayableButton and (not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or Frame.hasJoinTextPlayableButtonIxp)) then
			Text = Frame.playableText or (if FFlagLuaAppUpdatePlayButtonText then Localized.play else Localized.join)
			
			if FFlagLuaAppIconTextPlayButton and not Frame.hidePlayableIcon then
				Icon = PlayXlarge
			end
		else
			if not FFlagLuaAppIconPlayButton and not Frame.hidePlayableIcon then
				Icon = "icons/common/play"
			end
			Text = Frame.playableText
			
			if FFlagLuaAppIconPlayButton and not Frame.hidePlayableIcon then
				Icon = if Text and Text ~= "" then "icons/common/play" else PlayXlarge
			end
		end
	elseif GetFFlagIsSquadEnabledFunction() and PlayButtonState == PlayButtonStatesModule.PlayableWithParty then
		Icon = IconsCommonPlay
		Text = if Frame.hideOptionalText then nil else Localized.joinWithParty
		Flag = true
	elseif GetFFlagIsSquadEnabledFunction() and PlayButtonState == PlayButtonStatesModule.WaitingForParty then
		Icon = IconsCommonPlay
		Text = if Frame.hideOptionalText then nil else Localized.waitingForParty
		IsDisabled1 = true
		IsDisabled = true
		Flag = true
	elseif PlayButtonState == PlayButtonStatesModule.PaidAccess then
		Text = tostring(Frame.gameProductInfo and Frame.gameProductInfo.price or 0)
		Emphasis = ButtonVariant.Emphasis
		Icon = "icons/common/robux"
	elseif PlayButtonState == PlayButtonStatesModule.FiatPaidAccess then
		Emphasis = ButtonVariant.Emphasis
		local LocalizedFiatPrice = Frame.gameProductInfo and Frame.gameProductInfo.localizedFiatPrice or ""
		Text = Frame.fiatText or LocalizedFiatPrice
	elseif PlayButtonState == PlayButtonStatesModule.DemoMode then
		Emphasis = ButtonVariant.SubEmphasis
		Text = Localized.playDemo
	elseif FFlagLuaAppPlayButtonPrivatePT and PlayButtonState == PlayButtonStatesModule.Playtest then
		Emphasis = ButtonVariant.SubEmphasis
		Text = Localized.playtest
	elseif PlayButtonState == PlayButtonStatesModule.ActionNeeded then
		Emphasis = ButtonVariant.Emphasis
		Text = Localized.unlock
	elseif PlayButtonState == PlayButtonStatesModule.UnplayableOther then
		if Frame.hideIfUnplayable then
			return nil
		end
		Emphasis = ButtonVariant.Subtle
		Icon = "icons/status/unavailable"
		Text = if Frame.hideOptionalText then nil else Localized.unavailable
		IsDisabled1 = true
	elseif FFlagEnableGameJoinEarlyAccess and PlayButtonState == PlayButtonStatesModule.EarlyAccessLocked then
		Emphasis = ButtonVariant.Subtle
		Text = if IsEarlyAccessPending then nil else Frame.earlyAccessCaption or Localized.earlyAccess
		IsDisabled1 = true
	else
		error("invalid play button state!")
	end
	local Element2 = nil
	if Flag then
		if not FFlagLuaAppUseTokenHeightForPlayButton then
			local ButtonHeightSizeKeyByInputSizeModuleEntry = ButtonHeightSizeKeyByInputSizeModule[ButtonSize] or "Size_1000"
			Offset1 = if Tokens and Tokens.Size[ButtonHeightSizeKeyByInputSizeModuleEntry] then Tokens.Size[ButtonHeightSizeKeyByInputSizeModuleEntry] else 40
		end
		Element2 = ReactModule.createElement(ComboButton, {
			size = UDim2.new(1, 0, 0, Offset1),
			button = {
				icon = Icon,
				text = Text,
				isDisabled = IsDisabled1,
				onActivated = if IsDisabled1 then function() --[[ Line: 329 ]] end else OnPlayButtonActivated
			},
			overflow = {
				icon = if FFlagLuaAppUnifiedPlayButtonSquadMenuDirection and Frame.squadButtonMenuDirection == MenuDirection.Down then IconsActionsTruncationExpand else IconsActionsTruncationCollapse,
				isDisabled = IsDisabled,
				onActivated = if IsDisabled then function() --[[ Line: 337 ]] end else Frame.onPlaySquadButtonActivated
			},
			testId = Frame.testId
		})
	elseif Frame.useUIBloxButton then
		if not FFlagLuaAppUseTokenHeightForPlayButton then
			local ButtonHeightSizeKeyByInputSizeModuleEntry = ButtonHeightSizeKeyByInputSizeModule[ButtonSize] or "Size_1000"
			Offset1 = if Tokens and Tokens.Size[ButtonHeightSizeKeyByInputSizeModuleEntry] then Tokens.Size[ButtonHeightSizeKeyByInputSizeModuleEntry] else 40
		end
		local IsFit = Fill == "Fit"
		local _UDim2: UDim2 = if IsFit then UDim2.new(0, 0, 0, Offset1) else UDim2.new(1, 0, 0, Offset1)
		local IsPlayButtonStateMatch = PlayButtonState == PlayButtonStatesModule.Loading
		local PrimarySystem = if Emphasis == ButtonVariant.SubEmphasis then ButtonType.PrimarySystem elseif Emphasis == ButtonVariant.Subtle then ButtonType.Secondary else ButtonType.PrimaryContextual
		local IconsCommonPlay1 = if Icon == PlayXlarge then IconsCommonPlay else Icon
		
		if type(IconsCommonPlay1) == "string" then
			IconsCommonPlay1 = Images[IconsCommonPlay1]
		end
		Element2 = ReactModule.createElement(Button, {
			size = _UDim2,
			fitContent = IsFit,
			buttonType = PrimarySystem,
			icon = IconsCommonPlay1,
			text = Text,
			isLoading = IsPlayButtonStateMatch or IsEarlyAccessPending,
			isDisabled = IsDisabled1 or IsPlayButtonStateMatch,
			userInteractionEnabled = not (IsDisabled1 or IsPlayButtonStateMatch),
			onActivated = if IsDisabled1 or IsPlayButtonStateMatch then v38 else OnPlayButtonActivated,
			ref = if FFlagLuaAppMediaGalleryGamepadSupport then UseResult else Frame.playButtonCaptureRef,
			[ReactModule.Tag] = if Frame.testId then `data-testid={Frame.testId}` else nil,
			DO_NOT_USE_useUIBloxButton = if GetFFlagUIBloxUseFoundationButtonFunction() or FFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
		})
		
		if (FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or Frame.shouldLaunchWhenLoading or Frame.shouldLaunchOnReleaseAfterUnmount) and IsPlayButtonStateMatch then
			TextButton = ReactModule.createElement("TextButton", {
				Size = _UDim2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 2,
				ref = Frame.loadingCaptureRef,
				[ReactModule.Event.Activated] = Frame.onPlayButtonActivated
			})
		end
	else
		local HasIcon = if FFlagLuaAppIconPlayButton then if Text == nil then Icon ~= nil else Text == "" and Icon ~= nil else nil
		Element2 = if FFlagLuaAppIconPlayButton and (not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or Frame.hasIconPlayButtonIxp) and HasIcon then ReactModule.createElement(IconButton, {
			icon = Icon,
			variant = Emphasis,
			size = ButtonSize,
			width = if FFlagLuaAppPlayButtonLoadingSkeleton and PlayButtonState == PlayButtonStatesModule.Loading then XScale else nil,
			fillBehavior = Fill,
			isDisabled = IsDisabled1,
			onActivated = if IsDisabled1 then v38 else OnPlayButtonActivated,
			ref = if FFlagLuaAppMediaGalleryGamepadSupport then UseResult else Frame.playButtonCaptureRef,
			testId = Frame.testId
		}) else ReactModule.createElement(Button1, {
			icon = Icon,
			text = Text,
			variant = Emphasis,
			size = ButtonSize,
			width = if FFlagLuaAppPlayButtonLoadingSkeleton and PlayButtonState == PlayButtonStatesModule.Loading then XScale else nil,
			fillBehavior = Fill,
			isLoading = if IsEarlyAccessPending then true else nil,
			isDisabled = IsDisabled1,
			onActivated = if IsDisabled1 then v38 else OnPlayButtonActivated,
			ref = if FFlagLuaAppMediaGalleryGamepadSupport then UseResult else Frame.playButtonCaptureRef,
			testId = Frame.testId
		})
	end
	return ReactModule.createElement("Frame", {
		ref = if FFlagEnableGameJoinEarlyAccess and IsShowEarlyAccessTooltip then v1 else nil,
		LayoutOrder = Frame.LayoutOrder,
		Position = Frame.Position,
		Size = if FFlagLuaAppUseTokenHeightForPlayButton then UDim2.new(if Frame.width then Frame.width elseif Fill == "Fill" then UDim.new(1, 0) else UDim.new(0, 0), UDim.new(0, Offset1)) elseif Frame.width then UDim2.new(Frame.width, UDim.new(0, 0)) elseif Fill == "Fill" then UDim2.new(1, 0, 1, 0) else nil,
		AutomaticSize = if FFlagLuaAppUseTokenHeightForPlayButton then if Fill == "Fill" then nil else Enum.AutomaticSize.X elseif Fill == "Fill" then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[ReactModule.Tag] = if FFlagLuaAppMediaGalleryGamepadSupport then nil else Frame.tag
	}, {
		LoadingSkeleton = if PlayButtonState == PlayButtonStatesModule.Loading then TextButton else nil,
		PlayButton = Element2,
		EarlyAccessTooltip = if FFlagEnableGameJoinEarlyAccess then Element else nil
	})
end)