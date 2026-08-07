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

function disconnectedDialog.init(p0) --[[ line: 50 ]]
	p0.guiService = p0.props.guiService
	
	function p0.onConfirmBindingAction(_, p1, _) --[[ line: 53 ]]
		-- upvalues: p0 (ref)
		if p1 == Enum.UserInputState.Begin then
			p0.props.onConfirm()
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end
end

function disconnectedDialog.render(p2) --[[ line: 64 ]]
	-- upvalues: withStyle (ref), robloxTranslatorModule (ref), roactModule (ref), interactiveAlert (ref), fitFrameVertical (ref), imageSetLabel (ref), alert (ref), fitTextLabel (ref), buttonType (ref), coreGuiService (ref), inGameMenuConstantsModule (ref)
	return withStyle(function(p3) --[[ line: 65 ]]
		-- upvalues: robloxTranslatorModule (copy), roactModule (copy), interactiveAlert (copy), fitFrameVertical (copy), imageSetLabel (copy), alert (copy), fitTextLabel (copy), buttonType (copy), p2 (ref), coreGuiService (copy), inGameMenuConstantsModule (copy)
		local theme = p3.Theme
		local font = p3.Font
		local var11 = robloxTranslatorModule:FormatByKey("InGame.ConnectionError.Message.RestartApp")
		
		return roactModule.createElement(roactModule.Portal, { target = coreGuiService }, {
			HeadsetDisconnectedDialog = roactModule.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				OnTopOfCoreBlur = true,
				DisplayOrder = inGameMenuConstantsModule.DisplayOrder.HeadsetDisconnectedDialog,
				Enabled = p2.props.visible,
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
						middleContent = function() --[[ line: 75 ]]
							-- upvalues: roactModule (copy), fitFrameVertical (copy), imageSetLabel (copy), alert (copy), fitTextLabel (copy), font (ref), var11 (ref), theme (ref)
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
									Text = var11,
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
										onActivated = p2.props.onConfirm,
										text = robloxTranslatorModule:FormatByKey("InGame.ConnectionError.Action.Restart")
									}
								}
							}
						},
						screenSize = p2.props.screenSize
					})
				})
			})
		})
	end)
end

function disconnectedDialog.bindActions(p4) --[[ line: 144 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:BindCoreAction("TopBarGamepadDisableMenuShortcut", function() --[[ line: 148 ]] end, false, Enum.KeyCode.ButtonStart, Enum.KeyCode.Escape)
	contextActionService:BindCoreAction("TopBarDialogConfirm", p4.onConfirmBindingAction, false, Enum.KeyCode.Return, Enum.KeyCode.ButtonA)
end

function disconnectedDialog.unbindActions(_) --[[ line: 163 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("TopBarGamepadDisableMenuShortcut")
	contextActionService:UnbindCoreAction("TopBarDialogConfirm")
end

function disconnectedDialog.didMount(p5) --[[ line: 168 ]]
	if p5.props.visible then
		p5:bindActions()
		p5.guiService:SetMenuIsOpen(true, "HeadsetDisconnectedDialog")
	end
end

function disconnectedDialog.didUpdate(p6, p7, _) --[[ line: 175 ]]
	if p6.props.visible ~= p7.visible then
		if p6.props.visible then
			p6:bindActions()
			p6.guiService:SetMenuIsOpen(true, "HeadsetDisconnectedDialog")
			
			return
		end
		p6:unbindActions()
		p6.guiService:SetMenuIsOpen(false, "HeadsetDisconnectedDialog")
	end
end

function disconnectedDialog.willUnmount(p8) --[[ line: 187 ]]
	p8:unbindActions()
	p8.guiService:SetMenuIsOpen(false, "HeadsetDisconnectedDialog")
end

return disconnectedDialog