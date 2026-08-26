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

return function(p1)
	-- upvalues: useTokens (ref), useScreenSize (ref), constantsModule (ref), useLocalization (ref), reactModule (ref), mouseIconOverrideService (ref), enumsModule (ref), t (ref), textService (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), view (ref), loadableImage (ref), text (ref), skeleton (ref), verifiedBadgesModule (ref), useAbbreviatedNumberLocalization (ref), buttonVariant (ref), dialog (ref), dialogSize (ref)
	local var1 = useTokens()
	local var2 = p1.enableInputDelayed ~= nil or p1.enableInputDelayed
	local var3 = if useScreenSize().Y < constantsModule.SMALL_SCREEN_HEIGHT_THRESHOLD then constantsModule.THUMBNAIL_SIZE_SMALL else constantsModule.THUMBNAIL_SIZE
	local data = p1.data
	local var4 = data == nil
	local var5 = if data then data.groupName else nil
	local var6 = if data then data.ownerName else nil
	local var7 = if data then data.ownerIsVerified else false
	local var8 = if data then data.membersCount else 0
	local var9 = if data then data.isAlreadyMember else false
	local var10 = if data then data.hasPendingRequest else false
	local var11 = if data then data.isEligible else false
	local var12 = if data then data.disabledReason else nil
	local var13 = if data and data.hasSocialModules ~= nil then data.hasSocialModules else true
	local var14 = useLocalization({
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
		titleJoin = { "Feature.Groups.Title.Join", groupName = var5 or "" },
		titleFollow = { "Feature.Groups.Title.Follow", groupName = var5 or "" },
		titleAlreadyRequested = {
			"Feature.Groups.Title.RequestedToJoin",
			groupName = var5 or ""
		},
		titleAlreadyMember = {
			"Feature.Groups.Title.AlreadyMember",
			groupName = var5 or ""
		},
		titleAlreadyFollowing = {
			"Feature.Groups.Title.AlreadyFollowing",
			groupName = var5 or ""
		},
		titleUnableToJoin = {
			"Feature.Groups.Title.UnableToJoin",
			groupName = var5 or ""
		},
		ownerBy = {
			"Feature.Groups.Label.ByOwnerWithFormat",
			ownerName = var6 or ""
		}
	})
	reactModule.useEffect(function()
		-- upvalues: mouseIconOverrideService (copy)
		mouseIconOverrideService.push("GroupJoinPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow)
		
		return function()
			-- upvalues: mouseIconOverrideService (copy)
			mouseIconOverrideService.pop("GroupJoinPromptOverride")
		end
	end, {})
	local var15 = reactModule.useRef(nil)
	local var16, var17 = reactModule.useState(nil)
	local var18 = reactModule.useRef(nil)
	local var19, var20 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var17 (ref), var16 (ref)
		local var21 = nil
		
		if var15.current then
			local current = var15.current
			
			if current.AbsoluteSize.X > 0 then
				var17(current.AbsoluteSize.X)
			end
			var21 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: current (ref), var16 (copy), var17 (copy)
				if current.AbsoluteSize.X > 0 and current.AbsoluteSize.X ~= var16 then
					var17(current.AbsoluteSize.X)
				end
			end)
		end
		return function()
			-- upvalues: var21 (write)
			if var21 then
				var21:Disconnect()
				var21 = nil
			end
		end
	end, { var16 })
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var20 (ref), var19 (ref)
		local var21 = nil
		
		if var18.current then
			local current = var18.current
			
			if current.AbsoluteSize.X > 0 then
				var20(current.AbsoluteSize.X)
			end
			var21 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: current (ref), var19 (copy), var20 (copy)
				if current.AbsoluteSize.X > 0 and current.AbsoluteSize.X ~= var19 then
					var20(current.AbsoluteSize.X)
				end
			end)
		end
		return function()
			-- upvalues: var21 (write)
			if var21 then
				var21:Disconnect()
				var21 = nil
			end
		end
	end, { var19 })
	local var21 = reactModule.useMemo(function()
		-- upvalues: var10 (ref), var14 (ref), var9 (ref), var11 (ref), var12 (ref), enumsModule (copy), t (copy)
		if var10 then
			return var14.subTextPendingRequest
		elseif var9 or var11 or not var12 then
			return nil
		end
		local var22 = enumsModule.DisabledReasons[var12]
		
		if var22 then
			local var23 = t[var22]
			
			return if var23 then var14[var23] else var14.subTextNotEligible
		end
	end, {
		var14,
		var9,
		var10,
		var11,
		var12
	})
	local var22 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), var13 (ref), var14 (ref), var9 (ref), var10 (ref), var11 (ref), var5 (ref)
		if var4 then
			return nil
		end
		local var23 = if var13 then var14.titleJoin else var14.titleFollow
		
		if var9 then
			var23 = if var13 then var14.titleAlreadyMember else var14.titleAlreadyFollowing
		elseif var10 then
			var23 = var14.titleAlreadyRequested
		elseif not var11 then
			var23 = var14.titleUnableToJoin
		end
		return var23 or var5
	end, {
		var14, var5, var9, var10, var11, var13, var4
	})
	local font = var1.Typography.HeadingSmall.Font
	local fontSize = var1.Typography.HeadingSmall.FontSize
	local font_1 = var1.Typography.BodyMedium.Font
	local fontSize_1 = var1.Typography.BodyMedium.FontSize
	local medium = var1.Padding.Medium
	local var23 = reactModule.useMemo(function()
		-- upvalues: var22 (ref), var16 (ref), textService (copy), fontSize (ref), font (ref)
		return if var22 and var22 ~= "" and (var16 and var16 > 0) then textService:GetTextSize(var22, fontSize, font, Vector2.new(var16, 1e999)) else nil
	end, { var22, var16, font, fontSize })
	local var24 = reactModule.useMemo(function()
		-- upvalues: var21 (ref), var19 (ref), medium (ref), textService (copy), fontSize_1 (ref), font_1 (ref)
		if var21 and var19 and var19 > 0 then
			local var25 = var19 - medium * 2
			
			return if var25 > 0 then textService:GetTextSize(var21, fontSize_1, font_1, Vector2.new(var25, 1e999)) else nil
		end
	end, {
		var21,
		var19,
		font_1,
		fontSize_1,
		medium
	})
	local var25 = reactModule.useMemo(function()
		-- upvalues: var23 (ref), var24 (ref)
		local t = {}
		
		if var23 then
			t.title = var23
		end
		if var24 then
			t.subText = var24
		end
		return t
	end, { var23, var24 })
	local var26 = if p1.groupId then getRbxthumbWithTypeSizeAndOptions(tostring(p1.groupId), constants.RbxthumbTypes.GroupIcon, constantsModule.THUMBNAIL_SIZE) else nil
	local var27 = reactModule.useCallback(function()
		-- upvalues: var26 (ref), reactModule (copy), view (copy), var1 (ref), var3 (ref), loadableImage (copy)
		return if var26 then reactModule.createElement(view, {
			tag = "col size-full-0 auto-y align-x-center",
			LayoutOrder = 0
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var1.Padding.Medium),
				PaddingBottom = UDim.new(0, var1.Padding.Medium)
			}),
			ImageContainer = reactModule.createElement(view, { Size = UDim2.new(0, var3, 0, var3) }, {
				UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var3, var3) }),
				LoadableImage = reactModule.createElement(loadableImage, {
					BackgroundTransparency = 1,
					useShimmerAnimationWhileLoading = true,
					showFailedStateWhenLoadingFailed = true,
					Size = UDim2.fromScale(1, 1),
					Image = var26,
					cornerRadius = UDim.new(0, var1.Radius.Medium)
				})
			})
		}) else nil
	end, { var26, var1, var3 })
	local var28 = reactModule.useCallback(function()
		-- upvalues: reactModule (copy), view (copy), var15 (ref), var22 (ref), var4 (ref), var25 (ref), text (copy), var1 (ref), var16 (ref), skeleton (copy), fontSize (ref)
		return reactModule.createElement(view, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = 1,
			ref = var15
		}, {
			TitleText = if var22 and var22 ~= "" and (not var4 and var25) and var25.title then reactModule.createElement(text, {
				tag = "text-align-x-left",
				TextWrapped = true,
				Text = var22,
				fontStyle = var1.Typography.HeadingSmall,
				textStyle = var1.Color.Content.Emphasis,
				Size = UDim2.fromOffset(math.ceil(var25.title.X), math.ceil(var25.title.Y)),
				AutomaticSize = Enum.AutomaticSize.None
			}, {
				UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var16 or 1e999, 1e999) })
			}) elseif var22 and var22 ~= "" and not var4 then reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-align-x-left",
				TextWrapped = true,
				Text = var22,
				fontStyle = var1.Typography.HeadingSmall,
				textStyle = var1.Color.Content.Emphasis
			}) elseif var4 then reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, fontSize) }) else nil
		})
	end, {
		var22, var4, var25, var16, var1, var15, fontSize
	})
	local var29 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var4 (ref), reactModule (copy), view (copy), var1 (ref), verifiedBadgesModule (copy), var7 (ref), text (copy), var14 (ref), skeleton (copy), fontSize_1 (ref)
		return if not (var6 ~= nil and var6 ~= "" and not var4) then if var4 then reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, {
			UIPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var1.Padding.XSmall) }),
			Shimmer = reactModule.createElement(skeleton, { Size = UDim2.new(0.6, 0, 0, fontSize_1) })
		}) else nil else reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, {
			UIPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var1.Padding.XSmall) }),
			Content = reactModule.createElement(verifiedBadgesModule.EmojiWrapper, {
				emoji = if var7 then verifiedBadgesModule.emoji.verified else "",
				size = UDim2.new(1, 0, 0, 0),
				automaticSize = Enum.AutomaticSize.Y,
				horizontalAlignment = Enum.HorizontalAlignment.Left
			}, {
				Text = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-align-x-left",
					TextWrapped = true,
					Text = var14.ownerBy
				})
			})
		})
	end, {
		var6, var7, var4, var1, var14, fontSize_1
	})
	local var30 = useAbbreviatedNumberLocalization(var8)
	local var31 = reactModule.useCallback(function()
		-- upvalues: reactModule (copy), view (copy), var18 (ref), var1 (ref), var4 (ref), skeleton (copy), fontSize_1 (ref), var21 (ref), var25 (ref), text (copy), var19 (ref), var8 (ref), var30 (ref), var13 (ref), var14 (ref)
		return reactModule.createElement(view, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = 3,
			ref = var18
		}, {
			UIPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var1.Padding.Medium) }),
			Content = if var4 then reactModule.createElement(skeleton, { Size = UDim2.new(0.4, 0, 0, fontSize_1) }) elseif var21 ~= nil and var25 and var25.subText then if var21 ~= nil then if var8 and var8 > 0 then reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium text-align-x-left",
				TextWrapped = true,
				Text = var30 .. " " .. (if var13 then var14.members else var14.followers)
			}) else nil else reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium text-align-x-left",
				TextWrapped = true,
				Text = var21
			}) else reactModule.createElement(text, {
				tag = "text-body-medium text-align-x-left",
				TextWrapped = true,
				Text = var21,
				Size = UDim2.fromOffset(math.ceil(var25.subText.X), math.ceil(var25.subText.Y)),
				AutomaticSize = Enum.AutomaticSize.None
			}, {
				UISizeConstraint = reactModule.createElement("UISizeConstraint", {
					MaxSize = Vector2.new(if var19 then var19 - var1.Padding.Medium * 2 else 1e999, 1e999)
				})
			})
		})
	end, {
		var4, var21, var25, var19, var1, var8, var30, var13, var14, var18,
		fontSize_1
	})
	local var32, var33 = reactModule.useState(false)
	local var34 = reactModule.useCallback(function()
		-- upvalues: var32 (ref), var33 (ref), p1 (ref)
		if not var32 then
			var33(true)
			
			if p1.onJoin then
				p1.onJoin()
			end
		end
	end, { p1.onJoin })
	local var35 = reactModule.useCallback(function()
		-- upvalues: var32 (ref), p1 (ref)
		if not var32 and p1.onClose then
			p1.onClose()
		end
	end, { p1.onClose, var32 })
	
	return reactModule.createElement(dialog.Root, { size = dialogSize.Small, onClose = var35 }, {
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 1 }, {
			Content = reactModule.createElement(view, { tag = "col size-full-0 auto-y" }, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 0)
				}),
				GroupImage = var27(),
				Title = var28(),
				OwnerName = var29(),
				SubContent = var31()
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 2,
			actions = reactModule.useMemo(function()
				-- upvalues: var4 (ref), buttonVariant (copy), var9 (ref), var11 (ref), var10 (ref), var14 (ref), var35 (ref), var32 (ref), var13 (ref), var34 (ref), var2 (ref), constantsModule (copy)
				return if var4 then {
					{
						isLoading = true,
						isDisabled = true,
						variant = buttonVariant.Standard
					}
				} elseif var9 or not var11 or var10 then {
					{
						variant = buttonVariant.Standard,
						text = var14.closeButton,
						onActivated = var35,
						isDisabled = var32
					}
				} else {
					{
						variant = buttonVariant.Emphasis,
						text = if var13 then var14.joinGroup else var14.followGroup,
						onActivated = var34,
						inputDelay = if var2 then constantsModule.ACCEPT_DELAY_SECONDS else nil,
						isLoading = var32,
						isDisabled = var32
					},
					{
						variant = buttonVariant.Standard,
						text = var14.notNowButton,
						onActivated = var35,
						isDisabled = var32
					}
				}
			end, {
				var14, var34, var35, var2, var10, var11, var9, var32, var13
			})
		})
	})
end