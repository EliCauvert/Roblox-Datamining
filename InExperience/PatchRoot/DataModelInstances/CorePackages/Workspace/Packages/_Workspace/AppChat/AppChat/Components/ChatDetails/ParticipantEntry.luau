local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local fFlagAppChatUseProfileFrameThumbnailModule = require(appChat.Flags.FFlagAppChatUseProfileFrameThumbnail)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = require(parent.AppCommonLib).Text
local useUserDataModule = require(appChat.Hooks.useUserData)
local useTokens = foundationModule.Hooks.useTokens
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local useIsRobloxSubscriber = require(parent.UserProfiles).Hooks.useIsRobloxSubscriber
local repeated = string.rep("W", 20)
local t = { showDivider = true }

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useUserDataModule (ref), useTokens (ref), useIsRobloxSubscriber (ref), fFlagEnableBlackbirdCheck (ref), reactModule (ref), text (ref), repeated (ref), foundationModule (ref), fFlagAppChatUseProfileFrameThumbnailModule (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2 = useUserDataModule(var1.userId)
	local var3 = useTokens()
	local var4 = reactModule.useMemo(function()
		-- upvalues: text (copy), repeated (copy), var3 (ref)
		local textBounds = text.GetTextBounds(repeated, var3.Typography.TitleLarge.Font, var3.Typography.TitleLarge.FontSize, Vector2.zero)
		
		return UDim2.fromOffset(textBounds.X, textBounds.Y)
	end, {
		var3.Typography.TitleLarge.Font,
		var3.Typography.TitleLarge.FontSize
	})
	
	return reactModule.createElement(foundationModule.View, {
		Name = "ParticipantEntryContainer",
		tag = {
			["row align-y-center gap-medium size-full padding-x-medium"] = true,
			["stroke-thin stroke-muted"] = var1.showDivider
		},
		onActivated = if var1.onActivated then reactModule.useCallback(function()
			-- upvalues: var1 (ref)
			if var1.onActivated then
				var1.onActivated()
			end
		end, { var1.onActivated }) else nil
	}, {
		Avatar = reactModule.createElement(foundationModule.Avatar, {
			LayoutOrder = 1,
			userId = var2.id,
			userPresence = var2.presence,
			size = foundationModule.Enums.InputSize.Medium,
			backgroundStyle = var3.Color.Shift.Shift_300,
			includeProfileFrame = fFlagAppChatUseProfileFrameThumbnailModule
		}),
		UserInfo = reactModule.createElement(foundationModule.View, { tag = "col fill auto-y clip", LayoutOrder = 2 }, {
			UserDataSkeleton = reactModule.createElement(foundationModule.Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(var4.X, var4.Y + reactModule.useMemo(function()
					-- upvalues: text (copy), var3 (ref)
					local textBounds = text.GetTextBounds("Roblox Studio", var3.Typography.CaptionMedium.Font, var3.Typography.CaptionMedium.FontSize, Vector2.zero)
					
					return UDim2.fromOffset(textBounds.X, textBounds.Y)
				end, {
					var3.Typography.CaptionMedium.Font,
					var3.Typography.CaptionMedium.FontSize
				}).Y),
				Visible = var2.isLoading
			}),
			DisplayName = if fFlagEnableBlackbirdCheck and useIsRobloxSubscriber(if fFlagEnableBlackbirdCheck then var1.userId else nil) then reactModule.createElement(foundationModule.View, {
				tag = "row align-y-center gap-xxsmall auto-xy",
				LayoutOrder = 1,
				Visible = var2.isLoading:map(function(p2)
					return not p2
				end)
			}, {
				NameText = reactModule.createElement(foundationModule.Text, {
					tag = "shrink auto-xy text-title-large text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = var2.combinedName
				}),
				SubscriptionBadge = reactModule.createElement(foundationModule.Icon, {
					LayoutOrder = 2,
					name = foundationModule.Enums.IconName.RobloxPlus,
					size = foundationModule.Enums.IconSize.Small,
					style = var3.Color.Content.Emphasis
				})
			}) else reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-title-large text-truncate-end content-emphasis",
				LayoutOrder = 1,
				Text = var2.combinedName,
				Visible = var2.isLoading:map(function(p2)
					return not p2
				end)
			}),
			PresenceText = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-caption-medium text-truncate-end content-muted",
				LayoutOrder = 3,
				Text = if var1.statusText then var2.presenceText:map(function(p2)
					-- upvalues: var1 (ref)
					return p2 .. " . " .. var8.statusText
				end) else var2.presenceText,
				Visible = var2.isLoading:map(function(p2)
					return not p2
				end)
			})
		}),
		ChildrenContainer = if var1.children then reactModule.createElement(foundationModule.View, {
			tag = "row align-x-right align-y-center auto-y",
			LayoutOrder = 3,
			selection = { Selectable = false },
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}, var1.children) else nil
	})
end)