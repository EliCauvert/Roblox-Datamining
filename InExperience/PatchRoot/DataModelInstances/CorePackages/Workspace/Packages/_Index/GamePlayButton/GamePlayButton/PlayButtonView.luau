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
local fFlagLuaAppDemoModePlayButton = sharedFlagsModule.FFlagLuaAppDemoModePlayButton
local var1 = if fFlagLuaAppIconPlayButton then "play-xlarge" else nil
local play = images["icons/common/play"]
local truncationCollapse = images["icons/actions/truncationCollapse"]
local truncationExpand = images["icons/actions/truncationExpand"]

local var2 = function() end

local var3 = if fFlagLuaAppDemoModePlayButton then require(script.Parent.ButtonHeightSizeKeyByInputSize) else {
	[inputSize.XSmall] = "Size_600",
	[inputSize.Small] = "Size_800",
	[inputSize.Medium] = "Size_1000",
	[inputSize.Large] = "Size_1200"
}

return reactModule.memo(function(p1)
	-- upvalues: inputSize (ref), fFlagLuaAppUseTokenHeightForPlayButton (ref), var3 (ref), fillBehavior (ref), playButtonStatesModule (ref), fFlagLuaAppPlayButtonLoadingSkeleton (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), reactModule (ref), skeleton (ref), radius (ref), buttonVariant (ref), fFlagLuaAppIconTextPlayButton (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppJoinTextPlayableButton (ref), fFlagLuaAppUpdatePlayButtonText (ref), var1 (ref), fFlagLuaAppIconPlayButton (ref), getFFlagIsSquadEnabled (ref), play (ref), fFlagLuaAppDemoModePlayButton (ref), comboButton (ref), fFlagLuaAppUnifiedPlayButtonSquadMenuDirection (ref), menuDirection (ref), truncationExpand (ref), truncationCollapse (ref), buttonType (ref), images (ref), button (ref), var2 (ref), getFFlagUIBloxUseFoundationButton (ref), fFlagLuaAppPlayButtonOptOutFoundationButton (ref), iconButton (ref), button_1 (ref), fFlagSduiExperienceDetailsSupport (ref)
	local tokens = p1.tokens
	local playButtonState = p1.playButtonState
	local localized = p1.localized
	local var4 = false
	local var5 = false
	local var6 = false
	local buttonSize = p1.buttonSize or inputSize.Medium
	local var7 = nil
	
	if fFlagLuaAppUseTokenHeightForPlayButton then
		local var8 = var3[buttonSize] or "Size_1000"
		var7 = if tokens and tokens.Size[var8] then tokens.Size[var8] else 40
	end
	local var9 = if p1.width then fillBehavior.Fill else p1.fillBehavior
	local subtle = nil
	local var10 = nil
	local var11 = nil
	local textButton = nil
	local var12 = nil
	
	if playButtonState == playButtonStatesModule.Loading then
		if p1.hideIfLoading then
			return nil
		elseif fFlagLuaAppPlayButtonLoadingSkeleton and (not p1.useUIBloxButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.hasPlayButtonLoadingSkeletonIxp)) then
			local _ = nil
			local var13 = if fFlagLuaAppUseTokenHeightForPlayButton then var7 else tokens and tokens.Size[var3[buttonSize] or "Size_1000"]
			var12 = if var9 == "Fill" then UDim.new(1, 0) else UDim.new(0, var13)
			local uDim2 = UDim2.new(var12, UDim.new(0, var13))
			local fFlagLuaAppUnifyPlayButtonAllSurfacesIxp_1 = fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or (p1.shouldLaunchWhenLoading or p1.shouldLaunchOnReleaseAfterUnmount)
			local var14 = reactModule.createElement(skeleton, {
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
				ref = p1.loadingCaptureRef,
				[reactModule.Event.Activated] = p1.onPlayButtonActivated
			}, { Skeleton = var14 }) else var14
			var6 = true
		end
		subtle = buttonVariant.Emphasis
	elseif playButtonState == playButtonStatesModule.Playable then
		subtle = buttonVariant.Emphasis
		
		if fFlagLuaAppIconTextPlayButton or (fFlagLuaAppTextOnlyPlayButton or fFlagLuaAppJoinTextPlayableButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.hasJoinTextPlayableButtonIxp)) then
			var11 = p1.playableText or (if fFlagLuaAppUpdatePlayButtonText then localized.play else localized.join)
			
			if fFlagLuaAppIconTextPlayButton and not p1.hidePlayableIcon then
				var10 = var1
			end
		elseif not fFlagLuaAppIconPlayButton and not p1.hidePlayableIcon then
			var10 = "icons/common/play"
		end
		var11 = p1.playableText
		
		if fFlagLuaAppIconPlayButton and not p1.hidePlayableIcon then
			var10 = if var11 and var11 ~= "" then "icons/common/play" else var1
		end
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.PlayableWithParty then
		var10 = play
		var11 = if p1.hideOptionalText then nil else localized.joinWithParty
		var4 = true
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.WaitingForParty then
		var10 = play
		var11 = if p1.hideOptionalText then nil else localized.waitingForParty
		var6 = true
		var5 = true
		var4 = true
	elseif playButtonState == playButtonStatesModule.PaidAccess then
		var11 = tostring(if p1.gameProductInfo then p1.gameProductInfo.price else 0)
		subtle = buttonVariant.Emphasis
		var10 = "icons/common/robux"
	elseif playButtonState == playButtonStatesModule.FiatPaidAccess then
		subtle = buttonVariant.Emphasis
		var11 = p1.fiatText or (if p1.gameProductInfo then p1.gameProductInfo.localizedFiatPrice else "")
	elseif fFlagLuaAppDemoModePlayButton and playButtonState == playButtonStatesModule.DemoMode then
		subtle = buttonVariant.SubEmphasis
		var11 = localized.playDemo
	elseif playButtonState == playButtonStatesModule.ActionNeeded then
		subtle = buttonVariant.Emphasis
		var11 = localized.unlock
	elseif playButtonState == playButtonStatesModule.UnplayableOther then
		if p1.hideIfUnplayable then
			return nil
		end
		subtle = buttonVariant.Subtle
		var10 = "icons/status/unavailable"
		var11 = if p1.hideOptionalText then nil else localized.unavailable
		var6 = true
	else
		error("invalid play button state!")
	end
	local var15, var16
	local _ = nil
	
	if var4 then
		if not fFlagLuaAppUseTokenHeightForPlayButton then
			local var17 = var3[buttonSize] or "Size_1000"
			var7 = if tokens and tokens.Size[var17] then tokens.Size[var17] else 40
		end
		var15 = reactModule.createElement(comboButton, {
			size = UDim2.new(1, 0, 0, var7),
			button = {
				icon = var10,
				text = var11,
				isDisabled = var6,
				onActivated = if not var6 then p1.onPlayButtonActivated else function() end
			},
			overflow = {
				icon = if fFlagLuaAppUnifiedPlayButtonSquadMenuDirection and p1.squadButtonMenuDirection == menuDirection.Down then truncationExpand else truncationCollapse,
				isDisabled = var5,
				onActivated = if not var5 then p1.onPlaySquadButtonActivated else function() end
			},
			testId = p1.testId
		})
	elseif p1.useUIBloxButton then
		if not fFlagLuaAppUseTokenHeightForPlayButton then
			local var18 = var3[buttonSize] or "Size_1000"
			var7 = if tokens and tokens.Size[var18] then tokens.Size[var18] else 40
		end
		local isFit = var9 == "Fit"
		local var19 = if isFit then UDim2.new(0, 0, 0, var7) else UDim2.new(1, 0, 0, var7)
		local var20 = playButtonState == playButtonStatesModule.Loading
		local var21 = if subtle == buttonVariant.SubEmphasis then buttonType.PrimarySystem elseif subtle == buttonVariant.Subtle then buttonType.Secondary else buttonType.PrimaryContextual
		local var22 = if var10 == var1 then play else var10
		
		if type(var22) == "string" then
			var22 = images[var22]
		end
		var15 = reactModule.createElement(button, {
			size = var19,
			fitContent = isFit,
			buttonType = var21,
			icon = var22,
			text = var11,
			isLoading = var20,
			isDisabled = var6 or var20,
			userInteractionEnabled = not (var6 or var20),
			onActivated = if var6 or var20 then var2 else p1.onPlayButtonActivated,
			ref = p1.playButtonCaptureRef,
			[reactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil,
			DO_NOT_USE_useUIBloxButton = if getFFlagUIBloxUseFoundationButton() or fFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
		})
		
		if (fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.shouldLaunchWhenLoading or p1.shouldLaunchOnReleaseAfterUnmount) and var20 then
			textButton = reactModule.createElement("TextButton", {
				Size = var19,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 2,
				ref = p1.loadingCaptureRef,
				[reactModule.Event.Activated] = p1.onPlayButtonActivated
			})
		end
	elseif fFlagLuaAppIconPlayButton then
		if var11 ~= nil then
			var16 = false
			
			if var11 == "" then
				local _ = var10 ~= nil
			end
		end
	else
		var16 = nil
	end
	var15 = if fFlagLuaAppIconPlayButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.hasIconPlayButtonIxp) and var16 then reactModule.createElement(iconButton, {
		icon = var10,
		variant = subtle,
		size = buttonSize,
		width = if fFlagLuaAppPlayButtonLoadingSkeleton and playButtonState == playButtonStatesModule.Loading then var12 else nil,
		fillBehavior = var9,
		isDisabled = var6,
		onActivated = if not var6 then p1.onPlayButtonActivated else var2,
		ref = p1.playButtonCaptureRef,
		testId = p1.testId
	}) else reactModule.createElement(button_1, {
		icon = var10,
		text = var11,
		variant = subtle,
		size = buttonSize,
		width = if fFlagLuaAppPlayButtonLoadingSkeleton and playButtonState == playButtonStatesModule.Loading then var12 else nil,
		fillBehavior = var9,
		isDisabled = var6,
		onActivated = if not var6 then p1.onPlayButtonActivated else var2,
		ref = p1.playButtonCaptureRef,
		testId = p1.testId
	})
	return reactModule.createElement("Frame", {
		LayoutOrder = p1.LayoutOrder,
		Position = p1.Position,
		Size = if fFlagLuaAppUseTokenHeightForPlayButton then UDim2.new(if p1.width then p1.width elseif var9 == "Fill" then UDim.new(1, 0) else UDim.new(0, 0), UDim.new(0, var7)) elseif p1.width then UDim2.new(p1.width, UDim.new(0, 0)) elseif var9 == "Fill" then UDim2.new(1, 0, 1, 0) else nil,
		AutomaticSize = if fFlagLuaAppUseTokenHeightForPlayButton then if var9 == "Fill" then nil else Enum.AutomaticSize.X elseif var9 == "Fill" then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Tag] = if fFlagSduiExperienceDetailsSupport then p1.tag else nil
	}, {
		LoadingSkeleton = if playButtonState == playButtonStatesModule.Loading then textButton else nil,
		PlayButton = var15
	})
end)