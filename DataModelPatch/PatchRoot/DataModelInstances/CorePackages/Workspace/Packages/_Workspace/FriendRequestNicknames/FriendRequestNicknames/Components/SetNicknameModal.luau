local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local AppStorageService = game:GetService("AppStorageService")
local ReactModule = require(Parent1.React)
local UIBloxModule = require(Parent1.UIBlox)
local ConfigResult = require(Parent1.SocialLibraries).SocialLibraries.config({})
local _ = require(Parent1.LuauPolyfill)
local AnalyticsFunction = require(Parent.Analytics).Analytics
local EventNamesModule = require(Parent.Analytics.EventNames)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local DropdownMenu = UIBloxModule.App.Menu.DropdownMenu
local IconSize = UIBloxModule.App.Constant.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UtilityActionIcon = UIBloxModule.App.Button.UtilityActionIcon
local CallbackInputBox = ConfigResult.Components.CallbackInputBox
local GetDeepValueFunction = ConfigResult.Dictionary.getDeepValue
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local TextKeysModule = require(Parent.Common.TextKeys)
local FriendRequestNicknameMinChars = game:DefineFastInt("FriendRequestNicknameMinChars", 2)
local FriendRequestNicknameMaxChars = game:DefineFastInt("FriendRequestNicknameMaxChars", 20)
local FriendRequestNicknameMaxHistory = game:DefineFastInt("FriendRequestNicknameMaxHistory", 3)
local FriendRequestNicknamesUIBugFixes = game:DefineFastFlag("FriendRequestNicknamesUIBugFixes", false)
local config = {
	Invalid = "Invalid",
	Valid = "Valid",
	TooShort = "TooShort",
	TooLong = "TooLong",
	InvalidCharacters = "InvalidCharacters",
	Moderated = "Moderated",
	ModeratedDisplayName = "ModeratedDisplayNameWithNickname",
	UpdateThrottled = "UpdateThrottled"
}
local config1 = {
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
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), FriendRequestNicknameMinChars (copy), FriendRequestNicknameMaxChars (copy), UseStyleFunction (copy), AnalyticsFunction (copy), AppStorageService (copy), FriendRequestNicknameMaxHistory (copy), ReactModule (copy), config1 (copy), FriendRequestNicknamesUIBugFixes (copy), EventNamesModule (copy), config (copy), GetDeepValueFunction (copy), Images (copy), InteractiveAlert (copy), StyledTextLabel (copy), ImageSetLabel (copy), CallbackInputBox (copy), IconSize (copy), DropdownMenu (copy), UtilityActionIcon (copy), ButtonType (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = TextKeysModule.TitleText,
		bodyText = if p1.recipientDisplayName then {
			TextKeysModule.BodyText,
			displayName = "<font weight=\"medium\">" .. p1.recipientDisplayName .. "</font>"
		} else { TextKeysModule.BodyTextNoDisplayName },
		privacyText = if p1.recipientDisplayName then {
			TextKeysModule.PrivacyText,
			displayName = p1.recipientDisplayName
		} else { TextKeysModule.PrivacyTextNoDisplayName },
		skipButtonText = TextKeysModule.Skip,
		addNicknameText = TextKeysModule.AddNickname,
		dropdownEntryText = TextKeysModule.NicknameDropdownLabel,
		errorInvalidText = TextKeysModule.ErrorMessageInvalid,
		errorTooShortText = TextKeysModule.ErrorTooShort,
		errorTooLongText = TextKeysModule.ErrorTooLong,
		errorInvalidCharactersText = TextKeysModule.ErrorInvalidCharacters,
		errorModeratedText = TextKeysModule.ErrorModerated,
		errorThrottledText = TextKeysModule.ErrorMessageThrottled,
		dropdownPlaceholder = TextKeysModule.DropdownPlaceholder,
		textboxPlaceholder = TextKeysModule.TextboxPlaceholder
	})
	
	local function _(p2)
		-- upvalues: UseLocalizationResult (copy)
		return if p2 == "Invalid" then UseLocalizationResult.errorInvalidText elseif p2 == "TooShort" then UseLocalizationResult.errorTooShortText elseif p2 == "TooLong" then UseLocalizationResult.errorTooLongText elseif p2 == "InvalidCharacters" then UseLocalizationResult.errorInvalidCharactersText elseif p2 == "Moderated" then UseLocalizationResult.errorModeratedText elseif p2 == "ModeratedDisplayNameWithNickname" then UseLocalizationResult.errorModeratedText elseif p2 == "UpdateThrottled" then UseLocalizationResult.errorThrottledText else ""
	end
	
	local UseStyleResult = UseStyleFunction()
	local AnalyticsResult = AnalyticsFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize
	local Text = ""
	
	if game:GetEngineFeature("FriendRequestNicknameHistoryStorageKey") then
		local Success, Result = pcall(function()
			-- upvalues: AppStorageService (upval)
			return {
				nicknames = AppStorageService:GetItem("FriendRequestNicknameHistory")
			}
		end)
		Text = if Success and Result and Result.nicknames ~= "" then Result.nicknames else ""
	end
	if p1.nicknameHistory then
		Text = p1.nicknameHistory
	end
	local T = nil
	T = if Text == "" then {} else string.split(Text, ",")
	while FriendRequestNicknameMaxHistory < #T do
		table.remove(T, 1)
	end
	local CountT = #T
	
	if Text == "" then
		p1.setOnTextInput(true)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(config1.DROPDOWN_FRAME_HEIGHT_CLOSED)
	
	if FriendRequestNicknamesUIBugFixes then
		if p1.onTextInput then
			if p1.screenSize.Y < p1.screenSize.X then
				config1.MODAL_POSITION = 0.28
			else
				config1.MODAL_POSITION = 0.4
			end
		else
			config1.MODAL_POSITION = 0.5
		end
	elseif p1.screenSize.Y < p1.screenSize.X then
		config1.MODAL_POSITION = 0.3
	else
		config1.MODAL_POSITION = 0.4
	end
	local UseRefResult = ReactModule.useRef(nil)
	
	local function v34(InitialInputText)
		-- upvalues: T (ref), FriendRequestNicknameMaxHistory (upval), AppStorageService (upval)
		if game:GetEngineFeature("FriendRequestNicknameHistoryStorageKey") then
			if InitialInputText == "" then return end
			for i, value in ipairs(T) do
				if value == InitialInputText then
					table.remove(T, i)
					break
				end
			end
			table.insert(T, InitialInputText)
			while FriendRequestNicknameMaxHistory < #T do
				table.remove(T, 1)
			end
			AppStorageService:SetItem("FriendRequestNicknameHistory", if #T == 0 then InitialInputText else table.concat(T, ","))
			AppStorageService:Flush()
		end
	end
	
	local _ = function(p2)
		-- upvalues: UseStateResult2_3 (copy), config1 (upval), CountT (copy)
		if not p2 then
			UseStateResult2_3(config1.DROPDOWN_FRAME_HEIGHT_CLOSED)
			
			return
		end
		if CountT == 3 then
			UseStateResult2_3(config1.DROPDOWN_FRAME_HEIGHT_OPEN_3NICKS)
			
			return
		end
		if CountT == 2 then
			UseStateResult2_3(config1.DROPDOWN_FRAME_HEIGHT_OPEN_2NICKS)
			
			return
		end
		if CountT == 1 then
			UseStateResult2_3(config1.DROPDOWN_FRAME_HEIGHT_OPEN_1NICK)
			
			return
		else
			UseStateResult2_3(config1.DROPDOWN_FRAME_HEIGHT_CLOSED)
		end
	end
	
	local function OnActivated()
		-- upvalues: p1 (copy), UseStateResult (copy), AnalyticsResult (copy), EventNamesModule (upval), Text (ref), v34 (copy), UseStateResult2_1 (copy), config (upval), UseLocalizationResult (copy)
		p1.sendFriendRequestWithNickname(UseStateResult):andThen(function(_)
			-- upvalues: AnalyticsResult (upval), EventNamesModule (upval), p1 (upval), Text (upval), UseStateResult (upval), v34 (upval)
			AnalyticsResult.fireAnalyticsEvent(EventNamesModule.SetNicknameAddNameClicked, {
				friendshipOriginSourceType = p1.friendRequestSource,
				previousNicknames = Text,
				submittedNickname = UseStateResult
			})
			v34(UseStateResult)
			p1.navigateBack()
		end):catch(function()
			-- upvalues: UseStateResult2_1 (upval), config (upval), UseLocalizationResult (upval)
			UseStateResult2_1(if config.Invalid == "Invalid" then UseLocalizationResult.errorInvalidText elseif config.TooShort == "Invalid" then UseLocalizationResult.errorTooShortText elseif config.TooLong == "Invalid" then UseLocalizationResult.errorTooLongText elseif config.InvalidCharacters == "Invalid" then UseLocalizationResult.errorInvalidCharactersText elseif config.Moderated == "Invalid" then UseLocalizationResult.errorModeratedText elseif config.ModeratedDisplayName == "Invalid" then UseLocalizationResult.errorModeratedText elseif config.UpdateThrottled == "Invalid" then UseLocalizationResult.errorThrottledText else "")
		end)
	end
	
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), AnalyticsResult (copy), EventNamesModule (upval), Text (ref)
		p1.sendFriendRequest()
		AnalyticsResult.fireAnalyticsEvent(EventNamesModule.SetNicknameSkipClicked, {
			friendshipOriginSourceType = p1.friendRequestSource,
			previousNicknames = Text
		})
		p1.navigateBack()
	end, { p1.sendFriendRequest, p1.navigateBack })
	ReactModule.useEffect(function()
		-- upvalues: AnalyticsResult (copy), EventNamesModule (upval), p1 (copy), Text (ref)
		AnalyticsResult.fireAnalyticsEvent(EventNamesModule.SetNicknameModalOpened, {
			friendshipOriginSourceType = p1.friendRequestSource,
			previousNicknames = Text
		})
	end, {})
	
	local function TextChangedCallback(Text: string)
		-- upvalues: p1 (copy), FriendRequestNicknameMinChars (copy), UseStateResult2_2 (copy), UseStateResult2_1 (copy), UseLocalizationResult (copy), FriendRequestNicknameMaxChars (copy), UseStateResult3 (copy), UseStateResult (copy), UseRefResult (copy), GetDeepValueFunction (upval), config (upval), UseStateResult2 (copy)
		p1.setSaveButtonEnabled(false)
		local Length = utf8.len(Text)
		
		if Length == nil then return end
		local Length1: number = Length
		
		if Length1 < FriendRequestNicknameMinChars then
			UseStateResult2_2(Length1)
			UseStateResult2_1(UseLocalizationResult.errorTooShortText)
			
			return
		end
		if FriendRequestNicknameMaxChars < Length1 then
			if UseStateResult3 == FriendRequestNicknameMaxChars then
				Text = UseStateResult
			else
				Text = string.sub(Text, 1, utf8.offset(Text, FriendRequestNicknameMaxChars + 1) - 1)
			end
			Length1 = FriendRequestNicknameMaxChars
			
			if UseRefResult and UseRefResult.current then
				UseRefResult.current.Text = Text
			end
		end
		p1.validateNickname(Text):andThen(function(Result)
			-- upvalues: GetDeepValueFunction (upval), UseStateResult2_1 (upval), config (upval), UseLocalizationResult (upval), p1 (upval), UseStateResult2 (upval), Text (ref)
			local ResponseBodyStatus = GetDeepValueFunction(Result, "responseBody.status")
			
			if ResponseBodyStatus == "Valid" then
				UseStateResult2_1("")
				p1.setSaveButtonEnabled(true)
				UseStateResult2(Text)
				
				return
			else
				UseStateResult2_1(if ResponseBodyStatus == config.Invalid then UseLocalizationResult.errorInvalidText elseif ResponseBodyStatus == config.TooShort then UseLocalizationResult.errorTooShortText elseif ResponseBodyStatus == config.TooLong then UseLocalizationResult.errorTooLongText elseif ResponseBodyStatus == config.InvalidCharacters then UseLocalizationResult.errorInvalidCharactersText elseif ResponseBodyStatus == config.Moderated then UseLocalizationResult.errorModeratedText elseif ResponseBodyStatus == config.ModeratedDisplayName then UseLocalizationResult.errorModeratedText elseif ResponseBodyStatus == config.UpdateThrottled then UseLocalizationResult.errorThrottledText else "")
				p1.setSaveButtonEnabled(false)
			end
		end):catch(function(_)
			-- upvalues: UseStateResult2_1 (upval), UseLocalizationResult (upval), p1 (upval)
			UseStateResult2_1(UseLocalizationResult.errorInvalidText)
			p1.setSaveButtonEnabled(false)
		end)
		UseStateResult2_2(Length1)
		UseStateResult2(Text)
	end
	
	local function v39()
		-- upvalues: Images (upval), UseLocalizationResult (copy), Text (ref), T (ref)
		local List = {
			{
				key = "item0",
				icon = Images["icons/actions/edit/edit"],
				text = UseLocalizationResult.dropdownEntryText
			}
		}
		
		if Text ~= "" then
			for i = #T, 1, -1 do
				table.insert(List, { key = "item" .. i, text = T[i] })
			end
		end
		return List
	end
	
	return ReactModule.createElement(InteractiveAlert, {
		title = UseLocalizationResult.titleText,
		titleIcon = Images["icons/status/success_large"],
		position = UDim2.new(0.5, 0, config1.MODAL_POSITION, 0),
		screenSize = p1.screenSize,
		middleContent = function()
			-- upvalues: ReactModule (upval), config1 (upval), StyledTextLabel (upval), UseLocalizationResult (copy), UseStyleResultFont (copy), Theme (copy), p1 (copy), ImageSetLabel (upval), ScaledBaseSize (copy), Images (upval), UseStateResult1 (copy), CallbackInputBox (upval), UseStateResult (copy), IconSize (upval), TextChangedCallback (copy), UseRefResult (copy), Text (ref), UseStateResult4 (copy), DropdownMenu (upval), UseStateResult2 (copy), T (ref), CountT (copy), UseStateResult2_3 (copy), v39 (copy), UtilityActionIcon (upval), UseStateResult3 (copy), FriendRequestNicknameMaxChars (copy)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 0),
				Position = UDim2.new(0.5, 0, 0, config1.DROPDOWN_FRAME_POSITION),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, config1.CONTENT_PADDING),
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Description = ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 1,
					textWrapped = true,
					lineHeight = 1,
					fluidSizing = false,
					text = UseLocalizationResult.bodyText,
					size = UDim2.new(1, 0, 0, 0),
					fontStyle = UseStyleResultFont.Body,
					colorStyle = Theme.TextEmphasis,
					textXAlignment = Enum.TextXAlignment.Center,
					textYAlignment = Enum.TextYAlignment.Center,
					automaticSize = Enum.AutomaticSize.Y
				}),
				Notice = ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 3,
					textWrapped = true,
					lineHeight = 1,
					fluidSizing = false,
					text = UseLocalizationResult.privacyText,
					size = UDim2.new(1, 0, 0, 0),
					fontStyle = UseStyleResultFont.CaptionBody,
					colorStyle = Theme.TextMuted,
					textXAlignment = Enum.TextXAlignment.Center,
					textYAlignment = Enum.TextYAlignment.Center,
					automaticSize = Enum.AutomaticSize.Y
				}),
				InputBackground = if p1.onTextInput then ReactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 6,
					Size = UDim2.new(1, 0, 0, ScaledBaseSize + config1.TEXTBOX_VERTICAL_PADDING * 2),
					Image = Images["component_assets/circle_21"],
					ImageTransparency = Theme.UIMuted.Transparency,
					ScaleType = Enum.ScaleType.Slice,
					ImageColor3 = Theme.UIMuted.Color,
					SliceCenter = Rect.new(8, 8, 9, 9)
				}, {
					InputBorder = ReactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, ScaledBaseSize + config1.TEXTBOX_VERTICAL_PADDING * 2),
						Image = Images["component_assets/circle_21_stroke_1"],
						ScaleType = Enum.ScaleType.Slice,
						ImageColor3 = if UseStateResult1 == "" then Theme.Divider.Color else Theme.Alert.Color,
						SliceCenter = Rect.new(8, 8, 9, 9)
					}, {
						Padding = ReactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, config1.TEXTBOX_HORIZONTAL_PADDING),
							PaddingRight = UDim.new(0, config1.TEXTBOX_HORIZONTAL_PADDING)
						}),
						InputTextbox = ReactModule.createElement(CallbackInputBox, {
							captureFocusOnMount = true,
							clearButtonDisabled = false,
							inputTextColor3 = Theme.TextDefault.Color,
							inputTextXAlignment = Enum.TextXAlignment.Left,
							inputTextTransparency = Theme.TextDefault.Transparency,
							inputTextSize = ScaledBaseSize,
							initialInputText = UseStateResult,
							placeholderText = UseLocalizationResult.textboxPlaceholder,
							placeholderTextColor3 = Theme.TextDefault.Color,
							clearIcon = Images["icons/actions/edit/clear_small"],
							clearIconColor3 = Theme.IconEmphasis.Color,
							clearButtonSize = IconSize.Small,
							textChangedCallback = TextChangedCallback,
							inputBoxRef = UseRefResult
						})
					})
				}) else nil,
				Dropdown = if p1.onTextInput or Text == "" then if Text == "" then ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 5,
					Size = UDim2.new(1, 0, 0, 10)
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						Padding = UDim.new(0, config1.CONTENT_PADDING),
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					PlaceholderElement = ReactModule.createElement(StyledTextLabel, {
						layoutOrder = 5,
						text = "",
						textWrapped = true,
						lineHeight = 1,
						fluidSizing = false,
						fontStyle = UseStyleResultFont.Header2,
						colorStyle = Theme.TextMuted,
						textTruncate = Enum.TextTruncate.AtEnd,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Center
					})
				}) else ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 5,
					Size = UDim2.new(1, 0, 0, 30)
				}, {
					TextFrame = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 5,
						Size = UDim2.new(1, 0, 0, 30)
					}, {
						Layout = ReactModule.createElement("UIListLayout", {
							Padding = UDim.new(0, config1.CONTENT_PADDING),
							FillDirection = Enum.FillDirection.Horizontal,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						Padding = ReactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, config1.TEXTBOX_HORIZONTAL_PADDING)
						}),
						Text = ReactModule.createElement(StyledTextLabel, {
							layoutOrder = 5,
							textWrapped = true,
							lineHeight = 1,
							fluidSizing = false,
							text = UseLocalizationResult.dropdownEntryText,
							fontStyle = UseStyleResultFont.Header2,
							colorStyle = Theme.TextMuted,
							textTruncate = Enum.TextTruncate.AtEnd,
							textXAlignment = Enum.TextXAlignment.Left,
							textYAlignment = Enum.TextYAlignment.Center
						})
					}),
					CancelFrame = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 5,
						Size = UDim2.new(1, 0, 0, 30)
					}, {
						Layout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							HorizontalAlignment = Enum.HorizontalAlignment.Right,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						Cancel = ReactModule.createElement(UtilityActionIcon, {
							layoutOrder = 6,
							iconSize = IconSize.Small,
							icon = Images["icons/actions/edit/clear"],
							onActivated = function()
								-- upvalues: p1 (upval), UseStateResult2_3 (upval), config1 (upval)
								p1.setOnTextInput(false)
								UseStateResult2_3(config1.DROPDOWN_FRAME_HEIGHT_CLOSED)
							end
						})
					})
				}) else ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 5,
					Size = UDim2.new(1, 0, 0, UseStateResult4)
				}, {
					DropdownMenu = ReactModule.createElement(DropdownMenu, {
						errorState = false,
						showDropShadow = true,
						dropdownMenuListPositionFixed = true,
						placeholder = UseLocalizationResult.dropdownPlaceholder,
						height = UDim.new(0, config1.DROPDOWN_HEIGHT),
						onChange = function(Text: string)
							-- upvalues: p1 (upval), UseStateResult2 (upval), T (upval)
							local Number: number? = tonumber(string.gsub(Text, "%D", ""))
							
							if Number then
								if Number == 0 then
									p1.setOnTextInput(true)
									
									return
								end
								UseStateResult2(T[Number])
								p1.setSaveButtonEnabled(true)
							end
						end,
						onMenuOpenChange = function(p2)
							-- upvalues: CountT (upval), UseStateResult2_3 (upval), config1 (upval)
							if not p2 then
								UseStateResult2_3(config1.DROPDOWN_FRAME_HEIGHT_CLOSED)
								
								return
							end
							if CountT == 3 then
								UseStateResult2_3(config1.DROPDOWN_FRAME_HEIGHT_OPEN_3NICKS)
								
								return
							end
							if CountT == 2 then
								UseStateResult2_3(config1.DROPDOWN_FRAME_HEIGHT_OPEN_2NICKS)
								
								return
							end
							if CountT == 1 then
								UseStateResult2_3(config1.DROPDOWN_FRAME_HEIGHT_OPEN_1NICK)
								
								return
							else
								UseStateResult2_3(config1.DROPDOWN_FRAME_HEIGHT_CLOSED)
							end
						end,
						screenSize = p1.screenSize,
						cellDatas = v39()
					})
				}),
				Counter = if p1.onTextInput then ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 7,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						Padding = UDim.new(0, config1.CONTENT_PADDING / 2),
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					CountText = ReactModule.createElement(StyledTextLabel, {
						layoutOrder = 1,
						fontStyle = UseStyleResultFont.CaptionBody,
						text = string.format("%d/%d", UseStateResult3, FriendRequestNicknameMaxChars),
						colorStyle = if UseStateResult3 == FriendRequestNicknameMaxChars then Theme.Alert else Theme.TextMuted,
						textXAlignment = Enum.TextXAlignment.Center,
						textYAlignment = Enum.TextYAlignment.Top
					}),
					ErrorText = if UseStateResult1 == "" then nil else ReactModule.createElement(StyledTextLabel, {
						layoutOrder = 2,
						fontStyle = UseStyleResultFont.CaptionBody,
						text = UseStateResult1,
						colorStyle = Theme.Alert,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Top
					})
				}) else nil
			})
		end,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = UseResult,
						text = UseLocalizationResult.skipButtonText
					}
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = OnActivated,
						text = UseLocalizationResult.addNicknameText,
						isDisabled = not p1.isSaveButtonEnabled
					}
				}
			}
		}
	})
end