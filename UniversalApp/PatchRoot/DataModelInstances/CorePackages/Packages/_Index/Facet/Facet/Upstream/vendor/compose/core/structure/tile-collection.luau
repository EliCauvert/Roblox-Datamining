local FreezeFunction = table.freeze
local _ = require("../types")
local OwnerModule = require("../ownership/owner")
local _ = require("../runtime/children")
local DiagnosticsModule = require("../diagnostics")
local _ = require("../host")
local SupportModule = require("./support")
local _ = require("../reactive/types")
local KeyedModule = require("./keyed")
local config = {
	viewport = true,
	tileSize = true,
	overscan = true,
	read = true,
	render = true
}

local function _(Value: number): boolean
	return type(Value) == "number" and Value == Value and math.abs(Value) < 1e999
end

return function(p1)
	-- upvalues: SupportModule (copy), config (copy), DiagnosticsModule (copy), OwnerModule (copy), FreezeFunction (copy), KeyedModule (copy)
	local TileCollection = SupportModule.optionsOf(p1, "TileCollection", "viewport = ..., tileSize = ..., read = ..., render = ...")
	SupportModule.noUnknownFields(TileCollection, "TileCollection", config)
	local TileCollection1 = SupportModule.sourceOf(TileCollection.viewport, "TileCollection", "viewport")
	local TileCollection2 = SupportModule.builderOf(TileCollection.read, "TileCollection", "read")
	local TileCollection3 = SupportModule.builderOf(TileCollection.render, "TileCollection", "render")
	local TileSize = TileCollection.tileSize
	
	if type(TileSize) == "table" then
		local Width: number = TileSize.width
		
		if type(Width) == "number" and (Width == Width and math.abs(Width) < 1e999) then
			local Height: number = TileSize.height
			
			if type(Height) == "number" and (Height == Height and math.abs(Height) < 1e999) and TileSize.width > 0 and TileSize.height > 0 then
				SupportModule.noUnknownFields(TileSize, "TileCollection.tileSize", { width = true, height = true })
				local Width1 = TileSize.width
				local Height1 = TileSize.height
				local Overscan = TileCollection.overscan or 0
				local IsMagnitudeBelow: boolean = type(Overscan) == "number" and Overscan == Overscan and math.abs(Overscan) < 1e999
				
				return if IsMagnitudeBelow and Overscan >= 0 and Overscan % 1 == 0 then function(p2)
					-- upvalues: SupportModule (upval), OwnerModule (upval), TileCollection1 (copy), DiagnosticsModule (upval), Width1 (copy), Overscan (copy), Height1 (copy), TileCollection2 (copy), FreezeFunction (upval), KeyedModule (upval), TileCollection3 (copy)
					local TileCollection = SupportModule.ownerFor("TileCollection")
					SupportModule.mountPointOf(p2, "TileCollection")
					local Tbl = {}
					local Tbl1 = {}
					OwnerModule.own(TileCollection, function()
						-- upvalues: Tbl (ref), Tbl1 (ref)
						table.clear(Tbl)
						table.clear(Tbl1)
					end)
					KeyedModule({
						from = function(p3)
							-- upvalues: TileCollection1 (upval), DiagnosticsModule (upval), Width1 (upval), Overscan (upval), Height1 (upval), TileCollection2 (upval), Tbl1 (ref), FreezeFunction (upval), Tbl (ref)
							local TileCollectionResult = TileCollection1(p3)
							local X: number = TileCollectionResult.x
							
							if type(X) == "number" and (X == X and math.abs(X) < 1e999) then
								local Y: number = TileCollectionResult.y
								
								if type(Y) == "number" and (Y == Y and math.abs(Y) < 1e999) then
									local Width1: number = TileCollectionResult.width
									
									if type(Width1) == "number" and (Width1 == Width1 and math.abs(Width1) < 1e999) then
										local Height1: number = TileCollectionResult.height
										
										if type(Height1) == "number" and (Height1 == Height1 and math.abs(Height1) < 1e999) and TileCollectionResult.width >= 0 and TileCollectionResult.height >= 0 then
											local t = {}
											local t1 = {}
											local t2 = {}
											
											if TileCollectionResult.width > 0 and TileCollectionResult.height > 0 then
												local FlooredDelta = math.floor(TileCollectionResult.x / Width1) - Overscan
												local NewCeiled = math.ceil((TileCollectionResult.x + TileCollectionResult.width) / Width1) - 1 + Overscan
												local FlooredDelta1 = math.floor(TileCollectionResult.y / Height1) - Overscan
												local NewCeiled1 = math.ceil((TileCollectionResult.y + TileCollectionResult.height) / Height1) - 1 + Overscan
												
												for _, Value in { FlooredDelta, NewCeiled, FlooredDelta1, NewCeiled1 } do
													if type(Value) ~= "number" or (Value ~= Value or math.abs(Value) >= 1e999) or math.abs(Value) > 9007199254740990 then
														return DiagnosticsModule.raise("tile-collection/invalid-viewport", "TileCollection coordinates must be safely representable integers", {})
													end
												end
												for i1 = FlooredDelta1, NewCeiled1 do
													for i = FlooredDelta, NewCeiled do
														local TileCollectionResult1 = TileCollection2(p3, i, i1)
														
														if TileCollectionResult1 ~= nil then
															local Formatted = string.format("%.0f:%.0f", i + 0, i1 + 0)
															local Entry = Tbl1[Formatted]
															local config1 = nil
															
															if Entry == nil then
																local config = {
																	column = i,
																	row = i1,
																	x = i * Width1,
																	y = i1 * Height1,
																	width = Width1,
																	height = Height1
																}
																FreezeFunction(config)
																config1 = config
															else
																config1 = Entry
															end
															t[#t + 1] = TileCollectionResult1
															t1[#t] = Formatted
															t2[Formatted] = config1
														end
													end
												end
											end
											Tbl = t1
											Tbl1 = t2
											
											return t
										end
									end
								end
							end
							return DiagnosticsModule.raise("tile-collection/invalid-viewport", "TileCollection needs a finite viewport with non-negative dimensions", {})
						end,
						key = function(_, p4)
							-- upvalues: Tbl (ref)
							return Tbl[p4]
						end,
						render = function(p4, _, p5)
							-- upvalues: TileCollection3 (upval), Tbl1 (ref)
							return TileCollection3(p4, Tbl1[p5])
						end
					})(p2)
				end else DiagnosticsModule.raise("tile-collection/invalid-overscan", "TileCollection overscan must be a non-negative integer", {})
			end
		end
	end
	return DiagnosticsModule.raise("tile-collection/invalid-size", "TileCollection needs positive finite tile dimensions", {})
end