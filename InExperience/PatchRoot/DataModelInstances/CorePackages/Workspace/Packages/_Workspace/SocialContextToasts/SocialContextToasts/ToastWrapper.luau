local socialContextToasts = script:FindFirstAncestor("SocialContextToasts")
local parent = socialContextToasts.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local toast = UIBloxModule.App.Dialog.Toast
local useStyle = UIBloxModule.Core.Style.useStyle
local colors = UIBloxModule.App.Style.Colors
local cryoModule = require(parent.Cryo)
local coPlayFooter = UIBloxModule.App.Tile.ExperienceTileMetadata.CoPlayFooter
local getLocalizedStrings = require(parent.NotificationsCommon).LocalizationHelper.getLocalizedStrings
local socialContextToastAnalyticsActionTypesModule = require(socialContextToasts.Enums.SocialContextToastAnalyticsActionTypes)
local socialContextToastEventsModule = require(socialContextToasts.SocialContextToastEvents)
local getFFlagSocialContextToastEventStream = require(parent.SharedFlags).GetFFlagSocialContextToastEventStream
local vector2 = Vector2.new(48, 48)
local vector2_1 = Vector2.new(36, 36)

local function _(p1, p2, p3)
	-- upvalues: reactModule (ref), coPlayFooter (ref), colors (ref)
	return function(p4)
		-- upvalues: p1 (ref), reactModule (copy), coPlayFooter (copy), p3 (ref), p2 (ref), colors (copy)
		local offset = p4.Size.X.Offset
		local var1 = if #p1 == 1 then offset else (offset - -9) / 2
		
		return reactModule.createElement(coPlayFooter, {
			faceGroupCount = 1,
			users = p1,
			size = p4.Size,
			showEmphasisBorder = p3,
			styleProps = {
				faceGroupGap = -9,
				faceWidth = var1,
				faceHeight = var1,
				badgeHeight = var1,
				badgeBorderColor = p2.Theme.SystemPrimaryContent,
				faceBorderColor = p2.Theme.SystemPrimaryContent,
				faceBackgroundColor = { colors.Smoke, Transparency = 0 },
				showEmphasisBorder = p3
			}
		})
	end
end

local t = { areUsersActive = true }

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), getFFlagSocialContextToastEventStream (ref), reactModule (ref), socialContextToastEventsModule (ref), socialContextToastAnalyticsActionTypesModule (ref), useStyle (ref), getLocalizedStrings (ref), toast (ref), coPlayFooter (ref), colors (ref), vector2 (ref), vector2_1 (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = nil
	
	if getFFlagSocialContextToastEventStream() then
		local analyticsProps = var1.analyticsProps
		var2 = reactModule.useCallback(function()
			-- upvalues: var1 (ref), socialContextToastEventsModule (copy), analyticsProps (ref), socialContextToastAnalyticsActionTypesModule (copy)
			socialContextToastEventsModule(analyticsProps.eventIngest, {
				toastType = analyticsProps.toastType,
				friendId = if var1.userIdList then table.concat(var1.userIdList) else nil,
				universeId = analyticsProps.gameId,
				placeId = analyticsProps.placeId,
				actionType = socialContextToastAnalyticsActionTypesModule.ForceDismissed
			})
		end)
	end
	if var1.onActivated == nil then
		if getFFlagSocialContextToastEventStream() then
			var1.onActivated = var2
		else
			function var10.onActivated() end
		end
	end
	local var3 = useStyle()
	local var4 = getLocalizedStrings(var1.toastStrings)
	local userIdList = var1.userIdList
	local createElement = reactModule.createElement
	local t_1 = { duration = 6 }
	local t_2 = {}
	local areUsersActive = var1.areUsersActive
	t_2.iconImage = if userIdList then function(p2)
		-- upvalues: userIdList (ref), reactModule (copy), coPlayFooter (copy), areUsersActive (ref), var3 (ref), colors (copy)
		local offset = p2.Size.X.Offset
		local var5 = if #userIdList == 1 then offset else (offset - -9) / 2
		
		return reactModule.createElement(coPlayFooter, {
			faceGroupCount = 1,
			users = userIdList,
			size = p2.Size,
			showEmphasisBorder = areUsersActive,
			styleProps = {
				faceGroupGap = -9,
				faceWidth = var5,
				faceHeight = var5,
				badgeHeight = var5,
				badgeBorderColor = var3.Theme.SystemPrimaryContent,
				faceBorderColor = var3.Theme.SystemPrimaryContent,
				faceBackgroundColor = { colors.Smoke, Transparency = 0 },
				showEmphasisBorder = areUsersActive
			}
		})
	end else nil
	t_2.toastTitle = var4.label
	t_2.iconSize = if userIdList and #userIdList > 1 then vector2 else vector2_1
	t_2.onActivated = var1.onActivated
	t_2.buttonText = var4.button
	t_2.buttonType = var1.buttonType
	t_2.onTouchSwipeUp = if getFFlagSocialContextToastEventStream() then var2 else nil
	t_1.toastContent = t_2
	
	return createElement(toast, t_1)
end