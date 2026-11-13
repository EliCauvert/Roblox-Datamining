local ReducedFunction = require("./motion").reduced
local _ = require("./input_kit")
local _ = require("./input_types")
local _ = require("./types")
local _ = require("./theme_types")
local _ = require("./control_types")
local _ = require("./input_props")
local _ = require("../vendor/compose/core")
local CloneFunction = table.clone

return function(p1, p2, p3)
	-- upvalues: CloneFunction (copy), ReducedFunction (copy)
	local Runtime = p1.runtime
	local Host = p1.Host
	local ReadFunction = p1.read
	local TypesUDim = p1.types.UDim
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local DynamicFunction = p3.dynamic
	local WritableFunction = p3.writable
	p2.Toggle = p1.construct("Toggle", function(Frame)
		-- upvalues: CloneFunction (upval), ReadFunction (copy), WritableFunction (copy), DynamicFunction (copy), p1 (copy), Host (copy), TypesVector2 (copy), TypesUDim2 (copy), TypesUDim (copy), ReducedFunction (upval), Runtime (copy), p3 (copy), TypesEnum (copy), p2 (copy)
		local CloneResult = CloneFunction(Frame)
		assert(type(ReadFunction(Frame.value)) == "boolean", "Facet.Toggle: value must be boolean")
		assert(WritableFunction(Frame.value) or Frame.onChange, "Facet.Toggle: read-only value requires onChange")
		assert(Frame.mixed == nil or (WritableFunction(Frame.mixed) or Frame.onChange), "Facet.Toggle: read-only mixed requires onChange")
		local Presentation = Frame.presentation or "switch"
		assert(Presentation == "switch" or (Presentation == "checkbox" or Presentation == "button"), "Facet.Toggle: invalid presentation")
		assert(Frame.mixed == nil or Presentation == "checkbox" and type(ReadFunction(Frame.mixed)) == "boolean", "Facet.Toggle: mixed requires a checkbox boolean source")
		assert(Frame.indicatorPosition == nil or (Frame.indicatorPosition == "leading" or Frame.indicatorPosition == "trailing"), "Facet.Toggle: invalid indicatorPosition")
		local IsPlain = Frame.appearance == "plain"
		assert(not IsPlain or Presentation ~= "button", "Facet.Toggle: the button presentation cannot be plain")
		CloneResult.value = nil
		CloneResult.mixed = nil
		CloneResult.presentation = nil
		CloneResult.onChange = nil
		CloneResult.indicatorPosition = nil
		CloneResult.row = nil
		CloneResult.hint = nil
		CloneResult.selected = if Frame.mixed == nil then Frame.value else function(p4)
			-- upvalues: ReadFunction (upval), Frame (copy)
			return ReadFunction(Frame.value, p4) or ReadFunction(Frame.mixed, p4) == true
		end
		CloneResult.ref = nil
		local Callback: (any) -> () = nil
		
		if IsPlain then
			CloneResult.selected = nil
			CloneResult.appearance = nil
		end
		function CloneResult.onActivate()
			-- upvalues: ReadFunction (upval), Frame (copy), WritableFunction (upval)
			local Inverted: boolean = if ReadFunction(Frame.mixed) then true else not ReadFunction(Frame.value)
			
			if Frame.onChange then
				Frame.onChange(Inverted)
				
				return
			end
			if WritableFunction(Frame.mixed) then
				Frame.mixed:set(false)
			end
			Frame.value:set(Inverted)
		end
		
		if Presentation ~= "button" then
			local HasRow: boolean = Frame.row ~= nil or (Frame.hint ~= nil or (Frame.icon ~= nil or Frame.trailingIcon ~= nil)) or Frame.image ~= nil
			local IsTrailing: boolean = Frame.indicatorPosition == "trailing" or Frame.indicatorPosition == nil and Frame.row ~= nil
			local HasControlSize = Frame.controlSize ~= nil
			local DynamicResult = HasControlSize and (DynamicFunction(p1.config.theme) or DynamicFunction(Frame.controlSize))
			
			local function track(p4)
				-- upvalues: HasControlSize (copy), Presentation (copy), p1 (upval), Frame (copy)
				if not HasControlSize then
					return if Presentation == "switch" then 38 else 24, 24
				elseif Presentation == "switch" then
					local NewIconSize = p1.controlSize(Frame.controlSize, "iconSize", p4) + 4
					
					return math.round(38 * NewIconSize / 24), NewIconSize
				else
					local NewIconSize = p1.controlSize(Frame.controlSize, "iconSize", p4) + p1.metric("space.xs", p4)
					
					return NewIconSize, NewIconSize
				end
			end
			
			local function _(Callback)
				-- upvalues: DynamicResult (copy)
				return if DynamicResult then Callback else Callback()
			end
			
			local _ = function(Callback)
				-- upvalues: DynamicResult (copy), DynamicFunction (upval), p1 (upval)
				return if DynamicResult or DynamicFunction(p1.config.theme) then Callback else Callback()
			end
			
			local _ = function(Callback)
				-- upvalues: track (copy), DynamicResult (copy)
				local function v90(p4)
					-- upvalues: track (upval), Callback (copy)
					local _, TrackResult2 = track(p4)
					
					return Callback(TrackResult2)
				end
				
				if DynamicResult then
					return v90
				else
					local _, TrackResult2 = track(nil)
					
					return (Callback(TrackResult2))
				end
			end
			
			local _ = function(p4): number
				-- upvalues: track (copy)
				return track(p4) + 8
			end
			
			local StyledFunction = p1.styled
			local Mark = Host.Frame("Mark")
			local config = { AnchorPoint = TypesVector2.new(0.5, 0.5) }
			local FromOffsetResult = nil
			
			if Presentation == "switch" then
				local function v28(p4)
					-- upvalues: track (copy), TypesUDim2 (upval)
					local _, TrackResult2 = track(p4)
					
					return TypesUDim2.fromOffset(TrackResult2 - 6, TrackResult2 - 6)
				end
				
				if DynamicResult then
					FromOffsetResult = v28
				else
					local _, TrackResult2 = track(nil)
					FromOffsetResult = TypesUDim2.fromOffset(TrackResult2 - 6, TrackResult2 - 6)
				end
			else
				FromOffsetResult = TypesUDim2.fromOffset(12, 12)
			end
			config.Size = FromOffsetResult
			config.Position = if Presentation == "switch" then nil else TypesUDim2.fromScale(0.5, 0.5)
			local UICornerFunction = Host.UICorner
			local t = {}
			
			local function v33(p4)
				-- upvalues: track (copy), p1 (upval), TypesUDim (upval), Presentation (copy)
				local _, TrackResult2 = track(p4)
				
				return p1.round(p4, TypesUDim.new(0, if Presentation == "switch" then (TrackResult2 - 6) / 2 else 2))
			end
			local RoundResult = nil
			
			if DynamicResult or DynamicFunction(p1.config.theme) then
				RoundResult = v33
			else
				local _, TrackResult2_1 = track(nil)
				RoundResult = p1.round(nil, TypesUDim.new(0, if Presentation == "switch" then (TrackResult2_1 - 6) / 2 else 2))
			end
			t.CornerRadius = RoundResult
			SETLIST_FALLBACK(config, 1, UICornerFunction(t))
			local ToggleMark = StyledFunction(Mark(config), "toggle-mark")
			
			if Presentation == "switch" then
				local ReducedResult = ReducedFunction(p1)
				local Control = p1.motionSpring("control")
				local SpringResult = Runtime.spring(function(p4): number
					-- upvalues: ReadFunction (upval), Frame (copy)
					return if ReadFunction(Frame.value, p4) == true then 0.7 else 0.3
				end, {
					period = Control.period,
					damping = Control.damping,
					reducedMotion = function(p4)
						-- upvalues: ReducedResult (copy)
						return ReducedResult(p4)
					end
				})
				Runtime.decorate(ToggleMark, {
					Position = function(Callback)
						-- upvalues: TypesUDim2 (upval), SpringResult (copy)
						return TypesUDim2.fromScale(Callback(SpringResult), 0.5)
					end
				})
			end
			local Object = nil
			if Presentation == "checkbox" then
				local IconFunction = p1.icon
				local v1 = "checkmark"
				local config1 = {
					Name = "Check",
					BackgroundTransparency = 1,
					Visible = false,
					AnchorPoint = TypesVector2.new(0.5, 0.5),
					Position = TypesUDim2.fromScale(0.5, 0.5)
				}
				
				local function v43(p4: number)
					-- upvalues: TypesUDim2 (upval)
					local Floored = math.floor(p4 * 2 / 3 + 0.5)
					
					return TypesUDim2.fromOffset(Floored, Floored)
				end
				
				local function v44(p4)
					-- upvalues: track (copy), v43 (copy)
					local _, TrackResult2 = track(p4)
					
					return v43(TrackResult2)
				end
				local FromOffsetResult1 = nil
				
				if DynamicResult then
					FromOffsetResult1 = v44
				else
					local _, TrackResult2_2 = track(nil)
					local Floored = math.floor(TrackResult2_2 * 2 / 3 + 0.5)
					FromOffsetResult1 = TypesUDim2.fromOffset(Floored, Floored)
				end
				config1.Size = FromOffsetResult1
				Object = IconFunction(v1, config1)
			else
				Object = nil
			end
			if Object then
				Object:AddTag("facet-toggle-check")
			end
			local StyledFunction1 = p1.styled
			local FrameFunction = Host.Frame
			
			local function v50(p4)
				-- upvalues: TypesUDim2 (upval), track (copy)
				return TypesUDim2.fromOffset(track(p4))
			end
			
			local config2 = {
				Name = "Indicator",
				Size = if DynamicResult then v50 else TypesUDim2.fromOffset(track(nil)),
				AnchorPoint = if HasRow then TypesVector2.zero else TypesVector2.new(0, 0.5)
			}
			local FromOffsetResult2 = nil
			
			if HasRow then
				FromOffsetResult2 = TypesUDim2.fromOffset(0, 0)
			elseif IsTrailing then
				FromOffsetResult2 = TypesUDim2.new(1, 8, 0.5, 0)
			else
				local function v58(p4)
					-- upvalues: TypesUDim2 (upval), track (copy)
					return TypesUDim2.new(0, -(track(p4) + 8), 0.5, 0)
				end
				
				FromOffsetResult2 = if DynamicResult then v58 else TypesUDim2.new(0, -(track(nil) + 8), 0.5, 0)
			end
			config2.Position = FromOffsetResult2
			local UICornerFunction1 = Host.UICorner
			local t1 = {}
			
			local function v57(p4)
				-- upvalues: track (copy), p1 (upval), TypesUDim (upval), Presentation (copy)
				local _, TrackResult2 = track(p4)
				
				return p1.round(p4, TypesUDim.new(0, if Presentation == "switch" then TrackResult2 / 2 else 4))
			end
			local RoundResult1 = nil
			
			if DynamicResult or DynamicFunction(p1.config.theme) then
				RoundResult1 = v57
			else
				local _, TrackResult2_3 = track(nil)
				RoundResult1 = p1.round(nil, TypesUDim.new(0, if Presentation == "switch" then TrackResult2_3 / 2 else 4))
			end
			t1.CornerRadius = RoundResult1
			config2[1] = UICornerFunction1(t1)
			config2[2] = ToggleMark
			config2[3] = Object
			local ToggleIndicator = StyledFunction1(FrameFunction(config2), "toggle-indicator")
			
			local function updateIndicator(p4)
				-- upvalues: ReadFunction (upval), Frame (copy), Presentation (copy), ToggleMark (copy), TypesUDim2 (upval), Object (copy), ToggleIndicator (copy)
				local ReadResult = ReadFunction(Frame.value, p4)
				local IsReadResult = ReadFunction(Frame.mixed, p4) == true
				
				if Presentation ~= "switch" then
					ToggleMark.Size = TypesUDim2.fromOffset(12, 4)
					ToggleMark.Visible = IsReadResult
					
					if Object then
						Object.Visible = ReadResult == true and not IsReadResult
					end
				end
				ToggleIndicator:SetAttribute("selected", ReadResult or IsReadResult)
				
				if ReadResult or IsReadResult then
					ToggleIndicator:AddTag("facet-toggle-on")
					
					return
				end
				if ToggleIndicator:HasTag("facet-toggle-on") then
					ToggleIndicator:RemoveTag("facet-toggle-on")
				end
			end
			
			ToggleIndicator:AddTag(if Presentation == "switch" then "facet-toggle-switch" else "facet-toggle-checkbox")
			
			if DynamicFunction(Frame.value) or DynamicFunction(Frame.mixed) then
				p1.Compose.watch(updateIndicator)
			else
				updateIndicator()
			end
			if Presentation == "switch" then
				p1.skin(ToggleIndicator, "toggleTrack", { selected = CloneResult.selected })
				p1.skin(ToggleMark, "toggleKnob", { selected = CloneResult.selected })
			end
			if HasRow then
				CloneResult.Text = ""
				local Row = Frame.row or {}
				local ReadResult = ReadFunction(Frame.textSize)
				assert(ReadResult == nil or (p3.typeRoles[ReadResult] or type(ReadResult) == "number"), "Facet.Toggle: textSize must be a type role or a positive number")
				local Title = p1.text({
					Name = "Title",
					Text = Row.title or (Frame.label or ""),
					TextSize = if type(ReadResult) == "number" then ReadResult else nil,
					AutomaticSize = TypesEnum.AutomaticSize.XY
				}, nil, if type(ReadResult) == "string" then ReadResult else nil)
				CloneResult.textSize = nil
				local Captions = { Title }
				local HasDescription: boolean = Row.description ~= nil or Frame.hint ~= nil
				
				if HasDescription then
					table.insert(Captions, p1.text({
						Name = "Description",
						Text = Row.description or Frame.hint,
						Size = if Frame.row then TypesUDim2.fromScale(1, 0) else TypesUDim2.fromOffset(0, 0),
						AutomaticSize = if Frame.row then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.XY,
						TextWrapped = Frame.row ~= nil
					}))
				end
				local Icon = Frame.icon or Row.icon
				CloneResult.icon = nil
				local List = if Icon then { p1.icon(Icon, { Name = "LeadingIcon" }) } else {}
				
				if Frame.row or Frame.hint then
					if not IsTrailing then
						table.insert(List, ToggleIndicator)
					end
					local ListRowResult2, ListRowResult3
					CloneResult[#CloneResult + 1], ListRowResult2, ListRowResult3 = p1.listRow({
						leading = List,
						captions = Captions,
						trailing = if IsTrailing then { ToggleIndicator } else nil,
						described = HasDescription,
						controlSize = Frame.controlSize
					})
					
					if Frame.Size == nil then
						CloneResult.Size = ListRowResult2
						CloneResult.AutomaticSize = Frame.AutomaticSize or TypesEnum.AutomaticSize.Y
					end
					Callback = ListRowResult3
				else
					local ColumnResult = if HasDescription then p1.column(Captions) else Title
					table.insert(List, if IsTrailing then ColumnResult else ToggleIndicator)
					table.insert(List, if IsTrailing then ToggleIndicator else ColumnResult)
					CloneResult[#CloneResult + 1] = p1.row(List)
				end
			else
				CloneResult.Text = Frame.Text or (Frame.label or "")
				CloneResult.TextXAlignment = Frame.TextXAlignment or TypesEnum.TextXAlignment.Left
				local DynamicResult1 = DynamicFunction(p1.config.theme) or (DynamicFunction(Frame.controlSize) or DynamicResult)
				
				local _ = function(p4)
					-- upvalues: ReadFunction (upval), p1 (upval), IsTrailing (copy), track (copy), TypesUDim (upval), DynamicResult1 (copy)
					local function amount(p5)
						-- upvalues: ReadFunction (upval), p1 (upval), p4 (copy), IsTrailing (upval), track (upval), TypesUDim (upval)
						local v2 = ReadFunction(p1.config.theme, p5)
						local Control = v2 and (v2.chrome and v2.chrome.control)
						local ContentInsets = if Control then Control.contentInsets or {} else {}
						local Left = (if p4 == "left" then ContentInsets.left elseif p4 == "right" then ContentInsets.right elseif p4 == "top" then ContentInsets.top else ContentInsets.bottom) or 0
						
						if IsTrailing and p4 == "right" or not IsTrailing and p4 == "left" then
							Left += track(p5) + 8
						end
						return TypesUDim.new(0, Left)
					end
					
					return if DynamicResult1 then amount else amount()
				end
				
				local t2 = {}
				
				local _ = function(p4, Key)
					-- upvalues: ReadFunction (upval), p1 (upval), IsTrailing (copy), track (copy), TypesUDim (upval), DynamicResult1 (copy), t2 (copy)
					local function amount(p5)
						-- upvalues: ReadFunction (upval), p1 (upval), p4 (copy), IsTrailing (upval), track (upval), TypesUDim (upval)
						local v2 = ReadFunction(p1.config.theme, p5)
						local Control = v2 and (v2.chrome and v2.chrome.control)
						local ContentInsets = if Control then Control.contentInsets or {} else {}
						local Left = (if p4 == "left" then ContentInsets.left elseif p4 == "right" then ContentInsets.right elseif p4 == "top" then ContentInsets.top else ContentInsets.bottom) or 0
						
						if IsTrailing and p4 == "right" or not IsTrailing and p4 == "left" then
							Left += track(p5) + 8
						end
						return TypesUDim.new(0, Left)
					end
					
					local Amount = if DynamicResult1 then amount else amount()
					
					if DynamicResult1 or Amount.Offset ~= 0 then
						t2[Key] = Amount
					end
				end
				
				local v2 = "left"
				
				local function amount(p4)
					-- upvalues: ReadFunction (upval), p1 (upval), v2 (copy), IsTrailing (copy), track (copy), TypesUDim (upval)
					local v3 = ReadFunction(p1.config.theme, p4)
					local Control = v3 and (v3.chrome and v3.chrome.control)
					local ContentInsets = if Control then Control.contentInsets or {} else {}
					local Left = (if v2 == "left" then ContentInsets.left elseif v2 == "right" then ContentInsets.right elseif v2 == "top" then ContentInsets.top else ContentInsets.bottom) or 0
					
					if IsTrailing and v2 == "right" or not IsTrailing and v2 == "left" then
						Left += track(p4) + 8
					end
					return TypesUDim.new(0, Left)
				end
				
				local Amount1 = if DynamicResult1 then amount else amount()
				
				if DynamicResult1 or Amount1.Offset ~= 0 then
					t2.PaddingLeft = Amount1
				end
				local v3 = "right"
				
				local function amount1(p4)
					-- upvalues: ReadFunction (upval), p1 (upval), v3 (copy), IsTrailing (copy), track (copy), TypesUDim (upval)
					local v4 = ReadFunction(p1.config.theme, p4)
					local Control = v4 and (v4.chrome and v4.chrome.control)
					local ContentInsets = if Control then Control.contentInsets or {} else {}
					local Left = (if v3 == "left" then ContentInsets.left elseif v3 == "right" then ContentInsets.right elseif v3 == "top" then ContentInsets.top else ContentInsets.bottom) or 0
					
					if IsTrailing and v3 == "right" or not IsTrailing and v3 == "left" then
						Left += track(p4) + 8
					end
					return TypesUDim.new(0, Left)
				end
				
				local Amount2 = if DynamicResult1 then amount1 else amount1()
				
				if DynamicResult1 or Amount2.Offset ~= 0 then
					t2.PaddingRight = Amount2
				end
				local v4 = "top"
				
				local function amount2(p4)
					-- upvalues: ReadFunction (upval), p1 (upval), v4 (copy), IsTrailing (copy), track (copy), TypesUDim (upval)
					local v5 = ReadFunction(p1.config.theme, p4)
					local Control = v5 and (v5.chrome and v5.chrome.control)
					local ContentInsets = if Control then Control.contentInsets or {} else {}
					local Left = (if v4 == "left" then ContentInsets.left elseif v4 == "right" then ContentInsets.right elseif v4 == "top" then ContentInsets.top else ContentInsets.bottom) or 0
					
					if IsTrailing and v4 == "right" or not IsTrailing and v4 == "left" then
						Left += track(p4) + 8
					end
					return TypesUDim.new(0, Left)
				end
				
				local Amount3 = if DynamicResult1 then amount2 else amount2()
				
				if DynamicResult1 or Amount3.Offset ~= 0 then
					t2.PaddingTop = Amount3
				end
				local v5 = "bottom"
				
				local function amount3(p4)
					-- upvalues: ReadFunction (upval), p1 (upval), v5 (copy), IsTrailing (copy), track (copy), TypesUDim (upval)
					local v6 = ReadFunction(p1.config.theme, p4)
					local Control = v6 and (v6.chrome and v6.chrome.control)
					local ContentInsets = if Control then Control.contentInsets or {} else {}
					local Left = (if v5 == "left" then ContentInsets.left elseif v5 == "right" then ContentInsets.right elseif v5 == "top" then ContentInsets.top else ContentInsets.bottom) or 0
					
					if IsTrailing and v5 == "right" or not IsTrailing and v5 == "left" then
						Left += track(p4) + 8
					end
					return TypesUDim.new(0, Left)
				end
				
				local Amount = if DynamicResult1 then amount3 else amount3()
				
				if DynamicResult1 or Amount.Offset ~= 0 then
					t2.PaddingBottom = Amount
				end
				CloneResult[#CloneResult + 1] = Host.UIPadding(t2)
				CloneResult[#CloneResult + 1] = ToggleIndicator
			end
		end
		if Frame.haptic == nil then
			CloneResult.haptic = true
		end
		if Presentation ~= "button" then
			p3.unskinned[CloneResult] = true
		end
		local Toggle = p1.styled(p2.Button(CloneResult), "toggle")
		
		if Callback then
			Callback(Toggle)
		end
		if Presentation ~= "button" then
			Toggle:AddTag("facet-toggle-row")
			
			if IsPlain then
				Toggle:AddTag("facet-toggle-plain")
				
				return Toggle
			end
			if Frame.row ~= nil or Frame.hint ~= nil or Frame.icon ~= nil then
				Toggle:AddTag("facet-toggle-settings")
			end
		end
		return Toggle
	end)
end