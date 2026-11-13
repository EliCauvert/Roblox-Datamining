local _ = require("./input_props")
local _ = require("./control_types")
local _ = require("./types")
local _ = require("./content_types")
local _ = require("../vendor/compose/core")
local ContentValuesModule = require("./content_values")
local _ = require("./content_props")
local list = {
	{
		side = "up",
		name = "Opt1",
		icon = "vote.up",
		label = "Upvote"
	},
	{
		side = "down",
		name = "Opt2",
		icon = "vote.down",
		label = "Downvote"
	}
}

return function(p1, p2)
	-- upvalues: ContentValuesModule (copy), list (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesUDim = p1.types.UDim
	
	local function isVote(p3): boolean
		return p3 == "up" or (p3 == "down" or p3 == "none")
	end
	
	p2.Vote = p1.construct("Vote", function(p3)
		-- upvalues: ReadFunction (copy), ContentValuesModule (upval), p1 (copy), isVote (copy), Compose (copy), TypesUDim2 (copy), TypesEnum (copy), Host (copy), TypesUDim (copy), list (upval), TypesVector2 (copy), p2 (copy)
		local ReadResult = ReadFunction(p3.value)
		assert(ReadResult == "up" or (ReadResult == "down" or ReadResult == "none"), "Facet UI.Vote: value must be up, down or none")
		assert(p3.onChange == nil or type(p3.onChange) == "function", "Facet UI.Vote: onChange must be a function")
		assert(p3.onChange ~= nil or ReadFunction(p3.readOnly) == true, "Facet UI.Vote: onChange(next) is required unless readOnly is true")
		local OnChangeFunction = p3.onChange
		local Vote = ContentValuesModule(p1, "Vote")
		
		if p3.controls then
			p3.controls.diagnostics = Vote.list
		end
		local Value = Vote.legal("value", p3.value, isVote, "must be up, down or none")
		local Flag = false
		local FormulaResult = Compose.formula(function(p4): boolean
			-- upvalues: ReadFunction (upval), p3 (copy), OnChangeFunction (copy), Flag (ref), Vote (copy)
			local IsReadResult = ReadFunction(p3.readOnly, p4) == true
			
			if IsReadResult or OnChangeFunction ~= nil then
				Flag = false
				
				return IsReadResult
			end
			if not Flag then
				Flag = true
				Vote.note("Facet UI.Vote: readOnly = false needs onChange; the vote stays read-only")
			end
			return true
		end)
		
		local function Enabled(p4): boolean
			-- upvalues: ReadFunction (upval), p3 (copy)
			return ReadFunction(p3.enabled, p4) ~= false
		end
		
		local Flag1 = false
		Compose.cleanup(function()
			-- upvalues: Flag1 (ref)
			Flag1 = true
		end)
		
		local function _(p4)
			-- upvalues: OnChangeFunction (copy), Flag1 (ref), FormulaResult (copy), ReadFunction (upval), p3 (copy), Value (copy)
			if not Flag1 and not FormulaResult:peek() and (ReadFunction(p3.enabled, nil) ~= false and OnChangeFunction ~= nil) then
				OnChangeFunction(if Value:peek() == p4 then "none" else p4)
				
				return
			end
		end
		
		local UchFloor = p1.touchFloor()
		
		local function side(p4)
			-- upvalues: p1 (upval), p3 (copy), TypesUDim2 (upval)
			local Height = p1.controlSize(p3.controlSize, "height", p4)
			
			return TypesUDim2.fromOffset(Height, Height)
		end
		
		local function strip(Name, ButtonResults)
			-- upvalues: TypesUDim2 (upval), TypesEnum (upval), Host (upval), TypesUDim (upval), p1 (upval)
			local config = {
				Name = Name,
				Size = TypesUDim2.fromOffset(0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				Host.UIListLayout({
					FillDirection = TypesEnum.FillDirection.Horizontal,
					SortOrder = TypesEnum.SortOrder.LayoutOrder,
					Padding = TypesUDim.new(0, 4)
				})
			}
			
			for _, buttonResult in ButtonResults do
				config[#config + 1] = buttonResult
			end
			return p1.styled(Host.Frame(config), "segmented")
		end
		
		local _ = function(Object, p4)
			-- upvalues: Compose (upval), Value (copy)
			Object:AddTag("facet-segment")
			Compose.watch(function(Callback)
				-- upvalues: Value (upval), p4 (copy), Object (copy)
				if Callback(Value) == p4 then
					Object:AddTag("facet-segment-current")
					
					return
				end
				if Object:HasTag("facet-segment-current") then
					Object:RemoveTag("facet-segment-current")
				end
			end)
		end
		
		local ShowResult = Compose.show(FormulaResult, function()
			-- upvalues: list (upval), Host (upval), side (copy), Value (copy), p1 (upval), TypesVector2 (upval), TypesUDim2 (upval), p3 (copy), Compose (upval), strip (copy)
			local List = {}
			
			for LayoutOrder, value in list do
				local Object = Host.Frame(value.name)({
					LayoutOrder = LayoutOrder,
					BackgroundTransparency = 1,
					Size = side,
					Attributes = {
						label = value.label,
						selected = function(Callback): boolean
							-- upvalues: Value (upval), value (copy)
							return Callback(Value) == value.side
						end
					},
					Host.UICorner({}),
					p1.icon(value.icon, {
						Name = "Icon",
						AnchorPoint = TypesVector2.new(0.5, 0.5),
						Position = TypesUDim2.fromScale(0.5, 0.5),
						Size = function(p4)
							-- upvalues: p1 (upval), p3 (upval), TypesUDim2 (upval)
							local IconSize = p1.controlSize(p3.controlSize, "iconSize", p4)
							
							return TypesUDim2.fromOffset(IconSize, IconSize)
						end
					})
				})
				local Side = value.side
				Object:AddTag("facet-segment")
				Compose.watch(function(Callback)
					-- upvalues: Value (upval), Side (copy), Object (copy)
					if Callback(Value) == Side then
						Object:AddTag("facet-segment-current")
						
						return
					end
					if Object:HasTag("facet-segment-current") then
						Object:RemoveTag("facet-segment-current")
					end
				end)
				table.insert(List, Object)
			end
			return (strip("Plate", List))
		end, function()
			-- upvalues: list (upval), p3 (copy), Value (copy), Enabled (copy), OnChangeFunction (copy), Flag1 (ref), FormulaResult (copy), ReadFunction (upval), side (copy), TypesEnum (upval), Host (upval), TypesVector2 (upval), UchFloor (copy), p2 (upval), Compose (upval), strip (copy)
			local ButtonResults = {}
			
			for LayoutOrder, value in list do
				local ButtonResult = p2.Button({
					Name = value.name,
					LayoutOrder = LayoutOrder,
					label = "",
					name = value.label,
					icon = value.icon,
					controlSize = p3.controlSize,
					selected = function(Callback): boolean
						-- upvalues: Value (upval), value (copy)
						return Callback(Value) == value.side
					end,
					enabled = Enabled,
					onActivate = function()
						-- upvalues: value (copy), OnChangeFunction (upval), Flag1 (upval), FormulaResult (upval), ReadFunction (upval), p3 (upval), Value (upval)
						local Side = value.side
						
						if not Flag1 and not FormulaResult:peek() and ReadFunction(p3.enabled, nil) ~= false then
							if OnChangeFunction == nil then return end
							OnChangeFunction(if Value:peek() == Side then "none" else Side)
						end
					end,
					Size = side,
					AutomaticSize = TypesEnum.AutomaticSize.None,
					Host.UISizeConstraint({
						MinSize = function(p4)
							-- upvalues: TypesVector2 (upval), UchFloor (upval)
							return TypesVector2.new(UchFloor(p4), UchFloor(p4))
						end
					})
				})
				local Side = value.side
				ButtonResult:AddTag("facet-segment")
				Compose.watch(function(Callback)
					-- upvalues: Value (upval), Side (copy), ButtonResult (copy)
					if Callback(Value) == Side then
						ButtonResult:AddTag("facet-segment-current")
						
						return
					end
					if ButtonResult:HasTag("facet-segment-current") then
						ButtonResult:RemoveTag("facet-segment-current")
					end
				end)
				table.insert(ButtonResults, ButtonResult)
			end
			return strip("Choice", ButtonResults)
		end)
		
		local function summaryText(p4)
			-- upvalues: p3 (copy), p1 (upval)
			local Summary = p3.summary
			
			return if Summary == nil then "" elseif type(Summary) == "string" then Summary else p1.readSource(Summary, p4)
		end
		
		local Summary = p1.text({
			Name = "Summary",
			LayoutOrder = 2,
			TextWrapped = false,
			Text = summaryText,
			Visible = function(p4): boolean
				-- upvalues: p3 (copy), p1 (upval)
				local Summary = p3.summary
				
				return (if Summary == nil then "" elseif type(Summary) == "string" then Summary else p1.readSource(Summary, p4)) ~= ""
			end,
			TextTruncate = TypesEnum.TextTruncate.AtEnd,
			Attributes = { FacetLabel = summaryText },
			AutomaticSize = TypesEnum.AutomaticSize.XY
		})
		Summary:AddTag("facet-secondary")
		
		return Host.Frame(p1.props(p3, {
			"value", "onChange", "summary", "readOnly", "controlSize", "enabled",
			"controls"
		}, {
			Name = "Vote",
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromOffset(0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.XY,
			Attributes = {
				FacetValue = function(p4)
					-- upvalues: p1 (upval), Value (copy)
					return p1.readSource(Value, p4)
				end,
				FacetReadOnly = function(Callback)
					-- upvalues: FormulaResult (copy)
					return Callback(FormulaResult)
				end
			},
			Host.UIListLayout({
				FillDirection = TypesEnum.FillDirection.Horizontal,
				SortOrder = TypesEnum.SortOrder.LayoutOrder,
				VerticalAlignment = TypesEnum.VerticalAlignment.Center,
				Padding = function(p4)
					-- upvalues: TypesUDim (upval), p1 (upval)
					return TypesUDim.new(0, p1.metric("space.s", p4))
				end
			}),
			Host.Frame("Mode")({
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = TypesUDim2.fromOffset(0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				ShowResult
			}),
			Summary
		}))
	end)
end