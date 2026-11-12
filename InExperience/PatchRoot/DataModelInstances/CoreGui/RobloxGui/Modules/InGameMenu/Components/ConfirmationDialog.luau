local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local UIBlox = InGameMenuDependenciesModule.UIBlox
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local GetTextSizeFunction = require(CorePackages.Workspace.Packages.Style).GetTextSize
local FoundationFontFaceMigration = require(CorePackages.Packages.Foundation).Utility.Flags.FoundationFontFaceMigration
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Resources.Constants)
local AssetsModule = require(Parent.Resources.Assets)
local FFlagIGMDialogButtonsUseUIBloxButtonModule = require(Parent.Flags.FFlagIGMDialogButtonsUseUIBloxButton)
local ThemedTextLabelModule = require(script.Parent.ThemedTextLabel)
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local FocusHandlerModule = require(script.Parent.Connection.FocusHandler)
local ConfirmationDialog = Roact.PureComponent:extend("ConfirmationDialog")
ConfirmationDialog.validateProps = T.strictInterface({
	bodyText = T.string,
	cancelText = T.string,
	confirmText = T.string,
	titleText = T.string,
	bindReturnToConfirm = T.boolean,
	onCancel = T.callback,
	onConfirm = T.callback,
	blurBackground = T.boolean,
	visible = T.boolean,
	inputType = T.optional(T.string)
})
ConfirmationDialog.defaultProps = {
	bodyText = "This is some body text. It will wrap when needed.",
	cancelText = "Cancel",
	confirmText = "Confirm",
	titleText = "Dialog Title",
	blurBackground = false
}

function ConfirmationDialog.init(p1)
	-- upvalues: Roact (copy)
	p1.state = { isRooted = false }
	
	function p1.onAncestryChanged(Object)
		-- upvalues: p1 (copy)
		if Object:IsDescendantOf(game) then
			p1:setState({ isRooted = true })
		end
	end
	
	p1.confirmButtonRef = Roact.createRef()
	p1.buttonContainerRef = Roact.createRef()
end

