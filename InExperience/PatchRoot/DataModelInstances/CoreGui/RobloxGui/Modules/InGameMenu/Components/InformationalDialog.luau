local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local T = InGameMenuDependenciesModule.t
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local WithStyleFunction = UIBlox.Core.Style.withStyle
local Parent = script.Parent.Parent
local GetFFlagIGMGamepadSelectionHistoryModule = require(Parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local ConstantsModule = require(Parent.Resources.Constants)
local AssetsModule = require(Parent.Resources.Assets)
local ThemedTextLabelModule = require(script.Parent.ThemedTextLabel)
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local FocusHandlerModule = require(script.Parent.Connection.FocusHandler)
local GetTextSizeFunction = require(CorePackages.Workspace.Packages.Style).GetTextSize
local FoundationFontFaceMigration = require(CorePackages.Packages.Foundation).Utility.Flags.FoundationFontFaceMigration
local InformationalDialog = Roact.PureComponent:extend("InformationalDialog")
InformationalDialog.validateProps = T.strictInterface({
	bodyText = T.string,
	confirmText = T.string,
	titleText = T.string,
	subBodyText = T.optional(T.string),
	iconImage = T.optional(T.union(T.table, T.string)),
	iconSize = T.number,
	onContinueFunc = T.optional(T.callback),
	bindReturnToConfirm = T.boolean,
	blurBackground = T.boolean,
	visible = T.boolean,
	inputType = T.optional(T.string)
})
InformationalDialog.defaultProps = {
	subBodyText = nil,
	blurBackground = false,
	iconImage = nil,
	iconSize = 64
}

function InformationalDialog.init(p1)
	-- upvalues: Roact (copy)
	p1.state = { isRooted = false, show = true }
	
	function p1.onAncestryChanged(Object)
		-- upvalues: p1 (copy)
		if Object:IsDescendantOf(game) then
			p1:setState({ isRooted = true })
		end
	end
	
	p1.confirmButtonRef = Roact.createRef()
	p1.buttonContainerRef = Roact.createRef()
end

function InformationalDialog.render(p1)
	-- upvalues: WithStyleFunction (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TextService (copy), GetFFlagIGMGamepadSelectionHistoryModule (copy), Roact (copy), CoreGui (copy), ImageSetLabel (copy), AssetsModule (copy), ThemedTextLabelModule (copy), Button (copy), ButtonType (copy), RunService (copy), FocusHandlerModule (copy), ConstantsModule (copy), GuiService (copy)
	local Props = p1.props
	
	return WithStyleFunction(function(p2)
		-- upvalues: Props (copy), FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), TextService (upval), GetFFlagIGMGamepadSelectionHistoryModule (upval), p1 (copy), Roact (upval), CoreGui (upval), ImageSetLabel (upval), AssetsModule (upval), ThemedTextLabelModule (upval), Button (upval), ButtonType (upval), RunService (upval), FocusHandlerModule (upval), ConstantsModule (upval), GuiService (upval)
		local BodyFont = p2.Font.Body.Font
		local ScaledRelativeSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize
		local BodyText = Props.bodyText
		local NewLargest = math.max(if FoundationFontFaceMigration then GetTextSizeFunction(BodyText, ScaledRelativeSize, p2.Tokens.Typography.BodyLarge.Font, Vector2.new(295, 1e999), { addTemporaryPadding = false }).Y else TextService:GetTextSize(BodyText, ScaledRelativeSize, BodyFont, Vector2.new(295, 1e999)).Y, ScaledRelativeSize * 2) + 20
		local NewLargest1 = math.max(if FoundationFontFaceMigration then GetTextSizeFunction(Props.subBodyText, ScaledRelativeSize, p2.Tokens.Typography.BodyLarge.Font, Vector2.new(295, 1e999), { addTemporaryPadding = false }).Y else TextService:GetTextSize(Props.subBodyText, ScaledRelativeSize, BodyFont, Vector2.new(295, 1e999)).Y, ScaledRelativeSize * 2) + 20
		
		return Roact.createElement(Roact.Portal, { target = CoreGui }, {
			InGameMenuInformationalDialog = Roact.createElement("ScreenGui", {
				DisplayOrder = 8,
				IgnoreGuiInset = true,
				OnTopOfCoreBlur = Props.blurBackground,
				Enabled = Props.visible and p1.state.show,
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
					Size = UDim2.new(0, 335, 0, NewLargest + 49 + NewLargest1 + 36 + 70 + Props.iconSize),
					SliceCenter = AssetsModule.Images.RoundedRect.SliceCenter
				}, {
					Padding = Roact.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 20),
						PaddingBottom = UDim.new(0, 20),
						PaddingLeft = UDim.new(0, 20),
						PaddingRight = UDim.new(0, 20)
					}),
					Layout = Roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Icon = Roact.createElement(ImageSetLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Image = Props.iconImage,
						Size = UDim2.new(0, Props.iconSize, 0, Props.iconSize)
					}),
					Title = Roact.createElement(ThemedTextLabelModule, {
						fontKey = "Header1",
						themeKey = "TextEmphasis",
						LayoutOrder = 2,
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
					SpaceContainer = Roact.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 4,
						Size = UDim2.new(1, 0, 0, 10)
					}),
					BodyTextContainer = Roact.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 5,
						Size = UDim2.new(1, 0, 0, NewLargest)
					}, {
						BodyText = Roact.createElement(ThemedTextLabelModule, {
							TextWrapped = true,
							Size = UDim2.new(1, 0, 1, 0),
							Text = Props.bodyText
						})
					}),
					SubBodyTextContainer = Roact.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 6,
						Size = UDim2.new(1, 0, 0, NewLargest1)
					}, {
						BodyText = Roact.createElement(ThemedTextLabelModule, {
							TextWrapped = true,
							Size = UDim2.new(1, 0, 1, 0),
							Text = Props.subBodyText
						})
					}),
					SpaceContainer2 = Roact.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 7,
						Size = UDim2.new(1, 0, 0, 10)
					}),
					ButtonContainer = Roact.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 8,
						Size = UDim2.new(1, 0, 0, 36),
						[Roact.Ref] = p1.buttonContainerRef,
						[Roact.Event.AncestryChanged] = p1.onAncestryChanged
					}, {
						Layout = Roact.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, 20),
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center
						}),
						ConfirmButton = Roact.createElement(Button, {
							buttonType = ButtonType.PrimarySystem,
							layoutOrder = 1,
							size = UDim2.new(1, -5, 1, 0),
							text = Props.confirmText,
							onActivated = function()
								-- upvalues: p1 (upval), RunService (upval)
								p1:setState({ show = false })
								
								if p1.props.onContinueFunc then
									p1.props.onContinueFunc()
								end
								RunService:SetRobloxGuiFocused(false)
							end,
							[Roact.Ref] = p1.confirmButtonRef
						})
					})
				})
			}),
			FocusHandler = Roact.createElement(FocusHandlerModule, {
				isFocused = p1.state.isRooted and (p1.props.visible and p1.props.inputType == ConstantsModule.InputType.Gamepad),
				shouldForgetPreviousSelection = if GetFFlagIGMGamepadSelectionHistoryModule() then not p1.props.visible else nil,
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

function InformationalDialog.updateBlur(p1)
	-- upvalues: RunService (copy)
	RunService:SetRobloxGuiFocused(p1.props.blurBackground and p1.props.visible)
end

function InformationalDialog.bindActions(p1)
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
end

function InformationalDialog:unbindActions()
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("InGameMenuModalConfirm")
end

function InformationalDialog.didMount(p1)
	p1:updateBlur()
	
	if p1.props.visible then
		p1:bindActions()
	end
end

function InformationalDialog.didUpdate(p1)
	p1:updateBlur()
	
	if p1.props.visible then
		p1:bindActions()
		
		return
	else
		p1:unbindActions()
	end
end

function InformationalDialog.willUnmount(p1)
	-- upvalues: RunService (copy)
	if p1.props.blurBackground then
		RunService:SetRobloxGuiFocused(false)
	end
	p1:unbindActions()
end

return InformationalDialog