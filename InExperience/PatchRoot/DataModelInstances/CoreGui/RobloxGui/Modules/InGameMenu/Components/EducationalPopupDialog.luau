local coreGuiService = game:GetService("CoreGui")
local runService = game:GetService("RunService")
local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local educationalModal = inGameMenuDependenciesModule.UIBlox.App.Dialog.Modal.EducationalModal
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local educationalPopupDialog = roact.PureComponent:extend("EducationalPopupDialog")
educationalPopupDialog.validateProps = t.strictInterface({
	bodyContents = t.array(t.strictInterface({
		icon = t.optional(t.union(t.string, t.table)),
		text = t.string,
		layoutOrder = t.optional(t.integer),
		isSystemMenuIcon = t.optional(t.boolean)
	})),
	cancelText = t.string,
	confirmText = t.string,
	titleText = t.optional(t.string),
	titleBackgroundImageProps = t.strictInterface({
		image = t.string,
		imageHeight = t.number,
		text = t.optional(t.string)
	}),
	screenSize = t.Vector2,
	onDismiss = t.callback,
	onCancel = t.callback,
	onConfirm = t.callback,
	blurBackground = t.boolean,
	visible = t.boolean
})
educationalPopupDialog.defaultProps = { blurBackground = false }

function educationalPopupDialog.render(p1)
	-- upvalues: withFoundationOrUIBloxStyle (ref), roact (ref), coreGuiService (ref), educationalModal (ref)
	return withFoundationOrUIBloxStyle(function(p2)
		return {
			Theme = {
				Overlay = {
					Color = p2.Color.Common.Scrim.Color3,
					Transparency = p2.Color.Common.Scrim.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: roact (copy), coreGuiService (copy), p1 (ref), educationalModal (copy)
		return roact.createElement(roact.Portal, { target = coreGuiService }, {
			InGameMenuEducationalPopupDialog = roact.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				OnTopOfCoreBlur = p1.props.blurBackground,
				Enabled = p1.props.visible,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			}, {
				Overlay = roact.createElement("TextButton", {
					AutoButtonColor = false,
					BorderSizePixel = 0,
					Text = "",
					BackgroundColor3 = p2.Theme.Overlay.Color,
					BackgroundTransparency = p2.Theme.Overlay.Transparency,
					Size = UDim2.fromScale(1, 1)
				}),
				Popup = roact.createElement(educationalModal, {
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

function educationalPopupDialog.bindActions(p1)
	-- upvalues: contextActionService (ref)
	contextActionService:BindCoreAction("EducationalPopupConfirm", function(_, p2, _)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.Begin then
			p1.props.onDismiss()
		end
	end, false, Enum.KeyCode.Escape)
end

function educationalPopupDialog.unbindActions(_)
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("EducationalPopupConfirm")
end

function educationalPopupDialog.updateBlur(p1)
	-- upvalues: runService (ref)
	runService:SetRobloxGuiFocused(p1.props.blurBackground and p1.props.visible and not game:GetService("VRService").VREnabled)
end

function educationalPopupDialog.didMount(p1)
	p1:updateBlur()
	
	if p1.props.visible then
		p1:bindActions()
	end
end

function educationalPopupDialog.didUpdate(p1)
	p1:updateBlur()
	
	if p1.props.visible then
		p1:bindActions()
		
		return
	end
	p1:unbindActions()
end

function educationalPopupDialog.willUnmount(p1)
	-- upvalues: runService (ref)
	if p1.props.blurBackground then
		runService:SetRobloxGuiFocused(false)
	end
	p1:unbindActions()
end

return educationalPopupDialog