local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local textService = game:GetService("TextService")
local enumsModule = require(parent.ProfilePlatform.Enums)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local userLibModule = require(parent.UserLib)
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local constants = userLibModule.Utils.Constants
local verifiedBadgesModule = require(parent.VerifiedBadges)
local mouseIconOverrideService = require(parent.CoreScriptsCommon).MouseIconOverrideService
local useScreenSize = require(parent.CoreScriptsRoactCommon).useScreenSize
local loadableImage = UIBloxModule.App.Loading.LoadableImage
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local useLocalization = localizationModule.Hooks.useLocalization
local useAbbreviatedNumberLocalization = localizationModule.Hooks.useAbbreviatedNumberLocalization
local text = foundationModule.Text
local view = foundationModule.View
local skeleton = foundationModule.Skeleton
local useTokens = foundationModule.Hooks.useTokens
local _ = require(groups.Common.Types)
local constantsModule = require(groups.Common.constants)
local t = {
	[enumsModule.DisabledReasons.BannedFromCommunity] = "subTextBannedFromCommunity",
	[enumsModule.DisabledReasons.CommunityIsClosed] = "subTextGroupClosed",
	[enumsModule.DisabledReasons.MaxCommunitiesJoined] = "subTextPremiumMaxGroups",
	[enumsModule.DisabledReasons.AccountCreatedLessThanOneDay] = "subTextRequiresAccountTenureTooltipOneDay",
	[enumsModule.DisabledReasons.AccountCreatedLessThanThreeDays] = "subTextRequiresAccountTenureTooltipThreeDays",
	[enumsModule.DisabledReasons.AccountCreatedLessThanOneWeek] = "subTextRequiresAccountTenureTooltipOneWeek",
	[enumsModule.DisabledReasons.AccountCreatedLessThanOneMonth] = "subTextRequiresAccountTenureTooltipOneMonth",
	[enumsModule.DisabledReasons.AccountCreatedLessThanThreeMonths] = "subTextRequiresAccountTenureTooltipThreeMonths",
	[enumsModule.DisabledReasons.InsufficientVerificationLevelHigh] = "subTextInsufficientVerificationLevelHigh",
	[enumsModule.DisabledReasons.InsufficientVerificationLevelMedium] = "subTextInsufficientVerificationLevelMedium",
	[enumsModule.DisabledReasons.InsufficientVerificationLevelLow] = "subTextInsufficientVerificationLevelLow"
}

