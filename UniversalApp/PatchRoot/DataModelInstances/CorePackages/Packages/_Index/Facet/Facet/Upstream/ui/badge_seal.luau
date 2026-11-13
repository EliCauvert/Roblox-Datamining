local _ = require("./control_types")
local _ = require("./types")
local _ = require("./content_types")
local _ = require("./media_types")
local _ = require("../vendor/compose/core")

return function(p1, p2)
	local Host = p1.Host
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	
	local function words(Enabled: number)
		if Enabled == true then
			return "•"
		elseif type(Enabled) == "number" then
			assert(Enabled == Enabled and Enabled % 1 == 0 and Enabled >= 0, "Facet UI.badged: a count must be a whole number of 0 or more")
			
			return if Enabled > 99 then "99+" elseif Enabled == 0 then "" else tostring(Enabled)
		elseif type(Enabled) == "string" then
			return Enabled
		else
			assert(Enabled == nil or Enabled == false, "Facet UI.badged: value must be a string, a count, true, false or nil")
			
			return ""
		end
	end
	
	function p2.badged(Frame: Frame, p3, p4)
		-- upvalues: Compose (copy), ReadFunction (copy), words (copy), ReadFunction (copy), Host (copy), TypesEnum (copy), TypesUDim2 (copy), p2 (copy), TypesVector2 (copy)
		assert(Frame and Frame:IsA("GuiObject"), "Facet UI.badged: host must be a GuiObject")
		assert(p4 == nil or type(p4) == "table", "Facet UI.badged: options must be a table with direction and status")
		local P4 = p4 or {}
		for i in P4 do
			assert(i == "direction" or i == "status", `Facet UI.badged: unknown option '{tostring(i)}'`)
		end
		local Direction = P4.direction
		local Status = P4.status
		assert(Direction == nil or (Direction == "ltr" or Direction == "rtl"), "Facet UI.badged: direction must be ltr or rtl")
		assert(Compose.currentOwner() ~= nil, "Facet UI.badged: build a badged host inside runtime.mount")
		
		local function tone(p5)
			-- upvalues: ReadFunction (upval), Status (copy)
			return ReadFunction(Status, p5) or "error"
		end
		
		words(ReadFunction(p3))
		
		local function Label(p5)
			-- upvalues: words (upval), ReadFunction (upval), p3 (copy)
			return (words(ReadFunction(p3, p5)))
		end
		
		return (Host.Frame(Frame.Name .. "+badge")({
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = Frame.LayoutOrder,
			Size = TypesUDim2.fromOffset(0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.XY,
			Host.UIListLayout({
				FillDirection = TypesEnum.FillDirection.Vertical,
				SortOrder = TypesEnum.SortOrder.LayoutOrder
			}),
			Frame,
			Host.Folder("Seal")({
				Host.Frame("Corner")({
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = TypesUDim2.fromOffset(0, 0),
					Position = TypesUDim2.fromScale(if Direction == "rtl" then 0 else 1, 0),
					ZIndex = Frame.ZIndex + 2,
					Compose.show(function(p5): boolean
						-- upvalues: ReadFunction (upval), p3 (copy)
						return ReadFunction(p3, p5) == true
					end, function()
						-- upvalues: p2 (upval), tone (copy), TypesVector2 (upval), TypesUDim2 (upval), Frame (copy)
						return p2.StatusIndicator({
							Name = "CornerDot",
							form = "dot",
							status = tone,
							AnchorPoint = TypesVector2.new(0.5, 0.5),
							Position = TypesUDim2.fromScale(0, 0),
							ZIndex = Frame.ZIndex + 2
						})
					end),
					Compose.show(function(p5): boolean
						-- upvalues: ReadFunction (upval), p3 (copy), words (upval)
						return ReadFunction(p3, p5) ~= true and words(ReadFunction(p3, p5)) ~= ""
					end, function()
						-- upvalues: p2 (upval), Label (copy), tone (copy), TypesVector2 (upval), TypesUDim2 (upval), Frame (copy)
						return p2.Badge({
							Name = "CornerBadge",
							label = Label,
							status = tone,
							AnchorPoint = TypesVector2.new(0.5, 0.5),
							Position = TypesUDim2.fromScale(0, 0),
							ZIndex = Frame.ZIndex + 2
						})
					end)
				})
			})
		}))
	end
end