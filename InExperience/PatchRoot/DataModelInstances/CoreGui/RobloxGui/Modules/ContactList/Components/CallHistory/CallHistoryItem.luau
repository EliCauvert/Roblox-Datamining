local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local reactModule = require(corePackagesService.Packages.React)
local sounds = require(corePackagesService.Workspace.Packages.SoundManager).Sounds
local soundGroups = require(corePackagesService.Workspace.Packages.SoundManager).SoundGroups
local soundManager = require(corePackagesService.Workspace.Packages.SoundManager).SoundManager
local userProfilesModule = require(corePackagesService.Workspace.Packages.UserProfiles)
local contactList = robloxGui.Modules.ContactList
local dependenciesModule = require(contactList.dependencies)
local useDispatch = dependenciesModule.Hooks.useDispatch
local UIBlox = dependenciesModule.UIBlox
local getStandardSizeAvatarHeadShotRbxthumb = dependenciesModule.getStandardSizeAvatarHeadShotRbxthumb
local useLocalization = dependenciesModule.Hooks.useLocalization
local useSelector = dependenciesModule.Hooks.useSelector
local controlState = UIBlox.Core.Control.Enum.ControlState
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local interactable = UIBlox.Core.Control.Interactable
local useStyle = UIBlox.Core.Style.useStyle
local callStateModule = require(contactList.Enums.CallState)
local random = Random.new()
local openOrUpdateCFMModule = require(contactList.Actions.OpenOrUpdateCFM)
local useAnalyticsModule = require(contactList.Analytics.useAnalytics)
local eventNamesEnumModule = require(contactList.Analytics.EventNamesEnum)
local pagesModule = require(contactList.Enums.Pages)
local useStartCallCallbackModule = require(contactList.Hooks.useStartCallCallback)
local vector2 = Vector2.new(24, 12)

local function _(p0, p1) --[[ line: 67 | named "getIsMissedCall" ]]
	-- upvalues: callStateModule (ref)
	return p0.callerId ~= p1 and p0.status ~= callStateModule.Finished
end

local _ = function(p2, p3) --[[ line: 71 | named "getCallStatusText" ]]
	-- upvalues: callStateModule (ref)
	return if p2.callerId ~= p3 and p2.status ~= callStateModule.Finished then "Feature.Call.Label.Missed" elseif p2.callerId == p3 then "Feature.Call.Label.Outgoing" else "Feature.Call.Label.Incoming"
end

local _ = function(p4, p5) --[[ line: 81 | named "getCallContextImage" ]]
	-- upvalues: callStateModule (ref)
	return if p4.callerId ~= p5 and p4.status ~= callStateModule.Finished then "rbxassetid://15239344406" elseif p4.callerId == p5 then "rbxassetid://15239341275" else "rbxassetid://15239341959"
end

local function getAbsoluteDiffDays(value, p6, p7) --[[ line: 92 ]]
	local var17 = tonumber(value:FormatLocalTime("YYYY", p7))
	local var18 = tonumber(p6:FormatLocalTime("YYYY", p7))
	local var19 = tonumber(value:FormatLocalTime("DDD", p7))
	local var20 = tonumber(p6:FormatLocalTime("DDD", p7))
	local var21 = 0
	
	for i = var18, var17 - 1 do
		var21 += if i % 4 == 0 and (i % 100 ~= 0 or i % 400 == 0) then 366 else 365
	end
	return var21 + var19 - var20
end

local function getTimestampText(p8, p9) --[[ line: 113 ]]
	-- upvalues: localizationService (ref), getAbsoluteDiffDays (ref)
	local currentDateTime = DateTime.now()
	local dateTime = DateTime.fromUnixTimestampMillis(p8)
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var24 = getAbsoluteDiffDays(currentDateTime, dateTime, robloxLocaleId)
	
	return if var24 == 0 then dateTime:FormatLocalTime("LT", robloxLocaleId) elseif var24 == 1 then p9 elseif var24 < 7 then dateTime:FormatLocalTime("dddd", robloxLocaleId) else dateTime:FormatLocalTime("L", robloxLocaleId)
