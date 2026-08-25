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

local function getBadgeStyleOptions(p0, p1)
	-- upvalues: tileBadgeComponentTypeValues (ref), flaggedMutedError (ref)
	local t = {
		[tileBadgeComponentTypeValues.Pill] = {
			backgroundColorStyle = p0.Color.Extended.White.White_90,
			contentColorStyle = p0.LightMode.Content.Emphasis,
			cornerRadius = UDim.new(1, 0),
			verticalPadding = p0.Size.Size_150
		},
		[tileBadgeComponentTypeValues.RoundedRectangle] = {
			backgroundColorStyle = p0.Color.Extended.Black.Black_90,
			contentColorStyle = p0.DarkMode.Content.Emphasis,
			cornerRadius = UDim.new(0.2, 0),
			verticalPadding = p0.Size.Size_100
		}
	}
	local var6 = p1 and t[p1]
	
	if p1 ~= nil and not var6 then
		flaggedMutedError("GameTileOverlayBadgeInvalidComponentTypeError", `Unsupported game tile badge component type: {p1}`)
	end
	return var6 or t[tileBadgeComponentTypeValues.Pill]
end

return reactModule.memo(function(p2)
	-- upvalues: useTokens (ref), reactModule (ref), gameTileConstantsModule (ref), flaggedMutedError (ref), tileBadgeIconNamesByType (ref), gameTileOverlayBadgeModule (ref), getBadgeStyleOptions (ref)
	local _ = nil
	local _ = nil
	local var7 = useTokens()
	local medium = var7.Padding.Medium
	local var8, var9 = reactModule.useBinding(0)
	local var10 = reactModule.useCallback(function(p3)
		-- upvalues: var9 (ref), medium (write)
		var9(p3.AbsoluteSize.X - medium * 2)
	end, { medium })
	local t = {}
	
	for i, v in p2.tileBadgesByPosition do
		local var12 = nil
		local var13 = nil
		local var14 = gameTileConstantsModule.TileBadgePositionCalculators[i]
		
		if var14 then
			local var15, var16 = var14(medium)
			var12 = var15
			var13 = var16
		else
			flaggedMutedError("GameTileOverlayBadgeInvalidPositionError", `Unsupported game tile badge position: {i}`)
		end
		if #v > 0 then
			local var17 = v[1]
			local t_1 = nil
			
			if var17.icons and #var17.icons > 0 then
				t_1 = {}
				
				for i_1, v_1 in var17.icons do
					local var19 = tileBadgeIconNamesByType[v_1]
					
					if var19 then
						table.insert(t_1, var19)
					else
						warn(`Unsupported game tile badge icon type: {v_1}`)
					end
				end
			end
			t[i .. "TileBadge"] = reactModule.createElement(gameTileOverlayBadgeModule, {
				Position = var12,
				AnchorPoint = var13,
				maxWidthBinding = var8,
				icons = t_1,
				text = var17.text,
				styleOptions = getBadgeStyleOptions(var7, var17.tileBadgeComponentType)
			})
		end
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[reactModule.Change.AbsoluteSize] = var10
	}, t)
end)