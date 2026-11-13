local _ = require("./control_types")
local MotionModule = require("./motion")
local _ = require("./collection_reorder")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./collection_types")
local _ = require("./collection_table_metrics")

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: MotionModule (copy)
	local Host = p1.Host
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local PreferredInput = p6.preferredInput
	
	return p1.Compose.show(p6.toolbarShown, function()
		-- upvalues: Runtime (copy), ReadFunction (copy), p4 (copy), p1 (copy), MotionModule (upval), p2 (copy), TypesVector2 (copy), TypesUDim2 (copy), TypesEnum (copy), Host (copy), p3 (copy), PreferredInput (copy), p5 (copy), p6 (copy)
		local TweenResult = Runtime.tween(function(p7): number
			-- upvalues: ReadFunction (upval), p4 (upval)
			return if ReadFunction(p4, p7) then 1 else 0
		end, {
			seconds = function(p7)
				-- upvalues: p1 (upval), ReadFunction (upval), p4 (upval)
				local Reveal = p1.motionTiming("reveal", p7)
				
				return if ReadFunction(p4, p7) then Reveal.enter else Reveal.exit
			end,
			ease = p1.motionEase("fade"),
			reducedMotion = MotionModule.reduced(p1)
		})
		
		local function _(Callback): number
			-- upvalues: TweenResult (copy)
			return (math.clamp(Callback(TweenResult), 0, 1))
		end
		
		local Object = p2.Button("Edit")({
			label = function(p7): string
				-- upvalues: ReadFunction (upval), p4 (upval)
				return if ReadFunction(p4, p7) then "Done" else "Edit"
			end,
			AnchorPoint = TypesVector2.new(1, 0),
			Position = TypesUDim2.fromScale(1, 0),
			Size = TypesUDim2.new(0, 0, 1, 0),
			AutomaticSize = TypesEnum.AutomaticSize.X,
			onActivate = function()
				-- upvalues: p4 (upval)
				p4:set(not p4:peek())
			end
		})
		local FontFaceResult = p1.observeStyled.FontFace(Object)
		local TextSizeResult = p1.observeStyled.TextSize(Object)
		Runtime.decorate(Object, { TextTransparency = 1 })
		
		local function hideLabel(Label)
			if Label:IsA("TextLabel") and (Label.Name == "Label" or Label.Name == "Title") then
				Label.TextTransparency = 1
			end
		end
		
		for _, Label in Object:GetDescendants() do
			if Label:IsA("TextLabel") and (Label.Name == "Label" or Label.Name == "Title") then
				Label.TextTransparency = 1
			end
		end
		Runtime.connect(Object, "DescendantAdded", hideLabel)
		
		local function caption(Text)
			-- upvalues: p1 (upval), FontFaceResult (copy), TextSizeResult (copy), Object (copy), TypesEnum (upval), TweenResult (copy), TypesUDim2 (upval)
			return p1.styled(p1.text({
				Interactable = false,
				Name = Text .. "Caption",
				Text = Text,
				FontFace = FontFaceResult,
				TextSize = TextSizeResult,
				TextColor3 = p1.observeStyled.TextColor3(Object),
				TextXAlignment = TypesEnum.TextXAlignment.Center,
				TextTransparency = function(Callback): number
					-- upvalues: Text (copy), TweenResult (upval)
					return if Text == "Edit" then math.clamp(Callback(TweenResult), 0, 1) else 1 - math.clamp(Callback(TweenResult), 0, 1)
				end,
				Size = TypesUDim2.fromScale(1, 1),
				AutomaticSize = TypesEnum.AutomaticSize.None
			}), "button-caption")
		end
		
		Runtime.mountFragment(function()
			-- upvalues: caption (copy)
			return { caption("Edit"), caption("Done") }
		end, Object)
		
		local function reserve(Name)
			-- upvalues: p1 (upval), FontFaceResult (copy), TextSizeResult (copy), TypesEnum (upval)
			return p1.text({
				TextTransparency = 1,
				Name = Name,
				Text = Name,
				FontFace = FontFaceResult,
				TextSize = TextSizeResult,
				AutomaticSize = TypesEnum.AutomaticSize.XY
			})
		end
		
		Runtime.mount(function()
			-- upvalues: Host (upval), TypesEnum (upval), p1 (upval), FontFaceResult (copy), TextSizeResult (copy), reserve (copy)
			return Host.Frame({
				Name = "WidthReserve",
				BackgroundTransparency = 1,
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				p1.text({
					Name = "Edit",
					Text = "Edit",
					TextTransparency = 1,
					FontFace = FontFaceResult,
					TextSize = TextSizeResult,
					AutomaticSize = TypesEnum.AutomaticSize.XY
				}),
				reserve("Done")
			})
		end, Object)
		local List = {}
		
		if p3.deletable then
			table.insert(List, "X Delete")
		end
		if p3.reorderable then
			table.insert(List, "L1 / R1 Move")
		end
		local _ = function(Callback): boolean
			-- upvalues: PreferredInput (upval), TypesEnum (upval)
			return PreferredInput ~= nil and Callback(PreferredInput) == TypesEnum.PreferredInput.Gamepad
		end
		
		local v1 = if p3.deletable and p5 then p2.Button("DeleteSelected")({
			label = "Delete",
			role = "destructive",
			Size = TypesUDim2.new(0, 0, 1, 0),
			AutomaticSize = TypesEnum.AutomaticSize.X,
			Visible = function(Callback): boolean
				-- upvalues: ReadFunction (upval), p4 (upval), TweenResult (copy), PreferredInput (upval), TypesEnum (upval)
				return if ReadFunction(p4, Callback) == true then not (PreferredInput ~= nil and Callback(PreferredInput) == TypesEnum.PreferredInput.Gamepad) else math.clamp(Callback(TweenResult), 0, 1) > 0 and not (PreferredInput ~= nil and Callback(PreferredInput) == TypesEnum.PreferredInput.Gamepad)
			end,
			enabled = function(p7)
				-- upvalues: ReadFunction (upval), p4 (upval), p5 (copy)
				return ReadFunction(p4, p7) == true and p5.canDeleteSelected(p7)
			end,
			onActivate = p5.deleteSelected
		}) else nil
		
		return Host.Frame({
			Name = "Toolbar",
			BackgroundTransparency = 1,
			Size = function(Callback)
				-- upvalues: TypesUDim2 (upval), p6 (upval), p1 (upval)
				return TypesUDim2.new(1, 0, 0, Callback(p6.toolbarHeight) - p1.metric("space.s", Callback))
			end,
			Object,
			p1.styled(p1.text({
				Name = "PadHints",
				Text = table.concat(List, " · "),
				AnchorPoint = TypesVector2.new(0, 0.5),
				Position = TypesUDim2.fromScale(0, 0.5),
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				Visible = function(Callback): boolean
					-- upvalues: ReadFunction (upval), p4 (upval), PreferredInput (upval), TypesEnum (upval)
					return ReadFunction(p4, Callback) == true and (PreferredInput ~= nil and Callback(PreferredInput) == TypesEnum.PreferredInput.Gamepad)
				end
			}), "secondary"),
			if v1 then p1.fade({
				Name = "DeleteFade",
				BackgroundTransparency = 1,
				Size = TypesUDim2.new(0, 0, 1, 0),
				AutomaticSize = TypesEnum.AutomaticSize.X,
				GroupTransparency = function(Callback): number
					-- upvalues: TweenResult (copy)
					return 1 - math.clamp(Callback(TweenResult), 0, 1)
				end,
				v1
			}) else nil
		})
	end)
end