function ConfirmationDialog.render(p1)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TextService (copy), Roact (copy), CoreGui (copy), ConstantsModule (copy), ImageSetLabel (copy), AssetsModule (copy), ThemedTextLabelModule (copy), Button (copy), ButtonType (copy), FFlagIGMDialogButtonsUseUIBloxButtonModule (copy), FocusHandlerModule (copy), GuiService (copy)
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
				},
				Divider = {
					Color = p2.Color.Stroke.Emphasis.Color3,
					Transparency = p2.Color.Stroke.Emphasis.Transparency
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
		-- upvalues: Props (copy), FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), TextService (upval), Roact (upval), CoreGui (upval), ConstantsModule (upval), ImageSetLabel (upval), AssetsModule (upval), ThemedTextLabelModule (upval), p1 (copy), Button (upval), ButtonType (upval), FFlagIGMDialogButtonsUseUIBloxButtonModule (upval), FocusHandlerModule (upval), GuiService (upval)
		local BodyFont = p2.Font.Body.Font
		local ScaledRelativeSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize
		local BodyText = Props.bodyText
		local NewLargest = math.max(if FoundationFontFaceMigration then GetTextSizeFunction(BodyText, ScaledRelativeSize, p2.Tokens.Typography.BodyLarge.Font, Vector2.new(295, 1e999), { addTemporaryPadding = false }).Y else TextService:GetTextSize(BodyText, ScaledRelativeSize, BodyFont, Vector2.new(295, 1e999)).Y, ScaledRelativeSize * 2) + 20 + 20
		
		return Roact.createElement(Roact.Portal, { target = CoreGui }, {
			InGameMenuConfirmationDialog = Roact.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				DisplayOrder = ConstantsModule.DisplayOrder.ConfirmationDialog,
				OnTopOfCoreBlur = Props.blurBackground,
				Enabled = Props.visible,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
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
					Size = UDim2.new(0, 335, 0, NewLargest + 49 + 36 + 20),
					SliceCenter = AssetsModule.Images.RoundedRect.SliceCenter
				}, {
					Padding = Roact.createElement("UIPadding", {
						PaddingBottom = UDim.new(0, 20),
						PaddingLeft = UDim.new(0, 20),
						PaddingRight = UDim.new(0, 20)
					}),
					Layout = Roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Title = Roact.createElement(ThemedTextLabelModule, {
						fontKey = "Header1",
						themeKey = "TextEmphasis",
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, 48),
						Text = Props.titleText
					}),
					Divider = Roact.createElement("Frame", {
						BorderSizePixel = 0,
						LayoutOrder = 3,
						BackgroundColor3 = p2.Theme.Divider.Color,
						BackgroundTransparency = p2.Theme.Divider.Transparency,
						Size = UDim2.new(0.8, 0, 0, 1)
					}),
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
					ButtonContainer = Roact.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 5,
						Size = UDim2.new(1, 0, 0, 36),
						[Roact.Ref] = p1.buttonContainerRef,
						[Roact.Event.AncestryChanged] = p1.onAncestryChanged
					}, {
						Layout = Roact.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, 10),
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center
						}),
						CancelButton = Roact.createElement(Button, {
							layoutOrder = 1,
							buttonType = ButtonType.Secondary,
							size = UDim2.new(0.5, -5, 1, 0),
							text = Props.cancelText,
							onActivated = Props.onCancel,
							DO_NOT_USE_useUIBloxButton = if FFlagIGMDialogButtonsUseUIBloxButtonModule then true else nil
						}),
						ConfirmButton = Roact.createElement(Button, {
							buttonType = ButtonType.PrimarySystem,
							layoutOrder = 2,
							size = UDim2.new(0.5, -5, 1, 0),
							text = Props.confirmText,
							onActivated = Props.onConfirm,
							[Roact.Ref] = p1.confirmButtonRef,
							DO_NOT_USE_useUIBloxButton = if FFlagIGMDialogButtonsUseUIBloxButtonModule then true else nil
						})
					})
				})
			}),
			FocusHandler = Roact.createElement(FocusHandlerModule, {
				isFocused = p1.state.isRooted and (p1.props.visible and p1.props.inputType == ConstantsModule.InputType.Gamepad),
				didFocus = function()
					-- upvalues: GuiService (upval), p1 (upval)
					GuiService:RemoveSelectionGroup("InGameMenuModalButtonsSelectionParent")
					GuiService:AddSelectionParent("InGameMenuModalButtonsSelectionParent", p1.buttonContainerRef:getValue())
					GuiService.SelectedCoreObject = p1.confirmButtonRef:getValue()
				end
			})
		})
	end)
end

function ConfirmationDialog.updateBlur(p1)
	-- upvalues: RunService (copy)
	RunService:SetRobloxGuiFocused(p1.props.blurBackground and p1.props.visible)
end

function ConfirmationDialog.bindActions(p1)
	-- upvalues: ContextActionService (copy)
	local function confirmFunc(_, UserInputState, _)
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			p1.props.onConfirm()
		end
	end
	
	if p1.props.bindReturnToConfirm then
		ContextActionService:BindCoreAction("InGameMenuModalConfirm", confirmFunc, false, Enum.KeyCode.Return)
	end
	ContextActionService:BindCoreAction("InGameMenuModalCancel", function(_, UserInputState, _)
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			p1.props.onCancel()
		end
	end, false, Enum.KeyCode.Escape)
end

function ConfirmationDialog:unbindActions()
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("InGameMenuModalConfirm")
	ContextActionService:UnbindCoreAction("InGameMenuModalCancel")
end

function ConfirmationDialog.didMount(p1)
	p1:updateBlur()
	
	if p1.props.visible then
		p1:bindActions()
	end
end

function ConfirmationDialog.didUpdate(p1)
	p1:updateBlur()
	
	if p1.props.visible then
		p1:bindActions()
		
		return
	else
		p1:unbindActions()
	end
end

function ConfirmationDialog.willUnmount(p1)
	-- upvalues: RunService (copy)
	if p1.props.blurBackground then
		RunService:SetRobloxGuiFocused(false)
	end
	p1:unbindActions()
end

return ConfirmationDialog