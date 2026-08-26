local textService = game:GetService("TextService")
local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local button = UIBlox.App.Button.Button
local buttonType = UIBlox.App.Button.Enum.ButtonType
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local assetsModule = require(script.Parent.Parent.Resources.Assets)
local themedTextLabelModule = require(script.Parent.ThemedTextLabel)
local dividerModule = require(script.Parent.Divider)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local infoDialog = roact.PureComponent:extend("InfoDialog")
infoDialog.validateProps = t.strictInterface({
	bodyText = t.string,
	dismissText = t.string,
	titleText = t.string,
	iconImage = t.union(t.string, t.table),
	onDismiss = t.callback,
	visible = t.boolean,
	buttonRef = t.optional(t.table)
})

function infoDialog.render(p1)
	-- upvalues: withFoundationOrUIBloxStyle (ref), textService (ref), roact (ref), imageSetLabel (ref), assetsModule (ref), themedTextLabelModule (ref), dividerModule (ref), button (ref), buttonType (ref)
	local props = p1.props
	
	return withFoundationOrUIBloxStyle(function(p2)
		return {
			Theme = {
				Overlay = {
					Color = p2.Color.Common.Scrim.Color3,
					Transparency = p2.Color.Common.Scrim.Transparency
				},
				BackgroundUIDefault = {
					Color = p2.Color.Surface.Surface_300.Color3,
					Transparency = p2.Color.Surface.Surface_300.Transparency
				}
			},
			Font = {
				BaseSize = 1,
				Body = {
					Font = p2.Typography.BodyLarge.Font,
					RelativeSize = p2.Typography.BodyLarge.FontSize
				}
			}
		}
	end, function(p2)
		-- upvalues: props (ref), textService (copy), roact (copy), imageSetLabel (copy), assetsModule (copy), p1 (ref), themedTextLabelModule (copy), dividerModule (copy), button (copy), buttonType (copy)
		local var1 = p2.Font.Body.RelativeSize * p2.Font.BaseSize
		local var2 = math.max(textService:GetTextSize(props.bodyText, var1, p2.Font.Body.Font, Vector2.new(264, 1e999)).Y, var1 * 2) + 48
		
		return roact.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 8,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = props.visible
		}, {
			Overlay = roact.createElement("TextButton", {
				AutoButtonColor = false,
				BorderSizePixel = 0,
				Text = "",
				BackgroundColor3 = p2.Theme.Overlay.Color,
				BackgroundTransparency = p2.Theme.Overlay.Transparency,
				Size = UDim2.new(1, 0, 1, 0)
			}),
			DialogMainFrame = roact.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = assetsModule.Images.RoundedRect.Image,
				ImageColor3 = p2.Theme.BackgroundUIDefault.Color,
				ImageTransparency = p2.Theme.BackgroundUIDefault.Transparency,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				ScaleType = assetsModule.Images.RoundedRect.ScaleType,
				Size = UDim2.new(0, 312, 0, var2 + 49 + 36 + 36 + 24 + 10),
				SliceCenter = assetsModule.Images.RoundedRect.SliceCenter
			}, {
				Padding = roact.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 10),
					PaddingBottom = UDim.new(0, 24),
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				Layout = roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Icon = roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(0, 36, 0, 36),
					Image = p1.props.iconImage
				}),
				Title = roact.createElement(themedTextLabelModule, {
					fontKey = "Header1",
					themeKey = "TextEmphasis",
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 48),
					Text = props.titleText
				}),
				Divider = roact.createElement(dividerModule, { LayoutOrder = 3 }),
				BodyTextContainer = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, var2)
				}, {
					BodyText = roact.createElement(themedTextLabelModule, {
						TextWrapped = true,
						Size = UDim2.new(1, 0, 1, 0),
						Text = props.bodyText
					})
				}),
				ConfirmButton = roact.createElement(button, {
					buttonType = buttonType.PrimarySystem,
					layoutOrder = 5,
					size = UDim2.new(1, 0, 0, 36),
					onActivated = props.onDismiss,
					text = props.dismissText,
					[roact.Ref] = p1.props.buttonRef
				})
			})
		})
	end)
end

function infoDialog.bindActions(p1)
	-- upvalues: contextActionService (ref)
	contextActionService:BindCoreAction("InGameMenuModalDismiss", function(_, p2, _)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.Begin then
			p1.props.onDismiss()
		end
	end, false, Enum.KeyCode.Escape)
end

function infoDialog.unbindActions(_)
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("InGameMenuModalDismiss")
end

function infoDialog.didMount(p1)
	if p1.props.visible then
		p1:bindActions()
	end
end

function infoDialog.didUpdate(p1)
	if p1.props.visible then
		p1:bindActions()
		
		return
	end
	p1:unbindActions()
end

function infoDialog.willUnmount(p1)
	p1:unbindActions()
end

return infoDialog