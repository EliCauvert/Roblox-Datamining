local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(CorePackages.Packages.React)
local Sounds = require(CorePackages.Workspace.Packages.SoundManager).Sounds
local SoundGroups = require(CorePackages.Workspace.Packages.SoundManager).SoundGroups
local SoundManager = require(CorePackages.Workspace.Packages.SoundManager).SoundManager
local UserProfilesModule = require(CorePackages.Workspace.Packages.UserProfiles)
local ContactList = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ContactList
local DependenciesModule = require(ContactList.dependencies)
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UIBlox = DependenciesModule.UIBlox
local GetStandardSizeAvatarHeadShotRbxthumbFunction = DependenciesModule.getStandardSizeAvatarHeadShotRbxthumb
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local ControlState = UIBlox.Core.Control.Enum.ControlState
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Interactable = UIBlox.Core.Control.Interactable
local UseStyleFunction = UIBlox.Core.Style.useStyle
local CallStateModule = require(ContactList.Enums.CallState)
local _Random = Random.new()
local OpenOrUpdateCFMModule = require(ContactList.Actions.OpenOrUpdateCFM)
local UseAnalyticsModule = require(ContactList.Analytics.useAnalytics)
local EventNamesEnumModule = require(ContactList.Analytics.EventNamesEnum)
local PagesModule = require(ContactList.Enums.Pages)
local UseStartCallCallbackModule = require(ContactList.Hooks.useStartCallCallback)
local _Vector2 = Vector2.new(24, 12)

local function _(p1, CallerId): boolean
	-- upvalues: CallStateModule (copy)
	return p1.callerId ~= CallerId and p1.status ~= CallStateModule.Finished
end

local _ = function(p1, CallerId): string
	-- upvalues: CallStateModule (copy)
	local IsNotStatusMatch: boolean = p1.callerId ~= CallerId and p1.status ~= CallStateModule.Finished
	
	return if IsNotStatusMatch then "Feature.Call.Label.Missed" elseif p1.callerId == CallerId then "Feature.Call.Label.Outgoing" else "Feature.Call.Label.Incoming"
end

local _ = function(p1, CallerId): string
	-- upvalues: CallStateModule (copy)
	local IsNotStatusMatch: boolean = p1.callerId ~= CallerId and p1.status ~= CallStateModule.Finished
	
	return if IsNotStatusMatch then "rbxassetid://15239344406" elseif p1.callerId == CallerId then "rbxassetid://15239341275" else "rbxassetid://15239341959"
end

local function getAbsoluteDiffDays(p1, p2, RobloxLocaleId): number
	local Number: number? = tonumber(p1:FormatLocalTime("DDD", RobloxLocaleId))
	local Number1: number? = tonumber(p2:FormatLocalTime("DDD", RobloxLocaleId))
	local Total = 0
	
	for i = tonumber(p2:FormatLocalTime("YYYY", RobloxLocaleId)), tonumber(p1:FormatLocalTime("YYYY", RobloxLocaleId)) - 1 do
		Total += if i % 4 == 0 and (i % 100 ~= 0 or i % 400 == 0) then 366 else 365
	end
	return Total + Number - Number1
end

local function getTimestampText(EndUtc, YesterdayLabel)
	-- upvalues: LocalizationService (copy), getAbsoluteDiffDays (copy)
	local _DateTime = DateTime.fromUnixTimestampMillis(EndUtc)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local AbsoluteDiffDays: number = getAbsoluteDiffDays(DateTime.now(), _DateTime, RobloxLocaleId)
	
	return if AbsoluteDiffDays == 0 then _DateTime:FormatLocalTime("LT", RobloxLocaleId) elseif AbsoluteDiffDays == 1 then YesterdayLabel elseif AbsoluteDiffDays < 7 then _DateTime:FormatLocalTime("dddd", RobloxLocaleId) else _DateTime:FormatLocalTime("L", RobloxLocaleId)
end

