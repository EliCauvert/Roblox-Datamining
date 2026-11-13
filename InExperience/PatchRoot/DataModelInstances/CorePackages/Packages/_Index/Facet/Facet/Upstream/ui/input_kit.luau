local LayoutKitModule = require("./layout_kit")
local _ = require("./input_value")
local InputAdjustmentModule = require("./input_adjustment")
local _ = require("./types")
local _ = require("../vendor/compose/core")

local function repeatHeld(p1, Total, Amount, Callback, Callback1)
	local Total1 = 0
	local Total2 = Total
	
	return p1.onFrame(function(Amount1)
		-- upvalues: Callback (copy), Total1 (ref), Total2 (ref), Callback1 (copy), Amount (copy)
		if not Callback() then return end
		Total1 += Amount1
		local Count = 0
		while Total2 <= Total1 and Count < 5 do
			Callback1()
			Total2 += Amount
			Count += 1
		end
		if Count == 5 then
			Total2 = Total1 + Amount
		end
	end)
end

return function(p2)
	-- upvalues: LayoutKitModule (copy), InputAdjustmentModule (copy), repeatHeld (copy)
	local Runtime = p2.runtime
	local Host = p2.Host
	local Compose = p2.Compose
	local ReadFunction = p2.read
	local TypesUDim2 = p2.types.UDim2
	local TypesEnum = p2.types.Enum
	
	local function enabled(p3, p4): boolean
		-- upvalues: ReadFunction (copy)
		return ReadFunction(p3.enabled, p4) ~= false and (ReadFunction(p3.disabled, p4) ~= true and ReadFunction(p3.busy, p4) ~= true)
	end
	
	local function stopEnabled(p3, p4): boolean
		-- upvalues: ReadFunction (copy)
		return ReadFunction(p3.enabled, p4) ~= false and ReadFunction(p3.disabled, p4) ~= true
	end
	
	local function attributes(p3, Attributes)
		-- upvalues: Runtime (copy)
		Runtime.decorate(p3, { Attributes = Attributes })
		
		return p3
	end
	
	return {
		repeatDelay = 0.4,
		repeatInterval = 0.1,
		lists = LayoutKitModule.of(p2),
		noKey = assert(TypesEnum.KeyCode:FromValue(0)),
		unskinned = setmetatable({}, { __mode = "k" }),
		typeRoles = {
			caption = true,
			label = true,
			body = true,
			heading = true,
			title = true,
			control = true,
			strong = true,
			numeral = true
		},
		repeatHeld = repeatHeld,
		dynamic = function(Callback)
			-- upvalues: Compose (copy)
			return Compose.isValue(Callback) or type(Callback) == "function"
		end,
		hasText = function(p3, p4): boolean
			-- upvalues: ReadFunction (copy)
			local ReadResult = ReadFunction(p3, p4)
			
			return ReadResult ~= nil and ReadResult ~= ""
		end,
		enabled = enabled,
		stopEnabled = stopEnabled,
		writable = function(p3): boolean
			-- upvalues: Compose (copy)
			return type(p3) == "table" and (Compose.isValue(p3) and type(p3.set) == "function")
		end,
		requireValue = function(p3, ValueType, p4)
			-- upvalues: ReadFunction (copy), Compose (copy)
			assert(type(ReadFunction(p3.value)) == ValueType, `Facet.{p4}: value must resolve to a {ValueType}`)
			local Value = p3.value
			assert(type(Value) == "table" and (Compose.isValue(Value) and type(Value.set) == "function") or (type(p3.onChange) == "function" or p3.readOnly == true), `Facet.{p4}: editing a read-only value requires onChange`)
		end,
		changed = function(p3, p4): boolean
			-- upvalues: ReadFunction (copy)
			if ReadFunction(p3.value) == p4 then
				return false
			end
			if p3.onChange then
				p3.onChange(p4)
			else
				p3.value:set(p4)
			end
			return ReadFunction(p3.value) == p4
		end,
		attributes = attributes,
		valueAttributes = function(Object, Callback, p3, p4)
			-- upvalues: ReadFunction (copy), Compose (copy)
			Object:SetAttribute("minimum", p3.min)
			Object:SetAttribute("maximum", p3.max)
			local v1 = nil
			local v2 = nil
			
			local function update(p5)
				-- upvalues: ReadFunction (upval), Callback (copy), p3 (copy), v1 (ref), Object (copy), v2 (ref), p4 (copy)
				local ReadResult = ReadFunction(Callback, p5)
				local QuantizeResult = p3.quantize(ReadResult)
				local FormatResult = p3.format(ReadResult)
				local Text: string = `{FormatResult} of {p3.min} to {p3.max}`
				
				if QuantizeResult ~= v1 then
					Object:SetAttribute("value", QuantizeResult)
					v1 = QuantizeResult
				end
				if Text ~= v2 then
					p4.Text = FormatResult
					Object:SetAttribute("semanticValue", Text)
					v2 = Text
				end
			end
			
			if Compose.isValue(Callback) or type(Callback) == "function" then
				Compose.watch(update)
			else
				update()
			end
		end,
		adjustment = InputAdjustmentModule(p2, {
			repeatDelay = 0.4,
			repeatInterval = 0.1,
			attributes = attributes,
			enabled = enabled,
			stopEnabled = stopEnabled,
			repeatHeld = repeatHeld
		}),
		paintedPart = function(p3, Image, p4, p5)
			-- upvalues: Host (copy), TypesUDim2 (copy), TypesEnum (copy), p2 (copy)
			if Image then
				p3[#p3 + 1] = Host.ImageLabel("Artwork")({
					BackgroundTransparency = 1,
					Image = Image,
					Size = TypesUDim2.fromScale(1, 1),
					ScaleType = TypesEnum.ScaleType.Stretch
				})
			end
			local StyledResult = p2.styled(Host.Frame(p3), p4)
			
			if not Image then
				p2.skin(StyledResult, p5)
			end
			return StyledResult
		end
	}
end