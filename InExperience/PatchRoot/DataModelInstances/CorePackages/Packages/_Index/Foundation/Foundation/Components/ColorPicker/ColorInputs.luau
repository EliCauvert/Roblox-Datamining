local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local _ = require(foundation.Components.Types)
local dropdownModule = require(foundation.Components.Dropdown)
local numberInputModule = require(foundation.Components.NumberInput)
local textInputModule = require(foundation.Components.TextInput)
local viewModule = require(foundation.Components.View)
local colorInputModeModule = require(foundation.Enums.ColorInputMode)
local inputSizeModule = require(foundation.Enums.InputSize)
local numberInputControlsVariantModule = require(foundation.Enums.NumberInputControlsVariant)
local colorInputUtilsModule = require(foundation.Components.ColorPicker.colorInputUtils)
local colorUtilsModule = require(foundation.Components.ColorPicker.colorUtils)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local _ = require(foundation.Providers.Style.Tokens)
local useTokensModule = require(foundation.Providers.Style.useTokens)

local function createNumberInputElement(p1, p2, p3)
	-- upvalues: reactModule (ref), numberInputModule (ref), dashModule (ref)
	local value = p1.value:getValue()
	
	return if value == nil then reactModule.createElement(numberInputModule, dashModule.join({
		value = -1,
		onChanged = function(p4)
			-- upvalues: p1 (ref)
			if p4 ~= -1 then
				p1.handler(p4, p1.component)
			end
		end,
		controlsVariant = p2,
		minimum = p1.minimum or 0,
		maximum = p1.maximum or 255,
		step = p1.step or 1,
		precision = p1.precision or 0,
		formatAsString = function(_)
			return ""
		end
	}, p3)) else reactModule.createElement(numberInputModule, dashModule.join({
		value = value,
		onChanged = function(p4)
			-- upvalues: p1 (ref)
			p1.handler(p4, p1.component)
		end,
		controlsVariant = p2,
		minimum = p1.minimum or 0,
		maximum = p1.maximum or 255,
		step = p1.step or 1,
		precision = p1.precision or 0
	}, p3))
end

local function renderInput(_, p1, p2, p3, p4)
	-- upvalues: inputSizeModule (ref), colorInputModeModule (ref), reactModule (ref), viewModule (ref), textInputModule (ref), createNumberInputElement (ref), numberInputControlsVariantModule (ref)
	return if p1.key == colorInputModeModule.Hex then reactModule.createElement(viewModule, { tag = "grow-1 size-0-full", LayoutOrder = p2 }, {
		Input = reactModule.createElement(textInputModule, {
			label = "",
			text = p1.value:getValue(),
			onChanged = function(p5)
				-- upvalues: p1 (ref)
				p1.handler(p5, p1.component)
			end,
			placeholder = p1.placeholder or "#000000",
			size = inputSizeModule.XSmall,
			width = UDim.new(1, 0),
			testId = `{p4}-{p3}`
		})
	}) else reactModule.createElement(viewModule, { tag = "grow-1 size-0-full", LayoutOrder = p2 }, {
		Input = createNumberInputElement(p1, numberInputControlsVariantModule.None, {
			label = "",
			size = inputSizeModule.XSmall,
			width = UDim.new(1, 0),
			LayoutOrder = p2,
			testId = `{p4}-{p3}{if p3 == p1.key:lower() then "" else `-{p1.key:lower()}`}`
		})
	})
end

local t = { alpha = reactModule.createBinding(1) }

