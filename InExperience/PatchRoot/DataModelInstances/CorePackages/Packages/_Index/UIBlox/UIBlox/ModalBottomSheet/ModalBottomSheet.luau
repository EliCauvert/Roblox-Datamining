local parent = script.Parent.Parent.Parent
local otterModule = require(parent.Otter)
local roactModule = require(parent.Roact)
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local withStyleModule = require(parent.UIBlox.Core.Style.withStyle)
local modalBottomSheetButtonModule = require(script.Parent.ModalBottomSheetButton)
local modalBottomSheet = roactModule.PureComponent:extend("ModalBottomSheet")
local t = { frequency = 4, dampingRatio = 1 }
modalBottomSheet.validateProps = tModule.strictInterface({
	buttonModels = tModule.array(tModule.table),
	screenWidth = tModule.number,
	onDismiss = tModule.callback,
	showImages = tModule.optional(tModule.boolean),
	bottomGap = tModule.optional(tModule.number),
	sheetContentXSize = tModule.optional(tModule.UDim),
	sheetContentXPosition = tModule.optional(tModule.UDim)
})
modalBottomSheet.defaultProps = {
	bottomGap = 0,
	showImages = true,
	sheetContentXSize = UDim.new(1, 0),
	sheetContentXPosition = UDim.new(0, 0)
}

function modalBottomSheet.init(p1)
	-- upvalues: otterModule (ref), roactModule (ref)
	p1.motor = otterModule.createSingleMotor(0)
	p1.ref = roactModule.createRef()
	p1.active = true
end

function modalBottomSheet.render(p1)
	-- upvalues: cryoModule (ref), roactModule (ref), modalBottomSheetButtonModule (ref), withStyleModule (ref), otterModule (ref), t (ref)
	local sheetContentXPosition = p1.props.sheetContentXPosition
	local sheetContentXSize = p1.props.sheetContentXSize
	p1.sheetHeight = #p1.props.buttonModels * 56
	
	if #p1.props.buttonModels >= 7 then
		p1.sheetHeight = 420
	end
	local t_1 = {}
	
	for i, v in ipairs(p1.props.buttonModels) do
		t_1["button " .. i] = roactModule.createElement(modalBottomSheetButtonModule, cryoModule.Dictionary.join(v, {
			elementHeight = 56,
			hasRoundTop = i == 1,
			hasRoundBottom = i == #p1.props.buttonModels,
			isFixed = p1.props.screenWidth > 600,
			showImage = p1.props.showImages,
			LayoutOrder = i,
			onActivatedAndDismissed = function(p2)
				-- upvalues: v (ref), p1 (ref)
				if v.onActivated then
					v.onActivated(p2)
				end
				if not v.stayOnActivated then
					p1.props.onDismiss()
				end
			end
		}))
	end
	t_1.layout = roactModule.createElement("UIListLayout", {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		FillDirection = Enum.FillDirection.Vertical,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	
	return withStyleModule(function(p2)
		-- upvalues: roactModule (copy), p1 (ref), otterModule (copy), t (copy), sheetContentXSize (ref), sheetContentXPosition (ref), t_1 (ref)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Background = roactModule.createElement("TextButton", {
				ZIndex = 0,
				AutoButtonColor = false,
				BackgroundColor3 = p2.Theme.Overlay.Color,
				BackgroundTransparency = p2.Theme.Overlay.Transparency,
				BorderSizePixel = 0,
				Selectable = false,
				Size = UDim2.new(1, 0, 1, 0),
				Text = "",
				[roactModule.Event.Activated] = function()
					-- upvalues: p1 (copy), otterModule (copy), t (copy)
					p1.active = false
					p1.motor:setGoal(otterModule.spring(0, t))
				end
			}),
			SheetContent = roactModule.createElement("ScrollingFrame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(sheetContentXSize.Scale, sheetContentXSize.Offset, 0, p1.sheetHeight),
				Position = UDim2.new(sheetContentXPosition.Scale, sheetContentXPosition.Offset, 1, 0),
				Selectable = false,
				ScrollBarThickness = 0,
				CanvasSize = UDim2.new(sheetContentXSize.Scale, sheetContentXSize.Offset, 0, #p1.props.buttonModels * 56),
				ClipsDescendants = true,
				[roactModule.Ref] = p1.ref
			}, t_1)
		})
	end)
end

function modalBottomSheet.didMount(p2)
	-- upvalues: otterModule (ref), t (ref)
	local sheetContentXPosition = p2.props.sheetContentXPosition
	p2.motor:onStep(function(p3)
		-- upvalues: p2 (ref), sheetContentXPosition (ref)
		if p2.ref.current then
			p2.ref.current.Position = UDim2.new(sheetContentXPosition.Scale, sheetContentXPosition.Offset, 1, -(p2.sheetHeight + p2.props.bottomGap) * p3)
		end
	end)
	p2.motor:setGoal(otterModule.spring(1, t))
	p2.motor:onComplete(function()
		-- upvalues: p2 (ref)
		if not p2.active then
			p2.props.onDismiss()
		end
	end)
	p2.motor:start()
end

function modalBottomSheet.willUnmount(p2)
	p2.motor:destroy()
end

return modalBottomSheet