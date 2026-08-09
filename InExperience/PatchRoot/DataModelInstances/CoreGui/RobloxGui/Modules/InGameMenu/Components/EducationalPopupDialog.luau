local coreGuiService = game:GetService("CoreGui")
local runService = game:GetService("RunService")
local contextActionService = game:GetService("ContextActionService")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local educationalModal = UIBlox.App.Dialog.Modal.EducationalModal
local withStyle = UIBlox.Core.Style.withStyle
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

function educationalPopupDialog.render(p0) --[[ line: 47 ]]
	-- upvalues: withStyle (ref), roact (ref), coreGuiService (ref), educationalModal (ref)
	return withStyle(function(p1) --[[ line: 48 ]]
		-- upvalues: roact (copy), coreGuiService (copy), p0 (ref), educationalModal (copy)
		return roact.createElement(roact.Portal, { target = coreGuiService }, {
			InGameMenuEducationalPopupDialog = roact.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				OnTopOfCoreBlur = p0.props.blurBackground,
				Enabled = p0.props.visible,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			}, {
				Overlay = roact.createElement("TextButton", {
					AutoButtonColor = false,
					BorderSizePixel = 0,
					Text = "",
					BackgroundColor3 = p1.Theme.Overlay.Color,
					BackgroundTransparency = p1.Theme.Overlay.Transparency,
					Size = UDim2.fromScale(1, 1)
				}),
				Popup = roact.createElement(educationalModal, {
					bodyContents = p0.props.bodyContents,
					cancelText = p0.props.cancelText,
					confirmText = p0.props.confirmText,
					titleText = p0.props.titleText,
					titleBackgroundImageProps = p0.props.titleBackgroundImageProps,
					screenSize = p0.props.screenSize,
					onDismiss = p0.props.onDismiss,
					onCancel = p0.props.onCancel,
					onConfirm = p0.props.onConfirm
				})
			})
		})
	end)
end

function educationalPopupDialog.bindActions(p2) --[[ line: 83 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:BindCoreAction("EducationalPopupConfirm", function(_, p3, _) --[[ line: 84 | named "dismissFunc" ]]
		-- upvalues: p2 (ref)
		if p3 == Enum.UserInputState.Begin then
			p2.props.onDismiss()
		end
	end, false, Enum.KeyCode.Escape)
end

function educationalPopupDialog.unbindActions(_) --[[ line: 93 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("EducationalPopupConfirm")
end

function educationalPopupDialog.updateBlur(p4) --[[ line: 97 ]]
	-- upvalues: runService (ref)
	runService:SetRobloxGuiFocused(p4.props.blurBackground and p4.props.visible and not game:GetService("VRService").VREnabled)
end

function educationalPopupDialog.didMount(p5) --[[ line: 104 ]]
	p5:updateBlur()
	
	if p5.props.visible then
		p5:bindActions()
	end
end

function educationalPopupDialog.didUpdate(p6) --[[ line: 112 ]]
	p6:updateBlur()
	
	if p6.props.visible then
		p6:bindActions()
		
		return
	end
	p6:unbindActions()
end

function educationalPopupDialog.willUnmount(p7) --[[ line: 122 ]]
	-- upvalues: runService (ref)
	if p7.props.blurBackground then
		runService:SetRobloxGuiFocused(false)
	end
	p7:unbindActions()
end

return educationalPopupDialog