local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local _ = require(parent_2.React)
local otterModule = require(parent_2.Otter)
local UIBloxModule = require(parent_2.UIBlox)
local foundationModule = require(parent_2.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local withStyle = UIBloxModule.Core.Style.withStyle
local multiTextLocalizerModule = require(parent_1.Locale.MultiTextLocalizer)
local loadingOverlayStateModule = require(parent.LoadingOverlayState)
local name = roactModule.Component:extend(script.Name)
local t = { dampingRatio = 1, frequency = 1 }

function name.init(p0) --[[ line: 36 ]]
	-- upvalues: roactModule (ref), otterModule (ref), t (ref)
	local var8, var9 = roactModule.createBinding(0)
	p0.motor = otterModule.createSingleMotor(0)
	p0.motor:start()
	p0.motor:onStep(var9)
	p0.animationProgress = var8
	p0.motor:setGoal(otterModule.spring(if p0.props.loadingState ~= nil then 0 else 1, t))
end

function name.getLoadingMessage(_, p1, p2) --[[ line: 48 ]]
	-- upvalues: loadingOverlayStateModule (ref)
	return if p2 == loadingOverlayStateModule.PurchasingItem then p1.PurchasingItem elseif p2 == loadingOverlayStateModule.PurchasingRobux then p1.PurchasingRobux elseif p2 == loadingOverlayStateModule.WaitingForPurchase then p1.WaitingForPurchase elseif p2 == loadingOverlayStateModule.WaitingForRobux then p1.WaitingForRobux else nil
end

function name.didUpdate(p3, p4, _) --[[ line: 61 ]]
	-- upvalues: otterModule (ref), t (ref)
	local props = p3.props
	
	if p4.loadingState ~= props.loadingState then
		p3.motor:setGoal(otterModule.spring(if props.loadingState ~= nil then 0 else 1, t))
	end
end

function name.willUnmount(p5) --[[ line: 69 ]]
	p5.motor:destroy()
end

function name.render(p6) --[[ line: 73 ]]
	-- upvalues: roactModule (ref), multiTextLocalizerModule (ref)
	return roactModule.createElement(multiTextLocalizerModule, {
		keys = {
			PurchasingItem = { key = "IAPExperience.Loading.Text.PurchasingItem" },
			PurchasingRobux = { key = "IAPExperience.Loading.Text.PurchasingRobux" },
			WaitingForPurchase = { key = "IAPExperience.Loading.Text.WaitingForPurchase" },
			WaitingForRobux = { key = "IAPExperience.Loading.Text.WaitingForRobux" }
		},
		render = function(p7) --[[ line: 89 ]]
			-- upvalues: p6 (ref)
			return p6:renderAlert(p7)
		end
	})
end

function name.renderAlert(p8, p9) --[[ line: 95 ]]
	-- upvalues: loadingOverlayStateModule (ref), withStyle (ref), roactModule (ref), loading (ref), iconSize (ref)
	local props = p8.props
	local var10 = props.loadingState ~= loadingOverlayStateModule.None and props.loadingState ~= nil
	local var11 = p8:getLoadingMessage(p9, props.loadingState)
	
	return withStyle(function(p10) --[[ line: 101 ]]
		-- upvalues: roactModule (copy), p8 (ref), props (ref), var10 (ref), loading (copy), iconSize (copy), var11 (ref)
		local theme = p10.Theme
		local font = p10.Font
		
		return roactModule.createElement("Frame", {
			BackgroundColor3 = theme.BackgroundUIContrast.Color,
			BackgroundTransparency = p8.animationProgress:map(function(p11) --[[ line: 106 ]]
				-- upvalues: props (copy), theme (ref)
				return if props.showOverlay then if props.shouldAnimate then 1 - (1 - theme.BackgroundUIContrast.Transparency) * p11 else theme.BackgroundUIContrast.Transparency else 1
			end),
			Size = UDim2.new(1, 0, 1, 0),
			Visible = props.showOverlay
		}, {
			StopPropagationOverlay = roactModule.createElement("TextButton", {
				Active = false,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Selectable = false,
				Text = "",
				ZIndex = 0,
				Size = UDim2.new(1, 0, 1, 0)
			}),
			MiddleContent = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				ZIndex = 1,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 20),
					[roactModule.Change.AbsoluteContentSize] = p8.onListLayoutAbsoluteContentSizeChanged
				}),
				Spinner = var10 and roactModule.createElement(loading, {
					size = iconSize.Large,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}) or nil,
				PreText = var11 and roactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					TextWrapped = true,
					AutomaticSize = Enum.AutomaticSize.XY,
					Font = font.Body.Font,
					Text = var11,
					TextSize = font.BaseSize * font.Body.RelativeSize,
					TextColor3 = theme.TextDefault.Color,
					TextTransparency = theme.TextDefault.Transparency
				}) or nil
			}),
			Children = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0)
			}, p8.props[roactModule.Children])
		})
	end)
end

return name