local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local ConstantsModule = require(Modules.LuaApp.Constants)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local RoactMotionModule = require(Modules.LuaApp.RoactMotion)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local LocalizedTextLabelModule = require(Modules.LuaApp.Components.LocalizedTextLabel)
local WithStyleFunction = require(game:GetService("CorePackages").Packages.UIBlox).Style.withStyle
local DEFAULTCONTEXTUALMENUCANCELHEIGHT = ConstantsModule.DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT
local FramePopup = RoactModule.PureComponent:extend("FramePopup")
FramePopup.defaultProps = { enableCancelButton = true, Selectable = false }

function FramePopup.init(p1)
	-- upvalues: RoactModule (copy), DEFAULTCONTEXTUALMENUCANCELHEIGHT (copy), DEPRECATEDImageSetLabelModule (copy), LocalizedTextLabelModule (copy), ConstantsModule (copy), FitChildrenModule (copy), WithStyleFunction (copy)
	p1.state = { hidden = true }
	p1.yAnchorPoint = if p1.state.hidden then 0 else 1
	p1.stiffness = nil
	p1.damping = nil
	p1.onRested = nil
	
	function p1.closeCallback()
		-- upvalues: p1 (copy)
		p1:close()
	end
	
	function p1.renderCancelButton(p2)
		-- upvalues: RoactModule (upval), DEFAULTCONTEXTUALMENUCANCELHEIGHT (upval), p1 (copy), DEPRECATEDImageSetLabelModule (upval), LocalizedTextLabelModule (upval), ConstantsModule (upval)
		return RoactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			LayoutOrder = 3,
			BackgroundColor3 = p2.Theme.BackgroundUIDefault.Color,
			BackgroundTransparency = p2.Theme.BackgroundUIDefault.Transparency,
			Size = UDim2.new(1, 0, 0, DEFAULTCONTEXTUALMENUCANCELHEIGHT),
			Text = "",
			[RoactModule.Event.Activated] = p1.closeCallback
		}, {
			Icon = RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClipsDescendants = false,
				Image = "LuaApp/icons/navigation/close",
				AnchorPoint = Vector2.new(0, 0.5),
				ImageColor3 = p2.Theme.IconDefault.Color,
				ImageTransparency = p2.Theme.IconDefault.Transparency,
				Position = UDim2.new(0, 20, 0.5, 0),
				Size = UDim2.new(0, 20, 0, 20)
			}),
			Cancel = RoactModule.createElement(LocalizedTextLabelModule, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "Feature.GamePage.LabelCancelField",
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = ConstantsModule.Color.WHITE,
				Position = UDim2.new(0, 60, 0.5, 0),
				Size = UDim2.new(1, -70, 1, 0),
				Font = p2.Font.Body.Font,
				TextSize = p2.Font.BaseSize * p2.Font.Body.RelativeSize,
				TextColor3 = p2.Theme.TextDefault.Color,
				TextTransparency = p2.Theme.TextDefault.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			})
		})
	end
	
	function p1.renderPopupFrame(p2, p3)
		-- upvalues: p1 (copy), RoactModule (upval), FitChildrenModule (upval)
		local EnableCancelButton = p1.props.enableCancelButton
		local ContentPosition = p1.props.contentPosition
		local ScreenSize = p1.props.screenSize
		
		return RoactModule.createElement(FitChildrenModule.FitFrame, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 0),
			Position = if ContentPosition then UDim2.new(0, 0, 0, ScreenSize.Y) else UDim2.new(0, 0, 1, 0),
			AnchorPoint = if p2.Settings.ReducedMotion then Vector2.new(0, 1) else Vector2.new(0, p3.animValue),
			fitAxis = FitChildrenModule.FitAxis.Height
		}, {
			UIPadding = ContentPosition and RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, ScreenSize.X * ContentPosition.X.Scale + ContentPosition.X.Offset),
				PaddingBottom = UDim.new(0, ScreenSize.Y - (ScreenSize.Y * ContentPosition.Y.Scale + ContentPosition.Y.Offset))
			}),
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Bottom
			}),
			Frame = RoactModule.createElement(FitChildrenModule.FitFrame, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 0),
				fitAxis = FitChildrenModule.FitAxis.Height
			}, p1.props[RoactModule.Children]),
			Separator = EnableCancelButton and RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 2,
				BackgroundColor3 = p2.Theme.BackgroundUIDefault.Color,
				BackgroundTransparency = p2.Theme.BackgroundUIDefault.Transparency,
				Size = UDim2.new(1, 0, 0, 1)
			}, {
				SeparatorBar = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundColor3 = p2.Theme.Divider.Color,
					BackgroundTransparency = p2.Theme.Divider.Transparency
				})
			}),
			Cancel = EnableCancelButton and p1.renderCancelButton(p2)
		})
	end
	
	function p1.onRender(p2)
		-- upvalues: WithStyleFunction (upval), RoactModule (upval), p1 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: RoactModule (upval), p2 (copy), p1 (upval)
			return if p3.Settings.ReducedMotion then RoactModule.createElement("CanvasGroup", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				GroupTransparency = 1 - p2.animValue
			}, { PopupFrame = p1.renderPopupFrame(p3, p2) }) else p1.renderPopupFrame(p3, p2)
		end)
	end
end

function FramePopup.open(p1)
	p1.yAnchorPoint = 1
	p1.stiffness = nil
	p1.damping = nil
	p1.onRested = nil
	p1:setState({ hidden = false })
end

function FramePopup.close(p1)
	p1.yAnchorPoint = 0
	p1.stiffness = 270
	p1.damping = nil
	p1.onRested = p1.props.onCancel
	p1:setState({ hidden = true })
end

function FramePopup.didMount(p1)
	p1:open()
end

function FramePopup.render(p1)
	-- upvalues: RoactModule (copy), RoactMotionModule (copy)
	return RoactModule.createElement("TextButton", {
		Size = UDim2.new(1, 0, 1, 0),
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		Text = "",
		[RoactModule.Event.Activated] = p1.closeCallback,
		Selectable = p1.props.Selectable
	}, {
		AnimatedPopup = RoactModule.createElement(RoactMotionModule.SimpleMotion, {
			style = {
				animValue = RoactMotionModule.spring(p1.yAnchorPoint, p1.stiffness, p1.damping)
			},
			onRested = p1.onRested,
			render = p1.onRender
		})
	})
end

return RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end)(FramePopup)