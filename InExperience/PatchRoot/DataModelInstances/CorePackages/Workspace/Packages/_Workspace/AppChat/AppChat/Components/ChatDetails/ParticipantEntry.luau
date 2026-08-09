local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
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

return reactModule.memo(function(p0) --[[ line: 32 | named "ParticipantEntry" ]]
	-- upvalues: cryoModule (ref), t (ref), useUserDataModule (ref), useTokens (ref), useIsRobloxSubscriber (ref), fFlagEnableBlackbirdCheck (ref), reactModule (ref), text (ref), repeated (ref), foundationModule (ref)
	local var7 = cryoModule.Dictionary.union(t, p0)
	local var8 = useUserDataModule(var7.userId)
	local var9 = useTokens()
	local var10 = reactModule.useMemo(function() --[[ line: 45 ]]
		-- upvalues: text (copy), repeated (copy), var9 (ref)
		local textBounds = text.GetTextBounds(repeated, var9.Typography.TitleLarge.Font, var9.Typography.TitleLarge.FontSize, Vector2.zero)
		
		return UDim2.fromOffset(textBounds.X, textBounds.Y)
	end, {
		var9.Typography.TitleLarge.Font,
		var9.Typography.TitleLarge.FontSize
	})
	
	return reactModule.createElement(foundationModule.View, {
		Name = "ParticipantEntryContainer",
		tag = {
			["row align-y-center gap-medium size-full padding-x-medium"] = true,
			["stroke-thin stroke-muted"] = var7.showDivider
		},
		onActivated = if var7.onActivated then reactModule.useCallback(function() --[[ line: 39 ]]
			-- upvalues: var7 (ref)
			if var7.onActivated then
				var7.onActivated()
			end
		end, { var7.onActivated }) else nil
	}, {
		Avatar = reactModule.createElement(foundationModule.Avatar, {
			LayoutOrder = 1,
			userId = var8.id,
			userPresence = var8.presence,
			size = foundationModule.Enums.InputSize.Medium,
			backgroundStyle = var9.Color.Shift.Shift_300
		}),
		UserInfo = reactModule.createElement(foundationModule.View, { tag = "col fill auto-y clip", LayoutOrder = 2 }, {
			UserDataSkeleton = reactModule.createElement(foundationModule.Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(var10.X, var10.Y + reactModule.useMemo(function() --[[ line: 55 ]]
					-- upvalues: text (copy), var9 (ref)
					local textBounds = text.GetTextBounds("Roblox Studio", var9.Typography.CaptionMedium.Font, var9.Typography.CaptionMedium.FontSize, Vector2.zero)
					
					return UDim2.fromOffset(textBounds.X, textBounds.Y)
				end, {
					var9.Typography.CaptionMedium.Font,
					var9.Typography.CaptionMedium.FontSize
				}).Y),
				Visible = var8.isLoading
			}),
			DisplayName = if fFlagEnableBlackbirdCheck and useIsRobloxSubscriber(if fFlagEnableBlackbirdCheck then var7.userId else nil) then reactModule.createElement(foundationModule.View, {
				tag = "row align-y-center gap-xxsmall auto-xy",
				LayoutOrder = 1,
				Visible = var8.isLoading:map(function(p2) --[[ line: 94 ]]
					return not p2
				end)
			}, {
				NameText = reactModule.createElement(foundationModule.Text, {
					tag = "shrink auto-xy text-title-large text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = var8.combinedName
				}),
				SubscriptionBadge = reactModule.createElement(foundationModule.Icon, {
					LayoutOrder = 2,
					name = foundationModule.Enums.IconName.RobloxPlus,
					size = foundationModule.Enums.IconSize.Small,
					style = var9.Color.Content.Emphasis
				})
			}) else reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-title-large text-truncate-end content-emphasis",
				LayoutOrder = 1,
				Text = var8.combinedName,
				Visible = var8.isLoading:map(function(p1) --[[ line: 114 ]]
					return not p1
				end)
			}),
			PresenceText = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-caption-medium text-truncate-end content-muted",
				LayoutOrder = 3,
				Text = if var7.statusText then var8.presenceText:map(function(p3) --[[ line: 122 ]]
					-- upvalues: var7 (ref)
					return p3 .. " . " .. var7.statusText
				end) else var8.presenceText,
				Visible = var8.isLoading:map(function(p4) --[[ line: 127 ]]
					return not p4
				end)
			})
		}),
		ChildrenContainer = if var7.children then reactModule.createElement(foundationModule.View, {
			tag = "row align-x-right align-y-center auto-y",
			LayoutOrder = 3,
			selection = { Selectable = false },
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}, var7.children) else nil
	})
end)