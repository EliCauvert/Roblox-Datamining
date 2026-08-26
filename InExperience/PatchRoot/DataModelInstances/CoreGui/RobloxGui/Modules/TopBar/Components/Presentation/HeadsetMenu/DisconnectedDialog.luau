local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local fitFrameModule = require(corePackagesService.Packages.FitFrame)
local fitFrameVertical = fitFrameModule.FitFrameVertical
local fitTextLabel = fitFrameModule.FitTextLabel
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local withStyle = UIBloxModule.Core.Style.withStyle
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local inGameMenuConstantsModule = require(coreGuiService.RobloxGui.Modules.InGameMenuConstants)
local alert = images["icons/status/alert"]
local disconnectedDialog = roactModule.PureComponent:extend("DisconnectedDialog")
disconnectedDialog.validateProps = tModule.strictInterface({
	visible = tModule.boolean,
	onConfirm = tModule.callback,
	screenSize = tModule.Vector2,
	guiService = tModule.optional(tModule.union(tModule.instanceOf("GuiService"), tModule.table))
})
disconnectedDialog.defaultProps = { guiService = guiService }

function disconnectedDialog.init(p1)
	p1.guiService = p1.props.guiService
	
	function p0.onConfirmBindingAction(_, p2, _)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.Begin then
			p1.props.onConfirm()
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end
end

function disconnectedDialog.render(p1)
	-- upvalues: withStyle (ref), robloxTranslatorModule (ref), roactModule (ref), interactiveAlert (ref), fitFrameVertical (ref), imageSetLabel (ref), alert (ref), fitTextLabel (ref), buttonType (ref), coreGuiService (ref), inGameMenuConstantsModule (ref)
	return withStyle(function(p2)
		-- upvalues: robloxTranslatorModule (copy), roactModule (copy), interactiveAlert (copy), fitFrameVertical (copy), imageSetLabel (copy), alert (copy), fitTextLabel (copy), buttonType (copy), p1 (ref), coreGuiService (copy), inGameMenuConstantsModule (copy)
		local theme = p2.Theme
		local font = p2.Font
		local var1 = robloxTranslatorModule:FormatByKey("InGame.ConnectionError.Message.RestartApp")
		
		return roactModule.createElement(roactModule.Portal, { target = coreGuiService }, {
			HeadsetDisconnectedDialog = roactModule.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				OnTopOfCoreBlur = true,
				DisplayOrder = inGameMenuConstantsModule.DisplayOrder.HeadsetDisconnectedDialog,
				Enabled = p1.props.visible,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			}, {
				Overlay = roactModule.createElement("Frame", {
					Active = true,
					BorderSizePixel = 0,
					BackgroundColor3 = theme.Overlay.Color,
					BackgroundTransparency = theme.Overlay.Transparency,
					Size = UDim2.fromScale(1, 1)
				}, {
					Alert = roactModule.createElement(interactiveAlert, {
						title = robloxTranslatorModule:FormatByKey("InGame.ConnectionError.Heading.VRDisconnected"),
						middleContent = function()
							-- upvalues: roactModule (copy), fitFrameVertical (copy), imageSetLabel (copy), alert (copy), fitTextLabel (copy), font (ref), var1 (ref), theme (ref)
							return roactModule.createElement(fitFrameVertical, {
								BackgroundTransparency = 1,
								width = UDim.new(1, 0),
								FillDirection = Enum.FillDirection.Vertical,
								HorizontalAlignment = Enum.HorizontalAlignment.Center,
								VerticalAlignment = Enum.VerticalAlignment.Center,
								contentPadding = UDim.new(0, 24)
							}, {
								Icon = roactModule.createElement(imageSetLabel, {
									LayoutOrder = 1,
									BackgroundTransparency = 1,
									ImageTransparency = 0,
									Position = UDim2.new(0, 5, 0, 5),
									Size = UDim2.fromOffset(40, 40),
									Image = alert
								}),
								BodyText = roactModule.createElement(fitTextLabel, {
									LayoutOrder = 2,
									BackgroundTransparency = 1,
									width = fitTextLabel.Width.FitToText,
									Font = font.Body.Font,
									Text = var1,
									TextSize = font.BaseSize * font.Body.RelativeSize,
									TextColor3 = theme.TextDefault.Color
								})
							})
						end,
						buttonStackInfo = {
							buttons = {
								{
									buttonType = buttonType.PrimarySystem,
									props = {
										onActivated = p1.props.onConfirm,
										text = robloxTranslatorModule:FormatByKey("InGame.ConnectionError.Action.Restart")
									}
								}
							}
						},
						screenSize = p1.props.screenSize
					})
				})
			})
		})
	end)
end

function disconnectedDialog.bindActions(p1)
	-- upvalues: contextActionService (ref)
	contextActionService:BindCoreAction("TopBarGamepadDisableMenuShortcut", function() end, false, Enum.KeyCode.ButtonStart, Enum.KeyCode.Escape)
	contextActionService:BindCoreAction("TopBarDialogConfirm", p1.onConfirmBindingAction, false, Enum.KeyCode.Return, Enum.KeyCode.ButtonA)
end

function disconnectedDialog.unbindActions(_)
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("TopBarGamepadDisableMenuShortcut")
	contextActionService:UnbindCoreAction("TopBarDialogConfirm")
end

function disconnectedDialog.didMount(p1)
	if p1.props.visible then
		p1:bindActions()
		p1.guiService:SetMenuIsOpen(true, "HeadsetDisconnectedDialog")
	end
end

function disconnectedDialog.didUpdate(p1, p2, _)
	if p1.props.visible ~= p2.visible then
		if p1.props.visible then
			p1:bindActions()
			p1.guiService:SetMenuIsOpen(true, "HeadsetDisconnectedDialog")
			
			return
		end
		p1:unbindActions()
		p1.guiService:SetMenuIsOpen(false, "HeadsetDisconnectedDialog")
	end
end

function disconnectedDialog.willUnmount(p1)
	p1:unbindActions()
	p1.guiService:SetMenuIsOpen(false, "HeadsetDisconnectedDialog")
end

return disconnectedDialog