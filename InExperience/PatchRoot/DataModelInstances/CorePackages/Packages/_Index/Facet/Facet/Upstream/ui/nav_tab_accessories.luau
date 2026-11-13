local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local SegmentMetricsModule = require("./segment_metrics")
local _ = require("./navigation_props")
local _ = require("./nav_tab_metrics")

return function(p1, p2, p3, p4, p5)
	-- upvalues: SegmentMetricsModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local Inset = SegmentMetricsModule.inset
	local Frame = p5.frame
	local Placement = Frame.placement
	local HeadHeight = Frame.headHeight
	local FootHeight = Frame.footHeight
	local TrailingWidth = Frame.trailingWidth
	local AboveHeight = p5.aboveHeight
	local Metrics = p5.metrics
	local BandFunction = Metrics.band
	local BottomInsetFunction = Metrics.bottomInset
	local config = {
		head = { sidebar = true },
		foot = { sidebar = true },
		trailing = { topBar = true, bottomBar = true, bottomBarCompact = true },
		aboveBar = { bottomBar = true, bottomBarCompact = true }
	}
	local Accessories = p3.accessories or {}
	for i, accessory in Accessories do
		assert(config[i] and type(accessory) == "function", "TabView accessories require head, foot, trailing or aboveBar builders")
		
		if p3.placement and p3.placement ~= "automatic" and type(p3.placement) == "string" then
			assert(config[i][p3.placement], "TabView accessory is unavailable in this placement")
		end
		p2.attach(p4, {
			Compose.keyed({
				from = function(Callback)
					-- upvalues: Placement (copy), config (copy), i (copy)
					local CallbackResult = Callback(Placement)
					local List = {}
					
					if config[i][CallbackResult] then
						table.insert(List, CallbackResult)
					end
					return List
				end,
				render = function(p6)
					-- upvalues: accessory (copy), Host (copy), i (copy), TypesUDim2 (copy), Metrics (copy), BandFunction (copy), TypesEnum (copy), p1 (copy), HeadHeight (copy), FootHeight (copy), TrailingWidth (copy), AboveHeight (copy), Compose (copy), Runtime (copy), TypesVector2 (copy), Placement (copy), BottomInsetFunction (copy), Inset (copy)
					local AccessoryResult = accessory(p6:peek())
					
					if AccessoryResult == nil then
						return Host.Folder({})
					else
						local v1 = Host.Frame("Accessory-" .. i)({
							BackgroundTransparency = 1,
							ClipsDescendants = true,
							Size = function(p7)
								-- upvalues: i (upval), TypesUDim2 (upval), Metrics (upval), BandFunction (upval)
								return if i == "head" or i == "foot" then TypesUDim2.fromOffset(Metrics.railWidth(p7), 0) elseif i == "trailing" then TypesUDim2.fromOffset(0, BandFunction(p7)) else TypesUDim2.new(1, 0, 0, 0)
							end,
							AutomaticSize = if i == "trailing" then TypesEnum.AutomaticSize.X else TypesEnum.AutomaticSize.Y,
							AccessoryResult
						})
						local AbsoluteSizeResult = p1.observe.AbsoluteSize(v1)
						local HeadHeight1 = if i == "head" then HeadHeight elseif i == "foot" then FootHeight elseif i == "trailing" then TrailingWidth else AboveHeight
						Compose.watch(function(Callback)
							-- upvalues: AbsoluteSizeResult (copy), HeadHeight1 (copy), i (upval)
							local CallbackResult = Callback(AbsoluteSizeResult)
							HeadHeight1:set(if i == "trailing" then CallbackResult.X else CallbackResult.Y)
						end)
						Compose.cleanup(function()
							-- upvalues: HeadHeight1 (copy)
							HeadHeight1:set(0)
						end)
						Runtime.decorate(v1, {
							ZIndex = 5,
							Name = "Accessory-" .. i,
							AnchorPoint = TypesVector2.new(if i == "trailing" then 1 else 0, if i == "foot" or i == "aboveBar" then 1 else 0),
							Position = function(Callback)
								-- upvalues: Placement (upval), i (upval), TypesUDim2 (upval), BandFunction (upval), BottomInsetFunction (upval), Metrics (upval), Inset (upval)
								local CallbackResult = Callback(Placement)
								
								return if i == "head" then TypesUDim2.fromOffset(0, 0) elseif i == "foot" then TypesUDim2.fromScale(0, 1) elseif i == "aboveBar" then TypesUDim2.new(0, 0, 1, -BandFunction(Callback) - BottomInsetFunction(Callback)) else TypesUDim2.new(1, 0, if CallbackResult == "topBar" then 0 else 1, if Metrics.segmentedTop(Callback) then Inset elseif CallbackResult == "topBar" then 0 else -BandFunction(Callback) - BottomInsetFunction(Callback))
							end
						})
						
						return v1
					end
				end
			})
		})
	end
end