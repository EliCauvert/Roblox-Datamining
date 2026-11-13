local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./collection_types")

return function(p1, p2, IsTouchMatch, p3, p4)
	local Compose = p1.Compose
	local ReadFunction1 = p1.read
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local UserInputService = p1.config.userInputService
	local PreferredInputResult = if UserInputService then p1.observe.PreferredInput(UserInputService) else nil
	local TenFootResult = p1.tenFoot()
	
	local function _(p5): number
		-- upvalues: p1 (copy)
		return (math.ceil(p1.metric("typography.body.size", p5) * p1.metric("typography.body.lineHeight", p5)))
	end
	
	local _ = function(Callback): boolean
		-- upvalues: PreferredInputResult (copy), TypesEnum (copy)
		local CallbackResult = if PreferredInputResult then Callback(PreferredInputResult) else nil
		
		return CallbackResult == TypesEnum.PreferredInput.Touch or CallbackResult == TypesEnum.PreferredInput.Gamepad
	end
	
	local MouseEnabledResult = if UserInputService then p1.observe.MouseEnabled(UserInputService) else nil
	local KeyboardEnabledResult = if UserInputService then p1.observe.KeyboardEnabled(UserInputService) else nil
	local FormulaResult = Compose.formula(function(Callback): number
		-- upvalues: p2 (copy), KeyboardEnabledResult (copy), MouseEnabledResult (copy), IsTouchMatch (copy), PreferredInputResult (copy), TypesEnum (copy), p1 (copy)
		local IsNotCallbackResult: boolean = p2.reorderable == true and (KeyboardEnabledResult ~= nil and (Callback(KeyboardEnabledResult) == true and (MouseEnabledResult ~= nil and Callback(MouseEnabledResult) == false)))
		local IsTouchMatch1: boolean = IsTouchMatch
		
		if IsTouchMatch1 then
			local CallbackResult = if PreferredInputResult then Callback(PreferredInputResult) else nil
			IsTouchMatch1 = CallbackResult == TypesEnum.PreferredInput.Touch or CallbackResult == TypesEnum.PreferredInput.Gamepad or IsNotCallbackResult
		end
		return if IsTouchMatch1 then math.max(p1.controlSize(nil, "height", Callback), 44) + p1.metric("space.s", Callback) else 0
	end)
	local FormulaResult1 = Compose.formula(function(Callback)
		-- upvalues: p2 (copy), ReadFunction (copy), PreferredInputResult (copy), TypesEnum (copy), ReadFunction1 (copy), p4 (copy)
		if p2.header == false then
			return 0
		end
		local ReadResult = if p2.headerHeight == nil then 40 else ReadFunction(p2.headerHeight, Callback)
		local CallbackResult = if PreferredInputResult then Callback(PreferredInputResult) else nil
		
		if CallbackResult == TypesEnum.PreferredInput.Touch or CallbackResult == TypesEnum.PreferredInput.Gamepad then
			ReadResult = math.max(ReadResult, 44)
		end
		for _, value in ReadFunction1(p2.columns, Callback) do
			ReadResult = math.max(ReadResult, Callback(p4)[value.id] or 0)
		end
		return ReadResult
	end)
	local TableValue = p1.styled(p1.text({
		Name = "CellTextInsets",
		Text = "",
		TextTransparency = 1,
		Interactable = false,
		TextWrapped = false,
		TextTruncate = TypesEnum.TextTruncate.None,
		Size = p1.types.UDim2.fromOffset(0, 0),
		AutomaticSize = TypesEnum.AutomaticSize.XY
	}), "TableValue")
	
	return {
		cellPadding = 16,
		input = UserInputService,
		preferredInput = PreferredInputResult,
		touchRows = function(Callback): boolean
			-- upvalues: PreferredInputResult (copy), TypesEnum (copy)
			return PreferredInputResult ~= nil and Callback(PreferredInputResult) == TypesEnum.PreferredInput.Touch
		end,
		minimumRow = Compose.formula(function(Callback)
			-- upvalues: p2 (copy), ReadFunction (copy), PreferredInputResult (copy), TypesEnum (copy), ReadFunction1 (copy), p1 (copy), TenFootResult (copy)
			if p2.itemSize ~= nil then
				return ReadFunction(p2.itemSize, Callback)
			end
			if PreferredInputResult ~= nil and Callback(PreferredInputResult) == TypesEnum.PreferredInput.Touch then
				local v1 = 1
				
				for _, value in ReadFunction1(p2.columns, Callback) do
					if value.render == nil and value.wrap ~= false then
						v1 = 2
					end
				end
				return (math.max(p1.metric("targetSizes.minimum", Callback), v1 * math.ceil(p1.metric("typography.body.size", Callback) * p1.metric("typography.body.lineHeight", Callback)) + 16))
			elseif TenFootResult(Callback) then
				return (math.max(p1.controlSize("large", "height", Callback), math.ceil(p1.metric("typography.body.size", Callback) * p1.metric("typography.body.lineHeight", Callback)) + 16))
			else
				local CallbackResult = if PreferredInputResult then Callback(PreferredInputResult) else nil
				
				return (math.max(40, p1.controlSize(nil, "height", Callback), if CallbackResult == TypesEnum.PreferredInput.Gamepad then 44 else 0))
			end
		end),
		toolbarShown = function(Callback): boolean
			-- upvalues: p2 (copy), KeyboardEnabledResult (copy), MouseEnabledResult (copy), IsTouchMatch (copy), PreferredInputResult (copy), TypesEnum (copy)
			local IsNotCallbackResult: boolean = p2.reorderable == true and (KeyboardEnabledResult ~= nil and (Callback(KeyboardEnabledResult) == true and (MouseEnabledResult ~= nil and Callback(MouseEnabledResult) == false)))
			local IsTouchMatch1: boolean = IsTouchMatch
			
			if IsTouchMatch1 then
				local CallbackResult = if PreferredInputResult then Callback(PreferredInputResult) else nil
				IsTouchMatch1 = CallbackResult == TypesEnum.PreferredInput.Touch or CallbackResult == TypesEnum.PreferredInput.Gamepad or IsNotCallbackResult
			end
			return IsTouchMatch1
		end,
		toolbarHeight = FormulaResult,
		headerHeight = FormulaResult1,
		topHeight = Compose.formula(function(Callback)
			-- upvalues: FormulaResult (copy), FormulaResult1 (copy)
			return Callback(FormulaResult) + Callback(FormulaResult1)
		end),
		recordHeight = function(p5, p6, Label, p7)
			-- upvalues: p1 (copy), Compose (copy), p3 (copy)
			local TextBoundsResult = if Label:IsA("TextLabel") then p1.observe.TextBounds(Label) else p1.observe.TextBounds(Label)
			local TextResult = p1.observe.Text(Label)
			Compose.watch(function(Callback)
				-- upvalues: TextBoundsResult (copy), p3 (upval), p7 (copy), TextResult (copy), p5 (copy), p6 (copy)
				local CallbackResult = Callback(TextBoundsResult)
				local NewY = CallbackResult.Y / Callback(p3) + p7
				
				if (CallbackResult.Y > 0 or Callback(TextResult) == "") and p5:peek()[p6] ~= NewY then
					local Copy = table.clone(p5:peek())
					Copy[p6] = NewY
					p5:set(Copy)
				end
			end)
		end,
		textHeight = function(p5, p6)
			-- upvalues: p1 (copy), p3 (copy)
			local TextBoundsResult = p1.observe.TextBounds(p5)
			local TextResult = p1.observe.Text(p5)
			local NewY = nil
			
			return function(Callback)
				-- upvalues: TextBoundsResult (copy), TextResult (copy), NewY (ref), p3 (upval), p6 (copy)
				local CallbackResult = Callback(TextBoundsResult)
				
				if CallbackResult.Y > 0 or Callback(TextResult) == "" then
					NewY = CallbackResult.Y / Callback(p3) + p6
				end
				return NewY
			end
		end,
		textInsets = TableValue,
		textInsetSize = p1.observe.AbsoluteSize(TableValue)
	}
end