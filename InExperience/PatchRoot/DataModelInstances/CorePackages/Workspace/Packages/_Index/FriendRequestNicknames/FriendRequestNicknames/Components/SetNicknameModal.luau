local parent = script.Parent.Parent
local parent_1 = parent.Parent
local appStorageService = game:GetService("AppStorageService")
local reactModule = require(parent_1.React)
local UIBloxModule = require(parent_1.UIBlox)
local var3 = require(parent_1.SocialLibraries).SocialLibraries.config({})
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
local callbackInputBox = var3.Components.CallbackInputBox
local getDeepValue = var3.Dictionary.getDeepValue
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

return function(p0)
	-- upvalues: useLocalization (ref), textKeysModule (ref), friendRequestNicknameMinChars (ref), friendRequestNicknameMaxChars (ref), useStyle (ref), analytics (ref), appStorageService (ref), friendRequestNicknameMaxHistory (ref), reactModule (ref), t_1 (ref), friendRequestNicknamesUIBugFixes (ref), eventNamesModule (ref), t (ref), getDeepValue (ref), images (ref), interactiveAlert (ref), styledTextLabel (ref), imageSetLabel (ref), callbackInputBox (ref), iconSize (ref), dropdownMenu (ref), utilityActionIcon (ref), buttonType (ref)
	local ok, status
	local var13 = useLocalization({
		titleText = textKeysModule.TitleText,
		bodyText = if p0.recipientDisplayName then {
			textKeysModule.BodyText,
			displayName = "<font weight=\"medium\">" .. p0.recipientDisplayName .. "</font>"
		} else { textKeysModule.BodyTextNoDisplayName },
		privacyText = if p0.recipientDisplayName then {
			textKeysModule.PrivacyText,
			displayName = p0.recipientDisplayName
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
	
	local _ = function(p1)
		-- upvalues: var13 (ref)
		return if p1 == "Invalid" then var13.errorInvalidText elseif p1 == "TooShort" then var13.errorTooShortText elseif p1 == "TooLong" then var13.errorTooLongText elseif p1 == "InvalidCharacters" then var13.errorInvalidCharactersText elseif p1 == "Moderated" then var13.errorModeratedText elseif p1 == "ModeratedDisplayNameWithNickname" then var13.errorModeratedText elseif p1 == "UpdateThrottled" then var13.errorThrottledText else ""
	end
	
	local var14 = useStyle()
	local var15 = analytics()
	local theme = var14.Theme
	local font = var14.Font
	local var16 = font.BaseSize * font.Body.RelativeSize
	local var17 = ""
	
	if game:GetEngineFeature("FriendRequestNicknameHistoryStorageKey") then
		ok, status = pcall(function()
			-- upvalues: appStorageService (copy)
			return {
				nicknames = appStorageService:GetItem("FriendRequestNicknameHistory")
			}
		end)
		var17 = if ok and status and status.nicknames ~= "" then status.nicknames else ""
	end
	if p0.nicknameHistory then
		var17 = p0.nicknameHistory
	end
	ok = if var17 == "" then {} else string.split(var17, ",")
	while friendRequestNicknameMaxHistory < #ok do
		table.remove(ok, 1)
	end
	status = #ok
	
	if var17 == "" then
		p0.setOnTextInput(true)
	end
	local var18, var19 = reactModule.useState("")
	local var20, var21 = reactModule.useState("")
	local var22, var23 = reactModule.useState(0)
	local var24, var25 = reactModule.useState(t_1.DROPDOWN_FRAME_HEIGHT_CLOSED)
	
	if friendRequestNicknamesUIBugFixes then
		if not p0.onTextInput then
			t_1.MODAL_POSITION = 0.5
		elseif p0.screenSize.Y < p0.screenSize.X then
			t_1.MODAL_POSITION = 0.28
		else
			t_1.MODAL_POSITION = 0.4
		end
	elseif p0.screenSize.Y < p0.screenSize.X then
		t_1.MODAL_POSITION = 0.3
	else
		t_1.MODAL_POSITION = 0.4
	end
	local var26 = reactModule.useRef(nil)
	
	local var27 = function(p2)
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
		-- upvalues: var25 (ref), t_1 (copy), status (ref)
		if not p3 then
			var25(t_1.DROPDOWN_FRAME_HEIGHT_CLOSED)
			
			return
		elseif status == 3 then
			var25(t_1.DROPDOWN_FRAME_HEIGHT_OPEN_3NICKS)
			
			return
		elseif status == 2 then
			var25(t_1.DROPDOWN_FRAME_HEIGHT_OPEN_2NICKS)
			
			return
		elseif status == 1 then
			var25(t_1.DROPDOWN_FRAME_HEIGHT_OPEN_1NICK)
			
			return
		end
		var25(t_1.DROPDOWN_FRAME_HEIGHT_CLOSED)
	end
	
	local var28 = function()
		-- upvalues: p0 (ref), var18 (ref), var15 (ref), eventNamesModule (copy), var17 (write), var27 (ref), var21 (ref), t (copy), var13 (ref)
		p0.sendFriendRequestWithNickname(var18):andThen(function(_)
			-- upvalues: var15 (copy), eventNamesModule (copy), p0 (copy), var17 (copy), var18 (copy), var27 (copy)
			var15.fireAnalyticsEvent(eventNamesModule.SetNicknameAddNameClicked, {
				friendshipOriginSourceType = p0.friendRequestSource,
				previousNicknames = var17,
				submittedNickname = var18
			})
			var27(var18)
			p0.navigateBack()
		end):catch(function()
			-- upvalues: var21 (copy), t (copy), var13 (copy)
			var21(if t.Invalid == "Invalid" then var13.errorInvalidText elseif t.TooShort == "Invalid" then var13.errorTooShortText elseif t.TooLong == "Invalid" then var13.errorTooLongText elseif t.InvalidCharacters == "Invalid" then var13.errorInvalidCharactersText elseif t.Moderated == "Invalid" then var13.errorModeratedText elseif t.ModeratedDisplayName == "Invalid" then var13.errorModeratedText elseif t.UpdateThrottled == "Invalid" then var13.errorThrottledText else "")
		end)
	end
	
	local var29 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), var15 (ref), eventNamesModule (copy), var17 (write)
		p0.sendFriendRequest()
		var15.fireAnalyticsEvent(eventNamesModule.SetNicknameSkipClicked, {
			friendshipOriginSourceType = p0.friendRequestSource,
			previousNicknames = var17
		})
		p0.navigateBack()
	end, { p0.sendFriendRequest, p0.navigateBack })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), eventNamesModule (copy), p0 (ref), var17 (write)
		var15.fireAnalyticsEvent(eventNamesModule.SetNicknameModalOpened, {
			friendshipOriginSourceType = p0.friendRequestSource,
			previousNicknames = var17
		})
	end, {})
	
	local var30 = function(p4)
		-- upvalues: p0 (ref), friendRequestNicknameMinChars (ref), var23 (ref), var21 (ref), var13 (ref), friendRequestNicknameMaxChars (ref), var22 (ref), var18 (ref), var26 (ref), getDeepValue (copy), t (copy), var19 (ref)
		p0.setSaveButtonEnabled(false)
		local charCount = utf8.len(p4)
		
		if charCount == nil then return end
		local var33 = charCount
		
		if var33 < friendRequestNicknameMinChars then
			var23(var33)
			var21(var13.errorTooShortText)
			
			return
		elseif friendRequestNicknameMaxChars < var33 then
			p4 = if var22 == friendRequestNicknameMaxChars then var18 else string.sub(p4, 1, utf8.offset(p4, friendRequestNicknameMaxChars + 1) - 1)
			var33 = friendRequestNicknameMaxChars
			
			if var26 and var26.current then
				var26.current.Text = p4
			end
		end
		p0.validateNickname(p4):andThen(function(p5)
			-- upvalues: getDeepValue (copy), var21 (copy), t (copy), var13 (copy), p0 (copy), var19 (copy), p4 (write)
			local var34 = getDeepValue(p5, "responseBody.status")
			
			if var34 == "Valid" then
				var21("")
				p0.setSaveButtonEnabled(true)
				var19(p4)
				
				return
			end
			var21(if var34 == t.Invalid then var13.errorInvalidText elseif var34 == t.TooShort then var13.errorTooShortText elseif var34 == t.TooLong then var13.errorTooLongText elseif var34 == t.InvalidCharacters then var13.errorInvalidCharactersText elseif var34 == t.Moderated then var13.errorModeratedText elseif var34 == t.ModeratedDisplayName then var13.errorModeratedText elseif var34 == t.UpdateThrottled then var13.errorThrottledText else "")
			p0.setSaveButtonEnabled(false)
		end):catch(function(_)
			-- upvalues: var21 (copy), var13 (copy), p0 (copy)
			var21(var13.errorInvalidText)
			p0.setSaveButtonEnabled(false)
		end)
		var23(var33)
		var19(p4)
	end
	
	local var31 = function()
		-- upvalues: images (copy), var13 (ref), var17 (write), ok (write)
		local list = {
			{
				key = "item0",
				icon = images["icons/actions/edit/edit"],
				text = var13.dropdownEntryText
			}
		}
		
		if var17 ~= "" then
			for i = #ok, 1, -1 do
				table.insert(list, { key = "item" .. i, text = ok[i] })
			end
		end
		return list
	end
	
	return reactModule.createElement(interactiveAlert, {
		title = var13.titleText,
		titleIcon = images["icons/status/success_large"],
		position = UDim2.new(0.5, 0, t_1.MODAL_POSITION, 0),
		screenSize = p0.screenSize,
		middleContent = function()
			-- upvalues: reactModule (copy), t_1 (copy), styledTextLabel (copy), var13 (ref), font (ref), theme (ref), p0 (ref), imageSetLabel (copy), var16 (ref), images (copy), var20 (ref), callbackInputBox (copy), var18 (ref), iconSize (copy), var30 (ref), var26 (ref), var17 (write), var24 (ref), dropdownMenu (copy), var19 (ref), ok (write), status (ref), var25 (ref), var31 (ref), utilityActionIcon (copy), var22 (ref), friendRequestNicknameMaxChars (ref)
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
					text = var13.bodyText,
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
					text = var13.privacyText,
					size = UDim2.new(1, 0, 0, 0),
					fontStyle = font.CaptionBody,
					colorStyle = theme.TextMuted,
					textXAlignment = Enum.TextXAlignment.Center,
					textYAlignment = Enum.TextYAlignment.Center,
					automaticSize = Enum.AutomaticSize.Y
				}),
				InputBackground = if p0.onTextInput then reactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 6,
					Size = UDim2.new(1, 0, 0, var16 + t_1.TEXTBOX_VERTICAL_PADDING * 2),
					Image = images["component_assets/circle_21"],
					ImageTransparency = theme.UIMuted.Transparency,
					ScaleType = Enum.ScaleType.Slice,
					ImageColor3 = theme.UIMuted.Color,
					SliceCenter = Rect.new(8, 8, 9, 9)
				}, {
					InputBorder = reactModule.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, var16 + t_1.TEXTBOX_VERTICAL_PADDING * 2),
						Image = images["component_assets/circle_21_stroke_1"],
						ScaleType = Enum.ScaleType.Slice,
						ImageColor3 = if var20 ~= "" then theme.Divider.Color else theme.Alert.Color,
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
							inputTextSize = var16,
							initialInputText = var18,
							placeholderText = var13.textboxPlaceholder,
							placeholderTextColor3 = theme.TextDefault.Color,
							clearIcon = images["icons/actions/edit/clear_small"],
							clearIconColor3 = theme.IconEmphasis.Color,
							clearButtonSize = iconSize.Small,
							textChangedCallback = var30,
							inputBoxRef = var26
						})
					})
				}) else nil,
				Dropdown = if p0.onTextInput or var17 == "" then if var17 ~= "" then reactModule.createElement("Frame", {
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
							text = var13.dropdownEntryText,
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
								-- upvalues: p0 (copy), var25 (copy), t_1 (copy)
								p0.setOnTextInput(false)
								var25(t_1.DROPDOWN_FRAME_HEIGHT_CLOSED)
							end
						})
					})
				}) else reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 5,
					Size = UDim2.new(1, 0, 0, var24)
				}, {
					DropdownMenu = reactModule.createElement(dropdownMenu, {
						errorState = false,
						showDropShadow = true,
						dropdownMenuListPositionFixed = true,
						placeholder = var13.dropdownPlaceholder,
						height = UDim.new(0, t_1.DROPDOWN_HEIGHT),
						onChange = function(p6)
							-- upvalues: p0 (copy), var19 (copy), ok (copy)
							local var36 = tonumber(string.gsub(p6, "%D", ""))
							
							if var36 then
								if var36 == 0 then
									p0.setOnTextInput(true)
									
									return
								end
								var19(ok[var36])
								p0.setSaveButtonEnabled(true)
							end
						end,
						onMenuOpenChange = function(p7)
							-- upvalues: status (copy), var25 (copy), t_1 (copy)
							if not p7 then
								var25(t_1.DROPDOWN_FRAME_HEIGHT_CLOSED)
								
								return
							elseif status == 3 then
								var25(t_1.DROPDOWN_FRAME_HEIGHT_OPEN_3NICKS)
								
								return
							elseif status == 2 then
								var25(t_1.DROPDOWN_FRAME_HEIGHT_OPEN_2NICKS)
								
								return
							elseif status == 1 then
								var25(t_1.DROPDOWN_FRAME_HEIGHT_OPEN_1NICK)
								
								return
							end
							var25(t_1.DROPDOWN_FRAME_HEIGHT_CLOSED)
						end,
						screenSize = p0.screenSize,
						cellDatas = var31()
					})
				}),
				Counter = if p0.onTextInput then reactModule.createElement("Frame", {
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
						text = string.format("%d/%d", var22, friendRequestNicknameMaxChars),
						colorStyle = if var22 == friendRequestNicknameMaxChars then theme.Alert else theme.TextMuted,
						textXAlignment = Enum.TextXAlignment.Center,
						textYAlignment = Enum.TextYAlignment.Top
					}),
					ErrorText = if var20 ~= "" then nil else reactModule.createElement(styledTextLabel, {
						layoutOrder = 2,
						fontStyle = font.CaptionBody,
						text = var20,
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
					props = { onActivated = var29, text = var13.skipButtonText }
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = var28,
						text = var13.addNicknameText,
						isDisabled = not p0.isSaveButtonEnabled
					}
				}
			}
		}
	})
end