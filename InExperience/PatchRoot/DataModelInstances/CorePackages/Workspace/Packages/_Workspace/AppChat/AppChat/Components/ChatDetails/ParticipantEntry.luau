local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FFlagAppChatUseProfileFrameThumbnailModule = require(AppChat.Flags.FFlagAppChatUseProfileFrameThumbnail)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = require(Parent.AppCommonLib).Text
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseUserDataModule = require(AppChat.Hooks.useUserData)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local UseIsRobloxSubscriberFunction = require(Parent.UserProfiles).Hooks.useIsRobloxSubscriber
local Repeated = string.rep("W", 20)
local config = { showDivider = true }

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseUserDataModule (copy), UseTokensFunction (copy), UseIsRobloxSubscriberFunction (copy), FFlagEnableBlackbirdCheck (copy), ReactModule (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), Repeated (copy), Text (copy), FoundationModule (copy), FFlagAppChatUseProfileFrameThumbnailModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseUserDataModuleResult = UseUserDataModule(UnionResult.userId)
	local UseTokensResult = UseTokensFunction()
	local UseIsRobloxSubscriberResult = UseIsRobloxSubscriberFunction(if FFlagEnableBlackbirdCheck then UnionResult.userId else nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UnionResult (copy)
		if UnionResult.onActivated then
			UnionResult.onActivated()
		end
	end, { UnionResult.onActivated })
	local UseMemoResult = ReactModule.useMemo(function(): UDim2
		-- upvalues: FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), Repeated (upval), UseTokensResult (copy), Text (upval)
		local TextSize = if FoundationFontFaceMigration then GetTextSizeFunction(Repeated, UseTokensResult.Typography.TitleLarge.FontSize, UseTokensResult.Typography.TitleLarge.Font, Vector2.zero) else Text.GetTextBounds(Repeated, UseTokensResult.Typography.TitleLarge.Font, UseTokensResult.Typography.TitleLarge.FontSize, Vector2.zero)
		
		return UDim2.fromOffset(TextSize.X, TextSize.Y)
	end, {
		UseTokensResult.Typography.TitleLarge.Font,
		UseTokensResult.Typography.TitleLarge.FontSize
	})
	
	return ReactModule.createElement(FoundationModule.View, {
		Name = "ParticipantEntryContainer",
		tag = {
			["row align-y-center gap-medium size-full padding-x-medium"] = true,
			["stroke-thin stroke-muted"] = UnionResult.showDivider
		},
		onActivated = if UnionResult.onActivated then UseResult else nil
	}, {
		Avatar = ReactModule.createElement(FoundationModule.Avatar, {
			LayoutOrder = 1,
			userId = UseUserDataModuleResult.id,
			userPresence = UseUserDataModuleResult.presence,
			size = FoundationModule.Enums.InputSize.Medium,
			backgroundStyle = UseTokensResult.Color.Shift.Shift_300,
			includeProfileFrame = FFlagAppChatUseProfileFrameThumbnailModule
		}),
		UserInfo = ReactModule.createElement(FoundationModule.View, { tag = "col fill auto-y clip", LayoutOrder = 2 }, {
			UserDataSkeleton = ReactModule.createElement(FoundationModule.Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(UseMemoResult.X, UseMemoResult.Y + ReactModule.useMemo(function(): UDim2
					-- upvalues: FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), UseTokensResult (copy), Text (upval)
					local RobloxStudio = if FoundationFontFaceMigration then GetTextSizeFunction("Roblox Studio", UseTokensResult.Typography.CaptionMedium.FontSize, UseTokensResult.Typography.CaptionMedium.Font, Vector2.zero) else Text.GetTextBounds("Roblox Studio", UseTokensResult.Typography.CaptionMedium.Font, UseTokensResult.Typography.CaptionMedium.FontSize, Vector2.zero)
					
					return UDim2.fromOffset(RobloxStudio.X, RobloxStudio.Y)
				end, {
					UseTokensResult.Typography.CaptionMedium.Font,
					UseTokensResult.Typography.CaptionMedium.FontSize
				}).Y),
				Visible = UseUserDataModuleResult.isLoading
			}),
			DisplayName = if FFlagEnableBlackbirdCheck and UseIsRobloxSubscriberResult then ReactModule.createElement(FoundationModule.View, {
				tag = "row align-y-center gap-xxsmall auto-xy",
				LayoutOrder = 1,
				Visible = UseUserDataModuleResult.isLoading:map(function(p2): boolean
					return not p2
				end)
			}, {
				NameText = ReactModule.createElement(FoundationModule.Text, {
					tag = "shrink auto-xy text-title-large text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = UseUserDataModuleResult.combinedName
				}),
				SubscriptionBadge = ReactModule.createElement(FoundationModule.Icon, {
					LayoutOrder = 2,
					name = FoundationModule.Enums.IconName.RobloxPlus,
					size = FoundationModule.Enums.IconSize.Small,
					style = UseTokensResult.Color.Content.Emphasis
				})
			}) else ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-title-large text-truncate-end content-emphasis",
				LayoutOrder = 1,
				Text = UseUserDataModuleResult.combinedName,
				Visible = UseUserDataModuleResult.isLoading:map(function(p2): boolean
					return not p2
				end)
			}),
			PresenceText = ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-caption-medium text-truncate-end content-muted",
				LayoutOrder = 3,
				Text = if UnionResult.statusText then UseUserDataModuleResult.presenceText:map(function(Text): string
					-- upvalues: UnionResult (copy)
					return Text .. " . " .. UnionResult.statusText
				end) else UseUserDataModuleResult.presenceText,
				Visible = UseUserDataModuleResult.isLoading:map(function(p2): boolean
					return not p2
				end)
			})
		}),
		ChildrenContainer = if UnionResult.children then ReactModule.createElement(FoundationModule.View, {
			tag = "row align-x-right align-y-center auto-y",
			LayoutOrder = 3,
			selection = { Selectable = false },
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			}
		}, UnionResult.children) else nil
	})
end)