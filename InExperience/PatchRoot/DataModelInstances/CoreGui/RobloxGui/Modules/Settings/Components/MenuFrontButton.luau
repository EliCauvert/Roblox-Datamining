local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local FrontButtonControllerModule = require(RobloxGui.Modules.Settings.FrontButtonController)
local MenuFrontButton = RoactModule.PureComponent:extend("MenuFrontButton")
local IsEnabled = require(RobloxGui.Modules.TenFootInterface):IsEnabled()
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local ShowTeleportHistoryFrontButton = game:DefineFastFlag("ShowTeleportHistoryFrontButton", false)
MenuFrontButton.validateProps = TModule.strictInterface({
	HubBar = TModule.instanceOf("ImageLabel"),
	frontEnabled = TModule.boolean,
	FrontBarRef = TModule.optional(TModule.table),
	LayoutOrder = TModule.optional(TModule.integer)
})
MenuFrontButton.defaultProps = {
	frontEnabled = ShowTeleportHistoryFrontButton and FrontButtonControllerModule.hasReturnUniverse()
}

function MenuFrontButton.init(p1) --[[ Line: 38 ]]
	-- upvalues: FrontButtonControllerModule (copy), RoactModule (copy)
	p1:setState({ text = FrontButtonControllerModule.getMenuText() })
	p1.sizeBinding, p1.updateSizeBinding = RoactModule.createBinding(nil)
	p1.sizeConstraintBinding, p1.updateSizeConstraintBinding = RoactModule.createBinding(nil)
	p1.visibleBinding, p1.updateVisibleBinding = RoactModule.createBinding(nil)
	p1.buttonHeightBinding, p1.updateButtonHeightBinding = RoactModule.createBinding(nil)
	p1.textSizeBinding, p1.updateTextSizeBinding = RoactModule.createBinding(nil)
	p1.textSizeConstraintBinding, p1.updateTextSizeConstraintBinding = RoactModule.createBinding(nil)
	p1.textLabelRef = RoactModule.createRef()
end

function MenuFrontButton.didMount(p1) --[[ Line: 50 ]]
	p1.updateSizeBinding(p1.props.HubBar.Size)
	p1.updateVisibleBinding(p1.props.HubBar.Visible)
	p1:updateViewport()
end

function MenuFrontButton.didUpdate(p1, p2) --[[ Line: 55 ]]
	if p1.props.HubBar ~= p2.HubBar then
		p1.updateSizeBinding(p1.props.HubBar.Size)
		p1.updateVisibleBinding(p1.props.HubBar.Visible)
	end
end

function MenuFrontButton.updateViewport(p1) --[[ Line: 61 ]]
	-- upvalues: ThemeModule (copy), UtilityModule (copy), IsEnabled (copy)
	local TextSizeResult = if UtilityModule:IsSmallTouchScreen() then ThemeModule.textSize(18) elseif IsEnabled then ThemeModule.textSize(36) else ThemeModule.textSize(24)
	p1.updateTextSizeConstraintBinding(TextSizeResult)
	local IsPortrait = UtilityModule:IsPortrait()
	local LargeButtonHeight = if IsEnabled then 120 else ThemeModule.LargeButtonHeight
	
	if IsPortrait or UtilityModule:IsSmallTouchScreen() then
		LargeButtonHeight = ThemeModule.ButtonHeight
		TextSizeResult = IsPortrait and ThemeModule.textSize(16) or ThemeModule.textSize(24)
	end
	p1.updateTextSizeBinding(TextSizeResult)
	p1.updateButtonHeightBinding(LargeButtonHeight)
	
	if p1.textLabelRef:getValue() and p1.props.FrontBarRef:getValue() then
		p1.updateSizeConstraintBinding(Vector2.new(p1.props.FrontBarRef:getValue().AbsoluteSize.X - (p1.textLabelRef:getValue().AbsolutePosition.X - p1.props.FrontBarRef:getValue().AbsolutePosition.X), 1e999))
	end
end

