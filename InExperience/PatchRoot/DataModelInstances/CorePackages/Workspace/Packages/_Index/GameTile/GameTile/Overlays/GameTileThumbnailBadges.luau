local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local FlaggedMutedErrorFunction = require(Parent.Loggers).flaggedMutedError
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local ReactModule = require(Parent.React)
local GameTileConstantsModule = require(GameTile.GameTileConstants)
local GameTileOverlayBadgeModule = require(GameTile.Overlays.GameTileOverlayBadge)
local _ = require(GameTile.GameTileTypes)
local TileBadgeIconNamesByType = GameTileConstantsModule.TileBadgeIconNamesByType
local TileBadgeComponentTypeValues = GameTileConstantsModule.TileBadgeComponentTypeValues

local function getBadgeStyleOptions(p1, TileBadgeComponentType) --[[ Line: 19 ]]
	-- upvalues: TileBadgeComponentTypeValues (copy), FlaggedMutedErrorFunction (copy)
	local config = {
		[TileBadgeComponentTypeValues.Pill] = {
			backgroundColorStyle = p1.Color.Extended.White.White_90,
			contentColorStyle = p1.LightMode.Content.Emphasis,
			cornerRadius = UDim.new(1, 0),
			verticalPadding = p1.Size.Size_150
		},
		[TileBadgeComponentTypeValues.RoundedRectangle] = {
			backgroundColorStyle = p1.Color.Extended.Black.Black_90,
			contentColorStyle = p1.DarkMode.Content.Emphasis,
			cornerRadius = UDim.new(0.2, 0),
			verticalPadding = p1.Size.Size_100
		}
	}
	local Entry = TileBadgeComponentType and config[TileBadgeComponentType]
	
	if TileBadgeComponentType ~= nil and not Entry then
		FlaggedMutedErrorFunction("GameTileOverlayBadgeInvalidComponentTypeError", `Unsupported game tile badge component type: {TileBadgeComponentType}`)
	end
	return Entry or config[TileBadgeComponentTypeValues.Pill]
end

return ReactModule.memo(function(p1) --[[ Line: 47 | Named "GameTileThumbnailBadges" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), GameTileConstantsModule (copy), FlaggedMutedErrorFunction (copy), TileBadgeIconNamesByType (copy), GameTileOverlayBadgeModule (copy), getBadgeStyleOptions (copy)
	local Medium = nil
	local UseTokensResult = UseTokensFunction()
	Medium = UseTokensResult.Padding.Medium
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 55 ]]
		-- upvalues: UseBindingResult2 (copy), Medium (ref)
		UseBindingResult2(Frame.AbsoluteSize.X - Medium * 2)
	end, { Medium })
	local Elements = {}
	
	for i, value in p1.tileBadgesByPosition do
		local Position = nil
		local AnchorPoint = nil
		local TileBadgePositionCalculator = GameTileConstantsModule.TileBadgePositionCalculators[i]
		
		if TileBadgePositionCalculator then
			Position, AnchorPoint = TileBadgePositionCalculator(Medium)
		else
			FlaggedMutedErrorFunction("GameTileOverlayBadgeInvalidPositionError", `Unsupported game tile badge position: {i}`)
		end
		if #value > 0 then
			local Entry = value[1]
			local List = nil
			
			if Entry.icons and #Entry.icons > 0 then
				List = {}
				
				for _, icon in Entry.icons do
					local TileBadgeIconNamesByTypeEntry = TileBadgeIconNamesByType[icon]
					
					if TileBadgeIconNamesByTypeEntry then
						table.insert(List, TileBadgeIconNamesByTypeEntry)
					else
						warn(`Unsupported game tile badge icon type: {icon}`)
					end
				end
			end
			Elements[i .. "TileBadge"] = ReactModule.createElement(GameTileOverlayBadgeModule, {
				Position = Position,
				AnchorPoint = AnchorPoint,
				maxWidthBinding = UseBindingResult,
				icons = List,
				text = Entry.text,
				styleOptions = getBadgeStyleOptions(UseTokensResult, Entry.tileBadgeComponentType)
			})
		end
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[ReactModule.Change.AbsoluteSize] = UseResult
	}, Elements)
end)