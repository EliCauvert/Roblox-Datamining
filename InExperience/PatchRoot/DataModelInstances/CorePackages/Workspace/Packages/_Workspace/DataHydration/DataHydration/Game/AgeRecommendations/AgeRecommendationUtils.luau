local Parent = script:FindFirstAncestor("DataHydration").Parent
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local EnumIgrsRating = require(Parent.DiscoveryTypes).EnumIgrsRating
local config = {
	[EnumIgrsRating.IgrsThirteenPlus] = "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs-13.png",
	[EnumIgrsRating.IgrsFifteenPlus] = "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs-15.png",
	[EnumIgrsRating.IgrsEighteenPlus] = "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs-18.png",
	[EnumIgrsRating.IgrsUnrated] = "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs-pending.png"
}

if require(Parent.SharedFlags).FFlagLuaAppAddIgrsImages then
	if EnumIgrsRating.IgrsThreePlus then
		config[EnumIgrsRating.IgrsThreePlus] = "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs-3.png"
	end
	if EnumIgrsRating.IgrsSevenPlus then
		config[EnumIgrsRating.IgrsSevenPlus] = "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs-7.png"
	end
end
return {
	getIgrsImage = function(p1)
		-- upvalues: config (copy), DiscoveryEventErrorLogger (copy)
		if config[p1] then
			return config[p1]
		else
			DiscoveryEventErrorLogger.reportError("getIgrsImage", `Invalid IGRS rating: {p1}`)
			
			return nil
		end
	end
}