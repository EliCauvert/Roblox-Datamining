local corePackagesService = game:GetService("CorePackages")
local textService = game:GetService("TextService")
local guiService = game:GetService("GuiService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local button = UIBlox.App.Button.Button
local buttonType = UIBlox.App.Button.Enum.ButtonType
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local parent = script.Parent.Parent.Parent
local withLocalizationModule = require(parent.Localization.withLocalization)
local assetsModule = require(parent.Resources.Assets)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local focusHandlerModule = require(parent.Components.Connection.FocusHandler)
local rootedConnectionModule = require(parent.Components.Connection.RootedConnection)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local image = require(corePackagesService.Packages.Foundation).Image
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local loadingFriendsError = roact.PureComponent:extend("LoadingFriendsError")
loadingFriendsError.validateProps = t.strictInterface({ onRetry = t.callback, canCaptureFocus = t.boolean })

function loadingFriendsError.init(p1)
	-- upvalues: roact (ref)
	p1.buttonRef = roact.createRef()
end

function loadingFriendsError.render(p1)
	-- upvalues: withFoundationOrUIBloxStyle (ref), withLocalizationModule (ref), textService (ref), roact (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), assetsModule (ref), imageSetLabel (ref), themedTextLabelModule (ref), rootedConnectionModule (ref), focusHandlerModule (ref), guiService (ref), button (ref), buttonType (ref)
	local props = p1.props
	
	return withFoundationOrUIBloxStyle(function(p2)
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
		-- upvalues: withLocalizationModule (copy), textService (copy), roact (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), assetsModule (copy), imageSetLabel (copy), themedTextLabelModule (copy), rootedConnectionModule (copy), focusHandlerModule (copy), props (ref), guiService (copy), p1 (ref), button (copy), buttonType (copy)
		return withLocalizationModule({
			errorOccured = "CoreScripts.InGameMenu.InviteFriends.ErrorOccured"
		})(function(p3)
			-- upvalues: p2 (ref), textService (copy), roact (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), assetsModule (copy), imageSetLabel (copy), themedTextLabelModule (copy), rootedConnectionModule (copy), focusHandlerModule (copy), props (copy), guiService (copy), p1 (copy), button (copy), buttonType (copy)
			return roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 304, 1, 0),
				Position = UDim2.new(0.5, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0)
			}, {
				Layout = roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Icon = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
					LayoutOrder = 1,
					Image = assetsModule.Images.Friends.Image,
					imageRect = {
						offset = assetsModule.Images.Friends.ImageRectOffset,
						size = assetsModule.Images.Friends.ImageRectSize
					},
					Size = UDim2.new(0, 64, 0, 64),
					imageStyle = { Transparency = 0.5, Color3 = Color3.new(1, 1, 1) }
				}) else roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					ImageTransparency = 0.5,
					LayoutOrder = 1,
					Image = assetsModule.Images.Friends,
					Size = UDim2.new(0, 64, 0, 64)
				}),
				TextContainer = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, textService:GetTextSize(p3.errorOccured, p2.Font.Body.RelativeSize * p2.Font.BaseSize, p2.Font.Body.Font, Vector2.new(304, 1e999)).Y + 36)
				}, {
					Text = roact.createElement(themedTextLabelModule, {
						fontKey = "Body",
						themeKey = "TextEmphasis",
						TextWrapped = true,
						Text = p3.errorOccured,
						Position = UDim2.new(0, 0, 0, 10),
						Size = UDim2.new(1, 0, 1, -36),
						TextXAlignment = Enum.TextXAlignment.Center
					})
				}),
				RootedConnection = roact.createElement(rootedConnectionModule, {
					render = function(p4)
						-- upvalues: roact (copy), focusHandlerModule (copy), props (copy), guiService (copy), p1 (copy), button (copy), buttonType (copy), assetsModule (copy)
						return roact.createElement(focusHandlerModule, {
							isFocused = props.canCaptureFocus and p4,
							didFocus = function()
								-- upvalues: guiService (copy), p1 (copy)
								guiService.SelectedCoreObject = p1.buttonRef:getValue()
							end
						}, {
							RetryButton = p4 and roact.createElement(button, {
								layoutOrder = 3,
								buttonType = buttonType.Secondary,
								size = UDim2.new(1, 0, 0, 48),
								icon = assetsModule.Images.RetryIcon,
								onActivated = props.onRetry,
								buttonRef = p1.buttonRef
							}) or nil
						})
					end
				})
			})
		end)
	end)
end

return loadingFriendsError