end

return function(p10) --[[ line: 131 | named "CallHistoryItem" ]]
	-- upvalues: userProfilesModule (ref), useLocalization (ref), callStateModule (ref), useAnalyticsModule (ref), useStyle (ref), useDispatch (ref), reactModule (ref), controlState (ref), soundManager (ref), sounds (ref), random (ref), soundGroups (ref), useSelector (ref), useStartCallCallbackModule (ref), eventNamesEnumModule (ref), pagesModule (ref), openOrUpdateCFMModule (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), interactable (ref), vector2 (ref), imageSetLabel (ref), getTimestampText (ref)
	local callRecord = p10.callRecord
	local localUserId = p10.localUserId
	assert(#callRecord.participants == 2, "Expect a local user and single other participant in call.")
	local userId = callRecord.participants[1].userId
	
	if userId == localUserId then
		userId = callRecord.participants[2].userId
	end
	local var25 = ""
	local var26 = ""
	local t = nil
	local var28 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { tostring(userId) },
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	
	if var28.data then
		var25 = userProfilesModule.Selectors.getCombinedNameFromId(var28.data, userId)
		local usernameFromId = userProfilesModule.Selectors.getUsernameFromId(var28.data, userId)
		t = {
			userId = userId,
			userName = usernameFromId,
			combinedName = var25
		}
		var26 = userProfilesModule.Formatters.formatUsername(usernameFromId)
	end
	local var30 = useLocalization({
		yesterdayLabel = "Feature.Call.Label.Yesterday",
		callStatusLabel = if callRecord.callerId ~= localUserId and callRecord.status ~= callStateModule.Finished then "Feature.Call.Label.Missed" elseif callRecord.callerId == localUserId then "Feature.Call.Label.Outgoing" else "Feature.Call.Label.Incoming"
	})
	local callStatusLabel = var30.callStatusLabel
	local yesterdayLabel = var30.yesterdayLabel
	local var31 = useAnalyticsModule()
	local var32 = useStyle()
	local theme = var32.Theme
	local font = var32.Font
	local var33 = useDispatch()
	local backgroundDefault, backgroundDefault_1 = reactModule.useState("BackgroundDefault")
	local var36 = reactModule.useCallback(function(_, p11) --[[ line: 178 ]]
		-- upvalues: controlState (copy), backgroundDefault_1 (ref), soundManager (copy), sounds (copy), random (copy), soundGroups (copy)
		if p11 == controlState.Pressed then
			backgroundDefault_1("BackgroundOnPress")
			
			return
		elseif p11 == controlState.Hover then
			backgroundDefault_1("BackgroundOnHover")
			soundManager:PlaySound(sounds.Hover.Name, {
				Volume = 0.5 + random:NextNumber(-0.25, 0.25),
				PlaybackSpeed = 1 + random:NextNumber(-0.5, 0.5)
			}, soundGroups.Iris)
			
			return
		end
		backgroundDefault_1("BackgroundDefault")
	end, {})
	local var37 = useStartCallCallbackModule(useSelector(reactModule.useCallback(function(p12) --[[ line: 192 ]]
		return p12.Navigation.currentTag
	end, {})), userId, var25, p10.dismissCallback, {
		searchQueryString = "",
		isSuggestedUser = false,
		itemListIndex = p10.layoutOrder,
		page = useSelector(reactModule.useCallback(function(p13) --[[ line: 197 ]]
			return p13.Navigation.currentPage
		end, {}))
	})
	local var38 = reactModule.useCallback(function() --[[ line: 210 ]]
		-- upvalues: var31 (ref), eventNamesEnumModule (copy), userId (write), p10 (ref), pagesModule (copy), var33 (ref), openOrUpdateCFMModule (copy), t (write)
		var31.fireEvent(eventNamesEnumModule.PhoneBookPlayerMenuOpened, {
			searchQueryString = nil,
			isSuggestedUser = false,
			eventTimestampMs = os.time() * 1000,
			friendUserId = userId,
			itemListIndex = p10.layoutOrder,
			page = pagesModule.CallHistory
		})
		var33(openOrUpdateCFMModule(t))
	end, { userId, p10.layoutOrder })
	local var39 = callRecord.callerId ~= localUserId and callRecord.status ~= callStateModule.Finished
	
	return reactModule.createElement(interactable, {
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.new(1, 0, 0, 68 + vector2.Y * 2),
		BackgroundColor3 = theme[backgroundDefault].Color,
		BackgroundTransparency = theme[backgroundDefault].Transparency,
		BorderSizePixel = 0,
		LayoutOrder = p10.layoutOrder,
		onStateChanged = var36,
		AutoButtonColor = false,
		[reactModule.Event.Activated] = var37
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, vector2.X),
			PaddingTop = UDim.new(0, vector2.Y)
		}),
		ProfileImage = reactModule.createElement("ImageButton", {
			Size = UDim2.fromOffset(68, 68),
			Image = getStandardSizeAvatarHeadShotRbxthumb(tostring(userId)),
			[reactModule.Event.MouseButton2Up] = var38,
			[reactModule.Event.TouchTap] = var38,
			AutoButtonColor = false
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}),
		Content = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 80, 0, 0),
			Size = UDim2.new(1, -(104 + vector2.X), 1, -vector2.Y)
		}, {
			NameContent = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, 4),
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				DisplayName = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 20),
					Font = font.Header2.Font,
					Text = var25,
					TextColor3 = if var39 then theme.Alert.Color else theme.TextEmphasis.Color,
					TextSize = font.BaseSize * font.Header2.RelativeSize,
					TextTransparency = if var39 then theme.Alert.Transparency else theme.TextEmphasis.Transparency,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				Username = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 14),
					Font = font.CaptionBody.Font,
					Text = var26,
					TextColor3 = theme.TextDefault.Color,
					TextSize = font.BaseSize * font.CaptionBody.RelativeSize,
					TextTransparency = theme.TextDefault.Transparency,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			Details = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Position = UDim2.new(0, 0, 1, -16),
				Size = UDim2.new(1, 0, 0, 16)
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 4)
				}),
				CallContextImage = reactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(16, 16),
					ImageColor3 = theme.TextDefault.Color,
					ImageTransparency = theme.TextDefault.Transparency,
					Image = if callRecord.callerId ~= localUserId and callRecord.status ~= callStateModule.Finished then "rbxassetid://15239344406" elseif callRecord.callerId == localUserId then "rbxassetid://15239341275" else "rbxassetid://15239341959"
				}),
				DetailsText = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.fromOffset(0, 14),
					AutomaticSize = Enum.AutomaticSize.X,
					Font = font.CaptionBody.Font,
					Text = callStatusLabel .. " \226\128\162 " .. getTimestampText(callRecord.endUtc, yesterdayLabel),
					TextColor3 = theme.TextDefault.Color,
					TextSize = font.BaseSize * font.CaptionBody.RelativeSize,
					TextTransparency = theme.TextDefault.Transparency,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextYAlignment = Enum.TextYAlignment.Center
				})
			})
		}),
		CallIcon = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Image = "rbxassetid://15239343417",
			Position = UDim2.new(1, (-vector2.X) - 4, 0.5, -vector2.Y / 2),
			Size = UDim2.fromOffset(24, 24),
			AnchorPoint = Vector2.new(1, 0.5),
			ImageColor3 = theme.ContextualPrimaryDefault.Color,
			ImageTransparency = theme.ContextualPrimaryDefault.Transparency
		}),
		Divider = p10.showDivider and reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 1, -1),
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = theme.Divider.Color,
			BackgroundTransparency = theme.Divider.Transparency
		}) or nil
	})
end