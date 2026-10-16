local TextService = game:GetService("TextService")
local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local EnumsModule = require(Parent.ProfilePlatform.Enums)
local FoundationModule = require(Parent.Foundation)
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local UserLibModule = require(Parent.UserLib)
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = UserLibModule.Utils.Constants
local VerifiedBadgesModule = require(Parent.VerifiedBadges)
local MouseIconOverrideService = require(Parent.CoreScriptsCommon).MouseIconOverrideService
local UseScreenSizeFunction = require(Parent.CoreScriptsRoactCommon).useScreenSize
local LoadableImage = require(Parent.UIBlox).App.Loading.LoadableImage
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UseAbbreviatedNumberLocalizationFunction = LocalizationModule.Hooks.useAbbreviatedNumberLocalization
local Text = FoundationModule.Text
local View = FoundationModule.View
local Skeleton = FoundationModule.Skeleton
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _ = require(Groups.Common.Types)
local ConstantsModule = require(Groups.Common.constants)
local config = {
	[EnumsModule.DisabledReasons.BannedFromCommunity] = "subTextBannedFromCommunity",
	[EnumsModule.DisabledReasons.CommunityIsClosed] = "subTextGroupClosed",
	[EnumsModule.DisabledReasons.MaxCommunitiesJoined] = "subTextPremiumMaxGroups",
	[EnumsModule.DisabledReasons.AccountCreatedLessThanOneDay] = "subTextRequiresAccountTenureTooltipOneDay",
	[EnumsModule.DisabledReasons.AccountCreatedLessThanThreeDays] = "subTextRequiresAccountTenureTooltipThreeDays",
	[EnumsModule.DisabledReasons.AccountCreatedLessThanOneWeek] = "subTextRequiresAccountTenureTooltipOneWeek",
	[EnumsModule.DisabledReasons.AccountCreatedLessThanOneMonth] = "subTextRequiresAccountTenureTooltipOneMonth",
	[EnumsModule.DisabledReasons.AccountCreatedLessThanThreeMonths] = "subTextRequiresAccountTenureTooltipThreeMonths",
	[EnumsModule.DisabledReasons.InsufficientVerificationLevelHigh] = "subTextInsufficientVerificationLevelHigh",
	[EnumsModule.DisabledReasons.InsufficientVerificationLevelMedium] = "subTextInsufficientVerificationLevelMedium",
	[EnumsModule.DisabledReasons.InsufficientVerificationLevelLow] = "subTextInsufficientVerificationLevelLow"
}

