local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local roactModule = require(corePackagesService.Packages.Roact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local tModule = require(corePackagesService.Packages.t)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local frontButtonControllerModule = require(robloxGui.Modules.Settings.FrontButtonController)
local menuFrontButton = roactModule.PureComponent:extend("MenuFrontButton")
local var9 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local themeModule = require(robloxGui.Modules.Settings.Theme)
local showTeleportHistoryFrontButton = game:DefineFastFlag("ShowTeleportHistoryFrontButton", false)
menuFrontButton.validateProps = tModule.strictInterface({
	HubBar = tModule.instanceOf("ImageLabel"),
	frontEnabled = tModule.boolean,
	FrontBarRef = tModule.optional(tModule.table),
	LayoutOrder = tModule.optional(tModule.integer)
})
menuFrontButton.defaultProps = {
	frontEnabled = showTeleportHistoryFrontButton and frontButtonControllerModule.hasReturnUniverse()
}

function menuFrontButton.init(p0)
	-- upvalues: frontButtonControllerModule (ref), roactModule (ref)
	p0:setState({ text = frontButtonControllerModule.getMenuText() })
	local var12, var13 = roactModule.createBinding(nil)
	p0.sizeBinding = var12
	p0.updateSizeBinding = var13
	local var14, var15 = roactModule.createBinding(nil)
	p0.sizeConstraintBinding = var14
	p0.updateSizeConstraintBinding = var15
	local var16, var17 = roactModule.createBinding(nil)
	p0.visibleBinding = var16
	p0.updateVisibleBinding = var17
	local var18, var19 = roactModule.createBinding(nil)
	p0.buttonHeightBinding = var18
	p0.updateButtonHeightBinding = var19
	local var20, var21 = roactModule.createBinding(nil)
	p0.textSizeBinding = var20
	p0.updateTextSizeBinding = var21
	local var22, var23 = roactModule.createBinding(nil)
	p0.textSizeConstraintBinding = var22
	p0.updateTextSizeConstraintBinding = var23
	p0.textLabelRef = roactModule.createRef()
end

function menuFrontButton.didMount(p1)
	p1.updateSizeBinding(p1.props.HubBar.Size)
	p1.updateVisibleBinding(p1.props.HubBar.Visible)
	p1:updateViewport()
end

function menuFrontButton.didUpdate(p2, p3)
	if p2.props.HubBar ~= p3.HubBar then
		p2.updateSizeBinding(p2.props.HubBar.Size)
		p2.updateVisibleBinding(p2.props.HubBar.Visible)
	end
end

function menuFrontButton.updateViewport(p4)
	-- upvalues: themeModule (ref), utilityModule (ref), var9 (ref)
	local var24 = themeModule.textSize(24)
	
	if utilityModule:IsSmallTouchScreen() then
		var24 = themeModule.textSize(18)
	elseif var9 then
		var24 = themeModule.textSize(36)
	end
	p4.updateTextSizeConstraintBinding(var24)
	local var25 = utilityModule:IsPortrait()
	local var26 = if var9 then 120 else themeModule.LargeButtonHeight
	
	if var25 or utilityModule:IsSmallTouchScreen() then
		var26 = themeModule.ButtonHeight
		var24 = var25 and themeModule.textSize(16) or themeModule.textSize(24)
	end
	p4.updateTextSizeBinding(var24)
	p4.updateButtonHeightBinding(var26)
	
	if p4.textLabelRef:getValue() and p4.props.FrontBarRef:getValue() then
		p4.updateSizeConstraintBinding(Vector2.new(p4.props.FrontBarRef:getValue().AbsoluteSize.X - (p4.textLabelRef:getValue().AbsolutePosition.X - p4.props.FrontBarRef:getValue().AbsolutePosition.X), 1e999))
	end
end

function menuFrontButton.render(p5)
	-- upvalues: roactModule (ref), externalEventConnection (ref), themeModule (ref), frontButtonControllerModule (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), foundationModule (ref), imageSetLabel (ref), images (ref)
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p5.props.LayoutOrder,
		Visible = roactModule.joinBindings({ p5.state.text, p5.visibleBinding }):map(function(p6)
			-- upvalues: p5 (ref)
			return p5.props.frontEnabled and (p6[1] ~= nil and p6[2])
		end),
		Size = roactModule.joinBindings({ p5.sizeBinding, p5.buttonHeightBinding }):map(function(p7)
			local var27 = p7[1]
			local var28 = p7[2]
			
			return if var27 and var28 then UDim2.new(UDim.new(var27.X.Scale * 0.5, var27.X.Offset * 0.5), UDim.new(0, var28 + 6)) else UDim2.new()
		end),
		[roactModule.Ref] = p5.props.FrontBarRef
	}, {
		SizeConnection = roactModule.createElement(externalEventConnection, {
			event = p5.props.HubBar:GetPropertyChangedSignal("Size"),
			callback = function()
				-- upvalues: p5 (ref)
				p5.updateSizeBinding(p5.props.HubBar.Size)
			end
		}),
		VisibleConnection = roactModule.createElement(externalEventConnection, {
			event = p5.props.HubBar:GetPropertyChangedSignal("Visible"),
			callback = function()
				-- upvalues: p5 (ref)
				p5.updateVisibleBinding(p5.props.HubBar.Visible)
			end
		}),
		ViewportSizeChangedConnection = roactModule.createElement(externalEventConnection, {
			event = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"),
			callback = function()
				-- upvalues: p5 (ref)
				p5:updateViewport()
			end
		}),
		UIPadding = roactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 6),
			PaddingTop = UDim.new(0, 10)
		}),
		ImageButton = roactModule.createElement("ImageButton", {
			Image = "",
			BorderSizePixel = 0,
			BackgroundColor3 = themeModule.color("DefaultButton"),
			BackgroundTransparency = themeModule.transparency("DefaultButton", 1),
			Position = UDim2.new(0, 0, 0, 0),
			Size = p5.buttonHeightBinding:map(function(p8)
				return if p8 then UDim2.new(0, 0, 0, p8) else UDim2.new()
			end),
			AutomaticSize = Enum.AutomaticSize.X,
			ScaleType = Enum.ScaleType.Stretch,
			SliceCenter = Rect.new(8, 6, 46, 44),
			[roactModule.Event.MouseEnter] = function(p9)
				-- upvalues: themeModule (copy)
				p9.BackgroundColor3 = themeModule.color("DefaultButtonHover")
				p9.BackgroundTransparency = themeModule.transparency("DefaultButtonHover")
			end,
			[roactModule.Event.MouseLeave] = function(p10)
				-- upvalues: themeModule (copy)
				p10.BackgroundColor3 = themeModule.color("DefaultButton")
				p10.BackgroundTransparency = themeModule.transparency("DefaultButton")
			end,
			[roactModule.Event.Activated] = function(_)
				-- upvalues: frontButtonControllerModule (copy)
				frontButtonControllerModule.initiateFrontButtonTeleport()
			end
		}, {
			UICorner = roactModule.createElement("UICorner", { CornerRadius = themeModule.DefaultCornerRadius }),
			UIStroke = roactModule.createElement("UIStroke", {
				Color = themeModule.color("DefaultButtonStroke"),
				Transparency = themeModule.transparency("DefaultButtonStroke"),
				Thickness = themeModule.DefaultStokeThickness
			}),
			Frame = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 4, 0, 0)
			}, {
				UIPadding = roactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 12) }),
				Container = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				TextLabel = roactModule.createElement("TextLabel", {
					Text = p5.state.text,
					Size = UDim2.new(0, 0, 1, 0),
					AutomaticSize = Enum.AutomaticSize.X,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextYAlignment = Enum.TextYAlignment.Center,
					Font = themeModule.font(Enum.Font.SourceSansBold, "Bold"),
					TextSize = p5.textSizeBinding,
					TextScaled = true,
					TextWrapped = true,
					LayoutOrder = 1,
					[roactModule.Ref] = p5.textLabelRef
				}, {
					UITextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = p5.textSizeConstraintBinding }),
					UISizeConstraint = roactModule.createElement("UISizeConstraint", { MaxSize = p5.sizeConstraintBinding })
				}),
				ImageLabel = if fFlagCoreUiMigrateUIBloxToFoundation then roactModule.createElement(foundationModule.Icon, {
					name = "icons/actions/cycleRight",
					LayoutOrder = 2,
					size = foundationModule.Enums.IconSize.Large
				}) else roactModule.createElement(imageSetLabel, {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Image = images["icons/actions/cycleRight"],
					Size = UDim2.new(1, 0, 0.75, 0)
				}, {
					UIAspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", {})
				})
			})
		})
	})
end

return menuFrontButton