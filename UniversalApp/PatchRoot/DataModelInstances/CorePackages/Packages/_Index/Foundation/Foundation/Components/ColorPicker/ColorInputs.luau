local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local _ = require(Foundation.Components.Types)
local DropdownModule = require(Foundation.Components.Dropdown)
local NumberInputModule = require(Foundation.Components.NumberInput)
local TextInputModule = require(Foundation.Components.TextInput)
local ViewModule = require(Foundation.Components.View)
local ColorInputModeModule = require(Foundation.Enums.ColorInputMode)
local InputSizeModule = require(Foundation.Enums.InputSize)
local NumberInputControlsVariantModule = require(Foundation.Enums.NumberInputControlsVariant)
local ColorInputUtilsModule = require(Foundation.Components.ColorPicker.colorInputUtils)
local ColorUtilsModule = require(Foundation.Components.ColorPicker.colorUtils)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(Foundation.Providers.Style.Tokens)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

local function createNumberInputElement(p1, ControlsVariant, p2) --[[ Line: 38 ]]
	-- upvalues: ReactModule (copy), NumberInputModule (copy), DashModule (copy)
	local Value = p1.value:getValue()
	
	return if Value == nil then ReactModule.createElement(NumberInputModule, DashModule.join({
		value = -1,
		onChanged = function(p3) --[[ Line: 51 ]]
			-- upvalues: p1 (copy)
			if p3 ~= -1 then
				p1.handler(p3, p1.component)
			end
		end,
		controlsVariant = ControlsVariant,
		minimum = p1.minimum or 0,
		maximum = p1.maximum or 255,
		step = p1.step or 1,
		precision = p1.precision or 0,
		formatAsString = function(_): string --[[ Line: 61 ]]
			return ""
		end
	}, p2)) else ReactModule.createElement(NumberInputModule, DashModule.join({
		value = Value,
		onChanged = function(p3) --[[ Line: 72 ]]
			-- upvalues: p1 (copy)
			p1.handler(p3, p1.component)
		end,
		controlsVariant = ControlsVariant,
		minimum = p1.minimum or 0,
		maximum = p1.maximum or 255,
		step = p1.step or 1,
		precision = p1.precision or 0
	}, p2))
end

local function renderInput(_, p1, LayoutOrder, Lowered, TestId) --[[ Line: 84 ]]
	-- upvalues: InputSizeModule (copy), ColorInputModeModule (copy), ReactModule (copy), ViewModule (copy), TextInputModule (copy), createNumberInputElement (copy), NumberInputControlsVariantModule (copy)
	local config = {
		label = "",
		size = InputSizeModule.XSmall,
		width = UDim.new(1, 0),
		LayoutOrder = LayoutOrder,
		testId = `{TestId}-{Lowered}{if Lowered == p1.key:lower() then "" else `-{p1.key:lower()}`}`
	}
	
	return if p1.key == ColorInputModeModule.Hex then ReactModule.createElement(ViewModule, { tag = "grow-1 size-0-full", LayoutOrder = LayoutOrder }, {
		Input = ReactModule.createElement(TextInputModule, {
			label = "",
			text = p1.value:getValue(),
			onChanged = function(p2) --[[ Line: 109 ]]
				-- upvalues: p1 (copy)
				p1.handler(p2, p1.component)
			end,
			placeholder = p1.placeholder or "#000000",
			size = InputSizeModule.XSmall,
			width = UDim.new(1, 0),
			testId = `{TestId}-{Lowered}`
		})
	}) else ReactModule.createElement(ViewModule, { tag = "grow-1 size-0-full", LayoutOrder = LayoutOrder }, {
		Input = createNumberInputElement(p1, NumberInputControlsVariantModule.None, config)
	})
end

local config = { alpha = ReactModule.createBinding(1) }