return function(p1) --[[ Line: 64 ]]
	-- upvalues: UseTokensFunction (copy), UseScreenSizeFunction (copy), ConstantsModule (copy), UseLocalizationFunction (copy), ReactModule (copy), MouseIconOverrideService (copy), EnumsModule (copy), config (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TextService (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), View (copy), LoadableImage (copy), Text (copy), Skeleton (copy), VerifiedBadgesModule (copy), UseAbbreviatedNumberLocalizationFunction (copy), ButtonVariant (copy), Dialog (copy), DialogSize (copy)
	local UseTokensResult = UseTokensFunction()
	local NoEnableInputDelayed = p1.enableInputDelayed == nil or p1.enableInputDelayed
	local THUMBNAILSIZESMALL = if UseScreenSizeFunction().Y < ConstantsModule.SMALL_SCREEN_HEIGHT_THRESHOLD then ConstantsModule.THUMBNAIL_SIZE_SMALL else ConstantsModule.THUMBNAIL_SIZE
	local Data = p1.data
	local NoData = Data == nil
	local GroupName = if Data then Data.groupName else nil
	local OwnerName = if Data then Data.ownerName else nil
	local OwnerIsVerified = if Data then Data.ownerIsVerified else false
	local MembersCount = if Data then Data.membersCount else 0
	local IsAlreadyMember = if Data then Data.isAlreadyMember else false
	local HasPendingRequest = if Data then Data.hasPendingRequest else false
	local IsEligible = if Data then Data.isEligible else false
	local DisabledReason = if Data then Data.disabledReason else nil
	local NoData1 = not Data or Data.hasSocialModules == nil or Data.hasSocialModules
	local UseLocalizationResult = UseLocalizationFunction({
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
		titleJoin = { "Feature.Groups.Title.Join", groupName = GroupName or "" },
		titleFollow = {
			"Feature.Groups.Title.Follow",
			groupName = GroupName or ""
		},
		titleAlreadyRequested = {
			"Feature.Groups.Title.RequestedToJoin",
			groupName = GroupName or ""
		},
		titleAlreadyMember = {
			"Feature.Groups.Title.AlreadyMember",
			groupName = GroupName or ""
		},
		titleAlreadyFollowing = {
			"Feature.Groups.Title.AlreadyFollowing",
			groupName = GroupName or ""
		},
		titleUnableToJoin = {
			"Feature.Groups.Title.UnableToJoin",
			groupName = GroupName or ""
		},
		ownerBy = {
			"Feature.Groups.Label.ByOwnerWithFormat",
			ownerName = OwnerName or ""
		}
	})
	ReactModule.useEffect(function() --[[ Line: 127 ]]
		-- upvalues: MouseIconOverrideService (upval)
		MouseIconOverrideService.push("GroupJoinPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow)
		
		return function() --[[ Line: 130 ]]
			-- upvalues: MouseIconOverrideService (upval)
			MouseIconOverrideService.pop("GroupJoinPromptOverride")
		end
	end, {})
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	ReactModule.useEffect(function() --[[ Line: 141 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy), UseStateResult (copy)
		local Connection = nil
		
		if UseRefResult.current then
			local Current = UseRefResult.current
			
			if Current.AbsoluteSize.X > 0 then
				UseStateResult2(Current.AbsoluteSize.X)
			end
			Connection = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 148 ]]
				-- upvalues: Current (copy), UseStateResult (upval), UseStateResult2 (upval)
				if Current.AbsoluteSize.X > 0 and Current.AbsoluteSize.X ~= UseStateResult then
					UseStateResult2(Current.AbsoluteSize.X)
				end
			end)
		end
		return function() --[[ Line: 154 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end
	end, { UseStateResult })
	ReactModule.useEffect(function() --[[ Line: 162 ]]
		-- upvalues: UseRefResult1 (copy), UseStateResult2_1 (copy), UseStateResult1 (copy)
		local Connection = nil
		
		if UseRefResult1.current then
			local Current = UseRefResult1.current
			
			if Current.AbsoluteSize.X > 0 then
				UseStateResult2_1(Current.AbsoluteSize.X)
			end
			Connection = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 169 ]]
				-- upvalues: Current (copy), UseStateResult1 (upval), UseStateResult2_1 (upval)
				if Current.AbsoluteSize.X > 0 and Current.AbsoluteSize.X ~= UseStateResult1 then
					UseStateResult2_1(Current.AbsoluteSize.X)
				end
			end)
		end
		return function() --[[ Line: 175 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end
	end, { UseStateResult1 })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 183 ]]
		-- upvalues: HasPendingRequest (copy), UseLocalizationResult (copy), IsAlreadyMember (copy), IsEligible (copy), DisabledReason (copy), EnumsModule (upval), config (upval)
		if HasPendingRequest then
			return UseLocalizationResult.subTextPendingRequest
		end
		if IsAlreadyMember or IsEligible or not DisabledReason then
			return nil
		end
		local DisabledReason1 = EnumsModule.DisabledReasons[DisabledReason]
		
		if DisabledReason1 then
			local Entry = config[DisabledReason1]
			
			if Entry then
				return UseLocalizationResult[Entry]
			end
		end
		return UseLocalizationResult.subTextNotEligible
	end, {
		UseLocalizationResult,
		IsAlreadyMember,
		HasPendingRequest,
		IsEligible,
		DisabledReason
	})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 204 ]]
		-- upvalues: NoData (copy), NoData1 (copy), UseLocalizationResult (copy), IsAlreadyMember (copy), HasPendingRequest (copy), IsEligible (copy), GroupName (copy)
		if NoData then
			return nil
		else
			local TitleAlreadyMember = if IsAlreadyMember then if NoData1 then UseLocalizationResult.titleAlreadyMember else UseLocalizationResult.titleAlreadyFollowing elseif HasPendingRequest then UseLocalizationResult.titleAlreadyRequested elseif IsEligible then if NoData1 then UseLocalizationResult.titleJoin else UseLocalizationResult.titleFollow else UseLocalizationResult.titleUnableToJoin
			
			return if TitleAlreadyMember then TitleAlreadyMember else GroupName
		end
	end, {
		UseLocalizationResult, GroupName, IsAlreadyMember, HasPendingRequest,
		IsEligible, NoData1, NoData
	})
	local HeadingSmallFont = UseTokensResult.Typography.HeadingSmall.Font
	local FontSize = UseTokensResult.Typography.HeadingSmall.FontSize
	local BodyMediumFont = UseTokensResult.Typography.BodyMedium.Font
	local FontSize1 = UseTokensResult.Typography.BodyMedium.FontSize
	local Medium = UseTokensResult.Padding.Medium
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 233 ]]
		-- upvalues: UseMemoResult1 (copy), UseStateResult (copy), FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), FontSize (copy), HeadingSmallFont (copy), TextService (upval)
		return if UseMemoResult1 and UseMemoResult1 ~= "" and UseStateResult and UseStateResult > 0 then if FoundationFontFaceMigration then GetTextSizeFunction(UseMemoResult1, FontSize, HeadingSmallFont, Vector2.new(UseStateResult, 1e999), { addTemporaryPadding = false }) else TextService:GetTextSize(UseMemoResult1, FontSize, HeadingSmallFont, Vector2.new(UseStateResult, 1e999)) else nil
	end, {
		UseMemoResult1,
		UseStateResult,
		HeadingSmallFont,
		FontSize
	})
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 255 ]]
		-- upvalues: UseMemoResult (copy), UseStateResult1 (copy), Medium (copy), FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), FontSize1 (copy), BodyMediumFont (copy), TextService (upval)
		if UseMemoResult and UseStateResult1 and UseStateResult1 > 0 then
			local UseStateResultDelta = UseStateResult1 - Medium * 2
			
			if UseStateResultDelta > 0 then
				return if FoundationFontFaceMigration then GetTextSizeFunction(UseMemoResult, FontSize1, BodyMediumFont, Vector2.new(UseStateResultDelta, 1e999), { addTemporaryPadding = false }) else TextService:GetTextSize(UseMemoResult, FontSize1, BodyMediumFont, Vector2.new(UseStateResultDelta, 1e999))
			end
		end
		return nil
	end, {
		UseMemoResult,
		UseStateResult1,
		BodyMediumFont,
		FontSize1,
		Medium
	})
	local UseMemoResult4 = ReactModule.useMemo(function() --[[ Line: 280 ]]
		-- upvalues: UseMemoResult2 (copy), UseMemoResult3 (copy)
		local t = {}
		
		if UseMemoResult2 then
			t.title = UseMemoResult2
		end
		if UseMemoResult3 then
			t.subText = UseMemoResult3
		end
		return t
	end, { UseMemoResult2, UseMemoResult3 })
	local RbxthumbWithTypeSizeAndOptions = if p1.groupId then GetRbxthumbWithTypeSizeAndOptionsFunction(tostring(p1.groupId), Constants.RbxthumbTypes.GroupIcon, ConstantsModule.THUMBNAIL_SIZE) else nil
	local UseResult = ReactModule.useCallback(function() --[[ Line: 300 ]]
		-- upvalues: RbxthumbWithTypeSizeAndOptions (copy), ReactModule (upval), View (upval), UseTokensResult (copy), THUMBNAILSIZESMALL (copy), LoadableImage (upval)
		return if RbxthumbWithTypeSizeAndOptions then ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y align-x-center",
			LayoutOrder = 0
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, UseTokensResult.Padding.Medium),
				PaddingBottom = UDim.new(0, UseTokensResult.Padding.Medium)
			}),
			ImageContainer = ReactModule.createElement(View, {
				Size = UDim2.new(0, THUMBNAILSIZESMALL, 0, THUMBNAILSIZESMALL)
			}, {
				UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
					MaxSize = Vector2.new(THUMBNAILSIZESMALL, THUMBNAILSIZESMALL)
				}),
				LoadableImage = ReactModule.createElement(LoadableImage, {
					BackgroundTransparency = 1,
					useShimmerAnimationWhileLoading = true,
					showFailedStateWhenLoadingFailed = true,
					Size = UDim2.fromScale(1, 1),
					Image = RbxthumbWithTypeSizeAndOptions,
					cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
				})
			})
		}) else nil
	end, {
		RbxthumbWithTypeSizeAndOptions,
		UseTokensResult,
		THUMBNAILSIZESMALL
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 329 ]]
		-- upvalues: ReactModule (upval), View (upval), UseRefResult (copy), UseMemoResult1 (copy), NoData (copy), UseMemoResult4 (copy), Text (upval), UseTokensResult (copy), UseStateResult (copy), Skeleton (upval), FontSize (copy)
		return ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = 1,
			ref = UseRefResult
		}, {
			TitleText = if UseMemoResult1 and UseMemoResult1 ~= "" and not NoData and UseMemoResult4 and UseMemoResult4.title then ReactModule.createElement(Text, {
				tag = "text-align-x-left",
				TextWrapped = true,
				Text = UseMemoResult1,
				fontStyle = UseTokensResult.Typography.HeadingSmall,
				textStyle = UseTokensResult.Color.Content.Emphasis,
				Size = UDim2.fromOffset(math.ceil(UseMemoResult4.title.X), (math.ceil(UseMemoResult4.title.Y))),
				AutomaticSize = Enum.AutomaticSize.None
			}, {
				UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
					MaxSize = Vector2.new(if UseStateResult then UseStateResult else 1e999, 1e999)
				})
			}) elseif UseMemoResult1 and UseMemoResult1 ~= "" and not NoData then ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-align-x-left",
				TextWrapped = true,
				Text = UseMemoResult1,
				fontStyle = UseTokensResult.Typography.HeadingSmall,
				textStyle = UseTokensResult.Color.Content.Emphasis
			}) elseif NoData then ReactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, FontSize) }) else nil
		})
	end, {
		UseMemoResult1, NoData, UseMemoResult4, UseStateResult, UseTokensResult,
		UseRefResult, FontSize
	})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 367 ]]
		-- upvalues: OwnerName (copy), NoData (copy), ReactModule (upval), View (upval), UseTokensResult (copy), VerifiedBadgesModule (upval), OwnerIsVerified (copy), Text (upval), UseLocalizationResult (copy), Skeleton (upval), FontSize1 (copy)
		return if OwnerName == nil or OwnerName == "" or NoData then if NoData then ReactModule.createElement(View, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, {
			UIPadding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, UseTokensResult.Padding.XSmall) }),
			Shimmer = ReactModule.createElement(Skeleton, { Size = UDim2.new(0.6, 0, 0, FontSize1) })
		}) else nil else ReactModule.createElement(View, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, {
			UIPadding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, UseTokensResult.Padding.XSmall) }),
			Content = ReactModule.createElement(VerifiedBadgesModule.EmojiWrapper, {
				emoji = if OwnerIsVerified then VerifiedBadgesModule.emoji.verified else "",
				size = UDim2.new(1, 0, 0, 0),
				automaticSize = Enum.AutomaticSize.Y,
				horizontalAlignment = Enum.HorizontalAlignment.Left
			}, {
				Text = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-body-medium text-align-x-left",
					TextWrapped = true,
					Text = UseLocalizationResult.ownerBy
				})
			})
		})
	end, {
		OwnerName, OwnerIsVerified, NoData, UseTokensResult, UseLocalizationResult,
		FontSize1
	})
	local UseAbbreviatedNumberLocalizationResult = UseAbbreviatedNumberLocalizationFunction(MembersCount)
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 408 ]]
		-- upvalues: ReactModule (upval), View (upval), UseRefResult1 (copy), UseTokensResult (copy), NoData (copy), Skeleton (upval), FontSize1 (copy), UseMemoResult (copy), UseMemoResult4 (copy), Text (upval), UseStateResult1 (copy), MembersCount (copy), UseAbbreviatedNumberLocalizationResult (copy), NoData1 (copy), UseLocalizationResult (copy)
		return ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = 3,
			ref = UseRefResult1
		}, {
			UIPadding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, UseTokensResult.Padding.Medium) }),
			Content = if NoData then ReactModule.createElement(Skeleton, { Size = UDim2.new(0.4, 0, 0, FontSize1) }) elseif UseMemoResult == nil or not UseMemoResult4 or not UseMemoResult4.subText then if UseMemoResult == nil then if MembersCount and MembersCount > 0 then ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-body-medium text-align-x-left",
				TextWrapped = true,
				Text = UseAbbreviatedNumberLocalizationResult .. " " .. (if NoData1 then UseLocalizationResult.members else UseLocalizationResult.followers)
			}) else nil else ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-body-medium text-align-x-left",
				TextWrapped = true,
				Text = UseMemoResult
			}) else ReactModule.createElement(Text, {
				tag = "text-body-medium text-align-x-left",
				TextWrapped = true,
				Text = UseMemoResult,
				Size = UDim2.fromOffset(math.ceil(UseMemoResult4.subText.X), (math.ceil(UseMemoResult4.subText.Y))),
				AutomaticSize = Enum.AutomaticSize.None
			}, {
				UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
					MaxSize = Vector2.new(if UseStateResult1 then UseStateResult1 - UseTokensResult.Padding.Medium * 2 else 1e999, 1e999)
				})
			})
		})
	end, {
		NoData, UseMemoResult, UseMemoResult4, UseStateResult1, UseTokensResult,
		MembersCount, UseAbbreviatedNumberLocalizationResult, NoData1,
		UseLocalizationResult, UseRefResult1, FontSize1
	})
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 469 ]]
		-- upvalues: UseStateResult3 (copy), UseStateResult2_2 (copy), p1 (copy)
		if not UseStateResult3 then
			UseStateResult2_2(true)
			
			if p1.onJoin then
				p1.onJoin()
			end
		end
	end, { p1.onJoin })
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 478 ]]
		-- upvalues: UseStateResult3 (copy), p1 (copy)
		if not UseStateResult3 and p1.onClose then
			p1.onClose()
		end
	end, { p1.onClose, UseStateResult3 })
	
	return ReactModule.createElement(Dialog.Root, { size = DialogSize.Small, onClose = UseResult5 }, {
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 1 }, {
			Content = ReactModule.createElement(View, { tag = "col size-full-0 auto-y" }, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 0)
				}),
				GroupImage = UseResult(),
				Title = UseResult1(),
				OwnerName = UseResult2(),
				SubContent = UseResult3()
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 2,
			actions = ReactModule.useMemo(function() --[[ Line: 486 ]]
				-- upvalues: NoData (copy), ButtonVariant (upval), IsAlreadyMember (copy), IsEligible (copy), HasPendingRequest (copy), UseLocalizationResult (copy), UseResult5 (copy), UseStateResult3 (copy), NoData1 (copy), UseResult4 (copy), NoEnableInputDelayed (copy), ConstantsModule (upval)
				return if NoData then {
					{
						isLoading = true,
						isDisabled = true,
						variant = ButtonVariant.Standard
					}
				} elseif IsAlreadyMember or not IsEligible or HasPendingRequest then {
					{
						variant = ButtonVariant.Standard,
						text = UseLocalizationResult.closeButton,
						onActivated = UseResult5,
						isDisabled = UseStateResult3
					}
				} else {
					{
						variant = ButtonVariant.Emphasis,
						text = NoData1 and UseLocalizationResult.joinGroup or UseLocalizationResult.followGroup,
						onActivated = UseResult4,
						inputDelay = if NoEnableInputDelayed then ConstantsModule.ACCEPT_DELAY_SECONDS else nil,
						isLoading = UseStateResult3,
						isDisabled = UseStateResult3
					},
					{
						variant = ButtonVariant.Standard,
						text = UseLocalizationResult.notNowButton,
						onActivated = UseResult5,
						isDisabled = UseStateResult3
					}
				}
			end, {
				UseLocalizationResult, UseResult4, UseResult5, NoEnableInputDelayed,
				HasPendingRequest, IsEligible, IsAlreadyMember, UseStateResult3, NoData1
			})
		})
	})
end