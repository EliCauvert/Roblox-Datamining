local _ = require("./types")
local _ = require("./engine_types")
local _ = require("./media_types")
local _ = require("../vendor/compose/core")
local _ = require("./control_types")
local _ = require("./media_props")

return function(p1, p2)
	local Host = p1.Host
	local Runtime = p1.runtime
	local Compose = p1.Compose
	local Types = p1.types
	local ReadFunction = p1.read
	local TypesEnum = Types.Enum
	local TypesUDim2 = Types.UDim2
	local TypesUDim = Types.UDim
	local TypesVector2 = Types.Vector2
	local MetricFunction = p1.metric
	local ControlSizeFunction = p1.controlSize
	
	local function initials(Name): string
		local Text = nil
		local Text1 = ""
		local Count = 0
		
		for i in string.gmatch(Name or "", "%S+") do
			Text = Text or i
			Text1 = i
			Count += 1
		end
		local function _(Text: string): string
			return (string.sub(Text, 1, (utf8.offset(Text, 2) or #Text + 1) - 1))
		end
		
		return if Text == nil then "" elseif Count == 1 then string.sub(Text, 1, (utf8.offset(Text, 2) or #Text + 1) - 1) else string.sub(Text, 1, (utf8.offset(Text, 2) or #Text + 1) - 1) .. string.sub(Text1, 1, (utf8.offset(Text1, 2) or #Text1 + 1) - 1)
	end
	
	p2.Avatar = p1.construct("Avatar", function(p3)
		-- upvalues: ReadFunction (copy), ControlSizeFunction (copy), p1 (copy), TypesUDim2 (copy), Host (copy), MetricFunction (copy), Runtime (copy), TypesEnum (copy), Compose (copy), initials (copy), TypesVector2 (copy), p2 (copy)
		assert(p3.form == nil or (p3.form == "standard" or p3.form == "icon"), "Facet Avatar invalid form")
		
		local function _(p4)
			-- upvalues: ReadFunction (upval), p3 (copy), ControlSizeFunction (upval)
			return ReadFunction(p3.diameter, p4) or ControlSizeFunction(p3.controlSize, if p3.form == "icon" then "iconSize" else "height", p4)
		end
		
		local PropsResult = p1.props(p3, {
			"name", "image", "userId", "presence", "presenceLabel", "diameter",
			"onActivate", "form", "controlSize", "backplate", "presenceMark", "loader",
			"onStatus", "resource", "icon", "background"
		}, {
			Size = function(p4)
				-- upvalues: ReadFunction (upval), p3 (copy), ControlSizeFunction (upval), TypesUDim2 (upval)
				local ReadResult = ReadFunction(p3.diameter, p4) or ControlSizeFunction(p3.controlSize, if p3.form == "icon" then "iconSize" else "height", p4)
				
				return TypesUDim2.fromOffset(ReadResult, ReadResult)
			end,
			Text = "",
			AutoButtonColor = false,
			Selectable = p3.onActivate ~= nil,
			Interactable = p3.onActivate ~= nil,
			Host.UICorner({ CornerRadius = p1.round })
		})
		local OnActivateFunction = p3.onActivate
		
		if OnActivateFunction then
			function PropsResult.Activated()
				-- upvalues: OnActivateFunction (copy)
				OnActivateFunction()
			end
		end
		assert(p3.background == nil or table.find({
			"surface", "surfaceStrong", "control", "contentStrong", "accent", "success",
			"warning", "danger"
		}, p3.background) ~= nil, "Facet Avatar background must be a palette role such as accent or success")
		assert(p3.icon == nil or not (p3.image or (p3.userId or p3.resource)), "Facet Avatar takes one face: image, userId, resource or icon")
		local Avatar = p1.styled(Host.TextButton(PropsResult), "avatar")
		
		local function ringWidth(p4)
			-- upvalues: MetricFunction (upval)
			return 2 * MetricFunction("strokes.hairline", p4)
		end
		
		if OnActivateFunction then
			local GuiStateResult = p1.observe.GuiState(Avatar)
			Runtime.mountFragment(function()
				-- upvalues: Host (upval), TypesEnum (upval), ringWidth (copy), GuiStateResult (copy)
				local HoverRing = Host.UIStroke({
					Name = "HoverRing",
					ApplyStrokeMode = TypesEnum.ApplyStrokeMode.Border,
					BorderStrokePosition = TypesEnum.BorderStrokePosition.Inner,
					Thickness = ringWidth,
					Transparency = function(Callback): number
						-- upvalues: GuiStateResult (upval), TypesEnum (upval)
						return if Callback(GuiStateResult) == TypesEnum.GuiState.Hover then 0 else 1
					end
				})
				HoverRing:AddTag("facet-avatar-hover")
				
				return { HoverRing }
			end, Avatar)
		end
		if p3.backplate then
			p1.styled(Avatar, "accent")
		end
		if p3.background then
			Avatar:AddTag("facet-avatar-background-" .. p3.background)
		end
		local function facts(p4)
			-- upvalues: ReadFunction (upval), p3 (copy)
			local ReadResult = ReadFunction(p3.name, p4)
			local ReadResult1 = ReadFunction(p3.presence, p4)
			assert(type(ReadResult) == "string" and ReadResult ~= "", "Facet Avatar name must be nonempty")
			assert(ReadResult1 == nil or ({
				online = true,
				away = true,
				busy = true,
				offline = true,
				inExperience = true
			})[ReadResult1], "Facet Avatar invalid presence")
			
			return {
				name = ReadResult,
				presence = ReadResult1,
				label = if ReadResult1 then ReadResult .. ", " .. (ReadFunction(p3.presenceLabel, p4) or ReadResult1) else ReadResult
			}
		end
		
		Runtime.decorate(Avatar, {
			Attributes = {
				AccessibleLabel = function(p4)
					-- upvalues: facts (copy)
					return facts(p4).label
				end
			}
		})
		local CellResult = Compose.cell(false)
		Runtime.mount(function()
			-- upvalues: p1 (upval), TypesEnum (upval), CellResult (copy), ReadFunction (upval), p3 (copy), TypesUDim2 (upval), initials (upval), facts (copy), Host (upval), ControlSizeFunction (upval)
			return p1.text({
				Name = "Initials",
				AutomaticSize = TypesEnum.AutomaticSize.None,
				Visible = function(Callback): boolean
					-- upvalues: CellResult (upval), ReadFunction (upval), p3 (upval)
					return not Callback(CellResult) and ReadFunction(p3.icon, Callback) == nil
				end,
				Size = TypesUDim2.fromScale(1, 1),
				Text = function(p4)
					-- upvalues: initials (upval), facts (upval)
					return (initials(facts(p4).name))
				end,
				TextScaled = true,
				TextXAlignment = TypesEnum.TextXAlignment.Center,
				TextYAlignment = TypesEnum.TextYAlignment.Center,
				Host.UITextSizeConstraint({
					MaxTextSize = function(p4): number
						-- upvalues: ReadFunction (upval), p3 (upval), ControlSizeFunction (upval)
						return (math.max(8, (math.floor((ReadFunction(p3.diameter, p4) or ControlSizeFunction(p3.controlSize, if p3.form == "icon" then "iconSize" else "height", p4)) * 0.4 + 0.5))))
					end
				})
			})
		end, Avatar)
		
		if p3.icon ~= nil then
			Runtime.mount(function()
				-- upvalues: p1 (upval), ReadFunction (upval), p3 (copy), TypesVector2 (upval), TypesUDim2 (upval)
				return p1.icon(function(p4)
					-- upvalues: ReadFunction (upval), p3 (upval)
					return ReadFunction(p3.icon, p4) or ""
				end, {
					Name = "Face",
					AnchorPoint = TypesVector2.new(0.5, 0.5),
					Position = TypesUDim2.fromScale(0.5, 0.5),
					Size = TypesUDim2.fromScale(0.6, 0.6)
				})
			end, Avatar)
		end
		if p3.presence then
			Runtime.mount(function()
				-- upvalues: Host (upval), TypesUDim2 (upval), facts (copy), p1 (upval), TypesEnum (upval), ringWidth (copy), TypesVector2 (upval), MetricFunction (upval)
				return Host.Frame("PresenceRing")({
					BackgroundTransparency = 1,
					Size = TypesUDim2.fromScale(1, 1),
					ZIndex = 2,
					Visible = function(p4): boolean
						-- upvalues: facts (upval)
						return facts(p4).presence == "inExperience"
					end,
					Host.UICorner({ CornerRadius = p1.round }),
					p1.styled(Host.UIStroke({
						ApplyStrokeMode = TypesEnum.ApplyStrokeMode.Border,
						BorderStrokePosition = TypesEnum.BorderStrokePosition.Inner,
						Thickness = ringWidth
					}), "avatar-ring"),
					Host.Frame("Gap")({
						BackgroundTransparency = 1,
						AnchorPoint = TypesVector2.new(0.5, 0.5),
						Position = TypesUDim2.fromScale(0.5, 0.5),
						Size = function(p4)
							-- upvalues: MetricFunction (upval), TypesUDim2 (upval)
							local ScaledStrokesHairline = 2 * MetricFunction("strokes.hairline", p4) * 2
							
							return TypesUDim2.new(1, -ScaledStrokesHairline, 1, -ScaledStrokesHairline)
						end,
						Host.UICorner({ CornerRadius = p1.round }),
						p1.styled(Host.UIStroke({
							ApplyStrokeMode = TypesEnum.ApplyStrokeMode.Border,
							BorderStrokePosition = TypesEnum.BorderStrokePosition.Inner,
							Thickness = ringWidth
						}), "avatar-ring-gap")
					})
				})
			end, Avatar)
		end
		local Image = p3.image
		local UserId = p3.userId
		local OnStatusFunction = p3.onStatus
		
		if Image or (UserId or p3.resource) then
			Runtime.mount(function()
				-- upvalues: Host (upval), p1 (upval), p3 (copy), CellResult (copy), OnStatusFunction (copy), TypesUDim2 (upval), Image (copy), ReadFunction (upval), UserId (copy), p2 (upval)
				return p2.AsyncImage({
					imageProperties = { Host.UICorner({ CornerRadius = p1.round }) },
					Name = "Portrait",
					loader = p3.loader,
					onStatus = function(p4, p5)
						-- upvalues: CellResult (upval), OnStatusFunction (upval)
						CellResult:set(p4 == "ready")
						
						if OnStatusFunction then
							OnStatusFunction(p4, p5)
						end
					end,
					resource = p3.resource,
					Size = TypesUDim2.fromScale(1, 1),
					image = function(p4)
						-- upvalues: Image (upval), ReadFunction (upval), UserId (upval)
						return if Image then ReadFunction(Image, p4) else "rbxthumb://type=AvatarHeadShot&id=" .. tostring(ReadFunction(UserId, p4)) .. "&w=150&h=150"
					end,
					placeholder = function(_)
						-- upvalues: Host (upval), TypesUDim2 (upval)
						return Host.Frame({
							BackgroundTransparency = 1,
							Size = TypesUDim2.fromScale(1, 1)
						})
					end,
					Host.UICorner({ CornerRadius = p1.round })
				})
			end, Avatar)
		end
		local Presence = p3.presence
		
		if Presence and (p3.presenceMark ~= false and p3.form ~= "icon") then
			local config = {
				online = "dot",
				away = "dash",
				busy = "square",
				offline = "ring"
			}
			local config1 = {
				online = "success",
				away = "warning",
				busy = "error",
				offline = "neutral"
			}
			Runtime.mount(function()
				-- upvalues: p2 (upval), facts (copy), config (copy), TypesVector2 (upval), TypesUDim2 (upval), ReadFunction (upval), Presence (copy), config1 (copy)
				return p2.StatusIndicator("Presence")({
					diameter = 12,
					cutout = true,
					Visible = function(p4): boolean
						-- upvalues: facts (upval)
						local Presence = facts(p4).presence
						
						return Presence ~= nil and Presence ~= "inExperience"
					end,
					form = function(p4)
						-- upvalues: facts (upval), config (upval)
						local Presence = facts(p4).presence
						
						return Presence and config[Presence] or "dot"
					end,
					AnchorPoint = TypesVector2.new(1, 1),
					Position = TypesUDim2.fromScale(1, 1),
					status = function(p4)
						-- upvalues: ReadFunction (upval), Presence (upval), config1 (upval)
						local ReadResult = ReadFunction(Presence, p4)
						
						return ReadResult and config1[ReadResult] or "neutral"
					end
				})
			end, Avatar)
		end
		return Avatar
	end)
	p2.AvatarGroup = p1.construct("AvatarGroup", function(p3)
		-- upvalues: Compose (copy), ReadFunction (copy), ControlSizeFunction (copy), p1 (copy), TypesUDim2 (copy), TypesEnum (copy), Host (copy), TypesUDim (copy), p2 (copy), TypesVector2 (copy)
		local FormulaResult = Compose.formula(function(p4)
			-- upvalues: ReadFunction (upval), p3 (copy)
			local ReadResult = ReadFunction(p3.items, p4)
			assert(type(ReadResult) == "table", "Facet AvatarGroup items must be an array")
			local t = {}
			local Count = 0
			
			for i, value in ReadResult do
				assert(type(i) == "number" and (i >= 1 and i % 1 == 0) and i <= #ReadResult, "Facet AvatarGroup items must be dense")
				assert(type(value) == "table" and type(value.id) == "string" and (value.id ~= "" and not t[value.id]), "Facet AvatarGroup needs unique nonempty ids")
				assert(type(value.name) == "string" and value.name ~= "", "Facet AvatarGroup needs member names")
				t[value.id] = true
				Count += 1
			end
			assert(Count == #ReadResult, "Facet AvatarGroup items must be dense")
			
			return ReadResult
		end)
		assert(p3.layout == nil or (p3.layout == "stacked" or p3.layout == "spread"), "Facet AvatarGroup invalid layout")
		assert(p3.overflow == nil or (p3.overflow == "count" or p3.overflow == "ellipsis"), "Facet AvatarGroup invalid overflow")
		assert(p3.form == nil or (p3.form == "standard" or p3.form == "icon"), "Facet AvatarGroup invalid form")
		assert(p3.onOverflow == nil or type(p3.onOverflow) == "function", "Facet AvatarGroup onOverflow must be a function")
		local Max = p3.max or 4
		assert(Max >= 1 and Max % 1 == 0, "Facet AvatarGroup max must be positive")
		
		local function Diameter(p5)
			-- upvalues: ReadFunction (upval), p3 (copy), ControlSizeFunction (upval)
			return ReadFunction(p3.diameter, p5) or ControlSizeFunction(p3.controlSize, if p3.form == "icon" then "iconSize" else "height", p5)
		end
		
		local v1: number = if p3.layout == "spread" then 8 else -10
		local UchFloor = p1.touchFloor()
		local PropsResult = p1.props(p3, {
			"items", "max", "diameter", "layout", "onOverflow", "overflow", "controlSize",
			"form", "overflowLabel"
		}, {
			BackgroundTransparency = 1,
			Size = function(p5)
				-- upvalues: TypesUDim2 (upval), ReadFunction (upval), p3 (copy), ControlSizeFunction (upval)
				return TypesUDim2.fromOffset(0, ReadFunction(p3.diameter, p5) or ControlSizeFunction(p3.controlSize, if p3.form == "icon" then "iconSize" else "height", p5))
			end,
			AutomaticSize = TypesEnum.AutomaticSize.X,
			Host.UIListLayout({
				FillDirection = TypesEnum.FillDirection.Horizontal,
				Padding = TypesUDim.new(0, v1),
				SortOrder = TypesEnum.SortOrder.LayoutOrder
			})
		})
		PropsResult[#PropsResult + 1] = Compose.keyed({
			from = function(Callback)
				-- upvalues: FormulaResult (copy), Max (copy)
				local CallbackResult = Callback(FormulaResult)
				local List = {}
				
				for i = 1, math.min(#CallbackResult, Max) do
					table.insert(List, CallbackResult[i])
				end
				return List
			end,
			key = function(p5)
				return if p5.resource then p5.id .. "\0" .. tostring(p5.resource) else p5.id
			end,
			render = function(p5, LayoutOrder)
				-- upvalues: p2 (upval), Diameter (copy), p3 (copy)
				return p2.Avatar({
					resource = p5:peek().resource,
					Name = function(Callback)
						-- upvalues: p5 (copy)
						return Callback(p5).id
					end,
					name = function(Callback)
						-- upvalues: p5 (copy)
						return Callback(p5).name
					end,
					image = if p5:peek().icon then nil else function(Callback)
						-- upvalues: p5 (copy)
						local CallbackResult = Callback(p5)
						local Image = CallbackResult.image
						
						if not Image then
							if CallbackResult.userId then
								return "rbxthumb://type=AvatarHeadShot&id=" .. tostring(CallbackResult.userId) .. "&w=150&h=150"
							end
							Image = ""
						end
						return Image
					end,
					presence = function(Callback)
						-- upvalues: p5 (copy)
						return Callback(p5).presence
					end,
					icon = if p5:peek().icon then function(Callback)
						-- upvalues: p5 (copy)
						return Callback(p5).icon
					end else nil,
					diameter = Diameter,
					presenceMark = p3.layout == "spread",
					LayoutOrder = LayoutOrder
				})
			end
		})
		PropsResult[#PropsResult + 1] = Compose.show(function(Callback): boolean
			-- upvalues: FormulaResult (copy), Max (copy)
			return Max < #Callback(FormulaResult)
		end, function()
			-- upvalues: p1 (upval), Host (upval), ReadFunction (upval), p3 (copy), FormulaResult (copy), Max (copy), ControlSizeFunction (upval), TypesUDim2 (upval), UchFloor (copy), TypesVector2 (upval)
			return p1.styled(Host.TextButton("Overflow")({
				Attributes = {
					AccessibleLabel = function(Callback)
						-- upvalues: ReadFunction (upval), p3 (upval), FormulaResult (upval), Max (upval)
						local ReadResult = ReadFunction(p3.overflowLabel, Callback)
						assert(ReadResult == nil or type(ReadResult) == "string", "Facet AvatarGroup overflowLabel must be a string")
						
						return ReadResult or tostring(#Callback(FormulaResult) - Max) .. " more players"
					end
				},
				Size = function(p5)
					-- upvalues: ReadFunction (upval), p3 (upval), ControlSizeFunction (upval), TypesUDim2 (upval)
					local ReadResult = ReadFunction(p3.diameter, p5) or ControlSizeFunction(p3.controlSize, if p3.form == "icon" then "iconSize" else "height", p5)
					
					return TypesUDim2.fromOffset(ReadResult, ReadResult)
				end,
				LayoutOrder = Max + 2,
				Text = function(Callback): string
					-- upvalues: p3 (upval), FormulaResult (upval), Max (upval)
					return if p3.overflow == "ellipsis" then "…" else "+" .. tostring(#Callback(FormulaResult) - Max)
				end,
				TextScaled = true,
				Selectable = p3.onOverflow ~= nil,
				AutoButtonColor = false,
				Activated = function()
					-- upvalues: p3 (upval)
					local OnOverflowFunction: () -> () = p3.onOverflow
					
					if OnOverflowFunction then
						OnOverflowFunction()
					end
				end,
				Host.UICorner({ CornerRadius = p1.round }),
				Host.UITextSizeConstraint({
					MaxTextSize = function(p5): number
						-- upvalues: ReadFunction (upval), p3 (upval), ControlSizeFunction (upval)
						return (math.max(8, (math.floor((ReadFunction(p3.diameter, p5) or ControlSizeFunction(p3.controlSize, if p3.form == "icon" then "iconSize" else "height", p5)) * 0.4 + 0.5))))
					end
				}),
				Host.UISizeConstraint({
					MinSize = function(p5)
						-- upvalues: p3 (upval), UchFloor (upval), TypesVector2 (upval)
						local UchFloorResult = if p3.onOverflow == nil then 0 else UchFloor(p5)
						
						return TypesVector2.new(UchFloorResult, UchFloorResult)
					end
				})
			}), "button")
		end)
		
		if v1 < 0 then
			PropsResult[#PropsResult + 1] = Compose.show(function(Callback): boolean
				-- upvalues: FormulaResult (copy), Max (copy)
				return Max < #Callback(FormulaResult)
			end, function()
				-- upvalues: Host (upval), Max (copy), TypesUDim2 (upval), v1 (copy)
				return Host.Frame("OverflowGap")({
					BackgroundTransparency = 1,
					LayoutOrder = Max + 1,
					Size = TypesUDim2.fromOffset(4 - v1 * 2, 0)
				})
			end)
		end
		local FrameResult = Host.Frame(PropsResult)
		
		if p3.layout ~= "spread" then
			p1.styled(FrameResult, "avatar-stack")
		end
		return FrameResult
	end)
end