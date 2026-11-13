local _ = require("./theme_types")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local Tbl = {
	"label", "requiredMark", "hint", "errorText", "controlSize", "appearance",
	"corners"
}
table.freeze(Tbl)
local config = {
	standard = "facet-field",
	contrast = "facet-control",
	utility = "facet-appearance-utility"
}

return function(p1)
	-- upvalues: config (copy), Tbl (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim = p1.types.UDim
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	
	local function _(Callback)
		-- upvalues: Compose (copy)
		return Compose.isValue(Callback) or type(Callback) == "function"
	end
	
	local _ = function(p2, p3)
		if p3 == nil then
			return "standard"
		end
		if p3 ~= "standard" and p3 ~= "contrast" and p3 ~= "utility" then
			error(`Facet UI.{p2}: appearance must be standard | contrast | utility (got {tostring(p3)})`, 0)
		end
		return p3
	end
	
	local _ = function(p2, p3, p4)
		-- upvalues: ReadFunction (copy)
		local ReadResult = ReadFunction(p4)
		
		if ReadResult ~= nil and type(ReadResult) ~= "string" then
			error(`Facet UI.{p2}: {p3} must be a string or a readable string (got {typeof(ReadResult)})`, 0)
		end
	end
	
	local _ = function(Object, Tag, p2)
		if p2 then
			Object:AddTag(Tag)
			
			return
		end
		if Object:HasTag(Tag) then
			Object:RemoveTag(Tag)
		end
	end
	
	return {
		KEYS = Tbl,
		present = function(p2): boolean
			return p2.label ~= nil or (p2.requiredMark ~= nil or (p2.hint ~= nil or (p2.errorText ~= nil or (p2.controlSize ~= nil or p2.appearance ~= nil)))) or p2.corners ~= nil
		end,
		check = function(p2, p3)
			-- upvalues: ReadFunction (copy), ReadFunction (copy), p1 (copy)
			local RequiredMark = p3.requiredMark
			
			if RequiredMark ~= nil and RequiredMark ~= "required" and RequiredMark ~= "optional" then
				error(`Facet UI.{p2}: requiredMark must be required | optional (got {tostring(RequiredMark)})`, 0)
			end
			local ReadResult = ReadFunction(p3.label)
			
			if ReadResult ~= nil and type(ReadResult) ~= "string" then
				error(`Facet UI.{p2}: label must be a string or a readable string (got {typeof(ReadResult)})`, 0)
			end
			local ReadResult1 = ReadFunction(p3.hint)
			
			if ReadResult1 ~= nil and type(ReadResult1) ~= "string" then
				error(`Facet UI.{p2}: hint must be a string or a readable string (got {typeof(ReadResult1)})`, 0)
			end
			local ReadResult2 = ReadFunction(p3.errorText)
			
			if ReadResult2 ~= nil and type(ReadResult2) ~= "string" then
				error(`Facet UI.{p2}: errorText must be a string or a readable string (got {typeof(ReadResult2)})`, 0)
			end
			local Corners = p3.corners
			
			if Corners ~= nil and Corners ~= "pill" and Corners ~= "square" then
				error(`Facet UI.{p2}: corners must be pill | square (got {tostring(Corners)})`, 0)
			end
			local ReadResult3 = ReadFunction(p3.appearance)
			
			if ReadResult3 ~= nil and ReadResult3 ~= "standard" and ReadResult3 ~= "contrast" and ReadResult3 ~= "utility" then
				error(`Facet UI.{p2}: appearance must be standard | contrast | utility (got {tostring(ReadResult3)})`, 0)
			end
			if p3.controlSize ~= nil then
				p1.controlSize(p3.controlSize, "height")
			end
		end,
		labelText = function(p2, p3)
			-- upvalues: ReadFunction (copy)
			local ReadResult = ReadFunction(p2.label, p3) or ""
			
			return if p2.requiredMark == "required" then ReadResult .. " *" else ReadResult
		end,
		errorOf = function(p2, p3)
			-- upvalues: ReadFunction (copy)
			return function(p4)
				-- upvalues: ReadFunction (upval), p2 (copy), p3 (copy)
				local v1 = ReadFunction(p2.errorText, p4)
				
				if type(v1) == "string" and v1 ~= "" then
					return v1
				else
					local v2 = if p3 then ReadFunction(p3, p4) else nil
					
					return if type(v2) == "string" then v2 else ""
				end
			end
		end,
		paint = function(p2, Object, p3, Callback)
			-- upvalues: config (upval), ReadFunction (copy), Compose (copy), Runtime (copy), Host (copy), TypesUDim (copy)
			local Tag = nil
			
			local function apply(p4)
				-- upvalues: config (upval), p2 (copy), ReadFunction (upval), p3 (copy), Tag (ref), Object (copy)
				local ReadResult = ReadFunction(p3.appearance, p4)
				local v1 = nil
				
				if ReadResult == nil then
					v1 = "standard"
				else
					if ReadResult ~= "standard" and ReadResult ~= "contrast" and ReadResult ~= "utility" then
						error(`Facet UI.{p2}: appearance must be standard | contrast | utility (got {tostring(ReadResult)})`, 0)
					end
					v1 = ReadResult
				end
				local Entry = config[v1]
				
				if Tag ~= Entry then
					if Tag then
						Object:RemoveTag(Tag)
					end
					Object:AddTag(Entry)
					Tag = Entry
				end
			end
			
			local AppearanceFunction = p3.appearance
			
			if Compose.isValue(AppearanceFunction) or type(AppearanceFunction) == "function" then
				Compose.watch(apply)
			else
				local ReadResult = ReadFunction(p3.appearance, nil)
				local v1 = nil
				
				if ReadResult == nil then
					v1 = "standard"
				else
					if ReadResult ~= "standard" and ReadResult ~= "contrast" and ReadResult ~= "utility" then
						error(`Facet UI.{p2}: appearance must be standard | contrast | utility (got {tostring(ReadResult)})`, 0)
					end
					v1 = ReadResult
				end
				local Entry = config[v1]
				
				if Tag ~= Entry then
					if Tag then
						Object:RemoveTag(Tag)
					end
					Object:AddTag(Entry)
					Tag = Entry
				end
			end
			if p3.corners then
				Runtime.mountFragment(function()
					-- upvalues: Host (upval), TypesUDim (upval), p3 (copy)
					return {
						Host.UICorner("Corners")({
							CornerRadius = TypesUDim.new(if p3.corners == "pill" then 1 else 0, 0)
						})
					}
				end, Object)
			end
			if Callback then
				Compose.watch(function(p4)
					-- upvalues: Object (copy), Callback (copy)
					if Callback(p4) then
						Object:AddTag("facet-invalid")
						
						return
					end
					if Object:HasTag("facet-invalid") then
						Object:RemoveTag("facet-invalid")
					end
				end)
			end
		end,
		wrap = function(p2)
			-- upvalues: ReadFunction (copy), ReadFunction (copy), Host (copy), TypesUDim2 (copy), TypesEnum (copy), p1 (copy), Runtime (copy), TypesVector2 (copy), Compose (copy), TypesUDim (copy)
			local Spec = p2.spec
			local Plate = p2.plate
			local Message = p2.message
			
			local function v37(p3)
				-- upvalues: ReadFunction (upval), Spec (copy), Message (copy)
				local v1 = ReadFunction(Spec.errorText, p3)
				
				if type(v1) == "string" and v1 ~= "" then
					return v1
				else
					local v2 = if Message then ReadFunction(Message, p3) else nil
					
					return if type(v2) == "string" then v2 else ""
				end
			end
			
			local function line(p3)
				-- upvalues: v37 (copy), ReadFunction (upval), Spec (copy)
				local v1 = v37(p3)
				
				return if v1 == "" then ReadFunction(Spec.hint, p3) or "" else v1
			end
			
			local List = {}
			
			if Spec.label ~= nil then
				table.insert(List, (Host.TextButton("Label")({
					Text = "",
					AutoButtonColor = false,
					Selectable = false,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = TypesUDim2.new(1, 0, 0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.Y,
					Interactable = function(p3)
						-- upvalues: p2 (copy)
						return p2.enabled(p3)
					end,
					Activated = function()
						-- upvalues: p2 (copy)
						if p2.enabled() then
							p2.focus()
						end
					end,
					p1.text({
						Name = "Title",
						TextWrapped = true,
						Text = function(p3)
							-- upvalues: Spec (copy), ReadFunction (upval)
							local ReadResult = ReadFunction(Spec.label, p3) or ""
							
							return if Spec.requiredMark == "required" then ReadResult .. " *" else ReadResult
						end,
						Size = TypesUDim2.new(1, 0, 0, 0),
						AutomaticSize = TypesEnum.AutomaticSize.Y
					}, nil, "label")
				})))
			end
			local EffectiveInputResult = p1.effectiveInput()
			
			local function _(p3): number
				-- upvalues: ReadFunction (upval), Spec (copy), EffectiveInputResult (copy), p1 (upval)
				return if ReadFunction(Spec.appearance, p3) == "utility" and EffectiveInputResult(p3) == "KeyboardAndMouse" then 0 else math.max(44, p1.metric("targetSizes.minimum", p3))
			end
			
			local Plate1 = Plate
			
			if Spec.controlSize ~= nil then
				local function plateHeight(p3): number
					-- upvalues: ReadFunction (upval), p1 (upval), Spec (copy)
					local ReadResult = ReadFunction(p1.config.theme, p3)
					local Field = ReadResult and (ReadResult.chrome and ReadResult.chrome.field)
					local ContentInsets = if Field and ReadFunction(Spec.appearance, p3) ~= "utility" and Field.kind ~= "native" and Field.kind ~= "none" then Field.contentInsets or {} else {}
					
					return (math.max(p1.controlSize(Spec.controlSize, "height", p3), (ContentInsets.top or 0) + (ContentInsets.bottom or 0) + p1.controlSize(Spec.controlSize, "iconSize", p3)))
				end
				
				Runtime.decorate(Plate, {
					AnchorPoint = TypesVector2.new(0, 0.5),
					Position = TypesUDim2.fromScale(0, 0.5),
					Size = function(p3)
						-- upvalues: TypesUDim2 (upval), plateHeight (copy)
						return TypesUDim2.new(1, 0, 0, (plateHeight(p3)))
					end,
					AutomaticSize = TypesEnum.AutomaticSize.None
				})
				Plate1 = Host.Frame(Plate.Name .. "+target")({
					BackgroundTransparency = 1,
					Size = function(p3)
						-- upvalues: TypesUDim2 (upval), ReadFunction (upval), Spec (copy), EffectiveInputResult (copy), p1 (upval), plateHeight (copy)
						return TypesUDim2.new(1, 0, 0, (math.max(if ReadFunction(Spec.appearance, p3) == "utility" and EffectiveInputResult(p3) == "KeyboardAndMouse" then 0 else math.max(44, p1.metric("targetSizes.minimum", p3)), (plateHeight(p3)))))
					end,
					Plate
				})
			end
			table.insert(List, Plate1)
			local v1 = false
			table.insert(List, Compose.show(function(p3): boolean
				-- upvalues: v1 (ref), v37 (copy), ReadFunction (upval), Spec (copy)
				local v2: boolean = v1
				
				if not v2 then
					local v3 = v37(p3)
					v2 = (if v3 == "" then ReadFunction(Spec.hint, p3) or "" else v3) ~= ""
				end
				v1 = v2
				
				return v1
			end, function()
				-- upvalues: p1 (upval), line (copy), TypesUDim2 (upval), TypesEnum (upval), Host (upval), Compose (upval), v37 (copy), ReadFunction (upval), Spec (copy), TypesUDim (upval)
				local Caption = p1.text({
					Name = "Validation",
					Text = line,
					Size = TypesUDim2.new(1, 0, 0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.Y,
					TextWrapped = true,
					Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
				}, nil, "caption")
				Compose.watch(function(p3)
					-- upvalues: Caption (copy), v37 (upval)
					if v37(p3) ~= "" then
						Caption:AddTag("facet-validation")
						
						return
					end
					if Caption:HasTag("facet-validation") then
						Caption:RemoveTag("facet-validation")
					end
				end)
				local TextSizeResult = p1.observeStyled.TextSize(Caption)
				local StatusError = p1.icon("status.error", {
					Name = "MessageMark",
					Visible = function(p3): boolean
						-- upvalues: v37 (upval)
						return v37(p3) ~= ""
					end,
					ScaleType = TypesEnum.ScaleType.Fit,
					Size = function(Callback)
						-- upvalues: p1 (upval), TextSizeResult (copy), TypesUDim2 (upval)
						local IconSizesSmall = p1.metric("iconSizes.small", Callback)
						local CallbackResult: number = Callback(TextSizeResult)
						
						return TypesUDim2.fromOffset(IconSizesSmall, if CallbackResult > 0 then CallbackResult else IconSizesSmall)
					end
				})
				StatusError:AddTag("facet-icon-error")
				local RowResult = p1.row({ StatusError, Caption }, {
					Name = "Message",
					Size = TypesUDim2.new(1, 0, 0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.Y,
					Visible = function(p3): boolean
						-- upvalues: v37 (upval), ReadFunction (upval), Spec (upval)
						local v2 = v37(p3)
						
						return (if v2 == "" then ReadFunction(Spec.hint, p3) or "" else v2) ~= ""
					end
				})
				assert(RowResult:FindFirstChildWhichIsA("UIListLayout")).Padding = TypesUDim.new(0, 4)
				
				return RowResult
			end))
			local Native = p2.native
			Native.BackgroundTransparency = 1
			Native.Size = Native.Size or TypesUDim2.new(1, 0, 0, 0)
			Native.AutomaticSize = Native.AutomaticSize or TypesEnum.AutomaticSize.Y
			local ColumnResult = p1.column(List, Native)
			assert(ColumnResult:FindFirstChildWhichIsA("UIListLayout")).Padding = TypesUDim.new(0, 4)
			
			return ColumnResult
		end
	}
end