return function(p0) --[[ line: 61 ]]
	-- upvalues: useTokens (ref), useScreenSize (ref), constantsModule (ref), useLocalization (ref), reactModule (ref), mouseIconOverrideService (ref), enumsModule (ref), t (ref), textService (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), view (ref), loadableImage (ref), text (ref), skeleton (ref), verifiedBadgesModule (ref), useAbbreviatedNumberLocalization (ref), buttonVariant (ref), dialog (ref), dialogSize (ref)
	local var11 = useTokens()
	local var12 = p0.enableInputDelayed ~= nil or p0.enableInputDelayed
	local var13 = if useScreenSize().Y < constantsModule.SMALL_SCREEN_HEIGHT_THRESHOLD then constantsModule.THUMBNAIL_SIZE_SMALL else constantsModule.THUMBNAIL_SIZE
	local data = p0.data
	local var14 = data == nil
	local var15 = if data then data.groupName else nil
	local var16 = if data then data.ownerName else nil
	local var17 = if data then data.ownerIsVerified else false
	local var18 = if data then data.membersCount else 0
	local var19 = if data then data.isAlreadyMember else false
	local var20 = if data then data.hasPendingRequest else false
	local var21 = if data then data.isEligible else false
	local var22 = if data then data.disabledReason else nil
	local var23 = if data and data.hasSocialModules ~= nil then data.hasSocialModules else true
	local var24 = useLocalization({
		joinGroup = "Feature.Groups.Action.JoinGroup",
		followGroup = "Feature.Groups.Action.Follow",
		notNowButton = "Feature.Groups.Action.NotNow",
		closeButton = "Feature.Groups.Action.Close",
		members = "Feature.Groups.Heading.Members",
		followers = "Feature.Groups.Heading.Followers",
		subTextPendingRequest = "Feature.Groups.Description.JoinGroupPending",
		subTextBannedFromCommunity = "Feature.Groups.Message.BannedFromGroup",
		subTextGroupClosed = "Feature.Groups.Message.GroupClosed",
		subTextPremiumMaxGroups = "Feature.Groups.Description.PremiumMaxGroups",
		subTextRequiresAccountTenureTooltipOneDay = "Feature.Groups.Description.RequiresAccountTenureTooltipOneDay",
		subTextRequiresAccountTenureTooltipThreeDays = "Feature.Groups.Description.RequiresAccountTenureTooltipThreeDays",
		subTextRequiresAccountTenureTooltipOneWeek = "Feature.Groups.Description.RequiresAccountTenureTooltipOneWeek",
		subTextRequiresAccountTenureTooltipOneMonth = "Feature.Groups.Description.RequiresAccountTenureTooltipOneMonth",
		subTextRequiresAccountTenureTooltipThreeMonths = "Feature.Groups.Description.RequiresAccountTenureTooltipThreeMonths",
		subTextInsufficientVerificationLevelHigh = "Feature.Groups.Modal.ContentTextHigh",
		subTextInsufficientVerificationLevelMedium = "Feature.Groups.Modal.ContentTextMedium",
		subTextInsufficientVerificationLevelLow = "Feature.Groups.Modal.ContentTextLow",
		subTextNotEligible = "Feature.Groups.Description.NotEligibleToJoin",
		titleJoin = { "Feature.Groups.Title.Join", groupName = var15 or "" },
		titleFollow = { "Feature.Groups.Title.Follow", groupName = var15 or "" },
		titleAlreadyRequested = {
			"Feature.Groups.Title.RequestedToJoin",
			groupName = var15 or ""
		},
		titleAlreadyMember = {
			"Feature.Groups.Title.AlreadyMember",
			groupName = var15 or ""
		},
		titleAlreadyFollowing = {
			"Feature.Groups.Title.AlreadyFollowing",
			groupName = var15 or ""
		},
		titleUnableToJoin = {
			"Feature.Groups.Title.UnableToJoin",
			groupName = var15 or ""
		},
		ownerBy = {
			"Feature.Groups.Label.ByOwnerWithFormat",
			ownerName = var16 or ""
		}
	})
	reactModule.useEffect(function() --[[ line: 124 ]]
		-- upvalues: mouseIconOverrideService (copy)
		mouseIconOverrideService.push("GroupJoinPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow)
		
		return function() --[[ line: 127 ]]
			-- upvalues: mouseIconOverrideService (copy)
			mouseIconOverrideService.pop("GroupJoinPromptOverride")
		end
	end, {})
	local var25 = reactModule.useRef(nil)
	local var26, var27 = reactModule.useState(nil)
	local var28 = reactModule.useRef(nil)
	local var29, var30 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 138 ]]
		-- upvalues: var25 (ref), var27 (ref), var26 (ref)
		local var46 = nil
		
		if var25.current then
			local current = var25.current
			
			if current.AbsoluteSize.X > 0 then
				var27(current.AbsoluteSize.X)
			end
			var46 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 145 ]]
				-- upvalues: current (ref), var26 (copy), var27 (copy)
				if current.AbsoluteSize.X > 0 and current.AbsoluteSize.X ~= var26 then
					var27(current.AbsoluteSize.X)
				end
			end)
		end
		return function() --[[ line: 151 ]]
			-- upvalues: var46 (write)
			if var46 then
				var46:Disconnect()
				var46 = nil
			end
		end
	end, { var26 })
	reactModule.useEffect(function() --[[ line: 159 ]]
		-- upvalues: var28 (ref), var30 (ref), var29 (ref)
		local var47 = nil
		
		if var28.current then
			local current = var28.current
			
			if current.AbsoluteSize.X > 0 then
				var30(current.AbsoluteSize.X)
			end
			var47 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 166 ]]
				-- upvalues: current (ref), var29 (copy), var30 (copy)
				if current.AbsoluteSize.X > 0 and current.AbsoluteSize.X ~= var29 then
					var30(current.AbsoluteSize.X)
				end
			end)
		end
		return function() --[[ line: 172 ]]
			-- upvalues: var47 (write)
			if var47 then
				var47:Disconnect()
				var47 = nil
			end
		end
	end, { var29 })
	local var31 = reactModule.useMemo(function() --[[ line: 180 ]]
		-- upvalues: var20 (ref), var24 (ref), var19 (ref), var21 (ref), var22 (ref), enumsModule (copy), t (copy)
		if var20 then
			return var24.subTextPendingRequest
		elseif var19 or var21 or not var22 then
			return nil
		end
		local var48 = enumsModule.DisabledReasons[var22]
		
		if var48 then
			local var49 = t[var48]
			
			return if var49 then var24[var49] else var24.subTextNotEligible
		end
	end, {
		var24,
		var19,
		var20,
		var21,
		var22
	})
	local var32 = reactModule.useMemo(function() --[[ line: 201 ]]
		-- upvalues: var14 (ref), var23 (ref), var24 (ref), var19 (ref), var20 (ref), var21 (ref), var15 (ref)
		if var14 then
			return nil
		end
		local var50 = if var23 then var24.titleJoin else var24.titleFollow
		
		if var19 then
			var50 = if var23 then var24.titleAlreadyMember else var24.titleAlreadyFollowing
		elseif var20 then
			var50 = var24.titleAlreadyRequested
		elseif not var21 then
			var50 = var24.titleUnableToJoin
		end
		return var50 or var15
	end, {
		var24, var15, var19, var20, var21, var23, var14
	})
	local font = var11.Typography.HeadingSmall.Font
	local fontSize = var11.Typography.HeadingSmall.FontSize
	local font_1 = var11.Typography.BodyMedium.Font
	local fontSize_1 = var11.Typography.BodyMedium.FontSize
	local medium = var11.Padding.Medium
	local var33 = reactModule.useMemo(function() --[[ line: 230 ]]
		-- upvalues: var32 (ref), var26 (ref), textService (copy), fontSize (ref), font (ref)
		return if var32 and var32 ~= "" and (var26 and var26 > 0) then textService:GetTextSize(var32, fontSize, font, Vector2.new(var26, 1e999)) else nil
	end, { var32, var26, font, fontSize })
	local var34 = reactModule.useMemo(function() --[[ line: 244 ]]
		-- upvalues: var31 (ref), var29 (ref), medium (ref), textService (copy), fontSize_1 (ref), font_1 (ref)
		if var31 and var29 and var29 > 0 then
			local var51 = var29 - medium * 2
			
			return if var51 > 0 then textService:GetTextSize(var31, fontSize_1, font_1, Vector2.new(var51, 1e999)) else nil
		end
	end, {
		var31,
		var29,
		font_1,
		fontSize_1,
		medium
	})
	local var35 = reactModule.useMemo(function() --[[ line: 261 ]]
		-- upvalues: var33 (ref), var34 (ref)
		local t = {}
		
		if var33 then
			t.title = var33
		end
		if var34 then
			t.subText = var34
		end
		return t
	end, { var33, var34 })
	local var36 = if p0.groupId then getRbxthumbWithTypeSizeAndOptions(tostring(p0.groupId), constants.RbxthumbTypes.GroupIcon, constantsModule.THUMBNAIL_SIZE) else nil
	local var37 = reactModule.useCallback(function() --[[ line: 281 ]]
		-- upvalues: var36 (ref), reactModule (copy), view (copy), var11 (ref), var13 (ref), loadableImage (copy)
		return if var36 then reactModule.createElement(view, {
			tag = "col size-full-0 auto-y align-x-center",
			LayoutOrder = 0
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var11.Padding.Medium),
				PaddingBottom = UDim.new(0, var11.Padding.Medium)
			}),
			ImageContainer = reactModule.createElement(view, { Size = UDim2.new(0, var13, 0, var13) }, {
				UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var13, var13) }),
				LoadableImage = reactModule.createElement(loadableImage, {
					BackgroundTransparency = 1,
					useShimmerAnimationWhileLoading = true,
					showFailedStateWhenLoadingFailed = true,
					Size = UDim2.fromScale(1, 1),
					Image = var36,
					cornerRadius = UDim.new(0, var11.Radius.Medium)
				})
			})
		}) else nil
	end, { var36, var11, var13 })
	local var38 = reactModule.useCallback(function() --[[ line: 310 ]]
		-- upvalues: reactModule (copy), view (copy), var25 (ref), var32 (ref), var14 (ref), var35 (ref), text (copy), var11 (ref), var26 (ref), skeleton (copy), fontSize (ref)
		return reactModule.createElement(view, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = 1,
			ref = var25
		}, {
			TitleText = if var32 and var32 ~= "" and (not var14 and var35) and var35.title then reactModule.createElement(text, {
				tag = "text-align-x-left",
				TextWrapped = true,
				Text = var32,
				fontStyle = var11.Typography.HeadingSmall,
				textStyle = var11.Color.Content.Emphasis,
				Size = UDim2.fromOffset(math.ceil(var35.title.X), math.ceil(var35.title.Y)),
				AutomaticSize = Enum.AutomaticSize.None
			}, {
				UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var26 or 1e999, 1e999) })
			}) elseif var32 and var32 ~= "" and not var14 then reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-align-x-left",
				TextWrapped = true,
				Text = var32,
				fontStyle = var11.Typography.HeadingSmall,
				textStyle = var11.Color.Content.Emphasis
			}) elseif var14 then reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, fontSize) }) else nil
		})
	end, {
		var32, var14, var35, var26, var11, var25, fontSize
	})
	local var39 = reactModule.useCallback(function() --[[ line: 348 ]]
		-- upvalues: var16 (ref), var14 (ref), reactModule (copy), view (copy), var11 (ref), verifiedBadgesModule (copy), var17 (ref), text (copy), var24 (ref), skeleton (copy), fontSize_1 (ref)
		return if not (var16 ~= nil and var16 ~= "" and not var14) then if var14 then reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, {
			UIPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var11.Padding.XSmall) }),
			Shimmer = reactModule.createElement(skeleton, { Size = UDim2.new(0.6, 0, 0, fontSize_1) })
		}) else nil else reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, {
			UIPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var11.Padding.XSmall) }),
			Content = reactModule.createElement(verifiedBadgesModule.EmojiWrapper, {
				emoji = if var17 then verifiedBadgesModule.emoji.verified else "",
				size = UDim2.new(1, 0, 0, 0),
				automaticSize = Enum.AutomaticSize.Y,
				horizontalAlignment = Enum.HorizontalAlignment.Left
			}, {
				Text = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-align-x-left",
					TextWrapped = true,
					Text = var24.ownerBy
				})
			})
		})
	end, {
		var16, var17, var14, var11, var24, fontSize_1
	})
	local var40 = useAbbreviatedNumberLocalization(var18)
	local var41 = reactModule.useCallback(function() --[[ line: 389 ]]
		-- upvalues: reactModule (copy), view (copy), var28 (ref), var11 (ref), var14 (ref), skeleton (copy), fontSize_1 (ref), var31 (ref), var35 (ref), text (copy), var29 (ref), var18 (ref), var40 (ref), var23 (ref), var24 (ref)
		return reactModule.createElement(view, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = 3,
			ref = var28
		}, {
			UIPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var11.Padding.Medium) }),
			Content = if var14 then reactModule.createElement(skeleton, { Size = UDim2.new(0.4, 0, 0, fontSize_1) }) elseif var31 ~= nil and var35 and var35.subText then if var31 ~= nil then if var18 and var18 > 0 then reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium text-align-x-left",
				TextWrapped = true,
				Text = var40 .. " " .. (if var23 then var24.members else var24.followers)
			}) else nil else reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium text-align-x-left",
				TextWrapped = true,
				Text = var31
			}) else reactModule.createElement(text, {
				tag = "text-body-medium text-align-x-left",
				TextWrapped = true,
				Text = var31,
				Size = UDim2.fromOffset(math.ceil(var35.subText.X), math.ceil(var35.subText.Y)),
				AutomaticSize = Enum.AutomaticSize.None
			}, {
				UISizeConstraint = reactModule.createElement("UISizeConstraint", {
					MaxSize = Vector2.new(if var29 then var29 - var11.Padding.Medium * 2 else 1e999, 1e999)
				})
			})
		})
	end, {
		var14, var31, var35, var29, var11, var18, var40, var23, var24, var28,
		fontSize_1
	})
	local var42, var43 = reactModule.useState(false)
	local var44 = reactModule.useCallback(function() --[[ line: 450 ]]
		-- upvalues: var42 (ref), var43 (ref), p0 (ref)
		if not var42 then
			var43(true)
			
			if p0.onJoin then
				p0.onJoin()
			end
		end
	end, { p0.onJoin })
	local var45 = reactModule.useCallback(function() --[[ line: 459 ]]
		-- upvalues: var42 (ref), p0 (ref)
		if not var42 and p0.onClose then
			p0.onClose()
		end
	end, { p0.onClose, var42 })
	
	return reactModule.createElement(dialog.Root, { size = dialogSize.Small, onClose = var45 }, {
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 1 }, {
			Content = reactModule.createElement(view, { tag = "col size-full-0 auto-y" }, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 0)
				}),
				GroupImage = var37(),
				Title = var38(),
				OwnerName = var39(),
				SubContent = var41()
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 2,
			actions = reactModule.useMemo(function() --[[ line: 467 ]]
				-- upvalues: var14 (ref), buttonVariant (copy), var19 (ref), var21 (ref), var20 (ref), var24 (ref), var45 (ref), var42 (ref), var23 (ref), var44 (ref), var12 (ref), constantsModule (copy)
				return if var14 then {
					{
						isLoading = true,
						isDisabled = true,
						variant = buttonVariant.Standard
					}
				} elseif var19 or not var21 or var20 then {
					{
						variant = buttonVariant.Standard,
						text = var24.closeButton,
						onActivated = var45,
						isDisabled = var42
					}
				} else {
					{
						variant = buttonVariant.Emphasis,
						text = if var23 then var24.joinGroup else var24.followGroup,
						onActivated = var44,
						inputDelay = if var12 then constantsModule.ACCEPT_DELAY_SECONDS else nil,
						isLoading = var42,
						isDisabled = var42
					},
					{
						variant = buttonVariant.Standard,
						text = var24.notNowButton,
						onActivated = var45,
						isDisabled = var42
					}
				}
			end, {
				var24, var44, var45, var12, var20, var21, var19, var42, var23
			})
		})
	})
end