return function(p2) --[[ Line: 143 | Named "ColorInputs" ]]
	-- upvalues: ColorInputModeModule (copy), WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), ColorUtilsModule (copy), ViewModule (copy), TextInputModule (copy), InputSizeModule (copy), ColorInputUtilsModule (copy), renderInput (copy), WithCommonPropsModule (copy), DashModule (copy), DropdownModule (copy)
	local AvailableModes = p2.availableModes or {
		ColorInputModeModule.RGB,
		ColorInputModeModule.HSV,
		ColorInputModeModule.Hex,
		ColorInputModeModule.Brick
	}
	local WithDefaultsModuleResult = WithDefaultsModule(p2, config)
	local UseTokensModuleResult = UseTokensModule()
	local Mode = WithDefaultsModuleResult.mode or ColorInputModeModule.RGB
	local Color = WithDefaultsModuleResult.color
	local Alpha = WithDefaultsModuleResult.alpha
	local UseResult = ReactModule.useCallback(function(p3) --[[ Line: 153 ]]
		-- upvalues: WithDefaultsModuleResult (copy)
		if WithDefaultsModuleResult.onColorChanged then
			WithDefaultsModuleResult.onColorChanged(p3)
		end
	end, { WithDefaultsModuleResult.onColorChanged })
	local OnAlphaChangedFunction = WithDefaultsModuleResult.onAlphaChanged
	local HasOnAlphaChanged = WithDefaultsModuleResult.onAlphaChanged ~= nil
	local MapResult = Color:map(function(p3) --[[ Line: 163 ]]
		-- upvalues: ColorUtilsModule (upval)
		if ColorUtilsModule.isPartialHSV(p3) then
			return { r = nil, g = nil, b = nil }
		else
			local ToColor3Result = ColorUtilsModule.toColor3(p3)
			
			return {
				r = math.round(ToColor3Result.R * 255),
				g = math.round(ToColor3Result.G * 255),
				b = math.round(ToColor3Result.B * 255)
			}
		end
	end)
	local MapResult1 = Color:map(function(p3) --[[ Line: 176 ]]
		if type(p3) == "table" then
			return { h = p3.H, s = p3.S, v = p3.V }
		else
			local HSV, HSV2, HSV3 = p3:ToHSV()
			
			return {
				h = math.round(HSV * 360),
				s = math.round(HSV2 * 100),
				v = math.round(HSV3 * 100)
			}
		end
	end)
	local MapResult2 = MapResult:map(function(p3): string --[[ Line: 189 ]]
		return if p3.r == nil or p3.g == nil or p3.b == nil then "" else string.format("#%02X%02X%02X", p3.r, p3.g, p3.b)
	end)
	local UseResult1 = ReactModule.useCallback(function(Value: number, Key) --[[ Line: 197 ]]
		-- upvalues: MapResult (copy), UseResult (copy)
		local Copy = table.clone(MapResult:getValue())
		Copy[Key] = math.clamp(Value, 0, 255)
		
		if Copy.r ~= nil and Copy.g ~= nil and Copy.b ~= nil then
			UseResult((Color3.fromRGB(Copy.r, Copy.g, Copy.b)))
			
			return
		end
	end, { MapResult, UseResult })
	local UseResult2 = ReactModule.useCallback(function(p3) --[[ Line: 213 ]]
		-- upvalues: OnAlphaChangedFunction (copy)
		if OnAlphaChangedFunction then
			OnAlphaChangedFunction(p3)
		end
	end, { OnAlphaChangedFunction })
	local UseResult3 = ReactModule.useCallback(function(Value: number, Key) --[[ Line: 219 ]]
		-- upvalues: MapResult1 (copy), UseResult (copy)
		local Copy = table.clone(MapResult1:getValue())
		
		if Copy[Key] ~= nil or Value ~= 0 then
			Copy[Key] = math.clamp(Value, 0, if Key == "h" then 360 else 100)
			UseResult((Color3.fromHSV(Copy.h / 360, (Copy.s or 100) / 100, (Copy.v or 100) / 100)))
			
			return
		end
	end, { MapResult1, UseResult })
	local UseResult4 = ReactModule.useCallback(function(Text: string) --[[ Line: 233 ]]
		-- upvalues: UseResult (copy)
		local Uppered: string = Text:gsub("#", ""):upper()
		
		if Uppered:match("^%x%x%x%x%x%x$") then
			local Number: number? = tonumber(Uppered:sub(1, 2), 16)
			local Number1: number? = tonumber(Uppered:sub(3, 4), 16)
			local Number2: number? = tonumber(Uppered:sub(5, 6), 16)
			
			if Number and Number1 and Number2 then
				UseResult((Color3.fromRGB(Number, Number1, Number2)))
			end
		end
	end, { UseResult })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 249 ]]
		-- upvalues: ColorInputModeModule (upval), HasOnAlphaChanged (copy), AvailableModes (copy)
		local List = {
			{
				id = ColorInputModeModule.RGB,
				text = ColorInputModeModule.RGB
			},
			{
				id = ColorInputModeModule.HSV,
				text = ColorInputModeModule.HSV
			},
			{
				id = ColorInputModeModule.Hex,
				text = ColorInputModeModule.Hex
			},
			{
				id = ColorInputModeModule.Brick,
				text = ColorInputModeModule.Brick
			}
		}
		
		if HasOnAlphaChanged then
			table.insert(List, 2, {
				id = ColorInputModeModule.RGBA,
				text = ColorInputModeModule.RGBA
			})
		end
		if not AvailableModes then
			return List
		end
		local List1 = {}
		
		for _, value in List do
			local Id = value.id
			
			for _, availableMode in AvailableModes do
				if Id == availableMode or Id == ColorInputModeModule.RGBA and (availableMode == ColorInputModeModule.RGB and HasOnAlphaChanged) then
					table.insert(List1, value)
					break
				end
			end
		end
		return List1
	end, { HasOnAlphaChanged })
	ReactModule.useEffect(function() --[[ Line: 284 ]]
		-- upvalues: Mode (copy), ColorInputModeModule (upval), HasOnAlphaChanged (copy), WithDefaultsModuleResult (copy)
		if Mode == ColorInputModeModule.RGBA and not HasOnAlphaChanged and WithDefaultsModuleResult.onModeChanged then
			WithDefaultsModuleResult.onModeChanged(ColorInputModeModule.RGB)
		end
	end, { Mode, HasOnAlphaChanged })
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { tag = "row gap-xsmall size-full-600" }), DashModule.join({
		ModeDropdown = if #UseMemoResult > 1 then ReactModule.createElement(DropdownModule.Root, {
			label = "",
			items = UseMemoResult,
			value = Mode,
			onItemChanged = function(p3) --[[ Line: 344 ]]
				-- upvalues: WithDefaultsModuleResult (copy)
				if WithDefaultsModuleResult.onModeChanged then
					WithDefaultsModuleResult.onModeChanged(p3)
				end
			end,
			size = InputSizeModule.XSmall,
			width = UDim.new(0, UseTokensModuleResult.Size.Size_1600),
			testId = `{WithDefaultsModuleResult.testId}--mode-dropdown`
		}) else nil
	}, ((function() --[[ Line: 292 ]]
		-- upvalues: Mode (copy), ColorInputModeModule (upval), ReactModule (upval), ViewModule (upval), TextInputModule (upval), Color (copy), InputSizeModule (upval), WithDefaultsModuleResult (copy), ColorInputUtilsModule (upval), MapResult (copy), MapResult1 (copy), MapResult2 (copy), Alpha (copy), UseResult1 (copy), UseResult3 (copy), UseResult4 (copy), UseResult2 (copy), UseTokensModuleResult (copy), renderInput (upval)
		if Mode == ColorInputModeModule.Brick then
			return {
				BrickColorName = ReactModule.createElement(ViewModule, { tag = "grow-1 size-0-full", LayoutOrder = 1 }, {
					Input = ReactModule.createElement(TextInputModule, {
						isDisabled = true,
						label = "",
						text = BrickColor.new(Color:getValue()).Name,
						onChanged = function() --[[ Line: 301 ]] end,
						size = InputSizeModule.XSmall,
						width = UDim.new(1, 0),
						testId = `{WithDefaultsModuleResult.testId}-brick-name`
					})
				})
			}
		end
		local InputConfig = ColorInputUtilsModule.createInputConfigs(MapResult, MapResult1, MapResult2, Alpha, UseResult1, UseResult3, UseResult4, UseResult2, UseTokensModuleResult)[Mode]
		
		if not InputConfig then
			return nil
		end
		local t = {}
		
		for i, value in ipairs(InputConfig) do
			t[value.key .. "Input"] = renderInput(UseTokensModuleResult, value, i, Mode:lower(), WithDefaultsModuleResult.testId)
		end
		return t
	end)())))
end