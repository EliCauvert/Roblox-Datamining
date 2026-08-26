local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local roactModule = require(corePackagesService.Packages.Roact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local tModule = require(corePackagesService.Packages.t)
local parent = script.Parent.Parent
local virtualKeyboardMonitorModule = require(parent.Components.VirtualKeyboardMonitor)
local assetsModule = require(parent.Resources.Assets)
local dividerModule = require(require(parent.Dependencies).Divider)
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local withStyle = UIBloxModule.Core.Style.withStyle
local iconButton = UIBloxModule.App.Button.IconButton
local headerBar = UIBloxModule.App.Bar.HeaderBar
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local images = UIBloxModule.App.ImageSet.Images
local makeBackButton = require(corePackagesService.Workspace.Packages.AppHeaderBar).makeBackButton
local modalDialog = roactModule.Component:extend("ModalDialog")
modalDialog.validateProps = tModule.strictInterface({
	visible = tModule.boolean,
	screenSize = tModule.Vector2,
	titleText = tModule.optional(tModule.string),
	showCloseButton = tModule.optional(tModule.boolean),
	headerBar = tModule.optional(tModule.table),
	contents = tModule.optional(tModule.table),
	actionButtons = tModule.optional(tModule.table),
	onDismiss = tModule.optional(tModule.callback),
	onBackButtonActivated = tModule.optional(tModule.callback)
})

function modalDialog.init(p1)
	-- upvalues: virtualKeyboardMonitorModule (ref)
	p1.virtualKeyboardMonitor = virtualKeyboardMonitorModule.getInstance()
	
	function p0.onOverlayActivated()
		-- upvalues: p1 (ref)
		if p1.virtualKeyboardMonitor:isKeyboardJustOff() then
			return
		end
		p1.props.onDismiss()
	end
end

function modalDialog.renderHeaderBarLeft(p1)
	-- upvalues: roactModule (ref), iconButton (ref), iconSize (ref), images (ref), makeBackButton (ref)
	local props = p1.props
	
	return if props.showCloseButton then function()
		-- upvalues: roactModule (copy), iconButton (copy), iconSize (copy), images (copy), props (ref)
		return roactModule.createElement(iconButton, {
			iconSize = iconSize.Medium,
			icon = images["icons/navigation/close"],
			onActivated = props.onDismiss
		})
	end elseif props.onBackButtonActivated == nil then function()
		return nil
	end else makeBackButton(props.onBackButtonActivated)
end

function modalDialog.renderHeaderBarRight(_)
	return function()
		return nil
	end
end

function modalDialog.render(p1)
	-- upvalues: withStyle (ref), roactModule (ref), imageSetButton (ref), assetsModule (ref), headerBar (ref), dividerModule (ref)
	local vector2_1, uDim2
	local props = p1.props
	local vector2 = Vector2.new(math.min(props.screenSize.X, 540), math.min(props.screenSize.Y, 375))
	local _ = nil
	local _ = nil
	
	if props.screenSize.X < 540 then
		vector2_1 = Vector2.new(0.5, 1)
		uDim2 = UDim2.fromScale(0.5, 1)
	else
		vector2_1 = Vector2.new(0.5, 0.5)
		uDim2 = UDim2.fromScale(0.5, 0.5)
	end
	local minValue = math.min(230, vector2.Y - 49 - 96)
	
	if not props.actionButtons then
		minValue += 96
	end
	return withStyle(function(p2)
		-- upvalues: roactModule (copy), props (ref), p1 (ref), imageSetButton (copy), vector2_1 (write), assetsModule (copy), uDim2 (write), vector2 (ref), headerBar (copy), dividerModule (copy), minValue (write)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Visible = props.visible
		}, {
			Overlay = roactModule.createElement("TextButton", {
				AutoButtonColor = false,
				BackgroundColor3 = p2.Theme.Overlay.Color,
				BackgroundTransparency = p2.Theme.Overlay.Transparency,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				Text = "",
				ZIndex = -10,
				[roactModule.Event.Activated] = p1.onOverlayActivated
			}),
			Dialog = roactModule.createElement(imageSetButton, {
				Active = true,
				BackgroundTransparency = 1,
				AnchorPoint = vector2_1,
				Image = assetsModule.Images.RoundedRect.Image,
				ImageColor3 = p2.Theme.BackgroundUIDefault.Color,
				ImageTransparency = p2.Theme.BackgroundUIDefault.Transparency,
				Position = uDim2,
				ScaleType = assetsModule.Images.RoundedRect.ScaleType,
				Size = UDim2.fromOffset(vector2.X, vector2.Y),
				SliceCenter = assetsModule.Images.RoundedRect.SliceCenter
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				HeaderBar = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 48)
				}, {
					Bar = props.headerBar or (roactModule.createElement(headerBar, {
						backgroundTransparency = 1,
						barHeight = 48,
						renderLeft = p1:renderHeaderBarLeft(),
						renderRight = p1:renderHeaderBarRight(),
						title = props.titleText
					}) or nil)
				}),
				Divider = roactModule.createElement(dividerModule, { LayoutOrder = 2 }),
				Content = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					ZIndex = 10,
					Size = UDim2.new(1, 0, 0, minValue)
				}, { Contents = props.contents }),
				ActionBar = props.actionButtons and roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, 96)
				}, {
					Padding = roactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 24),
						PaddingBottom = UDim.new(0, 24),
						PaddingLeft = UDim.new(0, 24),
						PaddingRight = UDim.new(0, 24)
					}),
					ActionButtons = props.actionButtons
				}) or nil
			})
		})
	end)
end

function modalDialog.bindActions(p1)
	-- upvalues: contextActionService (ref)
	contextActionService:BindCoreAction("ModalDialogDismiss", function(_, p2, _)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.Begin then
			p1.props.onDismiss()
		end
	end, false, Enum.KeyCode.Escape)
end

function modalDialog.unbindActions(_)
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("ModalDialogDismiss")
end

function modalDialog.didMount(p1)
	if p1.props.visible then
		p1:bindActions()
	end
end

function modalDialog.didUpdate(p1)
	if p1.props.visible then
		p1:bindActions()
		
		return
	end
	p1:unbindActions()
end

function modalDialog.willUnmount(p1)
	p1:unbindActions()
end

return modalDialog