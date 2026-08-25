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

return reactModule.memo(function(p0)
	-- upvalues: cryoModule (ref), t (ref), useUserDataModule (ref), useTokens (ref), useIsRobloxSubscriber (ref), fFlagEnableBlackbirdCheck (ref), reactModule (ref), text (ref), repeated (ref), foundationModule (ref), fFlagAppChatUseProfileFrameThumbnailModule (ref)
	local var8 = cryoModule.Dictionary.union(t, p0)
	local var9 = useUserDataModule(var8.userId)
	local var10 = useTokens()
	local var11 = reactModule.useMemo(function()
		-- upvalues: text (copy), repeated (copy), var10 (ref)
		local textBounds = text.GetTextBounds(repeated, var10.Typography.TitleLarge.Font, var10.Typography.TitleLarge.FontSize, Vector2.zero)
		
		return UDim2.fromOffset(textBounds.X, textBounds.Y)
	end, {
		var10.Typography.TitleLarge.Font,
		var10.Typography.TitleLarge.FontSize
	})
	
	return reactModule.createElement(foundationModule.View, {
		Name = "ParticipantEntryContainer",
		tag = {
			["row align-y-center gap-medium size-full padding-x-medium"] = true,
			["stroke-thin stroke-muted"] = var8.showDivider
		},
		onActivated = if var8.onActivated then reactModule.useCallback(function()
			-- upvalues: var8 (ref)
			if var8.onActivated then
				var8.onActivated()
			end
		end, { var8.onActivated }) else nil
	}, {
		Avatar = reactModule.createElement(foundationModule.Avatar, {
			LayoutOrder = 1,
			userId = var9.id,
			userPresence = var9.presence,
			size = foundationModule.Enums.InputSize.Medium,
			backgroundStyle = var10.Color.Shift.Shift_300,
			includeProfileFrame = fFlagAppChatUseProfileFrameThumbnailModule
		}),
		UserInfo = reactModule.createElement(foundationModule.View, { tag = "col fill auto-y clip", LayoutOrder = 2 }, {
			UserDataSkeleton = reactModule.createElement(foundationModule.Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(var11.X, var11.Y + reactModule.useMemo(function()
					-- upvalues: text (copy), var10 (ref)
					local textBounds = text.GetTextBounds("Roblox Studio", var10.Typography.CaptionMedium.Font, var10.Typography.CaptionMedium.FontSize, Vector2.zero)
					
					return UDim2.fromOffset(textBounds.X, textBounds.Y)
				end, {
					var10.Typography.CaptionMedium.Font,
					var10.Typography.CaptionMedium.FontSize
				}).Y),
				Visible = var9.isLoading
			}),
			DisplayName = if fFlagEnableBlackbirdCheck and useIsRobloxSubscriber(if fFlagEnableBlackbirdCheck then var8.userId else nil) then reactModule.createElement(foundationModule.View, {
				tag = "row align-y-center gap-xxsmall auto-xy",
				LayoutOrder = 1,
				Visible = var9.isLoading:map(function(p2)
					return not p2
				end)
			}, {
				NameText = reactModule.createElement(foundationModule.Text, {
					tag = "shrink auto-xy text-title-large text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = var9.combinedName
				}),
				SubscriptionBadge = reactModule.createElement(foundationModule.Icon, {
					LayoutOrder = 2,
					name = foundationModule.Enums.IconName.RobloxPlus,
					size = foundationModule.Enums.IconSize.Small,
					style = var10.Color.Content.Emphasis
				})
			}) else reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-title-large text-truncate-end content-emphasis",
				LayoutOrder = 1,
				Text = var9.combinedName,
				Visible = var9.isLoading:map(function(p1)
					return not p1
				end)
			}),
			PresenceText = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-caption-medium text-truncate-end content-muted",
				LayoutOrder = 3,
				Text = if var8.statusText then var9.presenceText:map(function(p3)
					-- upvalues: var8 (ref)
					return p3 .. " . " .. var8.statusText
				end) else var9.presenceText,
				Visible = var9.isLoading:map(function(p4)
					return not p4
				end)
			})
		}),
		ChildrenContainer = if var8.children then reactModule.createElement(foundationModule.View, {
			tag = "row align-x-right align-y-center auto-y",
			LayoutOrder = 3,
			selection = { Selectable = false },
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}, var8.children) else nil
	})
end)