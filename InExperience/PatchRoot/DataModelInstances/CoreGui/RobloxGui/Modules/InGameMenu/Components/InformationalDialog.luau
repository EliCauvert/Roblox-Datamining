local coreGuiService = game:GetService("CoreGui")
local runService = game:GetService("RunService")
local textService = game:GetService("TextService")
local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local button = UIBlox.App.Button.Button
local buttonType = UIBlox.App.Button.Enum.ButtonType
local withStyle = UIBlox.Core.Style.withStyle
local parent = script.Parent.Parent
local getFFlagIGMGamepadSelectionHistoryModule = require(parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local constantsModule = require(parent.Resources.Constants)
local assetsModule = require(parent.Resources.Assets)
local themedTextLabelModule = require(script.Parent.ThemedTextLabel)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local focusHandlerModule = require(script.Parent.Connection.FocusHandler)
local informationalDialog = roact.PureComponent:extend("InformationalDialog")
informationalDialog.validateProps = t.strictInterface({
	bodyText = t.string,
	confirmText = t.string,
	titleText = t.string,
	subBodyText = t.optional(t.string),
	iconImage = t.optional(t.union(t.table, t.string)),
	iconSize = t.number,
	onContinueFunc = t.optional(t.callback),
	bindReturnToConfirm = t.boolean,
	blurBackground = t.boolean,
	visible = t.boolean,
	inputType = t.optional(t.string)
})
informationalDialog.defaultProps = {
	subBodyText = nil,
	blurBackground = false,
	iconImage = nil,
	iconSize = 64
}

function informationalDialog.init(p1)
	-- upvalues: roact (ref)
	p1.state = { isRooted = false, show = true }
	
	function p0.onAncestryChanged(p2)
		-- upvalues: p1 (ref)
		if p2:IsDescendantOf(game) then
			p1:setState({ isRooted = true })
		end
	end
	
	p1.confirmButtonRef = roact.createRef()
	p1.buttonContainerRef = roact.createRef()
end

function informationalDialog.render(p1)
	-- upvalues: withStyle (ref), textService (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), roact (ref), coreGuiService (ref), imageSetLabel (ref), assetsModule (ref), themedTextLabelModule (ref), button (ref), buttonType (ref), runService (ref), focusHandlerModule (ref), constantsModule (ref), guiService (ref)
	local props = p1.props
	
	return withStyle(function(p2)
		-- upvalues: props (ref), textService (copy), getFFlagIGMGamepadSelectionHistoryModule (copy), p1 (ref), roact (copy), coreGuiService (copy), imageSetLabel (copy), assetsModule (copy), themedTextLabelModule (copy), button (copy), buttonType (copy), runService (copy), focusHandlerModule (copy), constantsModule (copy), guiService (copy)
		local font = p2.Font.Body.Font
		local var1 = p2.Font.Body.RelativeSize * p2.Font.BaseSize
		local var2 = math.max(textService:GetTextSize(props.bodyText, var1, font, Vector2.new(295, 1e999)).Y, var1 * 2) + 20
		local var3 = math.max(textService:GetTextSize(props.subBodyText, var1, font, Vector2.new(295, 1e999)).Y, var1 * 2) + 20
		
		return roact.createElement(roact.Portal, { target = coreGuiService }, {
			InGameMenuInformationalDialog = roact.createElement("ScreenGui", {
				DisplayOrder = 8,
				IgnoreGuiInset = true,
				OnTopOfCoreBlur = props.blurBackground,
				Enabled = props.visible and p1.state.show,
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
					Size = UDim2.new(0, 335, 0, var2 + 49 + var3 + 36 + 70 + props.iconSize),
					SliceCenter = assetsModule.Images.RoundedRect.SliceCenter
				}, {
					Padding = roact.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 20),
						PaddingBottom = UDim.new(0, 20),
						PaddingLeft = UDim.new(0, 20),
						PaddingRight = UDim.new(0, 20)
					}),
					Layout = roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Icon = roact.createElement(imageSetLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Image = props.iconImage,
						Size = UDim2.new(0, props.iconSize, 0, props.iconSize)
					}),
					Title = roact.createElement(themedTextLabelModule, {
						fontKey = "Header1",
						themeKey = "TextEmphasis",
						LayoutOrder = 2,
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
					SpaceContainer = roact.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 4,
						Size = UDim2.new(1, 0, 0, 10)
					}),
					BodyTextContainer = roact.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 5,
						Size = UDim2.new(1, 0, 0, var2)
					}, {
						BodyText = roact.createElement(themedTextLabelModule, {
							TextWrapped = true,
							Size = UDim2.new(1, 0, 1, 0),
							Text = props.bodyText
						})
					}),
					SubBodyTextContainer = roact.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 6,
						Size = UDim2.new(1, 0, 0, var3)
					}, {
						BodyText = roact.createElement(themedTextLabelModule, {
							TextWrapped = true,
							Size = UDim2.new(1, 0, 1, 0),
							Text = props.subBodyText
						})
					}),
					SpaceContainer2 = roact.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 7,
						Size = UDim2.new(1, 0, 0, 10)
					}),
					ButtonContainer = roact.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 8,
						Size = UDim2.new(1, 0, 0, 36),
						[roact.Ref] = p1.buttonContainerRef,
						[roact.Event.AncestryChanged] = p1.onAncestryChanged
					}, {
						Layout = roact.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, 20),
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center
						}),
						ConfirmButton = roact.createElement(button, {
							buttonType = buttonType.PrimarySystem,
							layoutOrder = 1,
							size = UDim2.new(1, -5, 1, 0),
							text = props.confirmText,
							onActivated = function()
								-- upvalues: p1 (copy), runService (copy)
								p1:setState({ show = false })
								
								if p1.props.onContinueFunc then
									p1.props.onContinueFunc()
								end
								runService:SetRobloxGuiFocused(false)
							end,
							[roact.Ref] = p1.confirmButtonRef
						})
					})
				})
			}),
			FocusHandler = roact.createElement(focusHandlerModule, {
				isFocused = p1.state.isRooted and (p1.props.visible and p1.props.inputType == constantsModule.InputType.Gamepad),
				shouldForgetPreviousSelection = if getFFlagIGMGamepadSelectionHistoryModule() then not p1.props.visible else nil,
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

function informationalDialog.updateBlur(p1)
	-- upvalues: runService (ref)
	runService:SetRobloxGuiFocused(p1.props.blurBackground and p1.props.visible)
end

function informationalDialog.bindActions(p1)
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
end

function informationalDialog.unbindActions(_)
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("InGameMenuModalConfirm")
end

function informationalDialog.didMount(p1)
	p1:updateBlur()
	
	if p1.props.visible then
		p1:bindActions()
	end
end

function informationalDialog.didUpdate(p1)
	p1:updateBlur()
	
	if p1.props.visible then
		p1:bindActions()
		
		return
	end
	p1:unbindActions()
end

function informationalDialog.willUnmount(p1)
	-- upvalues: runService (ref)
	if p1.props.blurBackground then
		runService:SetRobloxGuiFocused(false)
	end
	p1:unbindActions()
end

return informationalDialog