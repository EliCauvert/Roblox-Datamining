local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local name = require(appChat.Logger):new(script.Name)
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local buttonStack = UIBloxModule.App.Button.ButtonStack
local enum = UIBloxModule.App.Button.Enum
local labelModule = require(appChat.Components.Label.Label)
local useChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.useChatPagePadding)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local foundationModule = require(parent.Foundation)
local favoriteOn = UIBloxModule.App.ImageSet.Images["icons/actions/favoriteOn"]
local x = foundationModule.Enums.IconName.X
local t = {
	[appChatNetworkingModule.Constants.ModalContentType.Link] = function(p1)
		-- upvalues: useStyle (ref), reactModule (ref)
		local var1 = useStyle()
		
		return reactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 0, 0),
			LayoutOrder = p1.layoutOrder,
			Font = var1.Font.Body.Font,
			BorderSizePixel = 0,
			Text = `<u>{p1.content.text}</u>`,
			RichText = true,
			TextColor3 = var1.Theme.TextDefault.Color,
			TextSize = var1.Font.CaptionBody.RelativeSize * var1.Font.BaseSize,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			[reactModule.Event.Activated] = p1.content.onActivated
		})
	end,
	[appChatNetworkingModule.Constants.ModalContentType.Text] = function(p1)
		-- upvalues: useStyle (ref), reactModule (ref)
		local var1 = useStyle()
		
		return reactModule.createElement("TextLabel", {
			BorderSizePixel = 0,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			LayoutOrder = p1.layoutOrder,
			Font = var1.Font.Body.Font,
			Text = p1.content.text,
			TextColor3 = var1.Theme.TextDefault.Color,
			TextSize = var1.Font.CaptionBody.RelativeSize * var1.Font.BaseSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y
		})
	end
}
local t_1 = {
	titleText = "",
	bodyText = "",
	actionText = "",
	paddingX = 12,
	hideActionButton = false,
	additionalContent = {},
	buttonType = enum.ButtonType.PrimarySystem,
	onActivated = function() end,
	onDismissed = function() end
}

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: cryoModule (ref), t_1 (ref), useStyle (ref), useChatPagePaddingModule (ref), foundationModule (ref), reactModule (ref), t (ref), name (ref), labelModule (ref), favoriteOn (ref), x (ref), buttonStack (ref)
	local var1 = cryoModule.Dictionary.join(t_1, p1)
	local style = var1.style or useStyle()
	local var2 = useChatPagePaddingModule()
	local size200 = style.Tokens.Size.Size_200
	local size1000 = style.Tokens.Size.Size_1000
	local size600 = foundationModule.Hooks.useTokens().Size.Size_600
	local var3, var4 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var1 (ref), t (copy), reactModule (copy), name (copy)
		local var5 = cryoModule.Dictionary.map(var1.additionalContent, function(p3, p4)
			-- upvalues: t (copy), reactModule (copy), name (copy)
			local type = t[p3.type]
			local var6 = if type then reactModule.createElement(type, { layoutOrder = p4 + 2, content = p3 }) else nil
			
			if var6 then
				return var6, `additionalContent_{p4}`
			end
			name:warning(`Unsupported additional content type: {p3.type}`)
			
			return nil, nil
		end)
		
		return var5, not cryoModule.isEmpty(var5)
	end, { var1.additionalContent })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = var1.LayoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = p2
	}, {
		ContentPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, size200),
			PaddingBottom = UDim.new(0, size200),
			PaddingLeft = UDim.new(0, var2.left),
			PaddingRight = UDim.new(0, var2.right)
		}),
		Content = reactModule.createElement("Frame", {
			BackgroundTransparency = style.Theme.SystemPrimaryContent.Transparency,
			BackgroundColor3 = style.Theme.SystemPrimaryContent.Color,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, size200 * 2)
			}),
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, style.Tokens.Radius.Medium) }),
			UIStroke = reactModule.createElement("UIStroke", {
				Thickness = style.Tokens.Stroke.Standard,
				Color = style.Theme.Divider.Color,
				Transparency = style.Theme.Divider.Transparency
			}),
			ContentPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, size200),
				PaddingBottom = UDim.new(0, size200),
				PaddingLeft = UDim.new(0, size200),
				PaddingRight = UDim.new(0, size200)
			}),
			IconAndTextFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				HorizontalLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					Padding = UDim.new(0, size200)
				}),
				TextFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, (-size600) - size200, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Layout = reactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, size200)
					}),
					LabelAndTextFrame = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						Layout = reactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Horizontal,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							Padding = UDim.new(0, size200)
						}),
						TitleLabelWithIcon = if not var1.titleLabelText then nil else reactModule.createElement(labelModule, {
							layoutOrder = 1,
							bodyText = var1.titleLabelText,
							iconImage = favoriteOn
						}),
						TitleTextLabel = reactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BorderSizePixel = 0,
							TextWrapped = true,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 0),
							Font = style.Font.Title.Font,
							Text = var1.titleText,
							TextColor3 = style.Theme.TextEmphasis.Color,
							TextSize = style.Font.Header2.RelativeSize * style.Font.BaseSize,
							TextXAlignment = Enum.TextXAlignment.Left,
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
						})
					}),
					BodyTextLabel = reactModule.createElement("TextLabel", {
						LayoutOrder = 2,
						BorderSizePixel = 0,
						TextWrapped = true,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						Font = style.Font.Body.Font,
						Text = var1.bodyText,
						TextColor3 = style.Theme.TextDefault.Color,
						TextSize = style.Font.CaptionBody.RelativeSize * style.Font.BaseSize,
						TextXAlignment = Enum.TextXAlignment.Left,
						AutomaticSize = Enum.AutomaticSize.Y
					}),
					AdditionalContent = if var4 then reactModule.createElement(reactModule.Fragment, {}, var3) else nil
				}),
				ImageIcon = reactModule.createElement(foundationModule.View, {
					LayoutOrder = 2,
					tag = "auto-xy x-default-transparent radius-xsmall",
					onActivated = var1.onDismissed
				}, {
					Icon = reactModule.createElement(foundationModule.Icon, { size = size600, name = x })
				})
			}),
			Buttons = if var1.hideActionButton then nil else reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, size1000)
			}, {
				ButtonStack = reactModule.createElement(buttonStack, {
					forcedFillDirection = Enum.FillDirection.Horizontal,
					buttons = {
						{
							buttonType = var1.buttonType,
							props = { onActivated = var1.onActivated, text = var1.actionText }
						}
					}
				})
			})
		})
	})
end)