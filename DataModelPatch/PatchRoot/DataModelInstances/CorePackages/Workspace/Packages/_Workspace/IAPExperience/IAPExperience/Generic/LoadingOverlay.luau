local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local _ = require(Parent2.React)
local OtterModule = require(Parent2.Otter)
local FoundationModule = require(Parent2.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local WithStyleFunction = require(Parent2.UIBlox).Core.Style.withStyle
local MultiTextLocalizerModule = require(Parent1.Locale.MultiTextLocalizer)
local LoadingOverlayStateModule = require(Parent.LoadingOverlayState)
local ExtendResult = RoactModule.Component:extend(script.Name)
local config = { dampingRatio = 1, frequency = 1 }

function ExtendResult.init(p1)
	-- upvalues: RoactModule (copy), OtterModule (copy), config (copy)
	local Binding, Binding2 = RoactModule.createBinding(0)
	p1.motor = OtterModule.createSingleMotor(0)
	p1.motor:start()
	p1.motor:onStep(Binding2)
	p1.animationProgress = Binding
	p1.motor:setGoal(OtterModule.spring(if p1.props.loadingState == nil then 0 else 1, config))
end

function ExtendResult:getLoadingMessage(p1, LoadingState)
	-- upvalues: LoadingOverlayStateModule (copy)
	return if LoadingState == LoadingOverlayStateModule.PurchasingItem then p1.PurchasingItem elseif LoadingState == LoadingOverlayStateModule.PurchasingRobux then p1.PurchasingRobux elseif LoadingState == LoadingOverlayStateModule.WaitingForPurchase then p1.WaitingForPurchase elseif LoadingState == LoadingOverlayStateModule.WaitingForRobux then p1.WaitingForRobux else nil
end

function ExtendResult.didUpdate(p1, p2, _)
	-- upvalues: OtterModule (copy), config (copy)
	local Props = p1.props
	
	if p2.loadingState ~= Props.loadingState then
		p1.motor:setGoal(OtterModule.spring(if Props.loadingState == nil then 0 else 1, config))
	end
end

function ExtendResult.willUnmount(p1)
	p1.motor:destroy()
end

function ExtendResult.render(p1)
	-- upvalues: RoactModule (copy), MultiTextLocalizerModule (copy)
	return RoactModule.createElement(MultiTextLocalizerModule, {
		keys = {
			PurchasingItem = { key = "IAPExperience.Loading.Text.PurchasingItem" },
			PurchasingRobux = { key = "IAPExperience.Loading.Text.PurchasingRobux" },
			WaitingForPurchase = { key = "IAPExperience.Loading.Text.WaitingForPurchase" },
			WaitingForRobux = { key = "IAPExperience.Loading.Text.WaitingForRobux" }
		},
		render = function(p2)
			-- upvalues: p1 (copy)
			return p1:renderAlert(p2)
		end
	})
end

function ExtendResult.renderAlert(p1, p2)
	-- upvalues: LoadingOverlayStateModule (copy), WithStyleFunction (copy), RoactModule (copy), Loading (copy), IconSize (copy)
	local Props = p1.props
	local HasLoadingState: boolean = Props.loadingState ~= LoadingOverlayStateModule.None and Props.loadingState ~= nil
	local LoadingMessage = p1:getLoadingMessage(p2, Props.loadingState)
	
	return WithStyleFunction(function(p3)
		-- upvalues: RoactModule (upval), p1 (copy), Props (copy), HasLoadingState (copy), Loading (upval), IconSize (upval), LoadingMessage (copy)
		local Theme = p3.Theme
		local _Font = p3.Font
		
		return RoactModule.createElement("Frame", {
			BackgroundColor3 = Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = p1.animationProgress:map(function(p4)
				-- upvalues: Props (upval), Theme (copy)
				return if Props.showOverlay then if Props.shouldAnimate then 1 - (1 - Theme.BackgroundUIContrast.Transparency) * p4 else Theme.BackgroundUIContrast.Transparency else 1
			end),
			Size = UDim2.new(1, 0, 1, 0),
			Visible = Props.showOverlay
		}, {
			StopPropagationOverlay = RoactModule.createElement("TextButton", {
				Active = false,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Selectable = false,
				Text = "",
				ZIndex = 0,
				Size = UDim2.new(1, 0, 1, 0)
			}),
			MiddleContent = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				ZIndex = 1,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 20),
					[RoactModule.Change.AbsoluteContentSize] = p1.onListLayoutAbsoluteContentSizeChanged
				}),
				Spinner = HasLoadingState and RoactModule.createElement(Loading, {
					size = IconSize.Large,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}) or nil,
				PreText = LoadingMessage and RoactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					TextWrapped = true,
					AutomaticSize = Enum.AutomaticSize.XY,
					Font = _Font.Body.Font,
					Text = LoadingMessage,
					TextSize = _Font.BaseSize * _Font.Body.RelativeSize,
					TextColor3 = Theme.TextDefault.Color,
					TextTransparency = Theme.TextDefault.Transparency
				}) or nil
			}),
			Children = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0)
			}, p1.props[RoactModule.Children])
		})
	end)
end

return ExtendResult