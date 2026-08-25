local parent = script:FindFirstAncestor("GamePlayButton").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local comboButton = UIBloxModule.App.Button.ComboButton
local images = UIBloxModule.App.ImageSet.Images
local menuDirection = UIBloxModule.App.Menu.MenuDirection
local foundationModule = require(parent.Foundation)
local button_1 = foundationModule.Button
local iconButton = foundationModule.IconButton
local skeleton = foundationModule.Skeleton
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius
local _ = require(parent.GameProductInfoRodux)
local playButtonStatesModule = require(script.Parent.PlayButtonStates)
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagIsSquadEnabled = sharedFlagsModule.GetFFlagIsSquadEnabled
local fFlagLuaAppUnifyPlayButtonAllSurfacesIxp = sharedFlagsModule.FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local fFlagLuaAppJoinTextPlayableButton = sharedFlagsModule.FFlagLuaAppJoinTextPlayableButton
local fFlagLuaAppIconPlayButton = sharedFlagsModule.FFlagLuaAppIconPlayButton
local fFlagLuaAppPlayButtonLoadingSkeleton = sharedFlagsModule.FFlagLuaAppPlayButtonLoadingSkeleton
local fFlagLuaAppUnifiedPlayButtonSquadMenuDirection = sharedFlagsModule.FFlagLuaAppUnifiedPlayButtonSquadMenuDirection
local getFFlagUIBloxUseFoundationButton = sharedFlagsModule.UIBlox.GetFFlagUIBloxUseFoundationButton
local fFlagLuaAppPlayButtonOptOutFoundationButton = sharedFlagsModule.FFlagLuaAppPlayButtonOptOutFoundationButton
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagLuaAppTextOnlyPlayButton = sharedFlagsModule.FFlagLuaAppTextOnlyPlayButton
local fFlagLuaAppIconTextPlayButton = sharedFlagsModule.FFlagLuaAppIconTextPlayButton
local fFlagLuaAppUpdatePlayButtonText = sharedFlagsModule.FFlagLuaAppUpdatePlayButtonText
local fFlagLuaAppUseTokenHeightForPlayButton = sharedFlagsModule.FFlagLuaAppUseTokenHeightForPlayButton
local var5 = if fFlagLuaAppIconPlayButton then "play-xlarge" else nil
local play = images["icons/common/play"]
local truncationCollapse = images["icons/actions/truncationCollapse"]
local truncationExpand = images["icons/actions/truncationExpand"]

local var6 = function() end

local buttonHeightSizeKeyByInputSizeModule = require(script.Parent.ButtonHeightSizeKeyByInputSize)

