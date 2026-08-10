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

function educationalPopupDialog.render(p0) --[[ line: 47 ]]
	-- upvalues: withFoundationOrUIBloxStyle (ref), roact (ref), coreGuiService (ref), educationalModal (ref)
	return withFoundationOrUIBloxStyle(function(p1) --[[ line: 48 ]]
		return {
			Theme = {
				Overlay = {
					Color = p1.Color.Common.Scrim.Color3,
					Transparency = p1.Color.Common.Scrim.Transparency
				}
			}
		}
	end, function(p2) --[[ line: 54 ]]
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
					BackgroundColor3 = p2.Theme.Overlay.Color,
					BackgroundTransparency = p2.Theme.Overlay.Transparency,
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

function educationalPopupDialog.bindActions(p3) --[[ line: 89 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:BindCoreAction("EducationalPopupConfirm", function(_, p4, _) --[[ line: 90 | named "dismissFunc" ]]
		-- upvalues: p3 (ref)
		if p4 == Enum.UserInputState.Begin then
			p3.props.onDismiss()
		end
	end, false, Enum.KeyCode.Escape)
end

function educationalPopupDialog.unbindActions(_) --[[ line: 99 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("EducationalPopupConfirm")
end

function educationalPopupDialog.updateBlur(p5) --[[ line: 103 ]]
	-- upvalues: runService (ref)
	runService:SetRobloxGuiFocused(p5.props.blurBackground and p5.props.visible and not game:GetService("VRService").VREnabled)
end

function educationalPopupDialog.didMount(p6) --[[ line: 110 ]]
	p6:updateBlur()
	
	if p6.props.visible then
		p6:bindActions()
	end
end

function educationalPopupDialog.didUpdate(p7) --[[ line: 118 ]]
	p7:updateBlur()
	
	if p7.props.visible then
		p7:bindActions()
		
		return
	end
	p7:unbindActions()
end

function educationalPopupDialog.willUnmount(p8) --[[ line: 128 ]]
	-- upvalues: runService (ref)
	if p8.props.blurBackground then
		runService:SetRobloxGuiFocused(false)
	end
	p8:unbindActions()
end

return educationalPopupDialog