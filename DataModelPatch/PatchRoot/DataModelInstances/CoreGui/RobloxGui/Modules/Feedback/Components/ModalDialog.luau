local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local Parent = script.Parent.Parent
local AssetsModule = require(Parent.Resources.Assets)
local DividerModule = require(Parent.Components.PortedComponents.Divider)
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local IconButton = UIBloxModule.App.Button.IconButton
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local MakeBackButtonFunction = require(CorePackages.Workspace.Packages.AppHeaderBar).makeBackButton
local YOffset: number = if require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.GetFFlagEnableFeedbackReportDialogAdjustments)() then 60 else 48
local ModalDialog = RoactModule.Component:extend("ModalDialog")
ModalDialog.validateProps = TModule.strictInterface({
	visible = TModule.boolean,
	screenSize = TModule.Vector2,
	titleText = TModule.optional(TModule.string),
	showCloseButton = TModule.optional(TModule.boolean),
	headerBar = TModule.optional(TModule.table),
	contents = TModule.optional(TModule.table),
	actionButtons = TModule.optional(TModule.table),
	onDismiss = TModule.optional(TModule.callback),
	onBackButtonActivated = TModule.optional(TModule.callback),
	maxHeight = TModule.optional(TModule.number),
	maxWidth = TModule.optional(TModule.number)
})

function ModalDialog.init(p1)
	function p1.onOverlayActivated()
		-- upvalues: p1 (copy)
		p1.props.onDismiss()
	end
end

function ModalDialog.renderHeaderBarLeft(p1)
	-- upvalues: RoactModule (copy), IconButton (copy), IconSize (copy), Images (copy), MakeBackButtonFunction (copy)
	local Props = p1.props
	
	return if Props.showCloseButton then function()
		-- upvalues: RoactModule (upval), IconButton (upval), IconSize (upval), Images (upval), Props (copy)
		return RoactModule.createElement(IconButton, {
			iconSize = IconSize.Medium,
			icon = Images["icons/navigation/close"],
			onActivated = Props.onDismiss
		})
	end elseif Props.onBackButtonActivated == nil then function()
		return nil
	end else MakeBackButtonFunction(Props.onBackButtonActivated)
end

function ModalDialog:renderHeaderBarRight()
	return function()
		return nil
	end
end

function ModalDialog.render(p1)
	-- upvalues: YOffset (copy), WithStyleFunction (copy), RoactModule (copy), ImageSetButton (copy), AssetsModule (copy), HeaderBar (copy), DividerModule (copy)
	local Props = p1.props
	local Smallest = math.min(Props.screenSize.Y, 645)
	
	if Props.maxHeight then
		Smallest = math.min(Smallest, Props.maxHeight)
	end
	local Smallest1 = math.min(Props.screenSize.X, 540)
	
	if Props.maxWidth then
		Smallest1 = math.min(Smallest1, Props.maxWidth)
	end
	local _Vector2 = Vector2.new(Smallest1, Smallest)
	local _Vector2_1 = nil
	local _UDim2 = nil
	
	if Props.screenSize.X < 540 then
		_Vector2_1 = Vector2.new(0.5, 1)
		_UDim2 = UDim2.fromScale(0.5, 1)
	else
		_Vector2_1 = Vector2.new(0.5, 0.5)
		_UDim2 = UDim2.fromScale(0.5, 0.5)
	end
	local Smallest2 = math.min(600, _Vector2.Y - 49 - YOffset)
	
	if not Props.actionButtons then
		Smallest2 += YOffset
	end
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), Props (copy), p1 (copy), ImageSetButton (upval), _Vector2_1 (ref), AssetsModule (upval), _UDim2 (ref), _Vector2 (copy), HeaderBar (upval), DividerModule (upval), Smallest2 (ref), YOffset (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Visible = Props.visible
		}, {
			Overlay = RoactModule.createElement("TextButton", {
				AutoButtonColor = false,
				BackgroundColor3 = p2.Theme.Overlay.Color,
				BackgroundTransparency = p2.Theme.Overlay.Transparency,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				Text = "",
				[RoactModule.Event.Activated] = p1.onOverlayActivated
			}),
			Dialog = RoactModule.createElement(ImageSetButton, {
				Active = true,
				BackgroundTransparency = 1,
				AnchorPoint = _Vector2_1,
				Image = AssetsModule.Images.RoundedRect.Image,
				ImageColor3 = p2.Theme.BackgroundUIDefault.Color,
				ImageTransparency = p2.Theme.BackgroundUIDefault.Transparency,
				Position = _UDim2,
				ScaleType = AssetsModule.Images.RoundedRect.ScaleType,
				Size = UDim2.fromOffset(_Vector2.X, _Vector2.Y),
				SliceCenter = AssetsModule.Images.RoundedRect.SliceCenter
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				HeaderBar = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 48)
				}, {
					Bar = Props.headerBar or (RoactModule.createElement(HeaderBar, {
						backgroundTransparency = 1,
						barHeight = 48,
						renderLeft = p1:renderHeaderBarLeft(),
						renderRight = p1:renderHeaderBarRight(),
						title = Props.titleText
					}) or nil)
				}),
				Divider = RoactModule.createElement(DividerModule, { LayoutOrder = 2 }),
				Content = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					ZIndex = 10,
					Size = UDim2.new(1, 0, 0, Smallest2)
				}, { Contents = Props.contents }),
				ActionBar = Props.actionButtons and RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, YOffset)
				}, {
					Padding = RoactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 8),
						PaddingBottom = UDim.new(0, 2),
						PaddingLeft = UDim.new(0, 24),
						PaddingRight = UDim.new(0, 24)
					}),
					ActionButtons = Props.actionButtons
				}) or nil
			})
		})
	end)
end

function ModalDialog.bindActions(p1)
	-- upvalues: ContextActionService (copy)
	ContextActionService:BindCoreAction("ModalDialogDismiss", function(UserInputState)
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			p1.props.onDismiss()
		end
	end, false, Enum.KeyCode.Escape)
end

function ModalDialog:unbindActions()
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("ModalDialogDismiss")
end

function ModalDialog.didMount(p1)
	if p1.props.visible then
		p1:bindActions()
	end
end

function ModalDialog.didUpdate(p1)
	if p1.props.visible then
		p1:bindActions()
		
		return
	else
		p1:unbindActions()
	end
end

function ModalDialog.willUnmount(p1)
	p1:unbindActions()
end

return ModalDialog