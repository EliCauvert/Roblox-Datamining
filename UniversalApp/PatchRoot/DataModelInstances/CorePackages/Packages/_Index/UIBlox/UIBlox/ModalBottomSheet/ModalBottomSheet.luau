local Parent = script.Parent.Parent.Parent
local OtterModule = require(Parent.Otter)
local RoactModule = require(Parent.Roact)
local CryoModule = require(Parent.Cryo)
local TModule = require(Parent.t)
local WithStyleModule = require(Parent.UIBlox.Core.Style.withStyle)
local ModalBottomSheetButtonModule = require(script.Parent.ModalBottomSheetButton)
local ModalBottomSheet = RoactModule.PureComponent:extend("ModalBottomSheet")
local config = { frequency = 4, dampingRatio = 1 }
ModalBottomSheet.validateProps = TModule.strictInterface({
	buttonModels = TModule.array(TModule.table),
	screenWidth = TModule.number,
	onDismiss = TModule.callback,
	showImages = TModule.optional(TModule.boolean),
	bottomGap = TModule.optional(TModule.number),
	sheetContentXSize = TModule.optional(TModule.UDim),
	sheetContentXPosition = TModule.optional(TModule.UDim)
})
ModalBottomSheet.defaultProps = {
	bottomGap = 0,
	showImages = true,
	sheetContentXSize = UDim.new(1, 0),
	sheetContentXPosition = UDim.new(0, 0)
}

function ModalBottomSheet.init(p1)
	-- upvalues: OtterModule (copy), RoactModule (copy)
	p1.motor = OtterModule.createSingleMotor(0)
	p1.ref = RoactModule.createRef()
	p1.active = true
end

function ModalBottomSheet.render(p1)
	-- upvalues: CryoModule (copy), RoactModule (copy), ModalBottomSheetButtonModule (copy), WithStyleModule (copy), OtterModule (copy), config (copy)
	local SheetContentXPosition = p1.props.sheetContentXPosition
	local SheetContentXSize = p1.props.sheetContentXSize
	p1.sheetHeight = #p1.props.buttonModels * 56
	
	if #p1.props.buttonModels >= 7 then
		p1.sheetHeight = 420
	end
	local Elements = {}
	
	for LayoutOrder, buttonModel in ipairs(p1.props.buttonModels) do
		Elements["button " .. LayoutOrder] = RoactModule.createElement(ModalBottomSheetButtonModule, (CryoModule.Dictionary.join(buttonModel, {
			elementHeight = 56,
			hasRoundTop = LayoutOrder == 1,
			hasRoundBottom = LayoutOrder == #p1.props.buttonModels,
			isFixed = p1.props.screenWidth > 600,
			showImage = p1.props.showImages,
			LayoutOrder = LayoutOrder,
			onActivatedAndDismissed = function(p2)
				-- upvalues: buttonModel (copy), p1 (copy)
				if buttonModel.onActivated then
					buttonModel.onActivated(p2)
				end
				if not buttonModel.stayOnActivated then
					p1.props.onDismiss()
				end
			end
		})))
	end
	Elements.layout = RoactModule.createElement("UIListLayout", {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		FillDirection = Enum.FillDirection.Vertical,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	
	return WithStyleModule(function(p2)
		-- upvalues: RoactModule (upval), p1 (copy), OtterModule (upval), config (upval), SheetContentXSize (copy), SheetContentXPosition (copy), Elements (copy)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Background = RoactModule.createElement("TextButton", {
				ZIndex = 0,
				AutoButtonColor = false,
				BackgroundColor3 = p2.Theme.Overlay.Color,
				BackgroundTransparency = p2.Theme.Overlay.Transparency,
				BorderSizePixel = 0,
				Selectable = false,
				Size = UDim2.new(1, 0, 1, 0),
				Text = "",
				[RoactModule.Event.Activated] = function()
					-- upvalues: p1 (upval), OtterModule (upval), config (upval)
					p1.active = false
					p1.motor:setGoal(OtterModule.spring(0, config))
				end
			}),
			SheetContent = RoactModule.createElement("ScrollingFrame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(SheetContentXSize.Scale, SheetContentXSize.Offset, 0, p1.sheetHeight),
				Position = UDim2.new(SheetContentXPosition.Scale, SheetContentXPosition.Offset, 1, 0),
				Selectable = false,
				ScrollBarThickness = 0,
				CanvasSize = UDim2.new(SheetContentXSize.Scale, SheetContentXSize.Offset, 0, #p1.props.buttonModels * 56),
				ClipsDescendants = true,
				[RoactModule.Ref] = p1.ref
			}, Elements)
		})
	end)
end

function ModalBottomSheet.didMount(p2)
	-- upvalues: OtterModule (copy), config (copy)
	local SheetContentXPosition = p2.props.sheetContentXPosition
	p2.motor:onStep(function(p3)
		-- upvalues: p2 (copy), SheetContentXPosition (copy)
		if p2.ref.current then
			p2.ref.current.Position = UDim2.new(SheetContentXPosition.Scale, SheetContentXPosition.Offset, 1, -(p2.sheetHeight + p2.props.bottomGap) * p3)
		end
	end)
	p2.motor:setGoal(OtterModule.spring(1, config))
	p2.motor:onComplete(function()
		-- upvalues: p2 (copy)
		if not p2.active then
			p2.props.onDismiss()
		end
	end)
	p2.motor:start()
end

function ModalBottomSheet.willUnmount(p2)
	p2.motor:destroy()
end

return ModalBottomSheet