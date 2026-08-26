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
local var1 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
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

function menuFrontButton.init(p1)
	-- upvalues: frontButtonControllerModule (ref), roactModule (ref)
	p1:setState({ text = frontButtonControllerModule.getMenuText() })
	local var2, var3 = roactModule.createBinding(nil)
	p1.sizeBinding = var2
	p1.updateSizeBinding = var3
	local var4, var5 = roactModule.createBinding(nil)
	p1.sizeConstraintBinding = var4
	p1.updateSizeConstraintBinding = var5
	local var6, var7 = roactModule.createBinding(nil)
	p1.visibleBinding = var6
	p1.updateVisibleBinding = var7
	local var8, var9 = roactModule.createBinding(nil)
	p1.buttonHeightBinding = var8
	p1.updateButtonHeightBinding = var9
	local var10, var11 = roactModule.createBinding(nil)
	p1.textSizeBinding = var10
	p1.updateTextSizeBinding = var11
	local var12, var13 = roactModule.createBinding(nil)
	p1.textSizeConstraintBinding = var12
	p1.updateTextSizeConstraintBinding = var13
	p1.textLabelRef = roactModule.createRef()
end

function menuFrontButton.didMount(p1)
	p1.updateSizeBinding(p1.props.HubBar.Size)
	p1.updateVisibleBinding(p1.props.HubBar.Visible)
	p1:updateViewport()
end

function menuFrontButton.didUpdate(p1, p2)
	if p1.props.HubBar ~= p2.HubBar then
		p1.updateSizeBinding(p1.props.HubBar.Size)
		p1.updateVisibleBinding(p1.props.HubBar.Visible)
	end
end

function menuFrontButton.updateViewport(p1)
	-- upvalues: themeModule (ref), utilityModule (ref), var1 (ref)
	local var2 = themeModule.textSize(24)
	
	if utilityModule:IsSmallTouchScreen() then
		var2 = themeModule.textSize(18)
	elseif var1 then
		var2 = themeModule.textSize(36)
	end
	p1.updateTextSizeConstraintBinding(var2)
	local var3 = utilityModule:IsPortrait()
	local var4 = if var1 then 120 else themeModule.LargeButtonHeight
	
	if var3 or utilityModule:IsSmallTouchScreen() then
		var4 = themeModule.ButtonHeight
		var2 = var3 and themeModule.textSize(16) or themeModule.textSize(24)
	end
	p1.updateTextSizeBinding(var2)
	p1.updateButtonHeightBinding(var4)
	
	if p1.textLabelRef:getValue() and p1.props.FrontBarRef:getValue() then
		p1.updateSizeConstraintBinding(Vector2.new(p1.props.FrontBarRef:getValue().AbsoluteSize.X - (p1.textLabelRef:getValue().AbsolutePosition.X - p1.props.FrontBarRef:getValue().AbsolutePosition.X), 1e999))
	end
end

function menuFrontButton.render(p1)
	-- upvalues: roactModule (ref), externalEventConnection (ref), themeModule (ref), frontButtonControllerModule (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), foundationModule (ref), imageSetLabel (ref), images (ref)
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p1.props.LayoutOrder,
		Visible = roactModule.joinBindings({ p1.state.text, p1.visibleBinding }):map(function(p2)
			-- upvalues: p1 (ref)
			return p1.props.frontEnabled and (p2[1] ~= nil and p2[2])
		end),
		Size = roactModule.joinBindings({ p1.sizeBinding, p1.buttonHeightBinding }):map(function(p2)
			local var2 = p2[1]
			local var3 = p2[2]
			
			return if var2 and var3 then UDim2.new(UDim.new(var2.X.Scale * 0.5, var2.X.Offset * 0.5), UDim.new(0, var3 + 6)) else UDim2.new()
		end),
		[roactModule.Ref] = p1.props.FrontBarRef
	}, {
		SizeConnection = roactModule.createElement(externalEventConnection, {
			event = p1.props.HubBar:GetPropertyChangedSignal("Size"),
			callback = function()
				-- upvalues: p1 (ref)
				p1.updateSizeBinding(p1.props.HubBar.Size)
			end
		}),
		VisibleConnection = roactModule.createElement(externalEventConnection, {
			event = p1.props.HubBar:GetPropertyChangedSignal("Visible"),
			callback = function()
				-- upvalues: p1 (ref)
				p1.updateVisibleBinding(p1.props.HubBar.Visible)
			end
		}),
		ViewportSizeChangedConnection = roactModule.createElement(externalEventConnection, {
			event = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"),
			callback = function()
				-- upvalues: p1 (ref)
				p1:updateViewport()
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
			Size = p1.buttonHeightBinding:map(function(p2)
				return if p2 then UDim2.new(0, 0, 0, p2) else UDim2.new()
			end),
			AutomaticSize = Enum.AutomaticSize.X,
			ScaleType = Enum.ScaleType.Stretch,
			SliceCenter = Rect.new(8, 6, 46, 44),
			[roactModule.Event.MouseEnter] = function(p2)
				-- upvalues: themeModule (copy)
				p2.BackgroundColor3 = themeModule.color("DefaultButtonHover")
				p2.BackgroundTransparency = themeModule.transparency("DefaultButtonHover")
			end,
			[roactModule.Event.MouseLeave] = function(p2)
				-- upvalues: themeModule (copy)
				p2.BackgroundColor3 = themeModule.color("DefaultButton")
				p2.BackgroundTransparency = themeModule.transparency("DefaultButton")
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
					Text = p1.state.text,
					Size = UDim2.new(0, 0, 1, 0),
					AutomaticSize = Enum.AutomaticSize.X,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextYAlignment = Enum.TextYAlignment.Center,
					Font = themeModule.font(Enum.Font.SourceSansBold, "Bold"),
					TextSize = p1.textSizeBinding,
					TextScaled = true,
					TextWrapped = true,
					LayoutOrder = 1,
					[roactModule.Ref] = p1.textLabelRef
				}, {
					UITextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = p1.textSizeConstraintBinding }),
					UISizeConstraint = roactModule.createElement("UISizeConstraint", { MaxSize = p1.sizeConstraintBinding })
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