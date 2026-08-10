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
local backButtonControllerModule = require(robloxGui.Modules.Settings.BackButtonController)
local menuBackButton = roactModule.PureComponent:extend("MenuBackButton")
local var9 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local themeModule = require(robloxGui.Modules.Settings.Theme)
menuBackButton.validateProps = tModule.strictInterface({
	HubBar = tModule.instanceOf("ImageLabel"),
	backEnabled = tModule.boolean,
	BackBarRef = tModule.optional(tModule.table),
	LayoutOrder = tModule.optional(tModule.integer)
})
menuBackButton.defaultProps = {
	backEnabled = backButtonControllerModule.hasReturnUniverse()
}

function menuBackButton.init(p0) --[[ line: 38 ]]
	-- upvalues: backButtonControllerModule (ref), roactModule (ref)
	p0:setState({ text = backButtonControllerModule.getMenuText() })
	local var11, var12 = roactModule.createBinding(nil)
	p0.sizeBinding = var11
	p0.updateSizeBinding = var12
	local var13, var14 = roactModule.createBinding(nil)
	p0.sizeConstraintBinding = var13
	p0.updateSizeConstraintBinding = var14
	local var15, var16 = roactModule.createBinding(nil)
	p0.visibleBinding = var15
	p0.updateVisibleBinding = var16
	local var17, var18 = roactModule.createBinding(nil)
	p0.buttonHeightBinding = var17
	p0.updateButtonHeightBinding = var18
	local var19, var20 = roactModule.createBinding(nil)
	p0.textSizeBinding = var19
	p0.updateTextSizeBinding = var20
	local var21, var22 = roactModule.createBinding(nil)
	p0.textSizeConstraintBinding = var21
	p0.updateTextSizeConstraintBinding = var22
	p0.textLabelRef = roactModule.createRef()
end

function menuBackButton.didMount(p1) --[[ line: 52 ]]
	p1.updateSizeBinding(p1.props.HubBar.Size)
	p1.updateVisibleBinding(p1.props.HubBar.Visible)
	p1:updateViewport()
end

function menuBackButton.didUpdate(p2, p3) --[[ line: 58 ]]
	if p2.props.HubBar ~= p3.HubBar then
		p2.updateSizeBinding(p2.props.HubBar.Size)
		p2.updateVisibleBinding(p2.props.HubBar.Visible)
	end
end

function menuBackButton.updateViewport(p4) --[[ line: 65 ]]
	-- upvalues: themeModule (ref), utilityModule (ref), var9 (ref)
	local var23 = themeModule.textSize(24)
	
	if utilityModule:IsSmallTouchScreen() then
		var23 = themeModule.textSize(18)
	elseif var9 then
		var23 = themeModule.textSize(36)
	end
	p4.updateTextSizeConstraintBinding(var23)
	local var24 = utilityModule:IsPortrait()
	local var25 = if var9 then 120 else themeModule.LargeButtonHeight
	
	if var24 or utilityModule:IsSmallTouchScreen() then
		var25 = themeModule.ButtonHeight
		var23 = var24 and themeModule.textSize(16) or themeModule.textSize(24)
	end
	p4.updateTextSizeBinding(var23)
	p4.updateButtonHeightBinding(var25)
	
	if p4.textLabelRef:getValue() and p4.props.BackBarRef:getValue() then
		p4.updateSizeConstraintBinding(Vector2.new(p4.props.BackBarRef:getValue().AbsoluteSize.X - (p4.textLabelRef:getValue().AbsolutePosition.X - p4.props.BackBarRef:getValue().AbsolutePosition.X), 1e999))
	end
end

function menuBackButton.render(p5) --[[ line: 93 ]]
	-- upvalues: roactModule (ref), externalEventConnection (ref), themeModule (ref), backButtonControllerModule (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), foundationModule (ref), imageSetLabel (ref), images (ref)
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0, 0),
		LayoutOrder = p5.props.LayoutOrder,
		Visible = roactModule.joinBindings({ p5.state.text, p5.visibleBinding }):map(function(p6) --[[ line: 103 ]]
			-- upvalues: p5 (ref)
			return p5.props.backEnabled and (p6[1] ~= nil and p6[2])
		end),
		Size = roactModule.joinBindings({ p5.sizeBinding, p5.buttonHeightBinding }):map(function(p7) --[[ line: 106 ]]
			local var26 = p7[1]
			local var27 = p7[2]
			
			return if var26 and var27 then UDim2.new(UDim.new(var26.X.Scale * 0.5, var26.X.Offset * 0.5), UDim.new(0, var27 + 6)) else UDim2.new()
		end),
		[roactModule.Ref] = p5.props.BackBarRef
	}, {
		SizeConnection = roactModule.createElement(externalEventConnection, {
			event = p5.props.HubBar:GetPropertyChangedSignal("Size"),
			callback = function() --[[ line: 122 ]]
				-- upvalues: p5 (ref)
				p5.updateSizeBinding(p5.props.HubBar.Size)
			end
		}),
		VisibleConnection = roactModule.createElement(externalEventConnection, {
			event = p5.props.HubBar:GetPropertyChangedSignal("Visible"),
			callback = function() --[[ line: 128 ]]
				-- upvalues: p5 (ref)
				p5.updateVisibleBinding(p5.props.HubBar.Visible)
			end
		}),
		ViewportSizeChangedConnection = roactModule.createElement(externalEventConnection, {
			event = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"),
			callback = function() --[[ line: 134 ]]
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
			Size = p5.buttonHeightBinding:map(function(p8) --[[ line: 148 ]]
				return if p8 then UDim2.new(0, 0, 0, p8) else UDim2.new()
			end),
			AutomaticSize = Enum.AutomaticSize.X,
			ScaleType = Enum.ScaleType.Stretch,
			SliceCenter = Rect.new(8, 6, 46, 44),
			[roactModule.Event.MouseEnter] = function(p9) --[[ line: 158 ]]
				-- upvalues: themeModule (copy)
				p9.BackgroundColor3 = themeModule.color("DefaultButtonHover")
				p9.BackgroundTransparency = themeModule.transparency("DefaultButtonHover")
			end,
			[roactModule.Event.MouseLeave] = function(p10) --[[ line: 162 ]]
				-- upvalues: themeModule (copy)
				p10.BackgroundColor3 = themeModule.color("DefaultButton")
				p10.BackgroundTransparency = themeModule.transparency("DefaultButton")
			end,
			[roactModule.Event.Activated] = function(_) --[[ line: 166 ]]
				-- upvalues: backButtonControllerModule (copy)
				backButtonControllerModule.initiateBackButtonTeleport(Enum.AdTeleportMethod.InGameMenuBackButton)
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
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				ImageLabel = if fFlagCoreUiMigrateUIBloxToFoundation then roactModule.createElement(foundationModule.Icon, {
					name = "icons/actions/cycleLeft",
					LayoutOrder = 1,
					size = foundationModule.Enums.IconSize.Large
				}) else roactModule.createElement(imageSetLabel, {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Image = images["icons/actions/cycleLeft"],
					Size = UDim2.new(1, 0, 0.75, 0)
				}, {
					UIAspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", {})
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
					LayoutOrder = 2,
					[roactModule.Ref] = p5.textLabelRef
				}, {
					UITextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = p5.textSizeConstraintBinding }),
					UISizeConstraint = roactModule.createElement("UISizeConstraint", { MaxSize = p5.sizeConstraintBinding })
				})
			})
		})
	})
end

return menuBackButton