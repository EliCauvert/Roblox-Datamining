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
local earlyAccessPlusTooltipModule = require(script.Parent.EarlyAccess.EarlyAccessPlusTooltip)
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
local fFlagLuaAppMediaGalleryGamepadSupport = sharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
local fFlagLuaAppTextOnlyPlayButton = sharedFlagsModule.FFlagLuaAppTextOnlyPlayButton
local fFlagLuaAppIconTextPlayButton = sharedFlagsModule.FFlagLuaAppIconTextPlayButton
local fFlagLuaAppUpdatePlayButtonText = sharedFlagsModule.FFlagLuaAppUpdatePlayButtonText
local fFlagLuaAppUseTokenHeightForPlayButton = sharedFlagsModule.FFlagLuaAppUseTokenHeightForPlayButton
local fFlagEnableGameJoinEarlyAccess = sharedFlagsModule.FFlagEnableGameJoinEarlyAccess
local var1 = if fFlagLuaAppIconPlayButton then "play-xlarge" else nil
local play = images["icons/common/play"]
local truncationCollapse = images["icons/actions/truncationCollapse"]
local truncationExpand = images["icons/actions/truncationExpand"]

local var2 = function() end

local buttonHeightSizeKeyByInputSizeModule = require(script.Parent.ButtonHeightSizeKeyByInputSize)

