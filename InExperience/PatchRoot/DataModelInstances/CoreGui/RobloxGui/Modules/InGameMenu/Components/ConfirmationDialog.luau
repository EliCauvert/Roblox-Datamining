local coreGuiService = game:GetService("CoreGui")
local runService = game:GetService("RunService")
local textService = game:GetService("TextService")
local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local button = UIBlox.App.Button.Button
local buttonType = UIBlox.App.Button.Enum.ButtonType
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local parent = script.Parent.Parent
local constantsModule = require(parent.Resources.Constants)
local assetsModule = require(parent.Resources.Assets)
local themedTextLabelModule = require(script.Parent.ThemedTextLabel)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local focusHandlerModule = require(script.Parent.Connection.FocusHandler)
local confirmationDialog = roact.PureComponent:extend("ConfirmationDialog")
confirmationDialog.validateProps = t.strictInterface({
	bodyText = t.string,
	cancelText = t.string,
	confirmText = t.string,
	titleText = t.string,
	bindReturnToConfirm = t.boolean,
	onCancel = t.callback,
	onConfirm = t.callback,
	blurBackground = t.boolean,
	visible = t.boolean,
	inputType = t.optional(t.string)
})
confirmationDialog.defaultProps = {
	bodyText = "This is some body text. It will wrap when needed.",
	cancelText = "Cancel",
	confirmText = "Confirm",
	titleText = "Dialog Title",
	blurBackground = false
}

function confirmationDialog.init(p1)
	-- upvalues: roact (ref)
	p1.state = { isRooted = false }
	
	function p0.onAncestryChanged(p2)
		-- upvalues: p1 (ref)
		if p2:IsDescendantOf(game) then
			p1:setState({ isRooted = true })
		end
	end
	
	p1.confirmButtonRef = roact.createRef()
	p1.buttonContainerRef = roact.createRef()
end

function confirmationDialog.render(p1)
	-- upvalues: withFoundationOrUIBloxStyle (ref), textService (ref), roact (ref), coreGuiService (ref), constantsModule (ref), imageSetLabel (ref), assetsModule (ref), themedTextLabelModule (ref), button (ref), buttonType (ref), focusHandlerModule (ref), guiService (ref)
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
		-- upvalues: props (ref), textService (copy), roact (copy), coreGuiService (copy), constantsModule (copy), imageSetLabel (copy), assetsModule (copy), themedTextLabelModule (copy), p1 (ref), button (copy), buttonType (copy), focusHandlerModule (copy), guiService (copy)
		local var1 = p2.Font.Body.RelativeSize * p2.Font.BaseSize
		local var2 = math.max(textService:GetTextSize(props.bodyText, var1, p2.Font.Body.Font, Vector2.new(295, 1e999)).Y, var1 * 2) + 20 + 20
		
		return roact.createElement(roact.Portal, { target = coreGuiService }, {
			InGameMenuConfirmationDialog = roact.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				DisplayOrder = constantsModule.DisplayOrder.ConfirmationDialog,
				OnTopOfCoreBlur = props.blurBackground,
				Enabled = props.visible,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
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
					Size = UDim2.new(0, 335, 0, var2 + 49 + 36 + 20),
					SliceCenter = assetsModule.Images.RoundedRect.SliceCenter
				}, {
					Padding = roact.createElement("UIPadding", {
						PaddingBottom = UDim.new(0, 20),
						PaddingLeft = UDim.new(0, 20),
						PaddingRight = UDim.new(0, 20)
					}),
					Layout = roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Title = roact.createElement(themedTextLabelModule, {
						fontKey = "Header1",
						themeKey = "TextEmphasis",
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, 48),
						Text = props.titleText
					}),
					Divider = roact.createElement("Frame", {
						BorderSizePixel = 0,
						LayoutOrder = 3,
						BackgroundColor3 = p2.Theme.Divider.Color,
						BackgroundTransparency = p2.Theme.Divider.Transparency,
						Size = UDim2.new(0.8, 0, 0, 1)
					}),
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
					ButtonContainer = roact.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 5,
						Size = UDim2.new(1, 0, 0, 36),
						[roact.Ref] = p1.buttonContainerRef,
						[roact.Event.AncestryChanged] = p1.onAncestryChanged
					}, {
						Layout = roact.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, 10),
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center
						}),
						CancelButton = roact.createElement(button, {
							layoutOrder = 1,
							buttonType = buttonType.Secondary,
							size = UDim2.new(0.5, -5, 1, 0),
							text = props.cancelText,
							onActivated = props.onCancel
						}),
						ConfirmButton = roact.createElement(button, {
							buttonType = buttonType.PrimarySystem,
							layoutOrder = 2,
							size = UDim2.new(0.5, -5, 1, 0),
							text = props.confirmText,
							onActivated = props.onConfirm,
							[roact.Ref] = p1.confirmButtonRef
						})
					})
				})
			}),
			FocusHandler = roact.createElement(focusHandlerModule, {
				isFocused = p1.state.isRooted and (p1.props.visible and p1.props.inputType == constantsModule.InputType.Gamepad),
				didFocus = function()
					-- upvalues: guiService (copy), p1 (copy)
					guiService:RemoveSelectionGroup("InGameMenuModalButtonsSelectionParent")
					guiService:AddSelectionParent("InGameMenuModalButtonsSelectionParent", p1.buttonContainerRef:getValue())
					guiService.SelectedCoreObject = p1.confirmButtonRef:getValue()
				end
			})
		})
	end)
end

function confirmationDialog.updateBlur(p1)
	-- upvalues: runService (ref)
	runService:SetRobloxGuiFocused(p1.props.blurBackground and p1.props.visible)
end

function confirmationDialog.bindActions(p1)
	-- upvalues: contextActionService (ref)
	local function confirmFunc(_, p2, _)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.Begin then
			p1.props.onConfirm()
		end
	end
	
	if p1.props.bindReturnToConfirm then
		contextActionService:BindCoreAction("InGameMenuModalConfirm", confirmFunc, false, Enum.KeyCode.Return)
	end
	contextActionService:BindCoreAction("InGameMenuModalCancel", function(_, p2, _)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.Begin then
			p1.props.onCancel()
		end
	end, false, Enum.KeyCode.Escape)
end

function confirmationDialog.unbindActions(_)
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("InGameMenuModalConfirm")
	contextActionService:UnbindCoreAction("InGameMenuModalCancel")
end

function confirmationDialog.didMount(p1)
	p1:updateBlur()
	
	if p1.props.visible then
		p1:bindActions()
	end
end

function confirmationDialog.didUpdate(p1)
	p1:updateBlur()
	
	if p1.props.visible then
		p1:bindActions()
		
		return
	end
	p1:unbindActions()
end

function confirmationDialog.willUnmount(p1)
	-- upvalues: runService (ref)
	if p1.props.blurBackground then
		runService:SetRobloxGuiFocused(false)
	end
	p1:unbindActions()
end

return confirmationDialog