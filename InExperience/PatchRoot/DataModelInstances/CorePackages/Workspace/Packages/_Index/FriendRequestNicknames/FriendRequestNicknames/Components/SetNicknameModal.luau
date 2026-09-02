local parent = script.Parent.Parent
local parent_1 = parent.Parent
local appStorageService = game:GetService("AppStorageService")
local reactModule = require(parent_1.React)
local UIBloxModule = require(parent_1.UIBlox)
local var1 = require(parent_1.SocialLibraries).SocialLibraries.config({})
local localizationModule = require(parent_1.Localization)
local _ = require(parent_1.LuauPolyfill)
local analytics = require(parent.Analytics).Analytics
local eventNamesModule = require(parent.Analytics.EventNames)
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local dropdownMenu = UIBloxModule.App.Menu.DropdownMenu
local iconSize = UIBloxModule.App.Constant.IconSize
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local utilityActionIcon = UIBloxModule.App.Button.UtilityActionIcon
local callbackInputBox = var1.Components.CallbackInputBox
local getDeepValue = var1.Dictionary.getDeepValue
local useLocalization = localizationModule.Hooks.useLocalization
local textKeysModule = require(parent.Common.TextKeys)
local friendRequestNicknameMinChars = game:DefineFastInt("FriendRequestNicknameMinChars", 2)
local friendRequestNicknameMaxChars = game:DefineFastInt("FriendRequestNicknameMaxChars", 20)
local friendRequestNicknameMaxHistory = game:DefineFastInt("FriendRequestNicknameMaxHistory", 3)
local friendRequestNicknamesUIBugFixes = game:DefineFastFlag("FriendRequestNicknamesUIBugFixes", false)
local t = {
	Invalid = "Invalid",
	Valid = "Valid",
	TooShort = "TooShort",
	TooLong = "TooLong",
	InvalidCharacters = "InvalidCharacters",
	Moderated = "Moderated",
	ModeratedDisplayName = "ModeratedDisplayNameWithNickname",
	UpdateThrottled = "UpdateThrottled"
}
local t_1 = {
	TEXTBOX_VERTICAL_PADDING = 8,
	TEXTBOX_HORIZONTAL_PADDING = 12,
	CONTENT_PADDING = 10,
	DROPDOWN_FRAME_HEIGHT_CLOSED = 50,
	DROPDOWN_FRAME_HEIGHT_OPEN_1NICK = 180,
	DROPDOWN_FRAME_HEIGHT_OPEN_2NICKS = 240,
	DROPDOWN_FRAME_HEIGHT_OPEN_3NICKS = 300,
	DROPDOWN_FRAME_POSITION = 300,
	DROPDOWN_HEIGHT = 50,
	MODAL_POSITION = 0.4
}

