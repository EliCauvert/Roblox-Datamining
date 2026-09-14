local parent = script:FindFirstAncestor("GamePlayButton").Parent
local collectionService = game:GetService("CollectionService")
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
local fFlagLuaAppPlayButtonPrivatePT = sharedFlagsModule.FFlagLuaAppPlayButtonPrivatePT
local getFFlagIsSquadEnabled = sharedFlagsModule.GetFFlagIsSquadEnabled
local fFlagLuaAppUnifyPlayButtonAllSurfacesIxp = sharedFlagsModule.FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local fFlagLuaAppJoinTextPlayableButton = sharedFlagsModule.FFlagLuaAppJoinTextPlayableButton
local fFlagLuaAppIconPlayButton = sharedFlagsModule.FFlagLuaAppIconPlayButton
local fFlagLuaAppPlayButtonLoadingSkeleton = sharedFlagsModule.FFlagLuaAppPlayButtonLoadingSkeleton
local fFlagLuaAppUnifiedPlayButtonSquadMenuDirection = sharedFlagsModule.FFlagLuaAppUnifiedPlayButtonSquadMenuDirection
local getFFlagUIBloxUseFoundationButton = sharedFlagsModule.UIBlox.GetFFlagUIBloxUseFoundationButton
local fFlagLuaAppPlayButtonOptOutFoundationButton = sharedFlagsModule.FFlagLuaAppPlayButtonOptOutFoundationButton
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagLuaAppMediaGalleryGamepadSupport = sharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
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
	-- upvalues: fFlagLuaAppMediaGalleryGamepadSupport (ref), reactModule (ref), collectionService (ref), fFlagSduiExperienceDetailsSupport (ref), inputSize (ref), fFlagLuaAppUseTokenHeightForPlayButton (ref), buttonHeightSizeKeyByInputSizeModule (ref), fillBehavior (ref), playButtonStatesModule (ref), fFlagLuaAppPlayButtonLoadingSkeleton (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), skeleton (ref), radius (ref), buttonVariant (ref), fFlagLuaAppIconTextPlayButton (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppJoinTextPlayableButton (ref), fFlagLuaAppUpdatePlayButtonText (ref), var1 (ref), fFlagLuaAppIconPlayButton (ref), getFFlagIsSquadEnabled (ref), play (ref), fFlagLuaAppPlayButtonPrivatePT (ref), comboButton (ref), fFlagLuaAppUnifiedPlayButtonSquadMenuDirection (ref), menuDirection (ref), truncationExpand (ref), truncationCollapse (ref), buttonType (ref), images (ref), button (ref), var2 (ref), getFFlagUIBloxUseFoundationButton (ref), fFlagLuaAppPlayButtonOptOutFoundationButton (ref), iconButton (ref), button_1 (ref)
	local tokens = p1.tokens
	local playButtonState = p1.playButtonState
	local localized = p1.localized
	local var3 = nil
	
	if fFlagLuaAppMediaGalleryGamepadSupport then
		local tag = p1.tag
		local playButtonCaptureRef = p1.playButtonCaptureRef
		local var4 = reactModule.useRef(nil)
		var3 = reactModule.useCallback(function(p2)
			-- upvalues: var4 (ref), tag (ref), collectionService (copy), fFlagSduiExperienceDetailsSupport (copy), playButtonCaptureRef (ref)
			local current = var4.current
			
			if current ~= nil and current ~= p2 and tag ~= nil then
				collectionService:RemoveTag(current, tag)
			end
			var4.current = p2
			
			if fFlagSduiExperienceDetailsSupport and tag ~= nil and p2 ~= nil then
				collectionService:AddTag(p2, tag)
			end
			if type(playButtonCaptureRef) == "function" then
				playButtonCaptureRef(p2)
				
				return
			elseif playButtonCaptureRef ~= nil then
				playButtonCaptureRef.current = p2
			end
		end, { tag, playButtonCaptureRef })
	end
	local var5 = false
	local var6 = false
	local var7 = false
	local buttonSize = p1.buttonSize or inputSize.Medium
	local var8 = nil
	
	if fFlagLuaAppUseTokenHeightForPlayButton then
		local var9 = buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"
		var8 = if tokens and tokens.Size[var9] then tokens.Size[var9] else 40
	end
	local var10 = if p1.width then fillBehavior.Fill else p1.fillBehavior
	local subtle = nil
	local var11 = nil
	local var12 = nil
	local textButton = nil
	local var13 = nil
	
	if playButtonState == playButtonStatesModule.Loading then
		if p1.hideIfLoading then
			return nil
		elseif fFlagLuaAppPlayButtonLoadingSkeleton and (not p1.useUIBloxButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.hasPlayButtonLoadingSkeletonIxp)) then
			local _ = nil
			local var14 = if fFlagLuaAppUseTokenHeightForPlayButton then var8 else tokens and tokens.Size[buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"]
			var13 = if var10 == "Fill" then UDim.new(1, 0) else UDim.new(0, var14)
			local uDim2 = UDim2.new(var13, UDim.new(0, var14))
			local fFlagLuaAppUnifyPlayButtonAllSurfacesIxp_1 = fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or (p1.shouldLaunchWhenLoading or p1.shouldLaunchOnReleaseAfterUnmount)
			local var15 = reactModule.createElement(skeleton, {
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
			}, { Skeleton = var15 }) else var15
			var7 = true
		end
		subtle = buttonVariant.Emphasis
	elseif playButtonState == playButtonStatesModule.Playable then
		subtle = buttonVariant.Emphasis
		
		if fFlagLuaAppIconTextPlayButton or (fFlagLuaAppTextOnlyPlayButton or fFlagLuaAppJoinTextPlayableButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.hasJoinTextPlayableButtonIxp)) then
			var12 = p1.playableText or (if fFlagLuaAppUpdatePlayButtonText then localized.play else localized.join)
			
			if fFlagLuaAppIconTextPlayButton and not p1.hidePlayableIcon then
				var11 = var1
			end
		elseif not fFlagLuaAppIconPlayButton and not p1.hidePlayableIcon then
			var11 = "icons/common/play"
		end
		var12 = p1.playableText
		
		if fFlagLuaAppIconPlayButton and not p1.hidePlayableIcon then
			var11 = if var12 and var12 ~= "" then "icons/common/play" else var1
		end
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.PlayableWithParty then
		var11 = play
		var12 = if p1.hideOptionalText then nil else localized.joinWithParty
		var5 = true
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.WaitingForParty then
		var11 = play
		var12 = if p1.hideOptionalText then nil else localized.waitingForParty
		var7 = true
		var6 = true
		var5 = true
	elseif playButtonState == playButtonStatesModule.PaidAccess then
		var12 = tostring(if p1.gameProductInfo then p1.gameProductInfo.price else 0)
		subtle = buttonVariant.Emphasis
		var11 = "icons/common/robux"
	elseif playButtonState == playButtonStatesModule.FiatPaidAccess then
		subtle = buttonVariant.Emphasis
		var12 = p1.fiatText or (if p1.gameProductInfo then p1.gameProductInfo.localizedFiatPrice else "")
	elseif playButtonState == playButtonStatesModule.DemoMode then
		subtle = buttonVariant.SubEmphasis
		var12 = localized.playDemo
	elseif fFlagLuaAppPlayButtonPrivatePT and playButtonState == playButtonStatesModule.Playtest then
		subtle = buttonVariant.SubEmphasis
		var12 = localized.playtest
	elseif playButtonState == playButtonStatesModule.ActionNeeded then
		subtle = buttonVariant.Emphasis
		var12 = localized.unlock
	elseif playButtonState == playButtonStatesModule.UnplayableOther then
		if p1.hideIfUnplayable then
			return nil
		end
		subtle = buttonVariant.Subtle
		var11 = "icons/status/unavailable"
		var12 = if p1.hideOptionalText then nil else localized.unavailable
		var7 = true
	else
		error("invalid play button state!")
	end
	local var16, var17
	local _ = nil
	
	if var5 then
		if not fFlagLuaAppUseTokenHeightForPlayButton then
			local var18 = buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"
			var8 = if tokens and tokens.Size[var18] then tokens.Size[var18] else 40
		end
		var16 = reactModule.createElement(comboButton, {
			size = UDim2.new(1, 0, 0, var8),
			button = {
				icon = var11,
				text = var12,
				isDisabled = var7,
				onActivated = if not var7 then p1.onPlayButtonActivated else function() end
			},
			overflow = {
				icon = if fFlagLuaAppUnifiedPlayButtonSquadMenuDirection and p1.squadButtonMenuDirection == menuDirection.Down then truncationExpand else truncationCollapse,
				isDisabled = var6,
				onActivated = if not var6 then p1.onPlaySquadButtonActivated else function() end
			},
			testId = p1.testId
		})
	elseif p1.useUIBloxButton then
		if not fFlagLuaAppUseTokenHeightForPlayButton then
			local var19 = buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"
			var8 = if tokens and tokens.Size[var19] then tokens.Size[var19] else 40
		end
		local isFit = var10 == "Fit"
		local var20 = if isFit then UDim2.new(0, 0, 0, var8) else UDim2.new(1, 0, 0, var8)
		local var21 = playButtonState == playButtonStatesModule.Loading
		local var22 = if subtle == buttonVariant.SubEmphasis then buttonType.PrimarySystem elseif subtle == buttonVariant.Subtle then buttonType.Secondary else buttonType.PrimaryContextual
		local var23 = if var11 == var1 then play else var11
		
		if type(var23) == "string" then
			var23 = images[var23]
		end
		var16 = reactModule.createElement(button, {
			size = var20,
			fitContent = isFit,
			buttonType = var22,
			icon = var23,
			text = var12,
			isLoading = var21,
			isDisabled = var7 or var21,
			userInteractionEnabled = not (var7 or var21),
			onActivated = if var7 or var21 then var2 else p1.onPlayButtonActivated,
			ref = if fFlagLuaAppMediaGalleryGamepadSupport then var3 else p1.playButtonCaptureRef,
			[reactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil,
			DO_NOT_USE_useUIBloxButton = if getFFlagUIBloxUseFoundationButton() or fFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
		})
		
		if (fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.shouldLaunchWhenLoading or p1.shouldLaunchOnReleaseAfterUnmount) and var21 then
			textButton = reactModule.createElement("TextButton", {
				Size = var20,
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
		if var12 ~= nil then
			var17 = false
			
			if var12 == "" then
				local _ = var11 ~= nil
			end
		end
	else
		var17 = nil
	end
	var16 = if fFlagLuaAppIconPlayButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.hasIconPlayButtonIxp) and var17 then reactModule.createElement(iconButton, {
		icon = var11,
		variant = subtle,
		size = buttonSize,
		width = if fFlagLuaAppPlayButtonLoadingSkeleton and playButtonState == playButtonStatesModule.Loading then var13 else nil,
		fillBehavior = var10,
		isDisabled = var7,
		onActivated = if not var7 then p1.onPlayButtonActivated else var2,
		ref = if fFlagLuaAppMediaGalleryGamepadSupport then var3 else p1.playButtonCaptureRef,
		testId = p1.testId
	}) else reactModule.createElement(button_1, {
		icon = var11,
		text = var12,
		variant = subtle,
		size = buttonSize,
		width = if fFlagLuaAppPlayButtonLoadingSkeleton and playButtonState == playButtonStatesModule.Loading then var13 else nil,
		fillBehavior = var10,
		isDisabled = var7,
		onActivated = if not var7 then p1.onPlayButtonActivated else var2,
		ref = if fFlagLuaAppMediaGalleryGamepadSupport then var3 else p1.playButtonCaptureRef,
		testId = p1.testId
	})
	return reactModule.createElement("Frame", {
		LayoutOrder = p1.LayoutOrder,
		Position = p1.Position,
		Size = if fFlagLuaAppUseTokenHeightForPlayButton then UDim2.new(if p1.width then p1.width elseif var10 == "Fill" then UDim.new(1, 0) else UDim.new(0, 0), UDim.new(0, var8)) elseif p1.width then UDim2.new(p1.width, UDim.new(0, 0)) elseif var10 == "Fill" then UDim2.new(1, 0, 1, 0) else nil,
		AutomaticSize = if fFlagLuaAppUseTokenHeightForPlayButton then if var10 == "Fill" then nil else Enum.AutomaticSize.X elseif var10 == "Fill" then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Tag] = if fFlagLuaAppMediaGalleryGamepadSupport then nil elseif fFlagSduiExperienceDetailsSupport then p1.tag else nil
	}, {
		LoadingSkeleton = if playButtonState == playButtonStatesModule.Loading then textButton else nil,
		PlayButton = var16
	})
end)