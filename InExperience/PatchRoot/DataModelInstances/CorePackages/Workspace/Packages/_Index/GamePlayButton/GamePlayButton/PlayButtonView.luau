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
local var1 = if fFlagLuaAppIconPlayButton then "play-xlarge" else nil
local play = images["icons/common/play"]
local truncationCollapse = images["icons/actions/truncationCollapse"]
local truncationExpand = images["icons/actions/truncationExpand"]

local var2 = function() end

local buttonHeightSizeKeyByInputSizeModule = require(script.Parent.ButtonHeightSizeKeyByInputSize)

return reactModule.memo(function(p1)
	-- upvalues: inputSize (ref), fFlagLuaAppUseTokenHeightForPlayButton (ref), buttonHeightSizeKeyByInputSizeModule (ref), fillBehavior (ref), playButtonStatesModule (ref), fFlagLuaAppPlayButtonLoadingSkeleton (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), reactModule (ref), skeleton (ref), radius (ref), buttonVariant (ref), fFlagLuaAppIconTextPlayButton (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppJoinTextPlayableButton (ref), fFlagLuaAppUpdatePlayButtonText (ref), var1 (ref), fFlagLuaAppIconPlayButton (ref), getFFlagIsSquadEnabled (ref), play (ref), comboButton (ref), fFlagLuaAppUnifiedPlayButtonSquadMenuDirection (ref), menuDirection (ref), truncationExpand (ref), truncationCollapse (ref), buttonType (ref), images (ref), button (ref), var2 (ref), getFFlagUIBloxUseFoundationButton (ref), fFlagLuaAppPlayButtonOptOutFoundationButton (ref), iconButton (ref), button_1 (ref), fFlagSduiExperienceDetailsSupport (ref)
	local tokens = p1.tokens
	local playButtonState = p1.playButtonState
	local localized = p1.localized
	local var3 = false
	local var4 = false
	local var5 = false
	local buttonSize = p1.buttonSize or inputSize.Medium
	local var6 = nil
	
	if fFlagLuaAppUseTokenHeightForPlayButton then
		local var7 = buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"
		var6 = if tokens and tokens.Size[var7] then tokens.Size[var7] else 40
	end
	local var8 = if p1.width then fillBehavior.Fill else p1.fillBehavior
	local subtle = nil
	local var9 = nil
	local var10 = nil
	local textButton = nil
	local var11 = nil
	
	if playButtonState == playButtonStatesModule.Loading then
		if p1.hideIfLoading then
			return nil
		elseif fFlagLuaAppPlayButtonLoadingSkeleton and (not p1.useUIBloxButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.hasPlayButtonLoadingSkeletonIxp)) then
			local _ = nil
			local var12 = if fFlagLuaAppUseTokenHeightForPlayButton then var6 else tokens and tokens.Size[buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"]
			var11 = if var8 == "Fill" then UDim.new(1, 0) else UDim.new(0, var12)
			local uDim2 = UDim2.new(var11, UDim.new(0, var12))
			local fFlagLuaAppUnifyPlayButtonAllSurfacesIxp_1 = fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or (p1.shouldLaunchWhenLoading or p1.shouldLaunchOnReleaseAfterUnmount)
			local var13 = reactModule.createElement(skeleton, {
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
			}, { Skeleton = var13 }) else var13
			var5 = true
		end
		subtle = buttonVariant.Emphasis
	elseif playButtonState == playButtonStatesModule.Playable then
		subtle = buttonVariant.Emphasis
		
		if fFlagLuaAppIconTextPlayButton or (fFlagLuaAppTextOnlyPlayButton or fFlagLuaAppJoinTextPlayableButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.hasJoinTextPlayableButtonIxp)) then
			var10 = p1.playableText or (if fFlagLuaAppUpdatePlayButtonText then localized.play else localized.join)
			
			if fFlagLuaAppIconTextPlayButton and not p1.hidePlayableIcon then
				var9 = var1
			end
		elseif not fFlagLuaAppIconPlayButton and not p1.hidePlayableIcon then
			var9 = "icons/common/play"
		end
		var10 = p1.playableText
		
		if fFlagLuaAppIconPlayButton and not p1.hidePlayableIcon then
			var9 = if var10 and var10 ~= "" then "icons/common/play" else var1
		end
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.PlayableWithParty then
		var9 = play
		var10 = if p1.hideOptionalText then nil else localized.joinWithParty
		var3 = true
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.WaitingForParty then
		var9 = play
		var10 = if p1.hideOptionalText then nil else localized.waitingForParty
		var5 = true
		var4 = true
		var3 = true
	elseif playButtonState == playButtonStatesModule.PaidAccess then
		var10 = tostring(if p1.gameProductInfo then p1.gameProductInfo.price else 0)
		subtle = buttonVariant.Emphasis
		var9 = "icons/common/robux"
	elseif playButtonState == playButtonStatesModule.FiatPaidAccess then
		subtle = buttonVariant.Emphasis
		var10 = p1.fiatText or (if p1.gameProductInfo then p1.gameProductInfo.localizedFiatPrice else "")
	elseif playButtonState == playButtonStatesModule.DemoMode then
		subtle = buttonVariant.SubEmphasis
		var10 = localized.playDemo
	elseif playButtonState == playButtonStatesModule.ActionNeeded then
		subtle = buttonVariant.Emphasis
		var10 = localized.unlock
	elseif playButtonState == playButtonStatesModule.UnplayableOther then
		if p1.hideIfUnplayable then
			return nil
		end
		subtle = buttonVariant.Subtle
		var9 = "icons/status/unavailable"
		var10 = if p1.hideOptionalText then nil else localized.unavailable
		var5 = true
	else
		error("invalid play button state!")
	end
	local var14, var15
	local _ = nil
	
	if var3 then
		if not fFlagLuaAppUseTokenHeightForPlayButton then
			local var16 = buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"
			var6 = if tokens and tokens.Size[var16] then tokens.Size[var16] else 40
		end
		var14 = reactModule.createElement(comboButton, {
			size = UDim2.new(1, 0, 0, var6),
			button = {
				icon = var9,
				text = var10,
				isDisabled = var5,
				onActivated = if not var5 then p1.onPlayButtonActivated else function() end
			},
			overflow = {
				icon = if fFlagLuaAppUnifiedPlayButtonSquadMenuDirection and p1.squadButtonMenuDirection == menuDirection.Down then truncationExpand else truncationCollapse,
				isDisabled = var4,
				onActivated = if not var4 then p1.onPlaySquadButtonActivated else function() end
			},
			testId = p1.testId
		})
	elseif p1.useUIBloxButton then
		if not fFlagLuaAppUseTokenHeightForPlayButton then
			local var17 = buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"
			var6 = if tokens and tokens.Size[var17] then tokens.Size[var17] else 40
		end
		local isFit = var8 == "Fit"
		local var18 = if isFit then UDim2.new(0, 0, 0, var6) else UDim2.new(1, 0, 0, var6)
		local var19 = playButtonState == playButtonStatesModule.Loading
		local var20 = if subtle == buttonVariant.SubEmphasis then buttonType.PrimarySystem elseif subtle == buttonVariant.Subtle then buttonType.Secondary else buttonType.PrimaryContextual
		local var21 = if var9 == var1 then play else var9
		
		if type(var21) == "string" then
			var21 = images[var21]
		end
		var14 = reactModule.createElement(button, {
			size = var18,
			fitContent = isFit,
			buttonType = var20,
			icon = var21,
			text = var10,
			isLoading = var19,
			isDisabled = var5 or var19,
			userInteractionEnabled = not (var5 or var19),
			onActivated = if var5 or var19 then var2 else p1.onPlayButtonActivated,
			ref = p1.playButtonCaptureRef,
			[reactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil,
			DO_NOT_USE_useUIBloxButton = if getFFlagUIBloxUseFoundationButton() or fFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
		})
		
		if (fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.shouldLaunchWhenLoading or p1.shouldLaunchOnReleaseAfterUnmount) and var19 then
			textButton = reactModule.createElement("TextButton", {
				Size = var18,
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
		if var10 ~= nil then
			var15 = false
			
			if var10 == "" then
				local _ = var9 ~= nil
			end
		end
	else
		var15 = nil
	end
	var14 = if fFlagLuaAppIconPlayButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.hasIconPlayButtonIxp) and var15 then reactModule.createElement(iconButton, {
		icon = var9,
		variant = subtle,
		size = buttonSize,
		width = if fFlagLuaAppPlayButtonLoadingSkeleton and playButtonState == playButtonStatesModule.Loading then var11 else nil,
		fillBehavior = var8,
		isDisabled = var5,
		onActivated = if not var5 then p1.onPlayButtonActivated else var2,
		ref = p1.playButtonCaptureRef,
		testId = p1.testId
	}) else reactModule.createElement(button_1, {
		icon = var9,
		text = var10,
		variant = subtle,
		size = buttonSize,
		width = if fFlagLuaAppPlayButtonLoadingSkeleton and playButtonState == playButtonStatesModule.Loading then var11 else nil,
		fillBehavior = var8,
		isDisabled = var5,
		onActivated = if not var5 then p1.onPlayButtonActivated else var2,
		ref = p1.playButtonCaptureRef,
		testId = p1.testId
	})
	return reactModule.createElement("Frame", {
		LayoutOrder = p1.LayoutOrder,
		Position = p1.Position,
		Size = if fFlagLuaAppUseTokenHeightForPlayButton then UDim2.new(if p1.width then p1.width elseif var8 == "Fill" then UDim.new(1, 0) else UDim.new(0, 0), UDim.new(0, var6)) elseif p1.width then UDim2.new(p1.width, UDim.new(0, 0)) elseif var8 == "Fill" then UDim2.new(1, 0, 1, 0) else nil,
		AutomaticSize = if fFlagLuaAppUseTokenHeightForPlayButton then if var8 == "Fill" then nil else Enum.AutomaticSize.X elseif var8 == "Fill" then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Tag] = if fFlagSduiExperienceDetailsSupport then p1.tag else nil
	}, {
		LoadingSkeleton = if playButtonState == playButtonStatesModule.Loading then textButton else nil,
		PlayButton = var14
	})
end)