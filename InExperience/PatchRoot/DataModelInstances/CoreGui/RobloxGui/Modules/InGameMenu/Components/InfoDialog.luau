local TextService = game:GetService("TextService")
local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local T = InGameMenuDependenciesModule.t
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local GetTextSizeFunction = require(CorePackages.Workspace.Packages.Style).GetTextSize
local FoundationFontFaceMigration = require(CorePackages.Packages.Foundation).Utility.Flags.FoundationFontFaceMigration
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local AssetsModule = require(script.Parent.Parent.Resources.Assets)
local ThemedTextLabelModule = require(script.Parent.ThemedTextLabel)
local DividerModule = require(script.Parent.Divider)
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local InfoDialog = Roact.PureComponent:extend("InfoDialog")
InfoDialog.validateProps = T.strictInterface({
	bodyText = T.string,
	dismissText = T.string,
	titleText = T.string,
	iconImage = T.union(T.string, T.table),
	onDismiss = T.callback,
	visible = T.boolean,
	buttonRef = T.optional(T.table)
})

function InfoDialog.render(p1)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TextService (copy), Roact (copy), ImageSetLabel (copy), AssetsModule (copy), ThemedTextLabelModule (copy), DividerModule (copy), Button (copy), ButtonType (copy)
	local Props = p1.props
	
	return WithFoundationOrUIBloxStyleFunction(function(p2)
		-- upvalues: FoundationFontFaceMigration (upval)
		return {
			Tokens = if FoundationFontFaceMigration then p2 else nil,
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
		-- upvalues: Props (copy), FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), TextService (upval), Roact (upval), ImageSetLabel (upval), AssetsModule (upval), p1 (copy), ThemedTextLabelModule (upval), DividerModule (upval), Button (upval), ButtonType (upval)
		local BodyFont = p2.Font.Body.Font
		local ScaledRelativeSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize
		local BodyText = Props.bodyText
		local NewLargest = math.max(if FoundationFontFaceMigration then GetTextSizeFunction(BodyText, ScaledRelativeSize, p2.Tokens.Typography.BodyLarge.Font, Vector2.new(264, 1e999), { addTemporaryPadding = false }).Y else TextService:GetTextSize(BodyText, ScaledRelativeSize, BodyFont, Vector2.new(264, 1e999)).Y, ScaledRelativeSize * 2) + 48
		
		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 8,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = Props.visible
		}, {
			Overlay = Roact.createElement("TextButton", {
				AutoButtonColor = false,
				BorderSizePixel = 0,
				Text = "",
				BackgroundColor3 = p2.Theme.Overlay.Color,
				BackgroundTransparency = p2.Theme.Overlay.Transparency,
				Size = UDim2.new(1, 0, 1, 0)
			}),
			DialogMainFrame = Roact.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = AssetsModule.Images.RoundedRect.Image,
				ImageColor3 = p2.Theme.BackgroundUIDefault.Color,
				ImageTransparency = p2.Theme.BackgroundUIDefault.Transparency,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				ScaleType = AssetsModule.Images.RoundedRect.ScaleType,
				Size = UDim2.new(0, 312, 0, NewLargest + 49 + 36 + 36 + 24 + 10),
				SliceCenter = AssetsModule.Images.RoundedRect.SliceCenter
			}, {
				Padding = Roact.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 10),
					PaddingBottom = UDim.new(0, 24),
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				Layout = Roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Icon = Roact.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(0, 36, 0, 36),
					Image = p1.props.iconImage
				}),
				Title = Roact.createElement(ThemedTextLabelModule, {
					fontKey = "Header1",
					themeKey = "TextEmphasis",
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 48),
					Text = Props.titleText
				}),
				Divider = Roact.createElement(DividerModule, { LayoutOrder = 3 }),
				BodyTextContainer = Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, NewLargest)
				}, {
					BodyText = Roact.createElement(ThemedTextLabelModule, {
						TextWrapped = true,
						Size = UDim2.new(1, 0, 1, 0),
						Text = Props.bodyText
					})
				}),
				ConfirmButton = Roact.createElement(Button, {
					buttonType = ButtonType.PrimarySystem,
					layoutOrder = 5,
					size = UDim2.new(1, 0, 0, 36),
					onActivated = Props.onDismiss,
					text = Props.dismissText,
					[Roact.Ref] = p1.props.buttonRef
				})
			})
		})
	end)
end

function InfoDialog.bindActions(p1)
	-- upvalues: ContextActionService (copy)
	ContextActionService:BindCoreAction("InGameMenuModalDismiss", function(_, UserInputState, _)
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			p1.props.onDismiss()
		end
	end, false, Enum.KeyCode.Escape)
end

function InfoDialog:unbindActions()
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("InGameMenuModalDismiss")
end

function InfoDialog.didMount(p1)
	if p1.props.visible then
		p1:bindActions()
	end
end

function InfoDialog.didUpdate(p1)
	if p1.props.visible then
		p1:bindActions()
		
		return
	else
		p1:unbindActions()
	end
end

function InfoDialog.willUnmount(p1)
	p1:unbindActions()
end

return InfoDialog