return reactModule.memo(function(p0)
	-- upvalues: inputSize (ref), fFlagLuaAppUseTokenHeightForPlayButton (ref), buttonHeightSizeKeyByInputSizeModule (ref), fillBehavior (ref), playButtonStatesModule (ref), fFlagLuaAppPlayButtonLoadingSkeleton (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), reactModule (ref), skeleton (ref), radius (ref), buttonVariant (ref), fFlagLuaAppIconTextPlayButton (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppJoinTextPlayableButton (ref), fFlagLuaAppUpdatePlayButtonText (ref), var5 (ref), fFlagLuaAppIconPlayButton (ref), getFFlagIsSquadEnabled (ref), play (ref), comboButton (ref), fFlagLuaAppUnifiedPlayButtonSquadMenuDirection (ref), menuDirection (ref), truncationExpand (ref), truncationCollapse (ref), buttonType (ref), images (ref), button (ref), var6 (ref), getFFlagUIBloxUseFoundationButton (ref), fFlagLuaAppPlayButtonOptOutFoundationButton (ref), iconButton (ref), button_1 (ref), fFlagSduiExperienceDetailsSupport (ref)
	local tokens = p0.tokens
	local playButtonState = p0.playButtonState
	local localized = p0.localized
	local var8 = false
	local var9 = false
	local var10 = false
	local buttonSize = p0.buttonSize or inputSize.Medium
	local var12 = nil
	
	if fFlagLuaAppUseTokenHeightForPlayButton then
		local var13 = buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"
		var12 = if tokens and tokens.Size[var13] then tokens.Size[var13] else 40
	end
	local var14 = if p0.width then fillBehavior.Fill else p0.fillBehavior
	local subtle = nil
	local var15 = nil
	local var16 = nil
	local textButton = nil
	local var18 = nil
	
	if playButtonState == playButtonStatesModule.Loading then
		if p0.hideIfLoading then
			return nil
		elseif fFlagLuaAppPlayButtonLoadingSkeleton and (not p0.useUIBloxButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p0.hasPlayButtonLoadingSkeletonIxp)) then
			local _ = nil
			local var19 = if fFlagLuaAppUseTokenHeightForPlayButton then var12 else tokens and tokens.Size[buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"]
			var18 = if var14 == "Fill" then UDim.new(1, 0) else UDim.new(0, var19)
			local uDim2 = UDim2.new(var18, UDim.new(0, var19))
			local fFlagLuaAppUnifyPlayButtonAllSurfacesIxp_1 = fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or (p0.shouldLaunchWhenLoading or p0.shouldLaunchOnReleaseAfterUnmount)
			local var22 = reactModule.createElement(skeleton, {
				ZIndex = 2,
				Size = if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp_1 then UDim2.fromScale(1, 1) else uDim2,
				radius = radius.Medium
			})
			textButton = if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp_1 then reactModule.createElement("TextButton", {
				Size = uDim2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 2,
				ref = p0.loadingCaptureRef,
				[reactModule.Event.Activated] = p0.onPlayButtonActivated
			}, { Skeleton = var22 }) else var22
			var10 = true
		end
		subtle = buttonVariant.Emphasis
	elseif playButtonState == playButtonStatesModule.Playable then
		subtle = buttonVariant.Emphasis
		
		if fFlagLuaAppIconTextPlayButton or (fFlagLuaAppTextOnlyPlayButton or fFlagLuaAppJoinTextPlayableButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p0.hasJoinTextPlayableButtonIxp)) then
			var16 = p0.playableText or (if fFlagLuaAppUpdatePlayButtonText then localized.play else localized.join)
			
			if fFlagLuaAppIconTextPlayButton and not p0.hidePlayableIcon then
				var15 = var5
			end
		elseif not fFlagLuaAppIconPlayButton and not p0.hidePlayableIcon then
			var15 = "icons/common/play"
		end
		var16 = p0.playableText
		
		if fFlagLuaAppIconPlayButton and not p0.hidePlayableIcon then
			var15 = if var16 and var16 ~= "" then "icons/common/play" else var5
		end
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.PlayableWithParty then
		var15 = play
		var16 = if p0.hideOptionalText then nil else localized.joinWithParty
		var8 = true
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.WaitingForParty then
		var15 = play
		var16 = if p0.hideOptionalText then nil else localized.waitingForParty
		var10 = true
		var9 = true
		var8 = true
	elseif playButtonState == playButtonStatesModule.PaidAccess then
		var16 = tostring(if p0.gameProductInfo then p0.gameProductInfo.price else 0)
		subtle = buttonVariant.Emphasis
		var15 = "icons/common/robux"
	elseif playButtonState == playButtonStatesModule.FiatPaidAccess then
		subtle = buttonVariant.Emphasis
		var16 = p0.fiatText or (if p0.gameProductInfo then p0.gameProductInfo.localizedFiatPrice else "")
	elseif playButtonState == playButtonStatesModule.DemoMode then
		subtle = buttonVariant.SubEmphasis
		var16 = localized.playDemo
	elseif playButtonState == playButtonStatesModule.ActionNeeded then
		subtle = buttonVariant.Emphasis
		var16 = localized.unlock
	elseif playButtonState == playButtonStatesModule.UnplayableOther then
		if p0.hideIfUnplayable then
			return nil
		end
		subtle = buttonVariant.Subtle
		var15 = "icons/status/unavailable"
		var16 = if p0.hideOptionalText then nil else localized.unavailable
		var10 = true
	else
		error("invalid play button state!")
	end
	local var24, var31
	local _ = nil
	
	if var8 then
		if not fFlagLuaAppUseTokenHeightForPlayButton then
			local var23 = buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"
			var12 = if tokens and tokens.Size[var23] then tokens.Size[var23] else 40
		end
		var24 = reactModule.createElement(comboButton, {
			size = UDim2.new(1, 0, 0, var12),
			button = {
				icon = var15,
				text = var16,
				isDisabled = var10,
				onActivated = if not var10 then p0.onPlayButtonActivated else function() end
			},
			overflow = {
				icon = if fFlagLuaAppUnifiedPlayButtonSquadMenuDirection and p0.squadButtonMenuDirection == menuDirection.Down then truncationExpand else truncationCollapse,
				isDisabled = var9,
				onActivated = if not var9 then p0.onPlaySquadButtonActivated else function() end
			},
			testId = p0.testId
		})
	elseif p0.useUIBloxButton then
		if not fFlagLuaAppUseTokenHeightForPlayButton then
			local var25 = buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"
			var12 = if tokens and tokens.Size[var25] then tokens.Size[var25] else 40
		end
		local isFit = var14 == "Fit"
		local var27 = if isFit then UDim2.new(0, 0, 0, var12) else UDim2.new(1, 0, 0, var12)
		local var28 = playButtonState == playButtonStatesModule.Loading
		local var29 = if subtle == buttonVariant.SubEmphasis then buttonType.PrimarySystem elseif subtle == buttonVariant.Subtle then buttonType.Secondary else buttonType.PrimaryContextual
		local var30 = if var15 == var5 then play else var15
		
		if type(var30) == "string" then
			var30 = images[var30]
		end
		var24 = reactModule.createElement(button, {
			size = var27,
			fitContent = isFit,
			buttonType = var29,
			icon = var30,
			text = var16,
			isLoading = var28,
			isDisabled = var10 or var28,
			userInteractionEnabled = not (var10 or var28),
			onActivated = if var10 or var28 then var6 else p0.onPlayButtonActivated,
			ref = p0.playButtonCaptureRef,
			[reactModule.Tag] = if p0.testId then `data-testid={p0.testId}` else nil,
			DO_NOT_USE_useUIBloxButton = if getFFlagUIBloxUseFoundationButton() or fFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
		})
		
		if (fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p0.shouldLaunchWhenLoading or p0.shouldLaunchOnReleaseAfterUnmount) and var28 then
			textButton = reactModule.createElement("TextButton", {
				Size = var27,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 2,
				ref = p0.loadingCaptureRef,
				[reactModule.Event.Activated] = p0.onPlayButtonActivated
			})
		end
	elseif fFlagLuaAppIconPlayButton then
		if var16 ~= nil then
			var31 = false
			
			if var16 == "" then
				local _ = var15 ~= nil
			end
		end
	else
		var31 = nil
	end
	var24 = if fFlagLuaAppIconPlayButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p0.hasIconPlayButtonIxp) and var31 then reactModule.createElement(iconButton, {
		icon = var15,
		variant = subtle,
		size = buttonSize,
		width = if fFlagLuaAppPlayButtonLoadingSkeleton and playButtonState == playButtonStatesModule.Loading then var18 else nil,
		fillBehavior = var14,
		isDisabled = var10,
		onActivated = if not var10 then p0.onPlayButtonActivated else var6,
		ref = p0.playButtonCaptureRef,
		testId = p0.testId
	}) else reactModule.createElement(button_1, {
		icon = var15,
		text = var16,
		variant = subtle,
		size = buttonSize,
		width = if fFlagLuaAppPlayButtonLoadingSkeleton and playButtonState == playButtonStatesModule.Loading then var18 else nil,
		fillBehavior = var14,
		isDisabled = var10,
		onActivated = if not var10 then p0.onPlayButtonActivated else var6,
		ref = p0.playButtonCaptureRef,
		testId = p0.testId
	})
	return reactModule.createElement("Frame", {
		LayoutOrder = p0.LayoutOrder,
		Position = p0.Position,
		Size = if fFlagLuaAppUseTokenHeightForPlayButton then UDim2.new(if p0.width then p0.width elseif var14 == "Fill" then UDim.new(1, 0) else UDim.new(0, 0), UDim.new(0, var12)) elseif p0.width then UDim2.new(p0.width, UDim.new(0, 0)) elseif var14 == "Fill" then UDim2.new(1, 0, 1, 0) else nil,
		AutomaticSize = if fFlagLuaAppUseTokenHeightForPlayButton then if var14 == "Fill" then nil else Enum.AutomaticSize.X elseif var14 == "Fill" then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Tag] = if fFlagSduiExperienceDetailsSupport then p0.tag else nil
	}, {
		LoadingSkeleton = if playButtonState == playButtonStatesModule.Loading then textButton else nil,
		PlayButton = var24
	})
end)