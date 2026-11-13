local _ = require("./types")
local _ = require("../vendor/compose/core")

return function(p1, Object, Frame, Callback, Callback1, p2, p3)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	
	if p2 then return end
	if Object:FindFirstChildWhichIsA("UIPadding") == nil then
		Runtime.mount(function()
			-- upvalues: Host (copy)
			return Host.UIPadding({})
		end, Object)
	end
	local P4 = p3 or p1.layoutSize(Object)
	local ClipsDescendants = Object.ClipsDescendants
	local CellResult = Compose.cell(TypesVector2.zero)
	
	local function moving(Callback1): boolean
		-- upvalues: Callback (copy), CellResult (copy)
		return Callback(Callback1) ~= 1 and (Callback1(CellResult).X > 0 and Callback1(CellResult).Y > 0)
	end
	
	Compose.watch(function(Callback1)
		-- upvalues: P4 (copy), Callback (copy), CellResult (copy)
		local CallbackResult = Callback1(P4)
		
		if Callback(Callback1) == 1 or CellResult:peek().X <= 0 or CellResult:peek().Y <= 0 then
			CellResult:set(CallbackResult)
		end
	end)
	
	local function origin(p4)
		-- upvalues: Callback1 (copy), TypesVector2 (copy)
		return if Callback1 then Callback1(p4) else TypesVector2.new(0.5, 0.5)
	end
	
	Runtime.decorate(Object, {
		ClipsDescendants = function(Callback1)
			-- upvalues: ClipsDescendants (copy), Callback (copy), CellResult (copy)
			return ClipsDescendants or Callback(Callback1) ~= 1 and (Callback1(CellResult).X > 0 and Callback1(CellResult).Y > 0)
		end,
		Size = function(Callback1)
			-- upvalues: CellResult (copy), Callback (copy), TypesUDim2 (copy), p1 (copy), Frame (copy)
			local ScaledCallbackResult = Callback1(CellResult) * Callback(Callback1)
			local IsYAbove: boolean = Callback(Callback1) ~= 1 and (Callback1(CellResult).X > 0 and Callback1(CellResult).Y > 0)
			
			return if IsYAbove then TypesUDim2.fromOffset(ScaledCallbackResult.X, ScaledCallbackResult.Y) else p1.read(Frame.Size, Callback1)
		end,
		AutomaticSize = function(Callback1)
			-- upvalues: Callback (copy), CellResult (copy), TypesEnum (copy), p1 (copy), Frame (copy)
			return if Callback(Callback1) ~= 1 and (Callback1(CellResult).X > 0 and Callback1(CellResult).Y > 0) then TypesEnum.AutomaticSize.None else p1.read(Frame.AutomaticSize, Callback1) or TypesEnum.AutomaticSize.None
		end
	})
	
	local function keepSelection(Callback: () -> ())
		-- upvalues: p1 (copy), Object (copy)
		local GuiService = p1.config.guiService
		local GetResult = if GuiService then p1.selection.get() else nil
		Callback()
		
		if GuiService and GetResult and p1.selection.get() ~= GetResult and GetResult:IsDescendantOf(Object) then
			p1.selection.set(GetResult)
		end
	end
	
	Runtime.mountFragment(function()
		-- upvalues: Compose (copy), moving (copy), Runtime (copy), Host (copy), Object (copy), CellResult (copy), Callback (copy), TypesVector2 (copy), TypesUDim2 (copy), origin (copy), Callback1 (copy), TypesEnum (copy), keepSelection (copy)
		return {
			Compose.show(moving, function()
				-- upvalues: Runtime (upval), Host (upval), Object (upval), CellResult (upval), Callback (upval), Compose (upval), TypesVector2 (upval), TypesUDim2 (upval), origin (upval), Callback1 (upval), TypesEnum (upval), keepSelection (upval)
				local List = {}
				local Parent = nil
				Runtime.mount(function()
					-- upvalues: Parent (ref), Host (upval)
					Parent = Host.Folder("PresentationConstraints")({})
					
					return Parent
				end, Object)
				
				for _, UISizeConstraint in Object:GetChildren() do
					if UISizeConstraint:IsA("UISizeConstraint") then
						table.insert(List, UISizeConstraint)
						UISizeConstraint.Parent = Parent
					end
				end
				Runtime.mount(function()
					-- upvalues: CellResult (upval), Callback (upval), Host (upval)
					local function extent(Callback1)
						-- upvalues: CellResult (upval), Callback (upval)
						return Callback1(CellResult) * Callback(Callback1)
					end
					
					return Host.UISizeConstraint("PresentationBounds")({ MinSize = extent, MaxSize = extent })
				end, Object)
				Compose.cleanup(function()
					-- upvalues: List (copy), Parent (ref), Object (upval)
					for _, value in List do
						if value.Parent == Parent then
							value.Parent = Object
						end
					end
				end)
				local Fade = Object:FindFirstChild("Fade") or Object
				local Children = Fade:GetChildren()
				local UIPadding = Object:FindFirstChildWhichIsA("UIPadding")
				local InputBinding = {}
				
				if UIPadding then
					for _, value in { "Left", "Right", "Top", "Bottom" } do
						InputBinding[value] = UIPadding:GetStyled("Padding" .. value)
					end
				end
				local Parent1 = nil
				local MountResult = Runtime.mount(function()
					-- upvalues: CellResult (upval), InputBinding (copy), TypesVector2 (upval), Parent1 (ref), Host (upval), TypesUDim2 (upval), origin (upval), Callback1 (upval)
					local function contentSize(Callback)
						-- upvalues: CellResult (upval), InputBinding (upval), TypesVector2 (upval)
						local CallbackResult = Callback(CellResult)
						
						local function _(p4, p5)
							-- upvalues: InputBinding (upval)
							local InputBindingEntry = InputBinding[p4]
							
							return if InputBindingEntry then InputBindingEntry.Offset + InputBindingEntry.Scale * p5 else 0
						end
						
						local X = CallbackResult.X
						local Left = InputBinding.Left
						local XDelta = CallbackResult.X - (if Left then Left.Offset + Left.Scale * X else 0)
						local X1 = CallbackResult.X
						local Right = InputBinding.Right
						local Largest = math.max(0, XDelta - (if Right then Right.Offset + Right.Scale * X1 else 0))
						local Y = CallbackResult.Y
						local Top = InputBinding.Top
						local YDelta = CallbackResult.Y - (if Top then Top.Offset + Top.Scale * Y else 0)
						local Y1 = CallbackResult.Y
						local Bottom = InputBinding.Bottom
						
						return TypesVector2.new(Largest, (math.max(0, YDelta - (if Bottom then Bottom.Offset + Bottom.Scale * Y1 else 0))))
					end
					
					Parent1 = Host.Frame("PresentationContent")({
						Host.UISizeConstraint({ MinSize = contentSize, MaxSize = contentSize }),
						BackgroundTransparency = 1,
						Size = function(p4)
							-- upvalues: contentSize (copy), TypesUDim2 (upval)
							local ContentSizeResult = contentSize(p4)
							
							return TypesUDim2.fromOffset(ContentSizeResult.X, ContentSizeResult.Y)
						end,
						AnchorPoint = origin,
						Position = function(p4)
							-- upvalues: Callback1 (upval), TypesVector2 (upval), TypesUDim2 (upval)
							local CallbackResult = if Callback1 then Callback1(p4) else TypesVector2.new(0.5, 0.5)
							
							return TypesUDim2.fromScale(CallbackResult.X, CallbackResult.Y)
						end
					})
					
					return Parent1
				end, Fade)
				
				local function freeze(Frame: Frame)
					-- upvalues: Runtime (upval), Callback (upval), CellResult (upval), Parent1 (ref), TypesEnum (upval), origin (upval), Callback1 (upval), TypesVector2 (upval), TypesUDim2 (upval), Compose (upval), keepSelection (upval)
					if Frame:IsA("CanvasGroup") then
						local Size = Frame.Size
						local AutomaticSize = Frame.AutomaticSize
						local AnchorPoint = Frame.AnchorPoint
						local Position = Frame.Position
						Runtime.decorate(Frame, {
							Size = function(Callback1)
								-- upvalues: Callback (upval), CellResult (upval), Parent1 (upval), Size (copy)
								local IsYAbove: boolean = Callback(Callback1) ~= 1 and (Callback1(CellResult).X > 0 and Callback1(CellResult).Y > 0)
								
								return if IsYAbove then Parent1.Size else Size
							end,
							AutomaticSize = function(Callback1)
								-- upvalues: Callback (upval), CellResult (upval), TypesEnum (upval), AutomaticSize (copy)
								local IsYAbove: boolean = Callback(Callback1) ~= 1 and (Callback1(CellResult).X > 0 and Callback1(CellResult).Y > 0)
								
								return if IsYAbove then TypesEnum.AutomaticSize.None else AutomaticSize
							end,
							AnchorPoint = origin,
							Position = function(p4)
								-- upvalues: Callback1 (upval), TypesVector2 (upval), TypesUDim2 (upval)
								local CallbackResult = if Callback1 then Callback1(p4) else TypesVector2.new(0.5, 0.5)
								
								return TypesUDim2.fromScale(CallbackResult.X, CallbackResult.Y)
							end
						})
						Compose.cleanup(function()
							-- upvalues: Frame (copy), keepSelection (upval), AnchorPoint (copy), Position (copy), Size (copy), AutomaticSize (copy)
							if Frame.Parent ~= nil then
								keepSelection(function()
									-- upvalues: Frame (upval), AnchorPoint (upval), Position (upval), Size (upval), AutomaticSize (upval)
									Frame.AnchorPoint = AnchorPoint
									Frame.Position = Position
									Frame.Size = Size
									Frame.AutomaticSize = AutomaticSize
								end)
							end
						end)
						
						return
					end
				end
				
				freeze(Fade)
				Runtime.connect(Object, "ChildAdded", function(Frame)
					-- upvalues: freeze (copy)
					if Frame.Name == "Fade" then
						freeze(Frame)
					end
				end)
				keepSelection(function()
					-- upvalues: Children (copy), Parent1 (ref)
					for _, child in Children do
						if child:IsA("GuiObject") and not string.match(child.Name, "Boundary$") and child.Name ~= "ChromeShadow" or child:IsA("UIGridStyleLayout") then
							child.Parent = Parent1
						end
					end
				end)
				Compose.cleanup(function()
					-- upvalues: keepSelection (upval), Parent1 (ref), MountResult (copy)
					keepSelection(function()
						-- upvalues: Parent1 (upval)
						for _, child in Parent1:GetChildren() do
							child.Parent = Parent1.Parent
						end
					end)
					MountResult()
				end)
				
				return Compose.fragment(function()
					return {}
				end)
			end)
		}
	end, Object)
end