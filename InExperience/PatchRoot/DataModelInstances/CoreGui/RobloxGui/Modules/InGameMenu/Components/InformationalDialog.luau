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

function informationalDialog.init(p0) --[[ line: 66 ]]
	-- upvalues: roact (ref)
	p0.state = { isRooted = false, show = true }
	
	function p0.onAncestryChanged(p1) --[[ line: 72 ]]
		-- upvalues: p0 (ref)
		if p1:IsDescendantOf(game) then
			p0:setState({ isRooted = true })
		end
	end
	
	p0.confirmButtonRef = roact.createRef()
	p0.buttonContainerRef = roact.createRef()
end

function informationalDialog.render(p2) --[[ line: 83 ]]
	-- upvalues: withStyle (ref), textService (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), roact (ref), coreGuiService (ref), imageSetLabel (ref), assetsModule (ref), themedTextLabelModule (ref), button (ref), buttonType (ref), runService (ref), focusHandlerModule (ref), constantsModule (ref), guiService (ref)
	local props = p2.props
	
	return withStyle(function(p3) --[[ line: 86 ]]
		-- upvalues: props (ref), textService (copy), getFFlagIGMGamepadSelectionHistoryModule (copy), p2 (ref), roact (copy), coreGuiService (copy), imageSetLabel (copy), assetsModule (copy), themedTextLabelModule (copy), button (copy), buttonType (copy), runService (copy), focusHandlerModule (copy), constantsModule (copy), guiService (copy)
		local font = p3.Font.Body.Font
		local var13 = p3.Font.Body.RelativeSize * p3.Font.BaseSize
		local var14 = math.max(textService:GetTextSize(props.bodyText, var13, font, Vector2.new(295, 1e999)).Y, var13 * 2) + 20
		local var15 = math.max(textService:GetTextSize(props.subBodyText, var13, font, Vector2.new(295, 1e999)).Y, var13 * 2) + 20
		
		return roact.createElement(roact.Portal, { target = coreGuiService }, {
			InGameMenuInformationalDialog = roact.createElement("ScreenGui", {
				DisplayOrder = 8,
				IgnoreGuiInset = true,
				OnTopOfCoreBlur = props.blurBackground,
				Enabled = props.visible and p2.state.show,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			}, {
				Overlay = roact.createElement("TextButton", {
					AutoButtonColor = false,
					BorderSizePixel = 0,
					Text = "",
					BackgroundColor3 = p3.Theme.Overlay.Color,
					BackgroundTransparency = p3.Theme.Overlay.Transparency,
					Size = UDim2.new(1, 0, 1, 0)
				}),
				DialogMainFrame = roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = assetsModule.Images.RoundedRect.Image,
					ImageColor3 = p3.Theme.BackgroundUIDefault.Color,
					ImageTransparency = p3.Theme.BackgroundUIDefault.Transparency,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					ScaleType = assetsModule.Images.RoundedRect.ScaleType,
					Size = UDim2.new(0, 335, 0, var14 + 49 + var15 + 36 + 70 + props.iconSize),
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
						BackgroundColor3 = p3.Theme.Divider.Color,
						BackgroundTransparency = p3.Theme.Divider.Transparency,
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
						Size = UDim2.new(1, 0, 0, var14)
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
						Size = UDim2.new(1, 0, 0, var15)
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
						[roact.Ref] = p2.buttonContainerRef,
						[roact.Event.AncestryChanged] = p2.onAncestryChanged
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
							onActivated = function() --[[ line: 237 ]]
								-- upvalues: p2 (copy), runService (copy)
								p2:setState({ show = false })
								
								if p2.props.onContinueFunc then
									p2.props.onContinueFunc()
								end
								runService:SetRobloxGuiFocused(false)
							end,
							[roact.Ref] = p2.confirmButtonRef
						})
					})
				})
			}),
			FocusHandler = roact.createElement(focusHandlerModule, {
				isFocused = p2.state.isRooted and (p2.props.visible and p2.props.inputType == constantsModule.InputType.Gamepad),
				shouldForgetPreviousSelection = if getFFlagIGMGamepadSelectionHistoryModule() then not p2.props.visible else nil,
				didFocus = function() --[[ line: 256 ]]
					-- upvalues: guiService (copy), p2 (copy)
					guiService:RemoveSelectionGroup("InGameMenuModalButtonsSelectionParent")
					guiService:AddSelectionParent("InGameMenuModalButtonsSelectionParent", p2.buttonContainerRef:getValue())
					guiService.SelectedCoreObject = p2.confirmButtonRef:getValue()
				end
			})
		})
	end)
end

function informationalDialog.updateBlur(p4) --[[ line: 267 ]]
	-- upvalues: runService (ref)
	runService:SetRobloxGuiFocused(p4.props.blurBackground and p4.props.visible)
end

function informationalDialog.bindActions(p5) --[[ line: 272 ]]
	-- upvalues: contextActionService (ref)
	local function confirmFunc(_, p6, _) --[[ line: 273 ]]
		-- upvalues: p5 (ref)
		if p6 == Enum.UserInputState.Begin then
			p5.props.onConfirm()
		end
	end
	
	if p5.props.bindReturnToConfirm then
		contextActionService:BindCoreAction("InGameMenuModalConfirm", confirmFunc, false, Enum.KeyCode.Return)
	end
end

function informationalDialog.unbindActions(_) --[[ line: 284 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("InGameMenuModalConfirm")
end

function informationalDialog.didMount(p7) --[[ line: 288 ]]
	p7:updateBlur()
	
	if p7.props.visible then
		p7:bindActions()
	end
end

function informationalDialog.didUpdate(p8) --[[ line: 296 ]]
	p8:updateBlur()
	
	if p8.props.visible then
		p8:bindActions()
		
		return
	end
	p8:unbindActions()
end

function informationalDialog.willUnmount(p9) --[[ line: 306 ]]
	-- upvalues: runService (ref)
	if p9.props.blurBackground then
		runService:SetRobloxGuiFocused(false)
	end
	p9:unbindActions()
end

return informationalDialog