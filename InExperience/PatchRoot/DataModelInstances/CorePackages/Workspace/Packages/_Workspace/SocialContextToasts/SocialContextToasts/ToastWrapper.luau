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

local function _(p0, p1, p2) --[[ line: 34 | named "makeCoPlayFooter" ]]
	-- upvalues: reactModule (ref), coPlayFooter (ref), colors (ref)
	return function(p3) --[[ line: 35 ]]
		-- upvalues: p0 (ref), reactModule (copy), coPlayFooter (copy), p2 (ref), p1 (ref), colors (copy)
		local offset = p3.Size.X.Offset
		local var9 = if #p0 == 1 then offset else (offset - -9) / 2
		
		return reactModule.createElement(coPlayFooter, {
			faceGroupCount = 1,
			users = p0,
			size = p3.Size,
			showEmphasisBorder = p2,
			styleProps = {
				faceGroupGap = -9,
				faceWidth = var9,
				faceHeight = var9,
				badgeHeight = var9,
				badgeBorderColor = p1.Theme.SystemPrimaryContent,
				faceBorderColor = p1.Theme.SystemPrimaryContent,
				faceBackgroundColor = { colors.Smoke, Transparency = 0 },
				showEmphasisBorder = p2
			}
		})
	end
end

local t = { areUsersActive = true }

return function(p4) --[[ line: 62 | named "ToastWrapper" ]]
	-- upvalues: cryoModule (ref), t (ref), getFFlagSocialContextToastEventStream (ref), reactModule (ref), socialContextToastEventsModule (ref), socialContextToastAnalyticsActionTypesModule (ref), useStyle (ref), getLocalizedStrings (ref), toast (ref), coPlayFooter (ref), colors (ref), vector2 (ref), vector2_1 (ref)
	local var10 = cryoModule.Dictionary.join(t, p4)
	local var11 = nil
	
	if getFFlagSocialContextToastEventStream() then
		local analyticsProps = var10.analyticsProps
		var11 = reactModule.useCallback(function() --[[ line: 68 ]]
			-- upvalues: var10 (ref), socialContextToastEventsModule (copy), analyticsProps (ref), socialContextToastAnalyticsActionTypesModule (copy)
			socialContextToastEventsModule(analyticsProps.eventIngest, {
				toastType = analyticsProps.toastType,
				friendId = if var10.userIdList then table.concat(var10.userIdList) else nil,
				universeId = analyticsProps.gameId,
				placeId = analyticsProps.placeId,
				actionType = socialContextToastAnalyticsActionTypesModule.ForceDismissed
			})
		end)
	end
	if var10.onActivated == nil then
		if getFFlagSocialContextToastEventStream() then
			var10.onActivated = var11
		else
			function var10.onActivated() --[[ line: 89 ]] end
		end
	end
	local var12 = useStyle()
	local var13 = getLocalizedStrings(var10.toastStrings)
	local userIdList = var10.userIdList
	local createElement = reactModule.createElement
	local t_1 = { duration = 6 }
	local t_2 = {}
	local areUsersActive = var10.areUsersActive
	t_2.iconImage = if userIdList then function(p5) --[[ line: 35 ]]
		-- upvalues: userIdList (ref), reactModule (copy), coPlayFooter (copy), areUsersActive (ref), var12 (ref), colors (copy)
		local offset = p5.Size.X.Offset
		local var9 = if #userIdList == 1 then offset else (offset - -9) / 2
		
		return reactModule.createElement(coPlayFooter, {
			faceGroupCount = 1,
			users = userIdList,
			size = p5.Size,
			showEmphasisBorder = areUsersActive,
			styleProps = {
				faceGroupGap = -9,
				faceWidth = var9,
				faceHeight = var9,
				badgeHeight = var9,
				badgeBorderColor = var12.Theme.SystemPrimaryContent,
				faceBorderColor = var12.Theme.SystemPrimaryContent,
				faceBackgroundColor = { colors.Smoke, Transparency = 0 },
				showEmphasisBorder = areUsersActive
			}
		})
	end else nil
	t_2.toastTitle = var13.label
	t_2.iconSize = if userIdList and #userIdList > 1 then vector2 else vector2_1
	t_2.onActivated = var10.onActivated
	t_2.buttonText = var13.button
	t_2.buttonType = var10.buttonType
	t_2.onTouchSwipeUp = if getFFlagSocialContextToastEventStream() then var11 else nil
	t_1.toastContent = t_2
	
	return createElement(toast, t_1)
end