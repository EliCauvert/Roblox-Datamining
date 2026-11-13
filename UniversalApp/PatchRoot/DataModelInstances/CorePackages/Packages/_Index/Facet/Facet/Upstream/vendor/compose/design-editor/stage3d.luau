local _ = require("./ui")
local MathModule = require("./math")
local CoreModule = require("../core")
local DesignModule = require("../design")
local RenderPreviewModule = require("./render-preview")

return function(p1)
	-- upvalues: MathModule (copy), CoreModule (copy), DesignModule (copy), RenderPreviewModule (copy)
	local v1 = require("./theme")(p1)
	local list = {
		{
			name = "X",
			direction = { X = 1, Y = 0, Z = 0 },
			color = p1.rgb(242, 92, 84)
		},
		{
			name = "Y",
			direction = { X = 0, Y = 1, Z = 0 },
			color = p1.rgb(80, 200, 120)
		},
		{
			name = "Z",
			direction = { X = 0, Y = 0, Z = 1 },
			color = p1.rgb(53, 129, 247)
		}
	}
	
	local function helper(SelectedName, Vector, Accent, p2)
		-- upvalues: p1 (copy)
		local Part = p1.new("Part")
		p1.set(Part, "Name", SelectedName)
		p1.set(Part, "Anchored", true)
		p1.set(Part, "CanCollide", false)
		p1.set(Part, "CanQuery", false)
		p1.set(Part, "CastShadow", false)
		p1.set(Part, "Material", p1.values.enum("Material", "SmoothPlastic"))
		p1.set(Part, "Size", p1.values.vector3(Vector.X, Vector.Y, Vector.Z))
		p1.set(Part, "Color", Accent)
		p1.set(Part, "Transparency", p2)
		
		return Part
	end
	
	local function boundsOf(p2)
		-- upvalues: p1 (copy)
		if p1.isA(p2, "Model") then
			local GetBoundingBox, GetBoundingBox2 = p1.call(p2, "GetBoundingBox")
			
			return GetBoundingBox, p1.vector(GetBoundingBox2)
		elseif p1.isA(p2, "BasePart") then
			return p1.get(p2, "CFrame"), p1.xyz(p2, "Size")
		else
			return p1.call(p2, "GetPivot"), { X = 1, Y = 1, Z = 1 }
		end
	end
	
	local function closestOnAxis(Origin, Axis, Vector, Vector1)
		-- upvalues: MathModule (upval)
		local VsubResult = MathModule.vsub(Origin, Vector)
		local DotResult = MathModule.dot(Axis, Vector1)
		local DotResult1 = MathModule.dot(Axis, VsubResult)
		local DotResult2 = MathModule.dot(Vector1, VsubResult)
		local DotResult3 = MathModule.dot(Vector1, Vector1)
		local Value = DotResult3 - DotResult * DotResult
		
		return if math.abs(Value) < 0.000001 then 0 else (DotResult * DotResult2 - DotResult3 * DotResult1) / Value
	end
	
	return function(p2, p3, p4)
		-- upvalues: v1 (copy), p1 (copy), CoreModule (upval), helper (copy), MathModule (upval), DesignModule (upval), boundsOf (copy), list (copy), RenderPreviewModule (upval), closestOnAxis (copy)
		local Library = p4.library or p2.library
		local Accent = p4.accent or v1.color.accent
		local Target = p4.target
		local NewResult = p1.new(if Target then "Frame" else "ViewportFrame")
		p1.set(NewResult, "Name", "DesignScene")
		p1.set(NewResult, "Size", p1.values.udim2(1, 0, 1, 0))
		p1.set(NewResult, "BackgroundColor3", v1.color.canvas)
		p1.set(NewResult, "BorderSizePixel", 0)
		
		if Target then
			p1.set(NewResult, "BackgroundTransparency", 1)
		else
			p1.set(NewResult, "Ambient", p1.rgb(150, 150, 160))
			p1.set(NewResult, "LightColor", p1.rgb(255, 250, 240))
			p1.set(NewResult, "LightDirection", p1.values.vector3(-1, -2, -0.6))
		end
		p1.set(NewResult, "Active", true)
		local NewResult1 = p1.new(if Target then "Model" else "WorldModel")
		p1.set(NewResult1, "Name", "DesignWorld")
		p1.set(NewResult1, "Parent", if Target then Target.world else NewResult)
		local Camera = if Target then Target.camera else p1.new("Camera")
		local GetResults = {}
		
		if Target then
			for _, value in { "CFrame", "Focus", "FieldOfView", "CameraType" } do
				GetResults[value] = p1.get(Camera, value)
			end
		else
			p1.set(Camera, "Parent", NewResult)
			p1.set(NewResult, "CurrentCamera", Camera)
		end
		local OwnResult = CoreModule.owner.own(p1.owner, function()
			-- upvalues: GetResults (copy), p1 (upval), Camera (copy)
			for i, getResult in GetResults do
				p1.set(Camera, i, getResult)
			end
		end)
		
		if Target then
			p1.set(Camera, "CameraType", p1.values.enum("CameraType", "Scriptable"))
		end
		p1.set(Camera, "FieldOfView", p4.fieldOfView or (if Target then p1.number(Camera, "FieldOfView") else 50))
		local Folder = p1.new("Folder")
		p1.set(Folder, "Name", "Guides")
		p1.set(Folder, "Parent", NewResult1)
		
		for i = -32, 32, 4 do
			local IsIMatch = i == 0
			local Secondary = if IsIMatch then v1.color.secondary else v1.color.grid
			local v2: number = if IsIMatch then 0.08 else 0.04
			local v3: number = if IsIMatch then 0.3 else 0.5
			local GridX = helper("GridX", { X = 64, Y = 0.02, Z = v2 }, Secondary, v3)
			p1.set(GridX, "CFrame", p1.values.cframe(MathModule.frame({ X = 0, Y = 0, Z = i })))
			p1.set(GridX, "Parent", Folder)
			local GridZ = helper("GridZ", { Y = 0.02, Z = 64, X = v2 }, Secondary, v3)
			p1.set(GridZ, "CFrame", p1.values.cframe(MathModule.frame({ Y = 0, Z = 0, X = i })))
			p1.set(GridZ, "Parent", Folder)
		end
		p1.set(NewResult, "Parent", p3)
		local Nodes = {}
		
		local function blocked(Id): boolean
			-- upvalues: DesignModule (upval), p2 (copy)
			local FindResult, FindResult2 = DesignModule.document.find(p2.document:peek().root, Id)
			while FindResult do
				if FindResult.locked or FindResult.hidden then
					return true
				end
				FindResult = FindResult2
				
				if not FindResult then continue end
				local _, FindResult2_1 = DesignModule.document.find(p2.document:peek().root, FindResult.id)
				FindResult2 = FindResult2_1
			end
			return false
		end
		
		local Runtime = p1.runtime
		local Callback = nil
		local t = {}
		local Radians = 0.6108652381980153
		local Radians1 = -0.4886921905584123
		local Largest = 28
		local Position = { X = 0, Y = 1, Z = 0 }
		local CellResult = CoreModule.cell(1)
		local Fit = CoreModule.cell("fit")
		
		local function dimensions()
			-- upvalues: Target (copy), p1 (upval), Camera (copy), NewResult (copy)
			local ViewportSize = if Target then p1.xy(Camera, "ViewportSize") else p1.xy(NewResult, "AbsoluteSize")
			
			if Target then
				return ViewportSize, { X = 0, Y = 0 }
			else
				return ViewportSize, (p1.xy(NewResult, "AbsolutePosition"))
			end
		end
		
		local function aim()
			-- upvalues: MathModule (upval), Radians1 (ref), Radians (ref), Position (ref), Largest (ref), Target (copy), dimensions (copy), p1 (upval), NewResult (copy), Camera (copy), CellResult (copy)
			local MultiplyResult = MathModule.multiply(MathModule.multiply(MathModule.frame(Position), (MathModule.rotation(Radians1, Radians, 0))), MathModule.frame({ X = 0, Y = 0, Z = Largest }))
			
			if Target then
				local DimensionsResult = dimensions()
				local AddResult = MathModule.add(p1.xy(NewResult, "AbsolutePosition"), MathModule.scale(p1.xy(NewResult, "AbsoluteSize"), 0.5))
				local Tangent = math.tan(math.rad((p1.number(Camera, "FieldOfView"))) / 2)
				MultiplyResult = MathModule.multiply(MultiplyResult, MathModule.frame({
					Z = 0,
					X = (1 - AddResult.X * 2 / math.max(DimensionsResult.X, 1)) * Largest * Tangent * DimensionsResult.X / math.max(DimensionsResult.Y, 1),
					Y = (AddResult.Y * 2 / math.max(DimensionsResult.Y, 1) - 1) * Largest * Tangent
				}))
			end
			p1.set(Camera, "CFrame", p1.values.cframe(MultiplyResult))
			p1.set(Camera, "Focus", p1.values.cframe(MathModule.frame(Position)))
			CellResult:set(28 / Largest)
		end
		
		aim()
		
		local function ray(PointResult)
			-- upvalues: dimensions (copy), MathModule (upval), p1 (upval), Camera (copy)
			local DimensionsResult, DimensionsResult2 = dimensions()
			local SubResult = MathModule.sub(PointResult, DimensionsResult2)
			local config = {
				X = SubResult.X / math.max(DimensionsResult.X, 1) * 2 - 1,
				Y = 1 - SubResult.Y / math.max(DimensionsResult.Y, 1) * 2
			}
			local Tangent = math.tan(math.rad((p1.number(Camera, "FieldOfView"))) / 2)
			
			return p1.xyz(p1.get(Camera, "CFrame"), "Position"), (MathModule.unit(MathModule.transform(p1.components(p1.get(Camera, "CFrame")), {
				Z = -1,
				X = config.X * (Tangent * DimensionsResult.X / math.max(DimensionsResult.Y, 1)),
				Y = config.Y * Tangent
			})))
		end
		
		local function projectedBounds(p5)
			-- upvalues: boundsOf (upval), p1 (upval), dimensions (copy), Camera (copy), MathModule (upval)
			local BoundsOfResult, BoundsOfResult2 = boundsOf(p5)
			local ComponentsResult = p1.components(BoundsOfResult)
			local Position = p1.xyz(BoundsOfResult, "Position")
			local DimensionsResult, DimensionsResult2 = dimensions()
			local Tangent = math.tan(math.rad((p1.number(Camera, "FieldOfView"))) / 2)
			local TangentRatio = Tangent * DimensionsResult.X / math.max(DimensionsResult.Y, 1)
			local config = {
				left = 1e999,
				top = 1e999,
				right = -1e999,
				bottom = -1e999
			}
			
			for _, value in { -0.5, 0.5 } do
				for _, value1 in { -0.5, 0.5 } do
					for _, value2 in { -0.5, 0.5 } do
						local VaddResult = MathModule.vadd(Position, MathModule.transform(ComponentsResult, {
							X = BoundsOfResult2.X * value,
							Y = BoundsOfResult2.Y * value1,
							Z = BoundsOfResult2.Z * value2
						}))
						local Vector = p1.vector(p1.call(p1.get(Camera, "CFrame"), "PointToObjectSpace", p1.values.vector3(VaddResult.X, VaddResult.Y, VaddResult.Z)))
						
						if Vector.Z < -0.01 then
							local NewX = DimensionsResult2.X + (Vector.X / -Vector.Z / TangentRatio + 1) * DimensionsResult.X / 2
							local NewY = DimensionsResult2.Y + (1 - Vector.Y / -Vector.Z / Tangent) * DimensionsResult.Y / 2
							config.left = math.min(config.left, NewX)
							config.top = math.min(config.top, NewY)
							config.right = math.max(config.right, NewX)
							config.bottom = math.max(config.bottom, NewY)
						end
					end
				end
			end
			return if config.left < 1e999 then config else nil
		end
		
		local function nodeOf(OptionalNodeResult)
			-- upvalues: NewResult1 (copy), p1 (upval)
			local OptionalNodeResult1 = OptionalNodeResult
			local GetAttribute = nil
			while OptionalNodeResult1 and OptionalNodeResult1 ~= NewResult1 do
				GetAttribute = p1.call(OptionalNodeResult1, "GetAttribute", "ComposeDesignNode")
				
				if type(GetAttribute) == "string" then
					return GetAttribute
				end
				OptionalNodeResult1 = p1.optionalNode(p1.get(OptionalNodeResult1, "Parent"))
			end
			return nil
		end
		
		local Folder1 = p1.new("Folder")
		p1.set(Folder1, "Name", "Gizmo")
		p1.set(Folder1, "Parent", NewResult1)
		local Selected = helper("Selected", { X = 1, Y = 1, Z = 1 }, Accent, 0.9)
		p1.set(Selected, "Parent", Folder1)
		local Hovered = helper("Hovered", { X = 1, Y = 1, Z = 1 }, Accent, 0.95)
		p1.set(Hovered, "Parent", Folder1)
		local Directions = {}
		
		for _, value1 in list do
			local HelperResult = helper("Axis" .. value1.name, { X = 0.12, Y = 0.12, Z = 2.4 }, value1.color, 0)
			p1.set(HelperResult, "CanQuery", true)
			p1.set(HelperResult, "Parent", Folder1)
			local HelperResult1 = helper("Tip" .. value1.name, { X = 0.4, Y = 0.4, Z = 0.6 }, value1.color, 0)
			p1.set(HelperResult1, "CanQuery", true)
			p1.set(HelperResult1, "Parent", Folder1)
			Directions[HelperResult] = value1.direction
			Directions[HelperResult1] = value1.direction
		end
		local function show(Hovered, p6)
			-- upvalues: Nodes (copy), p1 (upval), boundsOf (upval), Selected (copy)
			local Node = if p6 then Nodes[p6] else nil
			
			if Node == nil or p1.get(Node, "Parent") == nil then
				p1.set(Hovered, "Transparency", 1)
				
				return
			else
				local BoundsOfResult, BoundsOfResult2 = boundsOf(Node)
				p1.set(Hovered, "CFrame", BoundsOfResult)
				p1.set(Hovered, "Size", p1.values.vector3(BoundsOfResult2.X + 0.15, BoundsOfResult2.Y + 0.15, BoundsOfResult2.Z + 0.15))
				p1.set(Hovered, "Transparency", if Hovered == Selected then 0.9 else 0.95)
			end
		end
		
		local function placeGizmo(p6)
			-- upvalues: Nodes (copy), DesignModule (upval), p2 (copy), Directions (copy), p1 (upval), blocked (copy), boundsOf (upval), MathModule (upval)
			local Node = if p6 then Nodes[p6] else nil
			local FindResult = if p6 then DesignModule.document.find(p2.document:peek().root, p6) else nil
			local Position = if FindResult then FindResult.props.position else nil
			local NoPosition: boolean = FindResult ~= nil and (p2.library.kinds[FindResult.kind].fields.position ~= nil and (Position == nil or Position.literal ~= nil))
			for i, direction in Directions do
				if NoPosition and Node ~= nil and p1.get(Node, "Parent") ~= nil and (not p6 or not blocked(p6)) then
					local Position1 = p1.xyz(p1.call(Node, "GetPivot"), "Position")
					local _, BoundsOfResult2 = boundsOf(Node)
					local NewMagnitude = math.abs((MathModule.dot(BoundsOfResult2, direction))) / 2 + 0.6
					local NewNewMagnitude: number = if string.sub(p1.text(i, "Name"), 1, 3) == "Tip" then NewMagnitude + 2.7 else NewMagnitude + 1.2
					p1.set(i, "CFrame", p1.values.cframe(MathModule.lookAt(MathModule.vadd(Position1, MathModule.vscale(direction, NewNewMagnitude)), MathModule.vadd(Position1, MathModule.vscale(direction, NewNewMagnitude + 1)))))
					p1.set(i, "Transparency", 0)
					p1.set(i, "CanQuery", true)
				else
					p1.set(i, "Transparency", 1)
					p1.set(i, "CanQuery", false)
				end
			end
		end
		
		local function pick(PointResult)
			-- upvalues: ray (copy), Folder (copy), Folder1 (copy), Nodes (copy), blocked (copy), Target (copy), p1 (upval), NewResult1 (copy), nodeOf (copy)
			local RayResult, RayResult2 = ray(PointResult)
			local List = { Folder, Folder1 }
			
			for i, node in Nodes do
				if blocked(i) then
					table.insert(List, node)
				end
			end
			local List1 = {}
			
			if Target then
				for i1, node1 in Nodes do
					if p1.isA(node1, "BasePart") and not blocked(i1) then
						table.insert(List1, node1)
					end
				end
			end
			local Raycast = p1.call(if Target then Target.world else NewResult1, "Raycast", p1.values.vector3(RayResult.X, RayResult.Y, RayResult.Z), p1.values.vector3(RayResult2.X * 15000, RayResult2.Y * 15000, RayResult2.Z * 15000), (p1.values.raycastParams(Target ~= nil, if Target then List1 else List)))
			
			return if Raycast then nodeOf(p1.optionalNode(p1.get(Raycast, "Instance"))) else nil
		end
		
		local function v57() end
		
		local OwnResult1 = CoreModule.owner.own(p1.owner, CoreModule.createRootOwner(function()
			-- upvalues: CoreModule (upval), p2 (copy), Callback (ref), Nodes (copy), Runtime (copy), p4 (copy), Library (copy), p1 (upval), DesignModule (upval), RenderPreviewModule (upval), t (ref), NewResult1 (copy), helper (upval), Accent (copy), Folder1 (copy), v57 (ref), show (copy), Selected (copy), boundsOf (upval), MathModule (upval), placeGizmo (copy), Hovered (copy)
			CoreModule.watch(function(Callback1)
				-- upvalues: p2 (upval), Callback (upval), Nodes (upval), Runtime (upval), p4 (upval), Library (upval), p1 (upval), DesignModule (upval), RenderPreviewModule (upval), t (upval), NewResult1 (upval)
				local CallbackResult = Callback1(p2.document)
				
				if Callback then
					Callback()
				end
				table.clear(Nodes)
				Callback = Runtime.mount(function()
					-- upvalues: CallbackResult (copy), p4 (upval), Library (upval), Callback1 (copy), p1 (upval), DesignModule (upval), RenderPreviewModule (upval), t (upval), Runtime (upval), Nodes (upval)
					local CallbackResult1 = CallbackResult
					local Bindings = p4.bindings
					
					if p4.renderPreview then
						CallbackResult1, Bindings = p4.renderPreview(CallbackResult, Library, Callback1)
					end
					return p1.node(DesignModule.render(CallbackResult1, Library, {
						use = Callback1,
						exclude = function(p7): boolean
							return p7.hidden == true
						end,
						inputs = p4.inputs,
						bindings = RenderPreviewModule.bindings(CallbackResult1, Bindings, Callback1),
						outputs = p4.outputs,
						slots = p4.slots,
						players = function(p7)
							-- upvalues: t (upval)
							t = p7
						end,
						token = p4.token,
						resolveToken = p4.resolveToken,
						decorate = function(NodeResult, p7)
							-- upvalues: p1 (upval), Runtime (upval), Nodes (upval)
							local NodeResult1 = p1.node(p7)
							
							if p1.isA(NodeResult1, "PVInstance") then
								Runtime.decorate(NodeResult1, { Attributes = { ComposeDesignNode = NodeResult.id } })
								Nodes[NodeResult.id] = NodeResult1
							end
						end
					}))
				end, NewResult1)
			end)
			local Tbl = {}
			CoreModule.watch(function(Callback)
				-- upvalues: p2 (upval), Tbl (copy), p1 (upval), Nodes (upval), helper (upval), Accent (upval), Folder1 (upval), v57 (upval), show (upval), Selected (upval), boundsOf (upval), MathModule (upval), placeGizmo (upval)
				Callback(p2.document)
				local CallbackResult = Callback(p2.selected)
				local CallbackResult1 = Callback(p2.selection)
				
				for _, value in Tbl do
					p1.destroy(value)
				end
				table.clear(Tbl)
				
				if #CallbackResult1 > 1 then
					for _, value1 in CallbackResult1 do
						if Nodes[value1] then
							local HelperResult = helper(`Selected_{value1}`, { X = 1, Y = 1, Z = 1 }, Accent, 0.95)
							p1.set(HelperResult, "Parent", Folder1)
							Tbl[value1] = HelperResult
						end
					end
				end
				v57 = function()
					-- upvalues: show (upval), Selected (upval), CallbackResult (copy), CallbackResult1 (copy), Nodes (upval), Tbl (upval), boundsOf (upval), p1 (upval), MathModule (upval), placeGizmo (upval)
					show(Selected, CallbackResult)
					
					if #CallbackResult1 > 1 then
						local Vector = { X = 1e999, Y = 1e999, Z = 1e999 }
						local config = { X = -1e999, Y = -1e999, Z = -1e999 }
						
						for _, value in CallbackResult1 do
							local Node = Nodes[value]
							
							if Node then
								show(Tbl[value], value)
								local BoundsOfResult, BoundsOfResult2 = boundsOf(Node)
								local ComponentsResult = p1.components(BoundsOfResult)
								local Position = p1.xyz(BoundsOfResult, "Position")
								
								for _, value1 in { -0.5, 0.5 } do
									for _, value2 in { -0.5, 0.5 } do
										for _, value3 in { -0.5, 0.5 } do
											local VaddResult = MathModule.vadd(Position, MathModule.transform(ComponentsResult, {
												X = BoundsOfResult2.X * value1,
												Y = BoundsOfResult2.Y * value2,
												Z = BoundsOfResult2.Z * value3
											}))
											Vector = {
												X = math.min(Vector.X, VaddResult.X),
												Y = math.min(Vector.Y, VaddResult.Y),
												Z = math.min(Vector.Z, VaddResult.Z)
											}
											config = {
												X = math.max(config.X, VaddResult.X),
												Y = math.max(config.Y, VaddResult.Y),
												Z = math.max(config.Z, VaddResult.Z)
											}
										end
									end
								end
							end
						end
						if Vector.X < 1e999 then
							local VaddResult = MathModule.vadd(MathModule.vsub(config, Vector), { X = 0.15, Y = 0.15, Z = 0.15 })
							p1.set(Selected, "CFrame", p1.values.cframe(MathModule.frame((MathModule.vscale(MathModule.vadd(Vector, config), 0.5)))))
							p1.set(Selected, "Size", p1.values.vector3(VaddResult.X, VaddResult.Y, VaddResult.Z))
							p1.set(Selected, "Transparency", 0.9)
						end
					end
					placeGizmo(CallbackResult)
				end
				
				v57()
			end)
			CoreModule.watch(function(Callback)
				-- upvalues: p2 (upval), show (upval), Hovered (upval)
				Callback(p2.document)
				local CallbackResult = Callback(p2.hovered)
				show(Hovered, if CallbackResult and table.find(Callback(p2.selection), CallbackResult) then nil else CallbackResult)
			end)
		end, Runtime.reactor).dispose)
		
		local function setCamera(PeekResult)
			-- upvalues: p2 (copy), Nodes (copy), boundsOf (upval), Position (ref), p1 (upval), NewResult (copy), dimensions (copy), Camera (copy), Largest (ref), MathModule (upval), Radians (ref), Radians1 (ref), Target (copy), Fit (copy), aim (copy)
			assert(PeekResult == "fit" or (PeekResult == "eye-height" or (PeekResult == "approach-20" or (PeekResult == "close-up" or PeekResult == "top-down"))), "Unknown Camera preset; choose fit, eye-height, approach-20, close-up or top-down")
			local Node = Nodes[p2.document:peek().root.id]
			
			if Node then
				local BoundsOfResult, BoundsOfResult2 = boundsOf(Node)
				Position = p1.xyz(BoundsOfResult, "Position")
				local AbsoluteSize = p1.xy(NewResult, "AbsoluteSize")
				local DimensionsResult = dimensions()
				local Tangent = math.tan(math.rad((p1.number(Camera, "FieldOfView"))) / 2)
				Largest = math.clamp(MathModule.magnitude(BoundsOfResult2) * 0.575 / math.sin((math.min(math.atan(Tangent * AbsoluteSize.Y / math.max(1, DimensionsResult.Y)), (math.atan(Tangent * AbsoluteSize.X / math.max(1, DimensionsResult.Y)))))), 6, 5000)
				Radians = 0.6108652381980153
				Radians1 = -0.4886921905584123
				
				if PeekResult == "eye-height" or PeekResult == "approach-20" then
					local Position1 = Position
					Position1.Y += -BoundsOfResult2.Y / 2 + (Target and Target.eyeHeight or 5.5)
					Radians = 0
					Radians1 = 0
					Largest = BoundsOfResult2.Z / 2 + (if PeekResult == "approach-20" then 20 else 8)
				elseif PeekResult == "close-up" then
					Largest = math.max(2, Largest * 0.55)
				elseif PeekResult == "top-down" then
					Radians = 0
					Radians1 = -1.5707963267948966
				end
			end
			Fit:set(PeekResult)
			aim()
		end
		
		local function fit()
			-- upvalues: setCamera (copy)
			setCamera("fit")
		end
		
		local function orbit(Value: number, Value1: number)
			-- upvalues: Radians (ref), Radians1 (ref), Fit (copy), aim (copy)
			assert(Value == Value and (Value1 == Value1 and math.abs(Value) < 1e999) and math.abs(Value1) < 1e999, "Orbit requires finite angles in degrees")
			Radians = math.rad(Value)
			Radians1 = math.rad((math.clamp(Value1, -89, 89)))
			Fit:set("orbit")
			aim()
		end
		
		local function zoomTo(p7: number, _)
			-- upvalues: Largest (ref), Fit (copy), aim (copy)
			assert(p7 > 0 and p7 < 1e999, "Zoom requires a finite positive scale")
			Largest = math.clamp(28 / math.max(p7, 0.005), 2, 5000)
			Fit:set("custom")
			aim()
		end
		
		local function pan(Vector)
			-- upvalues: Fit (copy), dimensions (copy), Largest (ref), p1 (upval), Camera (copy), Position (ref), MathModule (upval), aim (copy)
			assert(Vector.X == Vector.X and (Vector.Y == Vector.Y and math.abs(Vector.X) < 1e999) and math.abs(Vector.Y) < 1e999, "Pan requires finite pixel offsets")
			Fit:set("custom")
			local LargestRatio = Largest * 2 * math.tan(math.rad((p1.number(Camera, "FieldOfView"))) / 2) / math.max(dimensions().Y, 1)
			local _CFrame = p1.get(Camera, "CFrame")
			Position = MathModule.vadd(Position, MathModule.vadd(MathModule.vscale(p1.xyz(_CFrame, "RightVector"), -Vector.X * LargestRatio), MathModule.vscale(p1.xyz(_CFrame, "UpVector"), Vector.Y * LargestRatio)))
			aim()
		end
		
		local UserInputService = p1.service("UserInputService")
		local Config = nil
		local v4 = nil
		local DesignMarquee = v1.frame("DesignMarquee", Accent)
		p1.set(DesignMarquee, "BackgroundTransparency", 0.85)
		p1.set(DesignMarquee, "Visible", false)
		p1.set(DesignMarquee, "ZIndex", 10)
		v1.stroke(DesignMarquee, Accent, 1)
		p1.set(DesignMarquee, "Parent", NewResult)
		
		local function translate(Node, Vector)
			-- upvalues: p1 (upval), MathModule (upval)
			local VsubResult = MathModule.vsub(Vector, (p1.xyz(p1.call(Node, "GetPivot"), "Position")))
			local List = {}
			
			for _, Node1 in if p1.isA(Node, "BasePart") then { Node } else p1.descendants(Node) do
				local BasePart = p1.isA(Node1, "BasePart")
				
				if BasePart or p1.isA(Node1, "Model") then
					local ComponentsResult = p1.components(if BasePart then p1.get(Node1, "CFrame") else p1.call(Node1, "GetPivot"))
					ComponentsResult[1] += VsubResult.X
					ComponentsResult[2] += VsubResult.Y
					ComponentsResult[3] += VsubResult.Z
					table.insert(List, {
						node = Node1,
						property = if BasePart then "CFrame" else "WorldPivot",
						frame = ComponentsResult
					})
				end
			end
			if p1.isA(Node, "Model") then
				local ComponentsResult = p1.components(p1.call(Node, "GetPivot"))
				local Y = Vector.Y
				local Z = Vector.Z
				ComponentsResult[1] = Vector.X
				ComponentsResult[2] = Y
				ComponentsResult[3] = Z
				table.insert(List, {
					property = "WorldPivot",
					node = Node,
					frame = ComponentsResult
				})
			end
			for _, value in List do
				p1.set(value.node, value.property, p1.values.cframe(value.frame))
			end
		end
		
		local List = {}
		
		local function _(p7)
			-- upvalues: List (copy)
			table.insert(List, p7)
		end
		
		table.insert(List, (p1.connect(NewResult, "InputBegan", function(p7)
			-- upvalues: p4 (copy), v1 (upval), p1 (upval), Config (ref), UserInputService (copy), ray (copy), Folder1 (copy), Target (copy), NewResult1 (copy), Directions (copy), Nodes (copy), p2 (copy), blocked (copy), DesignModule (upval), closestOnAxis (upval), v4 (ref), pick (copy), Fit (copy), Largest (ref), aim (copy)
			if p4.readOnly then return end
			local PointResult = v1.point(p7)
			
			if p1.get(p7, "UserInputType") == p1.values.enum("UserInputType", "MouseButton2") then
				Config = { kind = "orbit", from = PointResult }
				
				return
			end
			if p1.get(p7, "UserInputType") == p1.values.enum("UserInputType", "MouseButton3") or p1.get(p7, "UserInputType") == p1.values.enum("UserInputType", "MouseButton1") and p1.call(UserInputService, "IsKeyDown", p1.values.enum("KeyCode", "Space")) == true then
				Config = { kind = "pan", from = PointResult }
				
				return
			end
			if p1.get(p7, "UserInputType") == p1.values.enum("UserInputType", "MouseButton1") then
				local RayResult, RayResult2 = ray(PointResult)
				local Raycast = p1.call(if Target then Target.world else NewResult1, "Raycast", p1.values.vector3(RayResult.X, RayResult.Y, RayResult.Z), p1.values.vector3(RayResult2.X * 2000, RayResult2.Y * 2000, RayResult2.Z * 2000), (p1.values.raycastParams(true, { Folder1 })))
				local Direction = if Raycast and p1.isA(p1.get(Raycast, "Instance"), "Part") then Directions[p1.node(p1.get(Raycast, "Instance"))] else nil
				local Node = Nodes[p2.selected:peek()]
				
				if Direction and Node and not blocked(p2.selected:peek()) then
					local Origins = {}
					local List = {}
					
					for _, value in p2.selection:peek() do
						local FindResult = DesignModule.document.find(p2.document:peek().root, value)
						local v5 = false
						
						for _, value1 in List do
							local FindResult1 = DesignModule.document.find(p2.document:peek().root, value1)
							v5 = v5 or FindResult1 ~= nil and DesignModule.document.find(FindResult1, value) ~= nil
						end
						if FindResult and Nodes[value] and not blocked(value) and not v5 and p2.library.kinds[FindResult.kind].fields.position and (FindResult.props.position == nil or FindResult.props.position.literal ~= nil) then
							table.insert(List, value)
							Origins[value] = p1.xyz(p1.call(Nodes[value], "GetPivot"), "Position")
						end
					end
					p2.selectMany(List)
					local Node1 = Nodes[p2.selected:peek()]
					
					if Node1 ~= nil then
						local Position = p1.xyz(p1.call(Node1, "GetPivot"), "Position")
						Config = {
							kind = "move",
							from = PointResult,
							axis = Direction,
							origin = Position,
							start = closestOnAxis(Position, Direction, RayResult, RayResult2),
							origins = Origins
						}
						v4 = nil
						
						return
					end
					return
				else
					local PickResult = pick(PointResult)
					
					if PickResult then
						p2.select(PickResult, if p1.keyDown({
							"LeftShift", "RightShift", "LeftControl", "RightControl", "LeftMeta",
							"RightMeta", "LeftSuper", "RightSuper"
						}) then "toggle" else "replace")
						
						return
					else
						local Copy = if p1.keyDown({
							"LeftShift", "RightShift", "LeftControl", "RightControl", "LeftMeta",
							"RightMeta", "LeftSuper", "RightSuper"
						}) then table.clone(p2.selection:peek()) else {}
						Config = { kind = "marquee", from = PointResult, base = Copy }
						p2.selectMany(Copy)
						
						return
					end
				end
			elseif p1.get(p7, "UserInputType") == p1.values.enum("UserInputType", "MouseWheel") then
				Fit:set("custom")
				Largest = math.clamp(Largest * (if p1.xyz(p7, "Position").Z > 0 then 0.87 else 1.1494252873563218), 2, 5000)
				aim()
			end
		end)))
		table.insert(List, (p1.connect(NewResult, "InputChanged", function(p8)
			-- upvalues: p1 (upval), Fit (copy), Largest (ref), aim (copy), Config (ref), p2 (copy), pick (copy), v1 (upval)
			if p1.get(p8, "UserInputType") == p1.values.enum("UserInputType", "MouseWheel") then
				Fit:set("custom")
				Largest = math.clamp(Largest * (if p1.xyz(p8, "Position").Z > 0 then 0.87 else 1.1494252873563218), 2, 5000)
				aim()
				
				return
			elseif p1.get(p8, "UserInputType") == p1.values.enum("UserInputType", "MouseMovement") and Config == nil then
				p2.hovered:set((pick(v1.point(p8))))
			end
		end)))
		table.insert(List, (p1.connect(UserInputService, "InputChanged", function(p8)
			-- upvalues: Config (ref), p1 (upval), v1 (upval), MathModule (upval), Fit (copy), Radians (ref), Radians1 (ref), aim (copy), NewResult (copy), DesignMarquee (copy), pan (copy), Nodes (copy), p2 (copy), ray (copy), closestOnAxis (upval), UserInputService (copy), translate (copy), v4 (ref), v57 (ref)
			local Config1 = Config
			
			if Config1 == nil or p1.get(p8, "UserInputType") ~= p1.values.enum("UserInputType", "MouseMovement") then return end
			local PointResult = v1.point(p8)
			local SubResult = MathModule.sub(PointResult, Config1.from)
			
			if Config1.kind == "orbit" then
				Fit:set("orbit")
				Radians -= SubResult.X * 0.008
				Radians1 = math.clamp(Radians1 - SubResult.Y * 0.008, -1.53588974175501, 1.53588974175501)
				Config1.from = PointResult
				aim()
				
				return
			end
			if Config1.kind == "marquee" then
				Config1.to = PointResult
				local AbsolutePosition = p1.xy(NewResult, "AbsolutePosition")
				p1.set(DesignMarquee, "Position", p1.values.udim2(0, math.min(Config1.from.X, PointResult.X) - AbsolutePosition.X, 0, math.min(Config1.from.Y, PointResult.Y) - AbsolutePosition.Y))
				p1.set(DesignMarquee, "Size", p1.values.udim2(0, math.abs(SubResult.X), 0, (math.abs(SubResult.Y))))
				p1.set(DesignMarquee, "Visible", true)
				
				return
			end
			if Config1.kind == "pan" then
				pan(SubResult)
				Config1.from = PointResult
				
				return
			end
			local Axis = Config1.axis
			local Origin = Config1.origin
			local Start = Config1.start
			local Node = Nodes[p2.selected:peek()]
			
			if Axis and Origin and Start and Node then
				local RayResult, RayResult2 = ray(PointResult)
				local ClosestOnAxisResultDelta = closestOnAxis(Origin, Axis, RayResult, RayResult2) - Start
				
				if p1.call(UserInputService, "IsKeyDown", p1.values.enum("KeyCode", "LeftControl")) ~= true then
					ClosestOnAxisResultDelta = math.round(ClosestOnAxisResultDelta)
				end
				local VaddResult = MathModule.vadd(Origin, MathModule.vscale(Axis, ClosestOnAxisResultDelta))
				
				if Config1.origins then
					for i, origin in Config1.origins do
						translate(Nodes[i], MathModule.vadd(origin, MathModule.vscale(Axis, ClosestOnAxisResultDelta)))
					end
				end
				v4 = VaddResult
				v57()
			end
		end)))
		table.insert(List, (p1.connect(UserInputService, "InputEnded", function(p9)
			-- upvalues: Config (ref), p1 (upval), DesignMarquee (copy), MathModule (upval), Nodes (copy), p2 (copy), blocked (copy), projectedBounds (copy), v4 (ref), DesignModule (upval)
			local Config1 = Config
			
			if Config1 == nil then return end
			if p1.get(p9, "UserInputType") ~= p1.values.enum("UserInputType", "MouseButton1") and (p1.get(p9, "UserInputType") ~= p1.values.enum("UserInputType", "MouseButton2") and p1.get(p9, "UserInputType") ~= p1.values.enum("UserInputType", "MouseButton3")) then return end
			Config = nil
			
			if Config1.kind == "marquee" then
				p1.set(DesignMarquee, "Visible", false)
				local Copy = table.clone(Config1.base or {})
				local To = Config1.to
				
				if To and MathModule.length(MathModule.sub(To, Config1.from)) >= 4 then
					local Smallest = math.min(To.X, Config1.from.X)
					local Largest = math.max(To.X, Config1.from.X)
					local Smallest1 = math.min(To.Y, Config1.from.Y)
					local Largest1 = math.max(To.Y, Config1.from.Y)
					
					for i, node in Nodes do
						if i ~= p2.document:peek().root.id and not blocked(i) then
							local ProjectedBoundsResult = projectedBounds(node)
							
							if ProjectedBoundsResult and ProjectedBoundsResult.left <= Largest and Smallest <= ProjectedBoundsResult.right and ProjectedBoundsResult.top <= Largest1 and Smallest1 <= ProjectedBoundsResult.bottom then
								table.insert(Copy, i)
							end
						end
					end
				end
				p2.selectMany(Copy)
				
				return
			else
				local v6 = v4
				v4 = nil
				
				if Config1.kind == "move" and v6 then
					local FindResult = DesignModule.document.find(p2.document:peek().root, p2.selected:peek())
					
					if FindResult and p2.library.kinds[FindResult.kind].fields.position then
						local Origin = Config1.origin
						
						if Origin then
							local VsubResult = MathModule.vsub(v6, Origin)
							p2.change("position", function(p10)
								-- upvalues: VsubResult (copy)
								local Position = p10.props.position
								local Literal = if Position then Position.literal else nil
								local LiteralEntry = if type(Literal) == "table" then Literal[1] else nil
								local LiteralEntry1 = if type(Literal) == "table" then Literal[2] else nil
								local LiteralEntry2 = if type(Literal) == "table" then Literal[3] else nil
								
								return {
									literal = {
										(if type(LiteralEntry) == "number" then LiteralEntry else 0) + VsubResult.X,
										(if type(LiteralEntry1) == "number" then LiteralEntry1 else 0) + VsubResult.Y,
										(if type(LiteralEntry2) == "number" then LiteralEntry2 else 0) + VsubResult.Z
									}
								}
							end)
						end
					end
				end
			end
		end)))
		
		return {
			viewport = NewResult,
			world = NewResult1,
			camera = Camera,
			nodes = Nodes,
			zoom = CellResult,
			fit = fit,
			zoomTo = zoomTo,
			pick = pick,
			preset = Fit,
			setCamera = setCamera,
			orbit = orbit,
			pan = pan,
			play = function(p10)
				-- upvalues: t (ref)
				assert(t[p10], "Unknown Design sequence").play()
			end,
			guides = function(p10)
				-- upvalues: p1 (upval), Folder (copy), NewResult1 (copy), Folder1 (copy)
				p1.set(Folder, "Parent", if p10 then NewResult1 else nil)
				p1.set(Folder1, "Parent", if p10 then NewResult1 else nil)
			end,
			reframe = function()
				-- upvalues: Fit (copy), setCamera (copy), aim (copy)
				local PeekResult = Fit:peek()
				
				if PeekResult == "fit" or PeekResult == "eye-height" or PeekResult == "approach-20" or PeekResult == "close-up" or PeekResult == "top-down" then
					setCamera(PeekResult)
					
					return
				else
					aim()
				end
			end,
			readCamera = function()
				-- upvalues: Fit (copy), Radians (ref), Radians1 (ref), Largest (ref), Position (ref), p1 (upval), Camera (copy)
				return {
					preset = Fit:peek(),
					yaw = math.deg(Radians),
					pitch = math.deg(Radians1),
					distance = Largest,
					focus = table.clone(Position),
					frame = p1.components(p1.get(Camera, "CFrame")),
					fieldOfView = p1.number(Camera, "FieldOfView")
				}
			end,
			dispose = function()
				-- upvalues: List (copy), Callback (ref), OwnResult1 (copy), OwnResult (copy), p1 (upval), Folder (copy), Folder1 (copy), NewResult1 (copy), NewResult (copy)
				for _, Connection in List do
					Connection:Disconnect()
				end
				if Callback then
					Callback()
				end
				OwnResult1()
				OwnResult()
				p1.destroy(Folder)
				p1.destroy(Folder1)
				p1.destroy(NewResult1)
				p1.destroy(NewResult)
			end
		}
	end
end