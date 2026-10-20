local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local GuiService = game:GetService("GuiService")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local UIBlox = InGameMenuDependenciesModule.UIBlox
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local Parent = script.Parent.Parent.Parent
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local AssetsModule = require(Parent.Resources.Assets)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local FocusHandlerModule = require(Parent.Components.Connection.FocusHandler)
local RootedConnectionModule = require(Parent.Components.Connection.RootedConnection)
local SetCurrentPageModule = require(Parent.Actions.SetCurrentPage)
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local AddFriendsNow = Roact.PureComponent:extend("AddFriendsNow")
AddFriendsNow.validateProps = T.strictInterface({
	switchToPlayers = T.callback,
	canCaptureFocus = T.boolean
})

function AddFriendsNow.init(p1)
	-- upvalues: Roact (copy)
	p1.buttonRef = Roact.createRef()
end

function AddFriendsNow.render(p1)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), WithLocalizationModule (copy), TextService (copy), Roact (copy), ImageSetLabel (copy), AssetsModule (copy), ThemedTextLabelModule (copy), RootedConnectionModule (copy), FocusHandlerModule (copy), GuiService (copy), Button (copy), ButtonType (copy)
	local Props = p1.props
	
	return WithFoundationOrUIBloxStyleFunction(function(p2)
		return {
			Font = {
				BaseSize = 1,
				Body = {
					Font = p2.Typography.BodyLarge.Font,
					RelativeSize = p2.Typography.BodyLarge.FontSize
				}
			}
		}
	end, function(p2)
		-- upvalues: WithLocalizationModule (upval), TextService (upval), Roact (upval), ImageSetLabel (upval), AssetsModule (upval), ThemedTextLabelModule (upval), RootedConnectionModule (upval), FocusHandlerModule (upval), Props (copy), GuiService (upval), p1 (copy), Button (upval), ButtonType (upval)
		return WithLocalizationModule({
			noFriendsText = "CoreScripts.InGameMenu.InviteFriends.NoFriends",
			makeFriendsNow = "CoreScripts.InGameMenu.InviteFriends.MakeFriendsNow"
		})(function(p3)
			-- upvalues: p2 (copy), TextService (upval), Roact (upval), ImageSetLabel (upval), AssetsModule (upval), ThemedTextLabelModule (upval), RootedConnectionModule (upval), FocusHandlerModule (upval), Props (upval), GuiService (upval), p1 (upval), Button (upval), ButtonType (upval)
			return Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 304, 1, 0),
				Position = UDim2.new(0.5, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0)
			}, {
				Layout = Roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Icon = Roact.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					ImageTransparency = 0.5,
					LayoutOrder = 1,
					Image = AssetsModule.Images.AddFriend,
					Size = UDim2.new(0, 64, 0, 64)
				}),
				TextContainer = Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, TextService:GetTextSize(p3.noFriendsText, p2.Font.Body.RelativeSize * p2.Font.BaseSize, p2.Font.Body.Font, Vector2.new(304, 1e999)).Y + 20)
				}, {
					Text = Roact.createElement(ThemedTextLabelModule, {
						fontKey = "Body",
						themeKey = "TextEmphasis",
						TextWrapped = true,
						Text = p3.noFriendsText,
						Position = UDim2.new(0, 0, 0, 4),
						Size = UDim2.new(1, 0, 1, -20),
						TextXAlignment = Enum.TextXAlignment.Center
					})
				}),
				RootedConnection = Roact.createElement(RootedConnectionModule, {
					render = function(p4)
						-- upvalues: Roact (upval), FocusHandlerModule (upval), Props (upval), GuiService (upval), p1 (upval), Button (upval), ButtonType (upval), p3 (copy)
						return Roact.createElement(FocusHandlerModule, {
							isFocused = Props.canCaptureFocus and p4,
							didFocus = function()
								-- upvalues: GuiService (upval), p1 (upval)
								GuiService.SelectedCoreObject = p1.buttonRef:getValue()
							end
						}, {
							MakeFriendsButton = p4 and Roact.createElement(Button, {
								layoutOrder = 3,
								buttonType = ButtonType.Secondary,
								size = UDim2.new(1, 0, 0, 48),
								text = p3.makeFriendsNow,
								onActivated = Props.switchToPlayers,
								buttonRef = p1.buttonRef
							}) or nil
						})
					end
				})
			})
		end)
	end)
end

return RoactRodux.UNSTABLE_connect2(nil, function(Callback)
	-- upvalues: SetCurrentPageModule (copy)
	return {
		switchToPlayers = function()
			-- upvalues: Callback (copy), SetCurrentPageModule (upval)
			Callback(SetCurrentPageModule("Players"))
		end
	}
end)(AddFriendsNow)