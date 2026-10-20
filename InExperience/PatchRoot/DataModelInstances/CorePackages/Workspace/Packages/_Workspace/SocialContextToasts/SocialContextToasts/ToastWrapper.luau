local SocialContextToasts = script:FindFirstAncestor("SocialContextToasts")
local Parent = SocialContextToasts.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local Toast = UIBloxModule.App.Dialog.Toast
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Colors = UIBloxModule.App.Style.Colors
local CryoModule = require(Parent.Cryo)
local CoPlayFooter = UIBloxModule.App.Tile.ExperienceTileMetadata.CoPlayFooter
local GetLocalizedStringsFunction = require(Parent.NotificationsCommon).LocalizationHelper.getLocalizedStrings
local SocialContextToastAnalyticsActionTypesModule = require(SocialContextToasts.Enums.SocialContextToastAnalyticsActionTypes)
local SocialContextToastEventsModule = require(SocialContextToasts.SocialContextToastEvents)
local GetFFlagSocialContextToastEventStreamFunction = require(Parent.SharedFlags).GetFFlagSocialContextToastEventStream
local _Vector2 = Vector2.new(48, 48)
local _Vector2_1 = Vector2.new(36, 36)

local function _(Users, p1, ShowEmphasisBorder)
	-- upvalues: ReactModule (copy), CoPlayFooter (copy), Colors (copy)
	return function(p2)
		-- upvalues: Users (copy), ReactModule (upval), CoPlayFooter (upval), ShowEmphasisBorder (copy), p1 (copy), Colors (upval)
		local Offset: number = p2.Size.X.Offset
		local Offset1 = if #Users == 1 then Offset else (Offset - -9) / 2
		
		return ReactModule.createElement(CoPlayFooter, {
			faceGroupCount = 1,
			users = Users,
			size = p2.Size,
			showEmphasisBorder = ShowEmphasisBorder,
			styleProps = {
				faceGroupGap = -9,
				faceWidth = Offset1,
				faceHeight = Offset1,
				badgeHeight = Offset1,
				badgeBorderColor = p1.Theme.SystemPrimaryContent,
				faceBorderColor = p1.Theme.SystemPrimaryContent,
				faceBackgroundColor = { Colors.Smoke, Transparency = 0 },
				showEmphasisBorder = ShowEmphasisBorder
			}
		})
	end
end

local config = { areUsersActive = true }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), GetFFlagSocialContextToastEventStreamFunction (copy), ReactModule (copy), SocialContextToastEventsModule (copy), SocialContextToastAnalyticsActionTypesModule (copy), UseStyleFunction (copy), GetLocalizedStringsFunction (copy), Toast (copy), CoPlayFooter (copy), Colors (copy), _Vector2 (copy), _Vector2_1 (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseResult = nil
	
	if GetFFlagSocialContextToastEventStreamFunction() then
		local AnalyticsProps = JoinResult.analyticsProps
		UseResult = ReactModule.useCallback(function()
			-- upvalues: JoinResult (copy), SocialContextToastEventsModule (upval), AnalyticsProps (copy), SocialContextToastAnalyticsActionTypesModule (upval)
			SocialContextToastEventsModule(AnalyticsProps.eventIngest, {
				toastType = AnalyticsProps.toastType,
				friendId = if JoinResult.userIdList then table.concat(JoinResult.userIdList) else nil,
				universeId = AnalyticsProps.gameId,
				placeId = AnalyticsProps.placeId,
				actionType = SocialContextToastAnalyticsActionTypesModule.ForceDismissed
			})
		end)
	end
	if JoinResult.onActivated == nil then
		if GetFFlagSocialContextToastEventStreamFunction() then
			JoinResult.onActivated = UseResult
		else
			function JoinResult.onActivated() end
		end
	end
	local UseStyleResult = UseStyleFunction()
	local LocalizedStrings = GetLocalizedStringsFunction(JoinResult.toastStrings)
	local UserIdList = JoinResult.userIdList
	local CreateElementFunction = ReactModule.createElement
	local config1 = { duration = 6 }
	local ToastContent = {}
	local IconImage = nil
	
	if UserIdList then
		local AreUsersActive = JoinResult.areUsersActive
		IconImage = function(p2)
			-- upvalues: UserIdList (copy), ReactModule (upval), CoPlayFooter (upval), AreUsersActive (copy), UseStyleResult (copy), Colors (upval)
			local Offset: number = p2.Size.X.Offset
			local Offset1 = if #UserIdList == 1 then Offset else (Offset - -9) / 2
			
			return ReactModule.createElement(CoPlayFooter, {
				faceGroupCount = 1,
				users = UserIdList,
				size = p2.Size,
				showEmphasisBorder = AreUsersActive,
				styleProps = {
					faceGroupGap = -9,
					faceWidth = Offset1,
					faceHeight = Offset1,
					badgeHeight = Offset1,
					badgeBorderColor = UseStyleResult.Theme.SystemPrimaryContent,
					faceBorderColor = UseStyleResult.Theme.SystemPrimaryContent,
					faceBackgroundColor = { Colors.Smoke, Transparency = 0 },
					showEmphasisBorder = AreUsersActive
				}
			})
		end or nil
	else
		IconImage = nil
	end
	ToastContent.iconImage = IconImage
	ToastContent.toastTitle = LocalizedStrings.label
	ToastContent.iconSize = if UserIdList and #UserIdList > 1 then _Vector2 else _Vector2_1
	ToastContent.onActivated = JoinResult.onActivated
	ToastContent.buttonText = LocalizedStrings.button
	ToastContent.buttonType = JoinResult.buttonType
	ToastContent.onTouchSwipeUp = if GetFFlagSocialContextToastEventStreamFunction() then UseResult else nil
	config1.toastContent = ToastContent
	
	return CreateElementFunction(Toast, config1)
end