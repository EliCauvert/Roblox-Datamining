local CivilDateModule = require("./civil_date")
local _ = require("./types")
local _ = require("./date_time_picker_types")
local _ = require("./control_types")
local _ = require("../vendor/compose/core")

return {
	CELLS = 42,
	CELL = 44,
	DISC = 32,
	GAP = 24,
	YEAR_SPAN = 50,
	ROW = 44,
	span = function(Start, Finish)
		return { start = Start, finish = Finish }
	end,
	monthOf = function(p1)
		return { day = 1, year = p1.year, month = p1.month }
	end,
	sameRange = function(p1, p2)
		-- upvalues: CivilDateModule (copy)
		return CivilDateModule.same(p1.start, p2.start) and CivilDateModule.same(p1.finish, p2.finish)
	end,
	new = function(p1)
		local Host = p1.Host
		local TypesUDim2 = p1.types.UDim2
		local TypesVector2 = p1.types.Vector2
		
		return {
			gui = p1.config.guiService,
			input = p1.config.services.UserInputService,
			tagWhile = function(Object, Tag, Callback)
				-- upvalues: p1 (copy)
				p1.Compose.watch(function(p2)
					-- upvalues: Callback (copy), Object (copy), Tag (copy)
					if Callback(p2) then
						Object:AddTag(Tag)
						
						return
					end
					if Object:HasTag(Tag) then
						Object:RemoveTag(Tag)
					end
				end)
			end,
			frame = function(Name, p2)
				-- upvalues: TypesUDim2 (copy), TypesVector2 (copy), Host (copy)
				local config = {
					BorderSizePixel = 0,
					Name = Name,
					Size = TypesUDim2.fromOffset(32, 32),
					AnchorPoint = TypesVector2.new(0.5, 0.5),
					Position = TypesUDim2.fromScale(0.5, 0.5)
				}
				local P10 = p2 or {}
				for i, value in P10 do
					if type(i) == "number" then
						config[#config + 1] = value
					else
						config[i] = value
					end
				end
				return Host.Frame(config)
			end
		}
	end
}