return function(p3)
	-- upvalues: UserProfilesModule (copy), UseLocalizationFunction (copy), CallStateModule (copy), UseAnalyticsModule (copy), UseStyleFunction (copy), UseDispatchFunction (copy), ReactModule (copy), ControlState (copy), SoundManager (copy), Sounds (copy), _Random (copy), SoundGroups (copy), UseSelectorFunction (copy), UseStartCallCallbackModule (copy), EventNamesEnumModule (copy), PagesModule (copy), OpenOrUpdateCFMModule (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), Interactable (copy), _Vector2 (copy), ImageSetLabel (copy), getTimestampText (copy)
	local CallRecord = p3.callRecord
	local LocalUserId = p3.localUserId
	assert(#CallRecord.participants == 2, "Expect a local user and single other participant in call.")
	local UserId = CallRecord.participants[1].userId
	
	if UserId == LocalUserId then
		UserId = CallRecord.participants[2].userId
	end
	local CombinedNameFromId = ""
	local FormatUsernameResult = ""
	local v1 = nil
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { (tostring(UserId)) },
		query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	
	if UseUserProfilesFetchResult.data then
		CombinedNameFromId = UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, UserId)
		local UsernameFromId = UserProfilesModule.Selectors.getUsernameFromId(UseUserProfilesFetchResult.data, UserId)
		v1 = {
			userId = UserId,
			userName = UsernameFromId,
			combinedName = CombinedNameFromId
		}
		FormatUsernameResult = UserProfilesModule.Formatters.formatUsername(UsernameFromId)
	end
	local config = {
		yesterdayLabel = "Feature.Call.Label.Yesterday",
		callStatusLabel = if IsNotStatusMatch then "Feature.Call.Label.Missed" elseif CallRecord.callerId == LocalUserId then "Feature.Call.Label.Outgoing" else "Feature.Call.Label.Incoming"
	}
	local IsNotStatusMatch: boolean = CallRecord.callerId ~= LocalUserId and CallRecord.status ~= CallStateModule.Finished
	local UseLocalizationResult = UseLocalizationFunction(config)
	local CallStatusLabel = UseLocalizationResult.callStatusLabel
	local YesterdayLabel = UseLocalizationResult.yesterdayLabel
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local UseDispatchResult = UseDispatchFunction()
	local BackgroundDefault, BackgroundDefault2 = ReactModule.useState("BackgroundDefault")
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesEnumModule (upval), UserId (ref), p3 (copy), PagesModule (upval), UseDispatchResult (copy), OpenOrUpdateCFMModule (upval), v1 (ref)
		UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookPlayerMenuOpened, {
			searchQueryString = nil,
			isSuggestedUser = false,
			eventTimestampMs = os.time() * 1000,
			friendUserId = UserId,
			itemListIndex = p3.layoutOrder,
			page = PagesModule.CallHistory
		})
		UseDispatchResult(OpenOrUpdateCFMModule(v1))
	end, { UserId, p3.layoutOrder })
	local IsNotStatusMatch1: boolean = CallRecord.callerId ~= LocalUserId and CallRecord.status ~= CallStateModule.Finished
	local config1 = {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(16, 16),
		ImageColor3 = Theme.TextDefault.Color,
		ImageTransparency = Theme.TextDefault.Transparency,
		Image = if IsNotStatusMatch2 then "rbxassetid://15239344406" elseif CallRecord.callerId == LocalUserId then "rbxassetid://15239341275" else "rbxassetid://15239341959"
	}
	local IsNotStatusMatch2: boolean = CallRecord.callerId ~= LocalUserId and CallRecord.status ~= CallStateModule.Finished
	
	return ReactModule.createElement(Interactable, {
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.new(1, 0, 0, 68 + _Vector2.Y * 2),
		BackgroundColor3 = Theme[BackgroundDefault].Color,
		BackgroundTransparency = Theme[BackgroundDefault].Transparency,
		BorderSizePixel = 0,
		LayoutOrder = p3.layoutOrder,
		onStateChanged = ReactModule.useCallback(function(_, Hover)
			-- upvalues: ControlState (upval), BackgroundDefault2 (copy), SoundManager (upval), Sounds (upval), _Random (upval), SoundGroups (upval)
			if Hover == ControlState.Pressed then
				BackgroundDefault2("BackgroundOnPress")
				
				return
			end
			if Hover == ControlState.Hover then
				BackgroundDefault2("BackgroundOnHover")
				SoundManager:PlaySound(Sounds.Hover.Name, {
					Volume = 0.5 + _Random:NextNumber(-0.25, 0.25),
					PlaybackSpeed = 1 + _Random:NextNumber(-0.5, 0.5)
				}, SoundGroups.Iris)
				
				return
			else
				BackgroundDefault2("BackgroundDefault")
			end
		end, {}),
		AutoButtonColor = false,
		[ReactModule.Event.Activated] = UseStartCallCallbackModule(UseSelectorFunction((ReactModule.useCallback(function(p4)
			return p4.Navigation.currentTag
		end, {}))), UserId, CombinedNameFromId, p3.dismissCallback, {
			searchQueryString = "",
			isSuggestedUser = false,
			itemListIndex = p3.layoutOrder,
			page = UseSelectorFunction((ReactModule.useCallback(function(p4)
				return p4.Navigation.currentPage
			end, {})))
		})
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, _Vector2.X),
			PaddingTop = UDim.new(0, _Vector2.Y)
		}),
		ProfileImage = ReactModule.createElement("ImageButton", {
			Size = UDim2.fromOffset(68, 68),
			Image = GetStandardSizeAvatarHeadShotRbxthumbFunction((tostring(UserId))),
			[ReactModule.Event.MouseButton2Up] = UseResult,
			[ReactModule.Event.TouchTap] = UseResult,
			AutoButtonColor = false
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}),
		Content = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 80, 0, 0),
			Size = UDim2.new(1, -(104 + _Vector2.X), 1, -_Vector2.Y)
		}, {
			NameContent = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, 4),
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				DisplayName = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 20),
					Font = UseStyleResultFont.Header2.Font,
					Text = CombinedNameFromId,
					TextColor3 = if IsNotStatusMatch1 then Theme.Alert.Color else Theme.TextEmphasis.Color,
					TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize,
					TextTransparency = if IsNotStatusMatch1 then Theme.Alert.Transparency else Theme.TextEmphasis.Transparency,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				Username = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 14),
					Font = UseStyleResultFont.CaptionBody.Font,
					Text = FormatUsernameResult,
					TextColor3 = Theme.TextDefault.Color,
					TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionBody.RelativeSize,
					TextTransparency = Theme.TextDefault.Transparency,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			Details = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Position = UDim2.new(0, 0, 1, -16),
				Size = UDim2.new(1, 0, 0, 16)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 4)
				}),
				CallContextImage = ReactModule.createElement(ImageSetLabel, config1),
				DetailsText = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.fromOffset(0, 14),
					AutomaticSize = Enum.AutomaticSize.X,
					Font = UseStyleResultFont.CaptionBody.Font,
					Text = CallStatusLabel .. " • " .. getTimestampText(CallRecord.endUtc, YesterdayLabel),
					TextColor3 = Theme.TextDefault.Color,
					TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionBody.RelativeSize,
					TextTransparency = Theme.TextDefault.Transparency,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextYAlignment = Enum.TextYAlignment.Center
				})
			})
		}),
		CallIcon = ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://15239343417",
			Position = UDim2.new(1, -_Vector2.X - 4, 0.5, -_Vector2.Y / 2),
			Size = UDim2.fromOffset(24, 24),
			AnchorPoint = Vector2.new(1, 0.5),
			ImageColor3 = Theme.ContextualPrimaryDefault.Color,
			ImageTransparency = Theme.ContextualPrimaryDefault.Transparency
		}),
		Divider = p3.showDivider and ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 1, -1),
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = Theme.Divider.Color,
			BackgroundTransparency = Theme.Divider.Transparency
		}) or nil
	})
end