local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local FitFrameModule = require(CorePackages.Packages.FitFrame)
local FitFrameVertical = FitFrameModule.FitFrameVertical
local FitTextLabel = FitFrameModule.FitTextLabel
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local InGameMenuConstantsModule = require(CoreGui.RobloxGui.Modules.InGameMenuConstants)
local IconsStatusAlert = UIBloxModule.App.ImageSet.Images["icons/status/alert"]
local DisconnectedDialog = RoactModule.PureComponent:extend("DisconnectedDialog")
DisconnectedDialog.validateProps = TModule.strictInterface({
	visible = TModule.boolean,
	onConfirm = TModule.callback,
	screenSize = TModule.Vector2,
	guiService = TModule.optional(TModule.union(TModule.instanceOf("GuiService"), TModule.table))
})
DisconnectedDialog.defaultProps = { guiService = GuiService }

function DisconnectedDialog.init(p1) --[[ Line: 50 ]]
	p1.guiService = p1.props.guiService
	
	function p1:onConfirmBindingAction(UserInputState, _) --[[ Line: 53 ]]
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			p1.props.onConfirm()
			
			return Enum.ContextActionResult.Sink
		else
			return Enum.ContextActionResult.Pass
		end
	end
end

function DisconnectedDialog.render(p1) --[[ Line: 64 ]]
	-- upvalues: WithStyleFunction (copy), RobloxTranslatorModule (copy), RoactModule (copy), InteractiveAlert (copy), FitFrameVertical (copy), ImageSetLabel (copy), IconsStatusAlert (copy), FitTextLabel (copy), ButtonType (copy), CoreGui (copy), InGameMenuConstantsModule (copy)
	return WithStyleFunction(function(p2) --[[ Line: 65 ]]
		-- upvalues: RobloxTranslatorModule (upval), RoactModule (upval), InteractiveAlert (upval), FitFrameVertical (upval), ImageSetLabel (upval), IconsStatusAlert (upval), FitTextLabel (upval), ButtonType (upval), p1 (copy), CoreGui (upval), InGameMenuConstantsModule (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		local InGameConnectionErrorMessageRestartApp = RobloxTranslatorModule:FormatByKey("InGame.ConnectionError.Message.RestartApp")
		
		return RoactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
			HeadsetDisconnectedDialog = RoactModule.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				OnTopOfCoreBlur = true,
				DisplayOrder = InGameMenuConstantsModule.DisplayOrder.HeadsetDisconnectedDialog,
				Enabled = p1.props.visible,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			}, {
				Overlay = RoactModule.createElement("Frame", {
					Active = true,
					BorderSizePixel = 0,
					BackgroundColor3 = Theme.Overlay.Color,
					BackgroundTransparency = Theme.Overlay.Transparency,
					Size = UDim2.fromScale(1, 1)
				}, {
					Alert = RoactModule.createElement(InteractiveAlert, {
						title = RobloxTranslatorModule:FormatByKey("InGame.ConnectionError.Heading.VRDisconnected"),
						middleContent = function() --[[ Line: 75 ]]
							-- upvalues: RoactModule (upval), FitFrameVertical (upval), ImageSetLabel (upval), IconsStatusAlert (upval), FitTextLabel (upval), _Font (copy), InGameConnectionErrorMessageRestartApp (copy), Theme (copy)
							return RoactModule.createElement(FitFrameVertical, {
								BackgroundTransparency = 1,
								width = UDim.new(1, 0),
								FillDirection = Enum.FillDirection.Vertical,
								HorizontalAlignment = Enum.HorizontalAlignment.Center,
								VerticalAlignment = Enum.VerticalAlignment.Center,
								contentPadding = UDim.new(0, 24)
							}, {
								Icon = RoactModule.createElement(ImageSetLabel, {
									LayoutOrder = 1,
									BackgroundTransparency = 1,
									ImageTransparency = 0,
									Position = UDim2.new(0, 5, 0, 5),
									Size = UDim2.fromOffset(40, 40),
									Image = IconsStatusAlert
								}),
								BodyText = RoactModule.createElement(FitTextLabel, {
									LayoutOrder = 2,
									BackgroundTransparency = 1,
									width = FitTextLabel.Width.FitToText,
									Font = _Font.Body.Font,
									Text = InGameConnectionErrorMessageRestartApp,
									TextSize = _Font.BaseSize * _Font.Body.RelativeSize,
									TextColor3 = Theme.TextDefault.Color
								})
							})
						end,
						buttonStackInfo = {
							buttons = {
								{
									buttonType = ButtonType.PrimarySystem,
									props = {
										onActivated = p1.props.onConfirm,
										text = RobloxTranslatorModule:FormatByKey("InGame.ConnectionError.Action.Restart")
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

function DisconnectedDialog.bindActions(p1) --[[ Line: 144 ]]
	-- upvalues: ContextActionService (copy)
	ContextActionService:BindCoreAction("TopBarGamepadDisableMenuShortcut", function() --[[ Line: 148 ]] end, false, Enum.KeyCode.ButtonStart, Enum.KeyCode.Escape)
	ContextActionService:BindCoreAction("TopBarDialogConfirm", p1.onConfirmBindingAction, false, Enum.KeyCode.Return, Enum.KeyCode.ButtonA)
end

function DisconnectedDialog:unbindActions() --[[ Line: 163 ]]
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("TopBarGamepadDisableMenuShortcut")
	ContextActionService:UnbindCoreAction("TopBarDialogConfirm")
end

function DisconnectedDialog.didMount(p1) --[[ Line: 168 ]]
	if p1.props.visible then
		p1:bindActions()
		p1.guiService:SetMenuIsOpen(true, "HeadsetDisconnectedDialog")
	end
end

function DisconnectedDialog.didUpdate(p1, p2, _) --[[ Line: 175 ]]
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

function DisconnectedDialog.willUnmount(p1) --[[ Line: 187 ]]
	p1:unbindActions()
	p1.guiService:SetMenuIsOpen(false, "HeadsetDisconnectedDialog")
end

return DisconnectedDialog