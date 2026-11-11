local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local EducationalModal = InGameMenuDependenciesModule.UIBlox.App.Dialog.Modal.EducationalModal
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local EducationalPopupDialog = Roact.PureComponent:extend("EducationalPopupDialog")
EducationalPopupDialog.validateProps = T.strictInterface({
	bodyContents = T.array(T.strictInterface({
		icon = T.optional(T.union(T.string, T.table)),
		text = T.string,
		layoutOrder = T.optional(T.integer),
		isSystemMenuIcon = T.optional(T.boolean)
	})),
	cancelText = T.string,
	confirmText = T.string,
	titleText = T.optional(T.string),
	titleBackgroundImageProps = T.strictInterface({
		image = T.string,
		imageHeight = T.number,
		text = T.optional(T.string)
	}),
	screenSize = T.Vector2,
	onDismiss = T.callback,
	onCancel = T.callback,
	onConfirm = T.callback,
	blurBackground = T.boolean,
	visible = T.boolean
})
EducationalPopupDialog.defaultProps = { blurBackground = false }

function EducationalPopupDialog.render(p1)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), Roact (copy), CoreGui (copy), EducationalModal (copy)
	return WithFoundationOrUIBloxStyleFunction(function(p2)
		return {
			Theme = {
				Overlay = {
					Color = p2.Color.Common.Scrim.Color3,
					Transparency = p2.Color.Common.Scrim.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: Roact (upval), CoreGui (upval), p1 (copy), EducationalModal (upval)
		return Roact.createElement(Roact.Portal, { target = CoreGui }, {
			InGameMenuEducationalPopupDialog = Roact.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				OnTopOfCoreBlur = p1.props.blurBackground,
				Enabled = p1.props.visible,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			}, {
				Overlay = Roact.createElement("TextButton", {
					AutoButtonColor = false,
					BorderSizePixel = 0,
					Text = "",
					BackgroundColor3 = p2.Theme.Overlay.Color,
					BackgroundTransparency = p2.Theme.Overlay.Transparency,
					Size = UDim2.fromScale(1, 1)
				}),
				Popup = Roact.createElement(EducationalModal, {
					bodyContents = p1.props.bodyContents,
					cancelText = p1.props.cancelText,
					confirmText = p1.props.confirmText,
					titleText = p1.props.titleText,
					titleBackgroundImageProps = p1.props.titleBackgroundImageProps,
					screenSize = p1.props.screenSize,
					onDismiss = p1.props.onDismiss,
					onCancel = p1.props.onCancel,
					onConfirm = p1.props.onConfirm
				})
			})
		})
	end)
end

function EducationalPopupDialog.bindActions(p1)
	-- upvalues: ContextActionService (copy)
	ContextActionService:BindCoreAction("EducationalPopupConfirm", function(_, UserInputState, _)
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			p1.props.onDismiss()
		end
	end, false, Enum.KeyCode.Escape)
end

function EducationalPopupDialog:unbindActions()
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("EducationalPopupConfirm")
end

function EducationalPopupDialog.updateBlur(p1)
	-- upvalues: RunService (copy)
	RunService:SetRobloxGuiFocused(p1.props.blurBackground and p1.props.visible and not game:GetService("VRService").VREnabled)
end

function EducationalPopupDialog.didMount(p1)
	p1:updateBlur()
	
	if p1.props.visible then
		p1:bindActions()
	end
end

function EducationalPopupDialog.didUpdate(p1)
	p1:updateBlur()
	
	if p1.props.visible then
		p1:bindActions()
		
		return
	else
		p1:unbindActions()
	end
end

function EducationalPopupDialog.willUnmount(p1)
	-- upvalues: RunService (copy)
	if p1.props.blurBackground then
		RunService:SetRobloxGuiFocused(false)
	end
	p1:unbindActions()
end

return EducationalPopupDialog