function MenuFrontButton.render(p1) --[[ Line: 85 ]]
	-- upvalues: RoactModule (copy), ExternalEventConnection (copy), ThemeModule (copy), FrontButtonControllerModule (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), FoundationModule (copy), ImageSetLabel (copy), Images (copy)
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p1.props.LayoutOrder,
		Visible = RoactModule.joinBindings({ p1.state.text, p1.visibleBinding }):map(function(Entry) --[[ Line: 94 ]]
			-- upvalues: p1 (copy)
			return p1.props.frontEnabled and (Entry[1] ~= nil and Entry[2])
		end),
		Size = RoactModule.joinBindings({ p1.sizeBinding, p1.buttonHeightBinding }):map(function(Entry): UDim2 --[[ Line: 97 ]]
			local Entry1 = Entry[1]
			local Entry2: number = Entry[2]
			
			return if Entry1 and Entry2 then UDim2.new(UDim.new(Entry1.X.Scale * 0.5, Entry1.X.Offset * 0.5), UDim.new(0, Entry2 + 6)) else UDim2.new()
		end),
		[RoactModule.Ref] = p1.props.FrontBarRef
	}, {
		SizeConnection = RoactModule.createElement(ExternalEventConnection, {
			event = p1.props.HubBar:GetPropertyChangedSignal("Size"),
			callback = function() --[[ Line: 113 ]]
				-- upvalues: p1 (copy)
				p1.updateSizeBinding(p1.props.HubBar.Size)
			end
		}),
		VisibleConnection = RoactModule.createElement(ExternalEventConnection, {
			event = p1.props.HubBar:GetPropertyChangedSignal("Visible"),
			callback = function() --[[ Line: 119 ]]
				-- upvalues: p1 (copy)
				p1.updateVisibleBinding(p1.props.HubBar.Visible)
			end
		}),
		ViewportSizeChangedConnection = RoactModule.createElement(ExternalEventConnection, {
			event = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"),
			callback = function() --[[ Line: 125 ]]
				-- upvalues: p1 (copy)
				p1:updateViewport()
			end
		}),
		UIPadding = RoactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 6),
			PaddingTop = UDim.new(0, 10)
		}),
		ImageButton = RoactModule.createElement("ImageButton", {
			Image = "",
			BorderSizePixel = 0,
			BackgroundColor3 = ThemeModule.color("DefaultButton"),
			BackgroundTransparency = ThemeModule.transparency("DefaultButton", 1),
			Position = UDim2.new(0, 0, 0, 0),
			Size = p1.buttonHeightBinding:map(function(YOffset): UDim2 --[[ Line: 139 ]]
				return if YOffset then UDim2.new(0, 0, 0, YOffset) else UDim2.new()
			end),
			AutomaticSize = Enum.AutomaticSize.X,
			ScaleType = Enum.ScaleType.Stretch,
			SliceCenter = Rect.new(8, 6, 46, 44),
			[RoactModule.Event.MouseEnter] = function(p2) --[[ Line: 149 ]]
				-- upvalues: ThemeModule (upval)
				p2.BackgroundColor3 = ThemeModule.color("DefaultButtonHover")
				p2.BackgroundTransparency = ThemeModule.transparency("DefaultButtonHover")
			end,
			[RoactModule.Event.MouseLeave] = function(p2) --[[ Line: 153 ]]
				-- upvalues: ThemeModule (upval)
				p2.BackgroundColor3 = ThemeModule.color("DefaultButton")
				p2.BackgroundTransparency = ThemeModule.transparency("DefaultButton")
			end,
			[RoactModule.Event.Activated] = function(_) --[[ Line: 157 ]]
				-- upvalues: FrontButtonControllerModule (upval)
				FrontButtonControllerModule.initiateFrontButtonTeleport()
			end
		}, {
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = ThemeModule.DefaultCornerRadius }),
			UIStroke = RoactModule.createElement("UIStroke", {
				Color = ThemeModule.color("DefaultButtonStroke"),
				Transparency = ThemeModule.transparency("DefaultButtonStroke"),
				Thickness = ThemeModule.DefaultStokeThickness
			}),
			Frame = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 4, 0, 0)
			}, {
				UIPadding = RoactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 12) }),
				Container = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				TextLabel = RoactModule.createElement("TextLabel", {
					Text = p1.state.text,
					Size = UDim2.new(0, 0, 1, 0),
					AutomaticSize = Enum.AutomaticSize.X,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextYAlignment = Enum.TextYAlignment.Center,
					Font = ThemeModule.font(Enum.Font.SourceSansBold, "Bold"),
					TextSize = p1.textSizeBinding,
					TextScaled = true,
					TextWrapped = true,
					LayoutOrder = 1,
					[RoactModule.Ref] = p1.textLabelRef
				}, {
					UITextSizeConstraint = RoactModule.createElement("UITextSizeConstraint", { MaxTextSize = p1.textSizeConstraintBinding }),
					UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = p1.sizeConstraintBinding })
				}),
				ImageLabel = if FFlagCoreUiMigrateUIBloxToFoundation then RoactModule.createElement(FoundationModule.Icon, {
					name = "icons/actions/cycleRight",
					LayoutOrder = 2,
					size = FoundationModule.Enums.IconSize.Large
				}) else RoactModule.createElement(ImageSetLabel, {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Image = Images["icons/actions/cycleRight"],
					Size = UDim2.new(1, 0, 0.75, 0)
				}, {
					UIAspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {})
				})
			})
		})
	})
end

return MenuFrontButton