return reactModule.memo(function(p1)
	-- upvalues: fFlagEnableGameJoinEarlyAccess (ref), reactModule (ref), earlyAccessPlusTooltipModule (ref), fFlagLuaAppMediaGalleryGamepadSupport (ref), collectionService (ref), inputSize (ref), fFlagLuaAppUseTokenHeightForPlayButton (ref), buttonHeightSizeKeyByInputSizeModule (ref), fillBehavior (ref), playButtonStatesModule (ref), fFlagLuaAppPlayButtonLoadingSkeleton (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), skeleton (ref), radius (ref), buttonVariant (ref), fFlagLuaAppIconTextPlayButton (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppJoinTextPlayableButton (ref), fFlagLuaAppUpdatePlayButtonText (ref), var1 (ref), fFlagLuaAppIconPlayButton (ref), getFFlagIsSquadEnabled (ref), play (ref), fFlagLuaAppPlayButtonPrivatePT (ref), comboButton (ref), fFlagLuaAppUnifiedPlayButtonSquadMenuDirection (ref), menuDirection (ref), truncationExpand (ref), truncationCollapse (ref), buttonType (ref), images (ref), button (ref), var2 (ref), getFFlagUIBloxUseFoundationButton (ref), fFlagLuaAppPlayButtonOptOutFoundationButton (ref), iconButton (ref), button_1 (ref)
	local tokens = p1.tokens
	local playButtonState = p1.playButtonState
	local localized = p1.localized
	local var3 = false
	local var4 = nil
	local var5 = nil
	local onPlayButtonActivated = p1.onPlayButtonActivated
	
	if fFlagEnableGameJoinEarlyAccess then
		var3 = p1.showEarlyAccessTooltip == true
		local var6, var7 = reactModule.useState(var3)
		local var8 = reactModule.useRef(nil)
		var5 = var8
		
		if var3 then
			onPlayButtonActivated = function()
				-- upvalues: var7 (ref), p1 (ref)
				var7(false)
				p1.onPlayButtonActivated()
			end
			
			var4 = reactModule.createElement(earlyAccessPlusTooltipModule, {
				isOpen = var6,
				onRequestClose = function()
					-- upvalues: var7 (ref)
					var7(false)
				end,
				anchorRef = var8
			})
		end
	end
	local var9 = nil
	
	if fFlagLuaAppMediaGalleryGamepadSupport then
		local tag = p1.tag
		local playButtonCaptureRef = p1.playButtonCaptureRef
		local var10 = reactModule.useRef(nil)
		var9 = reactModule.useCallback(function(p2)
			-- upvalues: var10 (ref), tag (ref), collectionService (copy), playButtonCaptureRef (ref)
			local current = var10.current
			
			if current ~= nil and current ~= p2 and tag ~= nil then
				collectionService:RemoveTag(current, tag)
			end
			var10.current = p2
			
			if tag ~= nil and p2 ~= nil then
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
	local var11 = false
	local var12 = false
	local var13 = false
	local buttonSize = p1.buttonSize or inputSize.Medium
	local var14 = nil
	
	if fFlagLuaAppUseTokenHeightForPlayButton then
		local var15 = buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"
		var14 = if tokens and tokens.Size[var15] then tokens.Size[var15] else 40
	end
	local var16 = if p1.width then fillBehavior.Fill else p1.fillBehavior
	local subtle = nil
	local var17 = nil
	local var18 = nil
	local textButton = nil
	local var19 = nil
	local var20 = fFlagEnableGameJoinEarlyAccess and (playButtonState == playButtonStatesModule.EarlyAccessLocked and p1.earlyAccessPending == true)
	
	if playButtonState == playButtonStatesModule.Loading then
		if p1.hideIfLoading then
			return nil
		elseif fFlagLuaAppPlayButtonLoadingSkeleton and (not p1.useUIBloxButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.hasPlayButtonLoadingSkeletonIxp)) then
			local _ = nil
			local var21 = if fFlagLuaAppUseTokenHeightForPlayButton then var14 else tokens and tokens.Size[buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"]
			var19 = if var16 == "Fill" then UDim.new(1, 0) else UDim.new(0, var21)
			local uDim2 = UDim2.new(var19, UDim.new(0, var21))
			local fFlagLuaAppUnifyPlayButtonAllSurfacesIxp_1 = fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or (p1.shouldLaunchWhenLoading or p1.shouldLaunchOnReleaseAfterUnmount)
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
				ref = p1.loadingCaptureRef,
				[reactModule.Event.Activated] = p1.onPlayButtonActivated
			}, { Skeleton = var22 }) else var22
			var13 = true
		end
		subtle = buttonVariant.Emphasis
	elseif playButtonState == playButtonStatesModule.Playable then
		subtle = buttonVariant.Emphasis
		
		if fFlagLuaAppIconTextPlayButton or (fFlagLuaAppTextOnlyPlayButton or fFlagLuaAppJoinTextPlayableButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.hasJoinTextPlayableButtonIxp)) then
			var18 = p1.playableText or (if fFlagLuaAppUpdatePlayButtonText then localized.play else localized.join)
			
			if fFlagLuaAppIconTextPlayButton and not p1.hidePlayableIcon then
				var17 = var1
			end
		elseif not fFlagLuaAppIconPlayButton and not p1.hidePlayableIcon then
			var17 = "icons/common/play"
		end
		var18 = p1.playableText
		
		if fFlagLuaAppIconPlayButton and not p1.hidePlayableIcon then
			var17 = if var18 and var18 ~= "" then "icons/common/play" else var1
		end
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.PlayableWithParty then
		var17 = play
		var18 = if p1.hideOptionalText then nil else localized.joinWithParty
		var11 = true
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.WaitingForParty then
		var17 = play
		var18 = if p1.hideOptionalText then nil else localized.waitingForParty
		var13 = true
		var12 = true
		var11 = true
	elseif playButtonState == playButtonStatesModule.PaidAccess then
		var18 = tostring(if p1.gameProductInfo then p1.gameProductInfo.price else 0)
		subtle = buttonVariant.Emphasis
		var17 = "icons/common/robux"
	elseif playButtonState == playButtonStatesModule.FiatPaidAccess then
		subtle = buttonVariant.Emphasis
		var18 = p1.fiatText or (if p1.gameProductInfo then p1.gameProductInfo.localizedFiatPrice else "")
	elseif playButtonState == playButtonStatesModule.DemoMode then
		subtle = buttonVariant.SubEmphasis
		var18 = localized.playDemo
	elseif fFlagLuaAppPlayButtonPrivatePT and playButtonState == playButtonStatesModule.Playtest then
		subtle = buttonVariant.SubEmphasis
		var18 = localized.playtest
	elseif playButtonState == playButtonStatesModule.ActionNeeded then
		subtle = buttonVariant.Emphasis
		var18 = localized.unlock
	elseif playButtonState == playButtonStatesModule.UnplayableOther then
		if p1.hideIfUnplayable then
			return nil
		end
		subtle = buttonVariant.Subtle
		var17 = "icons/status/unavailable"
		var18 = if p1.hideOptionalText then nil else localized.unavailable
		var13 = true
	elseif fFlagEnableGameJoinEarlyAccess and playButtonState == playButtonStatesModule.EarlyAccessLocked then
		subtle = buttonVariant.Subtle
		var18 = if var20 then nil else p1.earlyAccessCaption or localized.earlyAccess
		var13 = true
	else
		error("invalid play button state!")
	end
	local var23, var24
	local _ = nil
	
	if var11 then
		if not fFlagLuaAppUseTokenHeightForPlayButton then
			local var25 = buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"
			var14 = if tokens and tokens.Size[var25] then tokens.Size[var25] else 40
		end
		var23 = reactModule.createElement(comboButton, {
			size = UDim2.new(1, 0, 0, var14),
			button = {
				icon = var17,
				text = var18,
				isDisabled = var13,
				onActivated = if not var13 then onPlayButtonActivated else function() end
			},
			overflow = {
				icon = if fFlagLuaAppUnifiedPlayButtonSquadMenuDirection and p1.squadButtonMenuDirection == menuDirection.Down then truncationExpand else truncationCollapse,
				isDisabled = var12,
				onActivated = if not var12 then p1.onPlaySquadButtonActivated else function() end
			},
			testId = p1.testId
		})
	elseif p1.useUIBloxButton then
		if not fFlagLuaAppUseTokenHeightForPlayButton then
			local var26 = buttonHeightSizeKeyByInputSizeModule[buttonSize] or "Size_1000"
			var14 = if tokens and tokens.Size[var26] then tokens.Size[var26] else 40
		end
		local isFit = var16 == "Fit"
		local var27 = if isFit then UDim2.new(0, 0, 0, var14) else UDim2.new(1, 0, 0, var14)
		local var28 = playButtonState == playButtonStatesModule.Loading
		local var29 = if subtle == buttonVariant.SubEmphasis then buttonType.PrimarySystem elseif subtle == buttonVariant.Subtle then buttonType.Secondary else buttonType.PrimaryContextual
		local var30 = if var17 == var1 then play else var17
		
		if type(var30) == "string" then
			var30 = images[var30]
		end
		var23 = reactModule.createElement(button, {
			size = var27,
			fitContent = isFit,
			buttonType = var29,
			icon = var30,
			text = var18,
			isLoading = var28 or var20,
			isDisabled = var13 or var28,
			userInteractionEnabled = not (var13 or var28),
			onActivated = if var13 or var28 then var2 else onPlayButtonActivated,
			ref = if fFlagLuaAppMediaGalleryGamepadSupport then var9 else p1.playButtonCaptureRef,
			[reactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil,
			DO_NOT_USE_useUIBloxButton = if getFFlagUIBloxUseFoundationButton() or fFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
		})
		
		if (fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.shouldLaunchWhenLoading or p1.shouldLaunchOnReleaseAfterUnmount) and var28 then
			textButton = reactModule.createElement("TextButton", {
				Size = var27,
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
		if var18 ~= nil then
			var24 = false
			
			if var18 == "" then
				local _ = var17 ~= nil
			end
		end
	else
		var24 = nil
	end
	var23 = if fFlagLuaAppIconPlayButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.hasIconPlayButtonIxp) and var24 then reactModule.createElement(iconButton, {
		icon = var17,
		variant = subtle,
		size = buttonSize,
		width = if fFlagLuaAppPlayButtonLoadingSkeleton and playButtonState == playButtonStatesModule.Loading then var19 else nil,
		fillBehavior = var16,
		isDisabled = var13,
		onActivated = if not var13 then onPlayButtonActivated else var2,
		ref = if fFlagLuaAppMediaGalleryGamepadSupport then var9 else p1.playButtonCaptureRef,
		testId = p1.testId
	}) else reactModule.createElement(button_1, {
		icon = var17,
		text = var18,
		variant = subtle,
		size = buttonSize,
		width = if fFlagLuaAppPlayButtonLoadingSkeleton and playButtonState == playButtonStatesModule.Loading then var19 else nil,
		fillBehavior = var16,
		isLoading = if var20 then true else nil,
		isDisabled = var13,
		onActivated = if not var13 then onPlayButtonActivated else var2,
		ref = if fFlagLuaAppMediaGalleryGamepadSupport then var9 else p1.playButtonCaptureRef,
		testId = p1.testId
	})
	return reactModule.createElement("Frame", {
		ref = if fFlagEnableGameJoinEarlyAccess and var3 then var5 else nil,
		LayoutOrder = p1.LayoutOrder,
		Position = p1.Position,
		Size = if fFlagLuaAppUseTokenHeightForPlayButton then UDim2.new(if p1.width then p1.width elseif var16 == "Fill" then UDim.new(1, 0) else UDim.new(0, 0), UDim.new(0, var14)) elseif p1.width then UDim2.new(p1.width, UDim.new(0, 0)) elseif var16 == "Fill" then UDim2.new(1, 0, 1, 0) else nil,
		AutomaticSize = if fFlagLuaAppUseTokenHeightForPlayButton then if var16 == "Fill" then nil else Enum.AutomaticSize.X elseif var16 == "Fill" then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Tag] = if fFlagLuaAppMediaGalleryGamepadSupport then nil else p1.tag
	}, {
		LoadingSkeleton = if playButtonState == playButtonStatesModule.Loading then textButton else nil,
		PlayButton = var23,
		EarlyAccessTooltip = if fFlagEnableGameJoinEarlyAccess then var4 else nil
	})
end)