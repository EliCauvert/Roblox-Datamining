local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local roactModule = require(corePackagesService.Packages.Roact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local tModule = require(corePackagesService.Packages.t)
local parent = script.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local dividerModule = require(parent.Components.PortedComponents.Divider)
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
	onBackButtonActivated = tModule.optional(tModule.callback),
	maxHeight = tModule.optional(tModule.number),
	maxWidth = tModule.optional(tModule.number)
})

function modalDialog.init(p0) --[[ line: 44 ]]
	function p0.onOverlayActivated() --[[ line: 45 ]]
		-- upvalues: p0 (ref)
		p0.props.onDismiss()
	end
end

function modalDialog.renderHeaderBarLeft(p1) --[[ line: 50 ]]
	-- upvalues: roactModule (ref), iconButton (ref), iconSize (ref), images (ref), makeBackButton (ref)
	local props = p1.props
	
	return if props.showCloseButton then function() --[[ line: 54 ]]
		-- upvalues: roactModule (copy), iconButton (copy), iconSize (copy), images (copy), props (ref)
		return roactModule.createElement(iconButton, {
			iconSize = iconSize.Medium,
			icon = images["icons/navigation/close"],
			onActivated = props.onDismiss
		})
	end elseif props.onBackButtonActivated == nil then function() --[[ line: 66 ]]
		return nil
	end else makeBackButton(props.onBackButtonActivated)
end

function modalDialog.renderHeaderBarRight(_) --[[ line: 72 ]]
	return function() --[[ line: 74 ]]
		return nil
	end
end

function modalDialog.render(p2) --[[ line: 79 ]]
	-- upvalues: withStyle (ref), roactModule (ref), imageSetButton (ref), assetsModule (ref), headerBar (ref), dividerModule (ref)
	local props = p2.props
	local minValue = math.min(props.screenSize.Y, 645)
	
	if props.maxHeight then
		minValue = math.min(minValue, props.maxHeight)
	end
	local minValue_1 = math.min(props.screenSize.X, 540)
	
	if props.maxWidth then
		minValue_1 = math.min(minValue_1, props.maxWidth)
	end
	local vector2_1, uDim2
	local vector2 = Vector2.new(minValue_1, minValue)
	local _ = nil
	local _ = nil
	
	if props.screenSize.X < 540 then
		vector2_1 = Vector2.new(0.5, 1)
		uDim2 = UDim2.fromScale(0.5, 1)
	else
		vector2_1 = Vector2.new(0.5, 0.5)
		uDim2 = UDim2.fromScale(0.5, 0.5)
	end
	local minValue_2 = math.min(600, vector2.Y - 49 - 60)
	
	if not props.actionButtons then
		minValue_2 += 60
	end
	return withStyle(function(p3) --[[ line: 115 ]]
		-- upvalues: roactModule (copy), props (ref), p2 (ref), imageSetButton (copy), vector2_1 (write), assetsModule (copy), uDim2 (write), vector2 (ref), headerBar (copy), dividerModule (copy), minValue_2 (write)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Visible = props.visible
		}, {
			Overlay = roactModule.createElement("TextButton", {
				AutoButtonColor = false,
				BackgroundColor3 = p3.Theme.Overlay.Color,
				BackgroundTransparency = p3.Theme.Overlay.Transparency,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				Text = "",
				[roactModule.Event.Activated] = p2.onOverlayActivated
			}),
			Dialog = roactModule.createElement(imageSetButton, {
				Active = true,
				BackgroundTransparency = 1,
				AnchorPoint = vector2_1,
				Image = assetsModule.Images.RoundedRect.Image,
				ImageColor3 = p3.Theme.BackgroundUIDefault.Color,
				ImageTransparency = p3.Theme.BackgroundUIDefault.Transparency,
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
						renderLeft = p2:renderHeaderBarLeft(),
						renderRight = p2:renderHeaderBarRight(),
						title = props.titleText
					}) or nil)
				}),
				Divider = roactModule.createElement(dividerModule, { LayoutOrder = 2 }),
				Content = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					ZIndex = 10,
					Size = UDim2.new(1, 0, 0, minValue_2)
				}, { Contents = props.contents }),
				ActionBar = props.actionButtons and roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, 60)
				}, {
					Padding = roactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 8),
						PaddingBottom = UDim.new(0, 2),
						PaddingLeft = UDim.new(0, 24),
						PaddingRight = UDim.new(0, 24)
					}),
					ActionButtons = props.actionButtons
				}) or nil
			})
		})
	end)
end

function modalDialog.bindActions(p4) --[[ line: 189 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:BindCoreAction("ModalDialogDismiss", function(p5) --[[ line: 190 | named "dismissFunc" ]]
		-- upvalues: p4 (ref)
		if p5 == Enum.UserInputState.Begin then
			p4.props.onDismiss()
		end
	end, false, Enum.KeyCode.Escape)
end

function modalDialog.unbindActions(_) --[[ line: 198 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("ModalDialogDismiss")
end

function modalDialog.didMount(p6) --[[ line: 202 ]]
	if p6.props.visible then
		p6:bindActions()
	end
end

function modalDialog.didUpdate(p7) --[[ line: 208 ]]
	if p7.props.visible then
		p7:bindActions()
		
		return
	end
	p7:unbindActions()
end

function modalDialog.willUnmount(p8) --[[ line: 216 ]]
	p8:unbindActions()
end

return modalDialog