return function(p1)
	-- upvalues: useLocalization (ref), textKeysModule (ref), friendRequestNicknameMinChars (ref), friendRequestNicknameMaxChars (ref), useStyle (ref), analytics (ref), appStorageService (ref), friendRequestNicknameMaxHistory (ref), reactModule (ref), t_1 (ref), friendRequestNicknamesUIBugFixes (ref), eventNamesModule (ref), t (ref), getDeepValue (ref), images (ref), interactiveAlert (ref), styledTextLabel (ref), imageSetLabel (ref), callbackInputBox (ref), iconSize (ref), dropdownMenu (ref), utilityActionIcon (ref), buttonType (ref)
	local ok, status
	local var2 = useLocalization({
		titleText = textKeysModule.TitleText,
		bodyText = if p1.recipientDisplayName then {
			textKeysModule.BodyText,
			displayName = "<font weight=\"medium\">" .. p0.recipientDisplayName .. "</font>"
		} else { textKeysModule.BodyTextNoDisplayName },
		privacyText = if p1.recipientDisplayName then {
			textKeysModule.PrivacyText,
			displayName = p1.recipientDisplayName
		} else { textKeysModule.PrivacyTextNoDisplayName },
		skipButtonText = textKeysModule.Skip,
		addNicknameText = textKeysModule.AddNickname,
		dropdownEntryText = textKeysModule.NicknameDropdownLabel,
		errorInvalidText = textKeysModule.ErrorMessageInvalid,
		errorTooShortText = textKeysModule.ErrorTooShort,
		errorTooLongText = textKeysModule.ErrorTooLong,
		errorInvalidCharactersText = textKeysModule.ErrorInvalidCharacters,
		errorModeratedText = textKeysModule.ErrorModerated,
		errorThrottledText = textKeysModule.ErrorMessageThrottled,
		dropdownPlaceholder = textKeysModule.DropdownPlaceholder,
		textboxPlaceholder = textKeysModule.TextboxPlaceholder
	})
	
	local _ = function(p2)
		-- upvalues: var2 (ref)
		return if p2 == "Invalid" then var2.errorInvalidText elseif p2 == "TooShort" then var2.errorTooShortText elseif p2 == "TooLong" then var2.errorTooLongText elseif p2 == "InvalidCharacters" then var2.errorInvalidCharactersText elseif p2 == "Moderated" then var2.errorModeratedText elseif p2 == "ModeratedDisplayNameWithNickname" then var2.errorModeratedText elseif p2 == "UpdateThrottled" then var2.errorThrottledText else ""
	end
	
	local var3 = useStyle()
	local var4 = analytics()
	local theme = var3.Theme
	local font = var3.Font
	local var5 = font.BaseSize * font.Body.RelativeSize
	local var6 = ""
	
	if game:GetEngineFeature("FriendRequestNicknameHistoryStorageKey") then
		ok, status = pcall(function()
			-- upvalues: appStorageService (copy)
			return {
				nicknames = appStorageService:GetItem("FriendRequestNicknameHistory")
			}
		end)
		var6 = if ok and status and status.nicknames ~= "" then status.nicknames else ""
	end
	if p1.nicknameHistory then
		var6 = p1.nicknameHistory
	end
	ok = if var6 == "" then {} else string.split(var6, ",")
	while friendRequestNicknameMaxHistory < #ok do
		table.remove(ok, 1)
	end
	status = #ok
	
	if var6 == "" then
		p1.setOnTextInput(true)
	end
	local var7, var8 = reactModule.useState("")
	local var9, var10 = reactModule.useState("")
	local var11, var12 = reactModule.useState(0)
	local var13, var14 = reactModule.useState(t_1.DROPDOWN_FRAME_HEIGHT_CLOSED)
	
	if friendRequestNicknamesUIBugFixes then
		if not p1.onTextInput then
			t_1.MODAL_POSITION = 0.5
		elseif p1.screenSize.Y < p1.screenSize.X then
			t_1.MODAL_POSITION = 0.28
		else
			t_1.MODAL_POSITION = 0.4
		end
	elseif p1.screenSize.Y < p1.screenSize.X then
		t_1.MODAL_POSITION = 0.3
	else
		t_1.MODAL_POSITION = 0.4
	end
	local var15 = reactModule.useRef(nil)
	
	local var16 = function(p2)
		-- upvalues: ok (write), friendRequestNicknameMaxHistory (copy), appStorageService (copy)
		if game:GetEngineFeature("FriendRequestNicknameHistoryStorageKey") then
			if p2 == "" then return end
			for i, v in ipairs(ok) do
				if v == p2 then
					table.remove(ok, i)
					break
				end
			end
			table.insert(ok, p2)
			while friendRequestNicknameMaxHistory < #ok do
				table.remove(ok, 1)
			end
			appStorageService:SetItem("FriendRequestNicknameHistory", if #ok == 0 then p2 else table.concat(ok, ","))
			appStorageService:Flush()
		end
	end
	
	local _ = function(p3)
		-- upvalues: var14 (ref), t_1 (copy), status (ref)
		if not p3 then
			var14(t_1.DROPDOWN_FRAME_HEIGHT_CLOSED)
			
			return
		elseif status == 3 then
			var14(t_1.DROPDOWN_FRAME_HEIGHT_OPEN_3NICKS)
			
			return
		elseif status == 2 then
			var14(t_1.DROPDOWN_FRAME_HEIGHT_OPEN_2NICKS)
			
			return
		elseif status == 1 then
			var14(t_1.DROPDOWN_FRAME_HEIGHT_OPEN_1NICK)
			
			return
		end
		var14(t_1.DROPDOWN_FRAME_HEIGHT_CLOSED)
	end
	
	local var17 = function()
		-- upvalues: p1 (ref), var7 (ref), var4 (ref), eventNamesModule (copy), var6 (write), var16 (ref), var10 (ref), t (copy), var2 (ref)
		p1.sendFriendRequestWithNickname(var7):andThen(function(_)
			-- upvalues: var4 (copy), eventNamesModule (copy), p1 (copy), var6 (copy), var7 (copy), var16 (copy)
			var4.fireAnalyticsEvent(eventNamesModule.SetNicknameAddNameClicked, {
				friendshipOriginSourceType = p1.friendRequestSource,
				previousNicknames = var6,
				submittedNickname = var7
			})
			var16(var7)
			p1.navigateBack()
		end):catch(function()
			-- upvalues: var10 (copy), t (copy), var2 (copy)
			var10(if t.Invalid == "Invalid" then var2.errorInvalidText elseif t.TooShort == "Invalid" then var2.errorTooShortText elseif t.TooLong == "Invalid" then var2.errorTooLongText elseif t.InvalidCharacters == "Invalid" then var2.errorInvalidCharactersText elseif t.Moderated == "Invalid" then var2.errorModeratedText elseif t.ModeratedDisplayName == "Invalid" then var2.errorModeratedText elseif t.UpdateThrottled == "Invalid" then var2.errorThrottledText else "")
		end)
	end
	
	local var18 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var4 (ref), eventNamesModule (copy), var6 (write)
		p1.sendFriendRequest()
		var4.fireAnalyticsEvent(eventNamesModule.SetNicknameSkipClicked, {
			friendshipOriginSourceType = p1.friendRequestSource,
			previousNicknames = var6
		})
		p1.navigateBack()
	end, { p1.sendFriendRequest, p1.navigateBack })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), eventNamesModule (copy), p1 (ref), var6 (write)
		var4.fireAnalyticsEvent(eventNamesModule.SetNicknameModalOpened, {
			friendshipOriginSourceType = p1.friendRequestSource,
			previousNicknames = var6
		})
	end, {})
	
	local var19 = function(p3)
		-- upvalues: p1 (ref), friendRequestNicknameMinChars (ref), var12 (ref), var10 (ref), var2 (ref), friendRequestNicknameMaxChars (ref), var11 (ref), var7 (ref), var15 (ref), getDeepValue (copy), t (copy), var8 (ref)
		p1.setSaveButtonEnabled(false)
		local charCount = utf8.len(p3)
		
		if charCount == nil then return end
		local var20 = charCount
		
		if var20 < friendRequestNicknameMinChars then
			var12(var20)
			var10(var2.errorTooShortText)
			
			return
		elseif friendRequestNicknameMaxChars < var20 then
			p3 = if var11 == friendRequestNicknameMaxChars then var7 else string.sub(p3, 1, utf8.offset(p3, friendRequestNicknameMaxChars + 1) - 1)
			var20 = friendRequestNicknameMaxChars
			
			if var15 and var15.current then
				var15.current.Text = p3
			end
		end
		p1.validateNickname(p3):andThen(function(p4)
			-- upvalues: getDeepValue (copy), var10 (copy), t (copy), var2 (copy), p1 (copy), var8 (copy), p3 (write)
			local var21 = getDeepValue(p4, "responseBody.status")
			
			if var21 == "Valid" then
				var10("")
				p1.setSaveButtonEnabled(true)
				var8(p3)
				
				return
			end
			var10(if var21 == t.Invalid then var2.errorInvalidText elseif var21 == t.TooShort then var2.errorTooShortText elseif var21 == t.TooLong then var2.errorTooLongText elseif var21 == t.InvalidCharacters then var2.errorInvalidCharactersText elseif var21 == t.Moderated then var2.errorModeratedText elseif var21 == t.ModeratedDisplayName then var2.errorModeratedText elseif var21 == t.UpdateThrottled then var2.errorThrottledText else "")
			p1.setSaveButtonEnabled(false)
		end):catch(function(_)
			-- upvalues: var10 (copy), var2 (copy), p1 (copy)
			var10(var2.errorInvalidText)
			p1.setSaveButtonEnabled(false)
		end)
		var12(var20)
		var8(p3)
	end
	
	local var20 = function()
		-- upvalues: images (copy), var2 (ref), var6 (write), ok (write)
		local list = {
			{
				key = "item0",
				icon = images["icons/actions/edit/edit"],
				text = var2.dropdownEntryText
			}
		}
		
		if var6 ~= "" then
			for i = #ok, 1, -1 do
				table.insert(list, { key = "item" .. i, text = ok[i] })
			end
		end
		return list
	end
	
	return reactModule.createElement(interactiveAlert, {
		title = var2.titleText,
		titleIcon = images["icons/status/success_large"],
		position = UDim2.new(0.5, 0, t_1.MODAL_POSITION, 0),
		screenSize = p1.screenSize,
		middleContent = function()
			-- upvalues: reactModule (copy), t_1 (copy), styledTextLabel (copy), var2 (ref), font (ref), theme (ref), p1 (ref), imageSetLabel (copy), var5 (ref), images (copy), var9 (ref), callbackInputBox (copy), var7 (ref), iconSize (copy), var19 (ref), var15 (ref), var6 (write), var13 (ref), dropdownMenu (copy), var8 (ref), ok (write), status (ref), var14 (ref), var20 (ref), utilityActionIcon (copy), var11 (ref), friendRequestNicknameMaxChars (ref)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 0),
				Position = UDim2.new(0.5, 0, 0, t_1.DROPDOWN_FRAME_POSITION),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, t_1.CONTENT_PADDING),
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Description = reactModule.createElement(styledTextLabel, {
					layoutOrder = 1,
					textWrapped = true,
					lineHeight = 1,
					fluidSizing = false,
					text = var2.bodyText,
					size = UDim2.new(1, 0, 0, 0),
					fontStyle = font.Body,
					colorStyle = theme.TextEmphasis,
					textXAlignment = Enum.TextXAlignment.Center,
					textYAlignment = Enum.TextYAlignment.Center,
					automaticSize = Enum.AutomaticSize.Y
				}),
				Notice = reactModule.createElement(styledTextLabel, {
					layoutOrder = 3,
					textWrapped = true,
					lineHeight = 1,
					fluidSizing = false,
					text = var2.privacyText,
					size = UDim2.new(1, 0, 0, 0),
					fontStyle = font.CaptionBody,
					colorStyle = theme.TextMuted,
					textXAlignment = Enum.TextXAlignment.Center,
					textYAlignment = Enum.TextYAlignment.Center,
					automaticSize = Enum.AutomaticSize.Y
				}),
				InputBackground = if p1.onTextInput then reactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 6,
					Size = UDim2.new(1, 0, 0, var5 + t_1.TEXTBOX_VERTICAL_PADDING * 2),
					Image = images["component_assets/circle_21"],
					ImageTransparency = theme.UIMuted.Transparency,
					ScaleType = Enum.ScaleType.Slice,
					ImageColor3 = theme.UIMuted.Color,
					SliceCenter = Rect.new(8, 8, 9, 9)
				}, {
					InputBorder = reactModule.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, var5 + t_1.TEXTBOX_VERTICAL_PADDING * 2),
						Image = images["component_assets/circle_21_stroke_1"],
						ScaleType = Enum.ScaleType.Slice,
						ImageColor3 = if var9 ~= "" then theme.Divider.Color else theme.Alert.Color,
						SliceCenter = Rect.new(8, 8, 9, 9)
					}, {
						Padding = reactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, t_1.TEXTBOX_HORIZONTAL_PADDING),
							PaddingRight = UDim.new(0, t_1.TEXTBOX_HORIZONTAL_PADDING)
						}),
						InputTextbox = reactModule.createElement(callbackInputBox, {
							captureFocusOnMount = true,
							clearButtonDisabled = false,
							inputTextColor3 = theme.TextDefault.Color,
							inputTextXAlignment = Enum.TextXAlignment.Left,
							inputTextTransparency = theme.TextDefault.Transparency,
							inputTextSize = var5,
							initialInputText = var7,
							placeholderText = var2.textboxPlaceholder,
							placeholderTextColor3 = theme.TextDefault.Color,
							clearIcon = images["icons/actions/edit/clear_small"],
							clearIconColor3 = theme.IconEmphasis.Color,
							clearButtonSize = iconSize.Small,
							textChangedCallback = var19,
							inputBoxRef = var15
						})
					})
				}) else nil,
				Dropdown = if p1.onTextInput or var6 == "" then if var6 ~= "" then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 5,
					Size = UDim2.new(1, 0, 0, 10)
				}, {
					Layout = reactModule.createElement("UIListLayout", {
						Padding = UDim.new(0, t_1.CONTENT_PADDING),
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					PlaceholderElement = reactModule.createElement(styledTextLabel, {
						layoutOrder = 5,
						text = "",
						textWrapped = true,
						lineHeight = 1,
						fluidSizing = false,
						fontStyle = font.Header2,
						colorStyle = theme.TextMuted,
						textTruncate = Enum.TextTruncate.AtEnd,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Center
					})
				}) else reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 5,
					Size = UDim2.new(1, 0, 0, 30)
				}, {
					TextFrame = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 5,
						Size = UDim2.new(1, 0, 0, 30)
					}, {
						Layout = reactModule.createElement("UIListLayout", {
							Padding = UDim.new(0, t_1.CONTENT_PADDING),
							FillDirection = Enum.FillDirection.Horizontal,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						Padding = reactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, t_1.TEXTBOX_HORIZONTAL_PADDING)
						}),
						Text = reactModule.createElement(styledTextLabel, {
							layoutOrder = 5,
							textWrapped = true,
							lineHeight = 1,
							fluidSizing = false,
							text = var2.dropdownEntryText,
							fontStyle = font.Header2,
							colorStyle = theme.TextMuted,
							textTruncate = Enum.TextTruncate.AtEnd,
							textXAlignment = Enum.TextXAlignment.Left,
							textYAlignment = Enum.TextYAlignment.Center
						})
					}),
					CancelFrame = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 5,
						Size = UDim2.new(1, 0, 0, 30)
					}, {
						Layout = reactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							HorizontalAlignment = Enum.HorizontalAlignment.Right,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						Cancel = reactModule.createElement(utilityActionIcon, {
							layoutOrder = 6,
							iconSize = iconSize.Small,
							icon = images["icons/actions/edit/clear"],
							onActivated = function()
								-- upvalues: p1 (copy), var14 (copy), t_1 (copy)
								p1.setOnTextInput(false)
								var14(t_1.DROPDOWN_FRAME_HEIGHT_CLOSED)
							end
						})
					})
				}) else reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 5,
					Size = UDim2.new(1, 0, 0, var13)
				}, {
					DropdownMenu = reactModule.createElement(dropdownMenu, {
						errorState = false,
						showDropShadow = true,
						dropdownMenuListPositionFixed = true,
						placeholder = var2.dropdownPlaceholder,
						height = UDim.new(0, t_1.DROPDOWN_HEIGHT),
						onChange = function(p3)
							-- upvalues: p1 (copy), var8 (copy), ok (copy)
							local var21 = tonumber(string.gsub(p3, "%D", ""))
							
							if var21 then
								if var21 == 0 then
									p1.setOnTextInput(true)
									
									return
								end
								var8(ok[var21])
								p1.setSaveButtonEnabled(true)
							end
						end,
						onMenuOpenChange = function(p3)
							-- upvalues: status (copy), var14 (copy), t_1 (copy)
							if not p3 then
								var14(t_1.DROPDOWN_FRAME_HEIGHT_CLOSED)
								
								return
							elseif status == 3 then
								var14(t_1.DROPDOWN_FRAME_HEIGHT_OPEN_3NICKS)
								
								return
							elseif status == 2 then
								var14(t_1.DROPDOWN_FRAME_HEIGHT_OPEN_2NICKS)
								
								return
							elseif status == 1 then
								var14(t_1.DROPDOWN_FRAME_HEIGHT_OPEN_1NICK)
								
								return
							end
							var14(t_1.DROPDOWN_FRAME_HEIGHT_CLOSED)
						end,
						screenSize = p1.screenSize,
						cellDatas = var20()
					})
				}),
				Counter = if p1.onTextInput then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 7,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						Padding = UDim.new(0, t_1.CONTENT_PADDING / 2),
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					CountText = reactModule.createElement(styledTextLabel, {
						layoutOrder = 1,
						fontStyle = font.CaptionBody,
						text = string.format("%d/%d", var11, friendRequestNicknameMaxChars),
						colorStyle = if var11 == friendRequestNicknameMaxChars then theme.Alert else theme.TextMuted,
						textXAlignment = Enum.TextXAlignment.Center,
						textYAlignment = Enum.TextYAlignment.Top
					}),
					ErrorText = if var9 ~= "" then nil else reactModule.createElement(styledTextLabel, {
						layoutOrder = 2,
						fontStyle = font.CaptionBody,
						text = var9,
						colorStyle = theme.Alert,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Top
					})
				}) else nil
			})
		end,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = { onActivated = var18, text = var2.skipButtonText }
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = var17,
						text = var2.addNicknameText,
						isDisabled = not p1.isSaveButtonEnabled
					}
				}
			}
		}
	})
end