local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local flaggedMutedError = require(parent.Loggers).flaggedMutedError
local useTokens = require(parent.Foundation).Hooks.useTokens
local reactModule = require(parent.React)
local gameTileConstantsModule = require(gameTile.GameTileConstants)
local gameTileOverlayBadgeModule = require(gameTile.Overlays.GameTileOverlayBadge)
local _ = require(gameTile.GameTileTypes)
local tileBadgeIconNamesByType = gameTileConstantsModule.TileBadgeIconNamesByType
local tileBadgeComponentTypeValues = gameTileConstantsModule.TileBadgeComponentTypeValues

local function getBadgeStyleOptions(p1, p2)
	-- upvalues: tileBadgeComponentTypeValues (ref), flaggedMutedError (ref)
	local t = {
		[tileBadgeComponentTypeValues.Pill] = {
			backgroundColorStyle = p1.Color.Extended.White.White_90,
			contentColorStyle = p1.LightMode.Content.Emphasis,
			cornerRadius = UDim.new(1, 0),
			verticalPadding = p1.Size.Size_150
		},
		[tileBadgeComponentTypeValues.RoundedRectangle] = {
			backgroundColorStyle = p1.Color.Extended.Black.Black_90,
			contentColorStyle = p1.DarkMode.Content.Emphasis,
			cornerRadius = UDim.new(0.2, 0),
			verticalPadding = p1.Size.Size_100
		}
	}
	local var1 = p2 and t[p2]
	
	if p2 ~= nil and not var1 then
		flaggedMutedError("GameTileOverlayBadgeInvalidComponentTypeError", `Unsupported game tile badge component type: {p2}`)
	end
	return var1 or t[tileBadgeComponentTypeValues.Pill]
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), gameTileConstantsModule (ref), flaggedMutedError (ref), tileBadgeIconNamesByType (ref), gameTileOverlayBadgeModule (ref), getBadgeStyleOptions (ref)
	local _ = nil
	local _ = nil
	local var1 = useTokens()
	local medium = var1.Padding.Medium
	local var2, var3 = reactModule.useBinding(0)
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), medium (write)
		var3(p2.AbsoluteSize.X - medium * 2)
	end, { medium })
	local t = {}
	
	for i, v in p1.tileBadgesByPosition do
		local var5 = nil
		local var6 = nil
		local var7 = gameTileConstantsModule.TileBadgePositionCalculators[i]
		
		if var7 then
			local var8, var9 = var7(medium)
			var5 = var8
			var6 = var9
		else
			flaggedMutedError("GameTileOverlayBadgeInvalidPositionError", `Unsupported game tile badge position: {i}`)
		end
		if #v > 0 then
			local var10 = v[1]
			local t_1 = nil
			
			if var10.icons and #var10.icons > 0 then
				t_1 = {}
				
				for i_1, v_1 in var10.icons do
					local var11 = tileBadgeIconNamesByType[v_1]
					
					if var11 then
						table.insert(t_1, var11)
					else
						warn(`Unsupported game tile badge icon type: {v_1}`)
					end
				end
			end
			t[i .. "TileBadge"] = reactModule.createElement(gameTileOverlayBadgeModule, {
				Position = var5,
				AnchorPoint = var6,
				maxWidthBinding = var2,
				icons = t_1,
				text = var10.text,
				styleOptions = getBadgeStyleOptions(var1, var10.tileBadgeComponentType)
			})
		end
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[reactModule.Change.AbsoluteSize] = var4
	}, t)
end)