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

function confirmationDialog.init(p0)
	-- upvalues: roact (ref)
	p0.state = { isRooted = false }
	
	function p0.onAncestryChanged(p1)
		-- upvalues: p0 (ref)
		if p1:IsDescendantOf(game) then
			p0:setState({ isRooted = true })
		end
	end
	
	p0.confirmButtonRef = roact.createRef()
	p0.buttonContainerRef = roact.createRef()
end

function confirmationDialog.render(p2)
	-- upvalues: withFoundationOrUIBloxStyle (ref), textService (ref), roact (ref), coreGuiService (ref), constantsModule (ref), imageSetLabel (ref), assetsModule (ref), themedTextLabelModule (ref), button (ref), buttonType (ref), focusHandlerModule (ref), guiService (ref)
	local props = p2.props
	
	return withFoundationOrUIBloxStyle(function(p3)
		return {
			Theme = {
				Overlay = {
					Color = p3.Color.Common.Scrim.Color3,
					Transparency = p3.Color.Common.Scrim.Transparency
				},
				BackgroundUIDefault = {
					Color = p3.Color.Surface.Surface_300.Color3,
					Transparency = p3.Color.Surface.Surface_300.Transparency
				},
				Divider = {
					Color = p3.Color.Stroke.Emphasis.Color3,
					Transparency = p3.Color.Stroke.Emphasis.Transparency
				}
			},
			Font = {
				BaseSize = 1,
				Body = {
					Font = p3.Typography.BodyLarge.Font,
					RelativeSize = p3.Typography.BodyLarge.FontSize
				}
			}
		}
	end, function(p4)
		-- upvalues: props (ref), textService (copy), roact (copy), coreGuiService (copy), constantsModule (copy), imageSetLabel (copy), assetsModule (copy), themedTextLabelModule (copy), p2 (ref), button (copy), buttonType (copy), focusHandlerModule (copy), guiService (copy)
		local var12 = p4.Font.Body.RelativeSize * p4.Font.BaseSize
		local var13 = math.max(textService:GetTextSize(props.bodyText, var12, p4.Font.Body.Font, Vector2.new(295, 1e999)).Y, var12 * 2) + 20 + 20
		
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
					BackgroundColor3 = p4.Theme.Overlay.Color,
					BackgroundTransparency = p4.Theme.Overlay.Transparency,
					Size = UDim2.new(1, 0, 1, 0)
				}),
				DialogMainFrame = roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = assetsModule.Images.RoundedRect.Image,
					ImageColor3 = p4.Theme.BackgroundUIDefault.Color,
					ImageTransparency = p4.Theme.BackgroundUIDefault.Transparency,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					ScaleType = assetsModule.Images.RoundedRect.ScaleType,
					Size = UDim2.new(0, 335, 0, var13 + 49 + 36 + 20),
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
						BackgroundColor3 = p4.Theme.Divider.Color,
						BackgroundTransparency = p4.Theme.Divider.Transparency,
						Size = UDim2.new(0.8, 0, 0, 1)
					}),
					BodyTextContainer = roact.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 4,
						Size = UDim2.new(1, 0, 0, var13)
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
						[roact.Ref] = p2.buttonContainerRef,
						[roact.Event.AncestryChanged] = p2.onAncestryChanged
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
							[roact.Ref] = p2.confirmButtonRef
						})
					})
				})
			}),
			FocusHandler = roact.createElement(focusHandlerModule, {
				isFocused = p2.state.isRooted and (p2.props.visible and p2.props.inputType == constantsModule.InputType.Gamepad),
				didFocus = function()
					-- upvalues: guiService (copy), p2 (copy)
					guiService:RemoveSelectionGroup("InGameMenuModalButtonsSelectionParent")
					guiService:AddSelectionParent("InGameMenuModalButtonsSelectionParent", p2.buttonContainerRef:getValue())
					guiService.SelectedCoreObject = p2.confirmButtonRef:getValue()
				end
			})
		})
	end)
end

function confirmationDialog.updateBlur(p5)
	-- upvalues: runService (ref)
	runService:SetRobloxGuiFocused(p5.props.blurBackground and p5.props.visible)
end

function confirmationDialog.bindActions(p6)
	-- upvalues: contextActionService (ref)
	local function confirmFunc(_, p7, _)
		-- upvalues: p6 (ref)
		if p7 == Enum.UserInputState.Begin then
			p6.props.onConfirm()
		end
	end
	
	if p6.props.bindReturnToConfirm then
		contextActionService:BindCoreAction("InGameMenuModalConfirm", confirmFunc, false, Enum.KeyCode.Return)
	end
	contextActionService:BindCoreAction("InGameMenuModalCancel", function(_, p8, _)
		-- upvalues: p6 (ref)
		if p8 == Enum.UserInputState.Begin then
			p6.props.onCancel()
		end
	end, false, Enum.KeyCode.Escape)
end

function confirmationDialog.unbindActions(_)
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("InGameMenuModalConfirm")
	contextActionService:UnbindCoreAction("InGameMenuModalCancel")
end

function confirmationDialog.didMount(p9)
	p9:updateBlur()
	
	if p9.props.visible then
		p9:bindActions()
	end
end

function confirmationDialog.didUpdate(p10)
	p10:updateBlur()
	
	if p10.props.visible then
		p10:bindActions()
		
		return
	end
	p10:unbindActions()
end

function confirmationDialog.willUnmount(p11)
	-- upvalues: runService (ref)
	if p11.props.blurBackground then
		runService:SetRobloxGuiFocused(false)
	end
	p11:unbindActions()
end

return confirmationDialog