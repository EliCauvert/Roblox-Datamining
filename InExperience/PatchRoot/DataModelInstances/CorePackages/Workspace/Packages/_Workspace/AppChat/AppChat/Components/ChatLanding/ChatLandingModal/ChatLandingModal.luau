local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local NewResult = require(AppChat.Logger):new(script.Name)
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local LabelModule = require(AppChat.Components.Label.Label)
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local FFlagAppChatLandingModalThemedBackgroundModule = require(AppChat.Flags.FFlagAppChatLandingModalThemedBackground)
local IconsActionsFavoriteOn = UIBloxModule.App.ImageSet.Images["icons/actions/favoriteOn"]
local X = FoundationModule.Enums.IconName.X
local config = {
	[AppChatNetworkingModule.Constants.ModalContentType.Link] = function(p1)
		-- upvalues: UseStyleFunction (copy), ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
		local UseStyleResult = UseStyleFunction()
		
		return ReactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 0, 0),
			LayoutOrder = p1.layoutOrder,
			Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Body.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
			BorderSizePixel = 0,
			Text = `<u>{p1.content.text}</u>`,
			RichText = true,
			TextColor3 = UseStyleResult.Theme.TextDefault.Color,
			TextSize = UseStyleResult.Font.CaptionBody.RelativeSize * UseStyleResult.Font.BaseSize,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			[ReactModule.Event.Activated] = p1.content.onActivated
		})
	end,
	[AppChatNetworkingModule.Constants.ModalContentType.Text] = function(p1)
		-- upvalues: UseStyleFunction (copy), ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
		local UseStyleResult = UseStyleFunction()
		
		return ReactModule.createElement("TextLabel", {
			BorderSizePixel = 0,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			LayoutOrder = p1.layoutOrder,
			Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Body.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
			Text = p1.content.text,
			TextColor3 = UseStyleResult.Theme.TextDefault.Color,
			TextSize = UseStyleResult.Font.CaptionBody.RelativeSize * UseStyleResult.Font.BaseSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y
		})
	end
}
local config1 = {
	titleText = "",
	bodyText = "",
	actionText = "",
	paddingX = 12,
	hideActionButton = false,
	additionalContent = {},
	buttonType = UIBloxModule.App.Button.Enum.ButtonType.PrimarySystem,
	onActivated = function() end,
	onDismissed = function() end
}

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: CryoModule (copy), config1 (copy), UseStyleFunction (copy), UseChatPagePaddingModule (copy), FoundationModule (copy), ReactModule (copy), config (copy), NewResult (copy), FFlagAppChatLandingModalThemedBackgroundModule (copy), LabelModule (copy), IconsActionsFavoriteOn (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), X (copy), ButtonStack (copy)
	local JoinResult = CryoModule.Dictionary.join(config1, p1)
	local UseStyleResult = UseStyleFunction()
	local Style = JoinResult.style or UseStyleResult
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	local Size200: number = Style.Tokens.Size.Size_200
	local Size1000 = Style.Tokens.Size.Size_1000
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Size600 = UseTokensResult.Size.Size_600
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), JoinResult (copy), config (upval), ReactModule (upval), NewResult (upval)
		local MapResult = CryoModule.Dictionary.map(JoinResult.additionalContent, function(Content, p2: number)
			-- upvalues: config (upval), ReactModule (upval), NewResult (upval)
			local Entry = config[Content.type]
			local LayoutOrder = p2 + 2
			local Element = if Entry then ReactModule.createElement(Entry, { layoutOrder = LayoutOrder, content = Content }) else nil
			
			if Element then
				return Element, `additionalContent_{p2}`
			else
				NewResult:warning(`Unsupported additional content type: {Content.type}`)
				
				return nil, nil
			end
		end)
		
		return MapResult, not CryoModule.isEmpty(MapResult)
	end, { JoinResult.additionalContent })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = JoinResult.LayoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = Ref
	}, {
		ContentPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, Size200),
			PaddingBottom = UDim.new(0, Size200),
			PaddingLeft = UDim.new(0, UseChatPagePaddingModuleResult.left),
			PaddingRight = UDim.new(0, UseChatPagePaddingModuleResult.right)
		}),
		Content = ReactModule.createElement("Frame", {
			BackgroundTransparency = if FFlagAppChatLandingModalThemedBackgroundModule then Style.Theme.BackgroundUIDefault.Transparency else Style.Theme.SystemPrimaryContent.Transparency,
			BackgroundColor3 = if FFlagAppChatLandingModalThemedBackgroundModule then Style.Theme.BackgroundUIDefault.Color else Style.Theme.SystemPrimaryContent.Color,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, Size200 * 2)
			}),
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Style.Tokens.Radius.Medium) }),
			UIStroke = ReactModule.createElement("UIStroke", {
				Thickness = Style.Tokens.Stroke.Standard,
				Color = Style.Theme.Divider.Color,
				Transparency = Style.Theme.Divider.Transparency
			}),
			ContentPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, Size200),
				PaddingBottom = UDim.new(0, Size200),
				PaddingLeft = UDim.new(0, Size200),
				PaddingRight = UDim.new(0, Size200)
			}),
			IconAndTextFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				HorizontalLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					Padding = UDim.new(0, Size200)
				}),
				TextFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, -Size600 - Size200, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, Size200)
					}),
					LabelAndTextFrame = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						Layout = ReactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Horizontal,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							Padding = UDim.new(0, Size200)
						}),
						TitleLabelWithIcon = if JoinResult.titleLabelText then ReactModule.createElement(LabelModule, {
							layoutOrder = 1,
							bodyText = JoinResult.titleLabelText,
							iconImage = IconsActionsFavoriteOn
						}) else nil,
						TitleTextLabel = ReactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BorderSizePixel = 0,
							TextWrapped = true,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 0),
							Font = if FoundationFontFaceMigration then nil else Style.Font.Title.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.HeadingLarge.Font) else nil,
							Text = JoinResult.titleText,
							TextColor3 = Style.Theme.TextEmphasis.Color,
							TextSize = Style.Font.Header2.RelativeSize * Style.Font.BaseSize,
							TextXAlignment = Enum.TextXAlignment.Left,
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							UIFlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
						})
					}),
					BodyTextLabel = ReactModule.createElement("TextLabel", {
						LayoutOrder = 2,
						BorderSizePixel = 0,
						TextWrapped = true,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						Font = if FoundationFontFaceMigration then nil else Style.Font.Body.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.BodyLarge.Font) else nil,
						Text = JoinResult.bodyText,
						TextColor3 = Style.Theme.TextDefault.Color,
						TextSize = Style.Font.CaptionBody.RelativeSize * Style.Font.BaseSize,
						TextXAlignment = Enum.TextXAlignment.Left,
						AutomaticSize = Enum.AutomaticSize.Y
					}),
					AdditionalContent = if UseMemoResult2 then ReactModule.createElement(ReactModule.Fragment, {}, UseMemoResult) else nil
				}),
				ImageIcon = ReactModule.createElement(FoundationModule.View, {
					LayoutOrder = 2,
					tag = "auto-xy x-default-transparent radius-xsmall",
					onActivated = JoinResult.onDismissed
				}, {
					Icon = ReactModule.createElement(FoundationModule.Icon, { size = Size600, name = X })
				})
			}),
			Buttons = if JoinResult.hideActionButton then nil else ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, Size1000)
			}, {
				ButtonStack = ReactModule.createElement(ButtonStack, {
					forcedFillDirection = Enum.FillDirection.Horizontal,
					buttons = {
						{
							buttonType = JoinResult.buttonType,
							props = {
								onActivated = JoinResult.onActivated,
								text = JoinResult.actionText
							}
						}
					}
				})
			})
		})
	})
end)