return function(p5)
	-- upvalues: colorInputModeModule (ref), withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), colorUtilsModule (ref), viewModule (ref), textInputModule (ref), inputSizeModule (ref), colorInputUtilsModule (ref), renderInput (ref), withCommonPropsModule (ref), dashModule (ref), dropdownModule (ref)
	local availableModes = p5.availableModes or {
		colorInputModeModule.RGB,
		colorInputModeModule.HSV,
		colorInputModeModule.Hex,
		colorInputModeModule.Brick
	}
	local var1 = withDefaultsModule(p5, t)
	local var2 = useTokensModule()
	local mode = var1.mode or colorInputModeModule.RGB
	local color = var1.color
	local alpha = var1.alpha
	local var3 = reactModule.useCallback(function(p6)
		-- upvalues: var1 (ref)
		if var1.onColorChanged then
			var1.onColorChanged(p6)
		end
	end, { var1.onColorChanged })
	local onAlphaChanged = var1.onAlphaChanged
	local var4 = var1.onAlphaChanged ~= nil
	local var5 = color:map(function(p6)
		-- upvalues: colorUtilsModule (copy)
		if colorUtilsModule.isPartialHSV(p6) then
			return { r = nil, g = nil, b = nil }
		end
		local var6 = colorUtilsModule.toColor3(p6)
		
		return {
			r = math.round(var6.R * 255),
			g = math.round(var6.G * 255),
			b = math.round(var6.B * 255)
		}
	end)
	local var6 = color:map(function(p6)
		if type(p6) == "table" then
			return { h = p6.H, s = p6.S, v = p6.V }
		end
		local var7, var8, var9 = p6:ToHSV()
		
		return {
			h = math.round(var7 * 360),
			s = math.round(var8 * 100),
			v = math.round(var9 * 100)
		}
	end)
	local var7 = var5:map(function(p6)
		return if p6.r == nil or p6.g == nil or p6.b == nil then "" else string.format("#%02X%02X%02X", p6.r, p6.g, p6.b)
	end)
	local var8 = reactModule.useCallback(function(p6, p7)
		-- upvalues: var5 (ref), var3 (ref)
		local cloned = table.clone(var5:getValue())
		cloned[p7] = math.clamp(p6, 0, 255)
		
		if cloned.r == nil or cloned.g == nil or cloned.b == nil then
			return
		end
		var3(Color3.fromRGB(cloned.r, cloned.g, cloned.b))
	end, { var5, var3 })
	local var9 = reactModule.useCallback(function(p6)
		-- upvalues: onAlphaChanged (ref)
		if onAlphaChanged then
			onAlphaChanged(p6)
		end
	end, { onAlphaChanged })
	local var10 = reactModule.useCallback(function(p6, p7)
		-- upvalues: var6 (ref), var3 (ref)
		local cloned = table.clone(var6:getValue())
		
		if cloned[p7] == nil and p6 == 0 then
			return
		end
		cloned[p7] = math.clamp(p6, 0, if p7 == "h" then 360 else 100)
		var3(Color3.fromHSV(cloned.h / 360, (cloned.s or 100) / 100, (cloned.v or 100) / 100))
	end, { var6, var3 })
	local var11 = reactModule.useCallback(function(p6)
		-- upvalues: var3 (ref)
		local var12 = p6:gsub("#", ""):upper()
		
		if var12:match("^%x%x%x%x%x%x$") then
			local var13 = tonumber(var12:sub(1, 2), 16)
			local var14 = tonumber(var12:sub(3, 4), 16)
			local var15 = tonumber(var12:sub(5, 6), 16)
			
			if var13 and var14 and var15 then
				var3(Color3.fromRGB(var13, var14, var15))
			end
		end
	end, { var3 })
	local var12 = reactModule.useMemo(function()
		-- upvalues: colorInputModeModule (copy), var4 (ref), availableModes (ref)
		local list = {
			{
				id = colorInputModeModule.RGB,
				text = colorInputModeModule.RGB
			},
			{
				id = colorInputModeModule.HSV,
				text = colorInputModeModule.HSV
			},
			{
				id = colorInputModeModule.Hex,
				text = colorInputModeModule.Hex
			},
			{
				id = colorInputModeModule.Brick,
				text = colorInputModeModule.Brick
			}
		}
		
		if var4 then
			table.insert(list, 2, {
				id = colorInputModeModule.RGBA,
				text = colorInputModeModule.RGBA
			})
		end
		if not availableModes then
			return list
		end
		local t = {}
		
		for i, v in list do
			local id = v.id
			
			for i_1, v_1 in availableModes do
				if if id ~= v_1 then id == colorInputModeModule.RGBA and (v_1 == colorInputModeModule.RGB and var4) else true then
					table.insert(t, v)
					continue
				end
			end
		end
		return t
	end, { var4 })
	reactModule.useEffect(function()
		-- upvalues: mode (ref), colorInputModeModule (copy), var4 (ref), var1 (ref)
		if mode == colorInputModeModule.RGBA and not var4 and var1.onModeChanged then
			var1.onModeChanged(colorInputModeModule.RGB)
		end
	end, { mode, var4 })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, { tag = "row gap-xsmall size-full-600" }), dashModule.join({
		ModeDropdown = if #var12 > 1 then reactModule.createElement(dropdownModule.Root, {
			label = "",
			items = var12,
			value = mode,
			onItemChanged = function(p6)
				-- upvalues: var1 (ref)
				if var1.onModeChanged then
					var1.onModeChanged(p6)
				end
			end,
			size = inputSizeModule.XSmall,
			width = UDim.new(0, var2.Size.Size_1600),
			testId = `{var1.testId}--mode-dropdown`
		}) else nil
	}, (function()
		-- upvalues: mode (ref), colorInputModeModule (copy), reactModule (copy), viewModule (copy), textInputModule (copy), color (ref), inputSizeModule (copy), var1 (ref), colorInputUtilsModule (copy), var5 (ref), var6 (ref), var7 (ref), alpha (ref), var8 (ref), var10 (ref), var11 (ref), var9 (ref), var2 (ref), renderInput (copy)
		if mode == colorInputModeModule.Brick then
			return {
				BrickColorName = reactModule.createElement(viewModule, { tag = "grow-1 size-0-full", LayoutOrder = 1 }, {
					Input = reactModule.createElement(textInputModule, {
						isDisabled = true,
						label = "",
						text = BrickColor.new(color:getValue()).Name,
						onChanged = function() end,
						size = inputSizeModule.XSmall,
						width = UDim.new(1, 0),
						testId = `{var1.testId}-brick-name`
					})
				})
			}
		end
		local var13 = colorInputUtilsModule.createInputConfigs(var5, var6, var7, alpha, var8, var10, var11, var9, var2)[mode]
		
		if not var13 then
			return nil
		end
		local t = {}
		
		for i, v in ipairs(var13) do
			t[v.key .. "Input"] = renderInput(var2, v, i, mode:lower(), var1.testId)
		end
		return t
	end)()))
end