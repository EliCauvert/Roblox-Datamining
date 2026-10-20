local TextService = game:GetService("TextService")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local UIBlox = InGameMenuDependenciesModule.UIBlox
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local GetTextSizeFunction = require(CorePackages.Workspace.Packages.Style).GetTextSize
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local Parent = script.Parent.Parent.Parent
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local AssetsModule = require(Parent.Resources.Assets)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local FocusHandlerModule = require(Parent.Components.Connection.FocusHandler)
local RootedConnectionModule = require(Parent.Components.Connection.RootedConnection)
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local FoundationModule = require(CorePackages.Packages.Foundation)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local Image = FoundationModule.Image
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local LoadingFriendsError = Roact.PureComponent:extend("LoadingFriendsError")
LoadingFriendsError.validateProps = T.strictInterface({ onRetry = T.callback, canCaptureFocus = T.boolean })

function LoadingFriendsError.init(p1)
	-- upvalues: Roact (copy)
	p1.buttonRef = Roact.createRef()
end

function LoadingFriendsError.render(p1)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), FoundationFontFaceMigration (copy), WithLocalizationModule (copy), GetTextSizeFunction (copy), TextService (copy), Roact (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Image (copy), AssetsModule (copy), ImageSetLabel (copy), ThemedTextLabelModule (copy), RootedConnectionModule (copy), FocusHandlerModule (copy), GuiService (copy), Button (copy), ButtonType (copy)
	local Props = p1.props
	
	return WithFoundationOrUIBloxStyleFunction(function(p2)
		-- upvalues: FoundationFontFaceMigration (upval)
		return {
			Tokens = if FoundationFontFaceMigration then p2 else nil,
			Font = {
				BaseSize = 1,
				Body = {
					Font = p2.Typography.BodyLarge.Font,
					RelativeSize = p2.Typography.BodyLarge.FontSize
				}
			}
		}
	end, function(p2)
		-- upvalues: WithLocalizationModule (upval), FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), TextService (upval), Roact (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), Image (upval), AssetsModule (upval), ImageSetLabel (upval), ThemedTextLabelModule (upval), RootedConnectionModule (upval), FocusHandlerModule (upval), Props (copy), GuiService (upval), p1 (copy), Button (upval), ButtonType (upval)
		return WithLocalizationModule({
			errorOccured = "CoreScripts.InGameMenu.InviteFriends.ErrorOccured"
		})(function(p3)
			-- upvalues: p2 (copy), FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), TextService (upval), Roact (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), Image (upval), AssetsModule (upval), ImageSetLabel (upval), ThemedTextLabelModule (upval), RootedConnectionModule (upval), FocusHandlerModule (upval), Props (upval), GuiService (upval), p1 (upval), Button (upval), ButtonType (upval)
			local BodyFont = p2.Font.Body.Font
			local ScaledRelativeSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize
			
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
				Icon = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
					LayoutOrder = 1,
					Image = AssetsModule.Images.Friends.Image,
					imageRect = {
						offset = AssetsModule.Images.Friends.ImageRectOffset,
						size = AssetsModule.Images.Friends.ImageRectSize
					},
					Size = UDim2.new(0, 64, 0, 64),
					imageStyle = { Transparency = 0.5, Color3 = Color3.new(1, 1, 1) }
				}) else Roact.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					ImageTransparency = 0.5,
					LayoutOrder = 1,
					Image = AssetsModule.Images.Friends,
					Size = UDim2.new(0, 64, 0, 64)
				}),
				TextContainer = Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, (if FoundationFontFaceMigration then GetTextSizeFunction(p3.errorOccured, ScaledRelativeSize, p2.Tokens.Typography.BodyLarge.Font, Vector2.new(304, 1e999), { addTemporaryPadding = false }).Y else TextService:GetTextSize(p3.errorOccured, ScaledRelativeSize, BodyFont, Vector2.new(304, 1e999)).Y) + 36)
				}, {
					Text = Roact.createElement(ThemedTextLabelModule, {
						fontKey = "Body",
						themeKey = "TextEmphasis",
						TextWrapped = true,
						Text = p3.errorOccured,
						Position = UDim2.new(0, 0, 0, 10),
						Size = UDim2.new(1, 0, 1, -36),
						TextXAlignment = Enum.TextXAlignment.Center
					})
				}),
				RootedConnection = Roact.createElement(RootedConnectionModule, {
					render = function(p4)
						-- upvalues: Roact (upval), FocusHandlerModule (upval), Props (upval), GuiService (upval), p1 (upval), Button (upval), ButtonType (upval), AssetsModule (upval)
						return Roact.createElement(FocusHandlerModule, {
							isFocused = Props.canCaptureFocus and p4,
							didFocus = function()
								-- upvalues: GuiService (upval), p1 (upval)
								GuiService.SelectedCoreObject = p1.buttonRef:getValue()
							end
						}, {
							RetryButton = p4 and Roact.createElement(Button, {
								layoutOrder = 3,
								buttonType = ButtonType.Secondary,
								size = UDim2.new(1, 0, 0, 48),
								icon = AssetsModule.Images.RetryIcon,
								onActivated = Props.onRetry,
								buttonRef = p1.buttonRef
							}) or nil
						})
					end
				})
			})
		end)
	end)
end

return LoadingFriendsError