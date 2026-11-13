local _ = require("../vendor/compose/core")
local TextMeasureModule = require("./text_measure")
local _ = require("./types")
local _ = require("./input_types")
local _ = require("./input_props")
local ColorPickerKitModule = require("./color_picker_kit")
local _ = require("./color_picker_state")
local RING = ColorPickerKitModule.RING
local BUBBLE = ColorPickerKitModule.BUBBLE
local SPACE = ColorPickerKitModule.SPACE

return function(p1, p2, p3, p4)
	-- upvalues: BUBBLE (copy), RING (copy), SPACE (copy), TextMeasureModule (copy)
	local Host = p1.Host
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local Color = p3.color
	local RingFunction = p3.ring
	local WHITE = p3.WHITE
	local Held = p4.held
	local Canon = p4.canon
	local InteractiveFunction = p4.interactive
	local ProposeFunction = p4.propose
	local CommitFunction = p4.commit
	local TouchFunction = p4.touch
	
	local function channelSlider(Name, Label, Max, Callback, Callback1, TrackContent, ThumbContent)
		-- upvalues: Canon (copy), InteractiveFunction (copy), ProposeFunction (copy), CommitFunction (copy), p2 (copy)
		local SliderResult = p2.Slider({
			min = 0,
			step = 1,
			Name = Name,
			label = Label,
			value = function(Callback1)
				-- upvalues: Callback (copy), Canon (upval), Max (copy)
				return Callback(Callback1(Canon)) * Max
			end,
			max = Max,
			enabled = function(p5)
				-- upvalues: InteractiveFunction (upval)
				return InteractiveFunction(p5)
			end,
			format = function(p5: number): string
				return (tostring((math.floor(p5 + 0.5))))
			end,
			trackContent = TrackContent,
			thumbContent = ThumbContent,
			onChange = function(p5)
				-- upvalues: ProposeFunction (upval), Callback1 (copy), Canon (upval), Max (copy)
				ProposeFunction(Callback1(Canon:peek(), p5 / Max))
			end,
			onCommit = function()
				-- upvalues: CommitFunction (upval)
				CommitFunction()
			end
		})
		local Track = SliderResult:FindFirstChild("Track", true)
		
		if Track then
			Track:SetAttribute("AccessibleLabel", Label)
		end
		return SliderResult
	end
	
	local function bubble(BackgroundColor3, Callback, List)
		-- upvalues: TypesUDim2 (copy), BUBBLE (upval), TouchFunction (copy), p1 (copy), Host (copy), WHITE (copy)
		local config = {
			Name = "Bubble",
			Size = TypesUDim2.fromOffset(BUBBLE, BUBBLE),
			BorderSizePixel = 0,
			ZIndex = 6,
			BackgroundColor3 = BackgroundColor3,
			Visible = function(p5)
				-- upvalues: TouchFunction (upval), Callback (copy)
				return TouchFunction(p5) and Callback(p5)
			end,
			p1.corner(BUBBLE),
			Host.UIStroke({ Thickness = 2, Transparency = 0, Color = WHITE })
		}
		
		for i, value in List do
			config[i] = value
		end
		return Host.Frame(config)
	end
	
	local function hueStrip()
		-- upvalues: p1 (copy), Color (copy), Host (copy), TypesVector2 (copy), TypesUDim2 (copy), WHITE (copy)
		local List = {}
		
		for i = 0, 6 do
			table.insert(List, p1.types.ColorSequenceKeypoint.new(i / 6, Color.toColor({ s = 1, v = 1, h = i % 6 / 6 })))
		end
		return Host.Frame("HueStrip")({
			AnchorPoint = TypesVector2.new(0.5, 0.5),
			Position = TypesUDim2.fromScale(0.5, 0.5),
			Size = TypesUDim2.new(1, 0, 0, 12),
			BackgroundColor3 = WHITE,
			BorderSizePixel = 0,
			p1.corner(12),
			Host.UIGradient("Rainbow")({ Rotation = 0, Color = p1.types.ColorSequence.new(List) })
		})
	end
	
	local function alphaStrip()
		-- upvalues: Host (copy), TypesUDim2 (copy), p3 (copy), TypesEnum (copy), TypesVector2 (copy), Held (copy), Color (copy), Canon (copy), p1 (copy)
		local FrameResults = {}
		
		for i = 1, 2 do
			local List = {}
			
			for i1 = 1, 24 do
				table.insert(List, Host.Frame(`C{i1}`)({
					BorderSizePixel = 0,
					Size = TypesUDim2.fromScale(0.041666666666666664, 1),
					LayoutOrder = i1,
					BackgroundColor3 = if (i1 + i) % 2 == 0 then p3.LIGHT else p3.DARK
				}))
			end
			local config1 = {
				Name = if i == 1 then "Top" else "Bottom",
				Size = TypesUDim2.fromScale(1, 0.5),
				Position = TypesUDim2.fromScale(0, (i - 1) / 2),
				BackgroundTransparency = 1,
				Host.UIListLayout({
					FillDirection = TypesEnum.FillDirection.Horizontal,
					SortOrder = TypesEnum.SortOrder.LayoutOrder
				})
			}
			
			for _, value in List do
				config1[#config1 + 1] = value
			end
			table.insert(FrameResults, Host.Frame(config1))
		end
		local config = {
			Name = "Checker",
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = TypesUDim2.fromScale(1, 1)
		}
		
		for _, frameResult in FrameResults do
			config[#config + 1] = frameResult
		end
		return Host.Frame("AlphaStrip")({
			AnchorPoint = TypesVector2.new(0.5, 0.5),
			Position = TypesUDim2.fromScale(0.5, 0.5),
			Size = TypesUDim2.new(1, 0, 0, 12),
			BackgroundTransparency = 1,
			Host.Frame(config),
			Host.Frame("Ramp")({
				Size = TypesUDim2.fromScale(1, 1),
				BorderSizePixel = 0,
				BackgroundColor3 = function(Callback)
					-- upvalues: Held (upval), Color (upval), Canon (upval)
					return Callback(Held) or Color.toColor(Callback(Canon))
				end,
				Host.UIGradient({
					Rotation = 0,
					Transparency = p1.types.NumberSequence.new({
						p1.types.NumberSequenceKeypoint.new(0, 1),
						p1.types.NumberSequenceKeypoint.new(1, 0)
					})
				})
			})
		})
	end
	
	local function hueSlider()
		-- upvalues: channelSlider (copy), hueStrip (copy), Color (copy), Host (copy), TypesUDim2 (copy), RING (upval), RingFunction (copy), bubble (copy), TypesVector2 (copy), SPACE (upval)
		local function v32(p5)
			-- upvalues: Color (upval)
			return function(Callback)
				-- upvalues: Color (upval), p5 (copy)
				return Color.toColor({ s = 1, v = 1, h = Callback(p5.value) / 360 })
			end
		end
		
		return (channelSlider("Hue", "Hue", 360, function(p5)
			return p5.h
		end, function(p5, p6)
			return { h = p6, s = p5.s, v = p5.v }
		end, hueStrip, function(p5)
			-- upvalues: Host (upval), TypesUDim2 (upval), RING (upval), RingFunction (upval), bubble (upval), v32 (copy), TypesVector2 (upval), SPACE (upval)
			return Host.Frame("Mark")({
				Size = TypesUDim2.fromOffset(RING, RING),
				BackgroundTransparency = 1,
				RingFunction("Ring"),
				bubble(v32(p5), function(Callback)
					-- upvalues: p5 (copy)
					return Callback(p5.dragging)
				end, {
					AnchorPoint = TypesVector2.new(0.5, 1),
					Position = TypesUDim2.new(0.5, 0, 0, -SPACE)
				})
			})
		end))
	end
	
	return {
		channelSlider = channelSlider,
		bubble = bubble,
		ringKnob = function(p5)
			-- upvalues: Host (copy), TypesUDim2 (copy), RING (upval), RingFunction (copy), bubble (copy), TypesVector2 (copy), SPACE (upval)
			return function(p6)
				-- upvalues: Host (upval), TypesUDim2 (upval), RING (upval), RingFunction (upval), bubble (upval), p5 (copy), TypesVector2 (upval), SPACE (upval)
				return Host.Frame("Mark")({
					Size = TypesUDim2.fromOffset(RING, RING),
					BackgroundTransparency = 1,
					RingFunction("Ring"),
					bubble(p5(p6), function(Callback)
						-- upvalues: p6 (copy)
						return Callback(p6.dragging)
					end, {
						AnchorPoint = TypesVector2.new(0.5, 1),
						Position = TypesUDim2.new(0.5, 0, 0, -SPACE)
					})
				})
			end
		end,
		hueSlider = hueSlider,
		slidersView = function()
			-- upvalues: hueSlider (copy), channelSlider (copy), TextMeasureModule (upval), p1 (copy), Runtime (copy), TypesUDim2 (copy), TypesEnum (copy)
			local list = {
				hueSlider(),
				channelSlider("Saturation", "Saturation", 100, function(p5)
					return p5.s
				end, function(p5, p6)
					return { h = p5.h, s = p6, v = p5.v }
				end),
				(channelSlider("Brightness", "Brightness", 100, function(p5)
					return p5.v
				end, function(p5, p6)
					return { h = p5.h, s = p5.s, v = p6 }
				end))
			}
			local Labels = {}
			local List = {}
			
			for _, value in list do
				local Label = value:FindFirstChild("Label")
				table.insert(Labels, Label)
				table.insert(List, TextMeasureModule.natural(p1, Label, function()
					-- upvalues: p1 (upval), Label (copy)
					local TextBoundsResult = p1.observe.TextBounds(Label)
					local LayoutUnitResult = p1.layoutUnit(Label)
					
					return p1.Compose.formula(function(Callback)
						-- upvalues: TextBoundsResult (copy), LayoutUnitResult (copy)
						return Callback(TextBoundsResult) / Callback(LayoutUnitResult)
					end)
				end))
			end
			for _, label in Labels do
				local UIPadding = label:FindFirstChildWhichIsA("UIPadding")
				local NewOffset = if UIPadding then UIPadding.PaddingLeft.Offset + UIPadding.PaddingRight.Offset else 0
				Runtime.decorate(label, {
					Size = function(Callback)
						-- upvalues: List (copy), TypesUDim2 (upval), NewOffset (copy)
						local Value = 0
						
						for _, value in List do
							local X: number = Callback(value).X
							
							if X < 1e999 then
								Value = math.max(Value, X)
							end
						end
						return TypesUDim2.fromOffset(math.ceil(Value) + NewOffset, 0)
					end
				})
			end
			return p1.column(list, {
				Name = "Sliders",
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y
			})
		end,
		opacitySlider = function()
			-- upvalues: p4 (copy), InteractiveFunction (copy), alphaStrip (copy), Held (copy), Color (copy), Canon (copy), Host (copy), TypesUDim2 (copy), RING (upval), RingFunction (copy), bubble (copy), TypesVector2 (copy), SPACE (upval), CommitFunction (copy), p2 (copy)
			local function v42()
				-- upvalues: Held (upval), Color (upval), Canon (upval)
				return function(Callback)
					-- upvalues: Held (upval), Color (upval), Canon (upval)
					return Callback(Held) or Color.toColor(Callback(Canon))
				end
			end
			
			local Opacity = p2.Slider({
				Name = "Opacity",
				label = "Opacity",
				LayoutOrder = 4,
				min = 0,
				max = 100,
				step = 1,
				value = function(Callback)
					-- upvalues: p4 (upval)
					return Callback(p4.alphaHeld) * 100
				end,
				enabled = function(p5)
					-- upvalues: InteractiveFunction (upval)
					return InteractiveFunction(p5)
				end,
				format = function(p5: number): string
					return `{math.floor(p5 + 0.5)}%`
				end,
				trackContent = alphaStrip,
				thumbContent = function(p5)
					-- upvalues: Host (upval), TypesUDim2 (upval), RING (upval), RingFunction (upval), bubble (upval), v42 (copy), TypesVector2 (upval), SPACE (upval)
					return Host.Frame("Mark")({
						Size = TypesUDim2.fromOffset(RING, RING),
						BackgroundTransparency = 1,
						RingFunction("Ring"),
						bubble(v42(p5), function(Callback)
							-- upvalues: p5 (copy)
							return Callback(p5.dragging)
						end, {
							AnchorPoint = TypesVector2.new(0.5, 1),
							Position = TypesUDim2.new(0.5, 0, 0, -SPACE)
						})
					})
				end,
				onChange = function(p5: number)
					-- upvalues: p4 (upval)
					p4.proposeAlpha(p5 / 100)
				end,
				onCommit = function()
					-- upvalues: CommitFunction (upval)
					CommitFunction()
				end
			})
			local Track = Opacity:FindFirstChild("Track", true)
			
			if Track then
				Track:SetAttribute("AccessibleLabel", "Opacity")
			end
			return Opacity
		end
	}
end