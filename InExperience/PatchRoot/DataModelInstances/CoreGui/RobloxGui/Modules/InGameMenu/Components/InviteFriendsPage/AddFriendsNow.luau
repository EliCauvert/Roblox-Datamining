local corePackagesService = game:GetService("CorePackages")
local textService = game:GetService("TextService")
local guiService = game:GetService("GuiService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local button = UIBlox.App.Button.Button
local buttonType = UIBlox.App.Button.Enum.ButtonType
local withStyle = UIBlox.Core.Style.withStyle
local parent = script.Parent.Parent.Parent
local withLocalizationModule = require(parent.Localization.withLocalization)
local assetsModule = require(parent.Resources.Assets)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local focusHandlerModule = require(parent.Components.Connection.FocusHandler)
local rootedConnectionModule = require(parent.Components.Connection.RootedConnection)
local setCurrentPageModule = require(parent.Actions.SetCurrentPage)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local addFriendsNow = roact.PureComponent:extend("AddFriendsNow")
addFriendsNow.validateProps = t.strictInterface({
	switchToPlayers = t.callback,
	canCaptureFocus = t.boolean
})

function addFriendsNow.init(p0) --[[ line: 41 ]]
	-- upvalues: roact (ref)
	p0.buttonRef = roact.createRef()
end

function addFriendsNow.render(p1) --[[ line: 45 ]]
	-- upvalues: withStyle (ref), withLocalizationModule (ref), textService (ref), roact (ref), imageSetLabel (ref), assetsModule (ref), themedTextLabelModule (ref), rootedConnectionModule (ref), focusHandlerModule (ref), guiService (ref), button (ref), buttonType (ref)
	local props = p1.props
	
	return withStyle(function(p2) --[[ line: 48 ]]
		-- upvalues: withLocalizationModule (copy), textService (copy), roact (copy), imageSetLabel (copy), assetsModule (copy), themedTextLabelModule (copy), rootedConnectionModule (copy), focusHandlerModule (copy), props (ref), guiService (copy), p1 (ref), button (copy), buttonType (copy)
		return withLocalizationModule({
			noFriendsText = "CoreScripts.InGameMenu.InviteFriends.NoFriends",
			makeFriendsNow = "CoreScripts.InGameMenu.InviteFriends.MakeFriendsNow"
		})(function(p3) --[[ line: 52 ]]
			-- upvalues: p2 (ref), textService (copy), roact (copy), imageSetLabel (copy), assetsModule (copy), themedTextLabelModule (copy), rootedConnectionModule (copy), focusHandlerModule (copy), props (copy), guiService (copy), p1 (copy), button (copy), buttonType (copy)
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
				Icon = roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					ImageTransparency = 0.5,
					LayoutOrder = 1,
					Image = assetsModule.Images.AddFriend,
					Size = UDim2.new(0, 64, 0, 64)
				}),
				TextContainer = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, textService:GetTextSize(p3.noFriendsText, p2.Font.Body.RelativeSize * p2.Font.BaseSize, p2.Font.Body.Font, Vector2.new(304, 1e999)).Y + 20)
				}, {
					Text = roact.createElement(themedTextLabelModule, {
						fontKey = "Body",
						themeKey = "TextEmphasis",
						TextWrapped = true,
						Text = p3.noFriendsText,
						Position = UDim2.new(0, 0, 0, 4),
						Size = UDim2.new(1, 0, 1, -20),
						TextXAlignment = Enum.TextXAlignment.Center
					})
				}),
				RootedConnection = roact.createElement(rootedConnectionModule, {
					render = function(p4) --[[ line: 102 ]]
						-- upvalues: roact (copy), focusHandlerModule (copy), props (copy), guiService (copy), p1 (copy), button (copy), buttonType (copy), p3 (ref)
						return roact.createElement(focusHandlerModule, {
							isFocused = props.canCaptureFocus and p4,
							didFocus = function() --[[ line: 106 ]]
								-- upvalues: guiService (copy), p1 (copy)
								guiService.SelectedCoreObject = p1.buttonRef:getValue()
							end
						}, {
							MakeFriendsButton = p4 and roact.createElement(button, {
								layoutOrder = 3,
								buttonType = buttonType.Secondary,
								size = UDim2.new(1, 0, 0, 48),
								text = p3.makeFriendsNow,
								onActivated = props.switchToPlayers,
								buttonRef = p1.buttonRef
							}) or nil
						})
					end
				})
			})
		end)
	end)
end

return roactRodux.UNSTABLE_connect2(nil, function(p5) --[[ line: 128 ]]
	-- upvalues: setCurrentPageModule (ref)
	return {
		switchToPlayers = function() --[[ line: 130 ]]
			-- upvalues: p5 (ref), setCurrentPageModule (copy)
			p5(setCurrentPageModule("Players"))
		end
	}
end)(addFriendsNow)